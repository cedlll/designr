> Type `/designr` to apply these rules to your current project

## Stack

MUST use Tailwind CSS defaults unless custom values already exist or are explicitly requested
MUST use motion/react (formerly framer-motion) when JavaScript animation is required
SHOULD use tw-animate-css for entrance and micro-animations in Tailwind CSS
MUST use cn utility (clsx + tailwind-merge) for class logic

## Components

MUST use accessible component primitives for anything with keyboard or focus behavior (Base UI, React Aria, Radix)
MUST use the project's existing component primitives first
NEVER mix primitive systems within the same interaction surface
SHOULD prefer Base UI for new primitives if compatible with the stack
MUST add an aria-label to icon-only buttons
NEVER rebuild keyboard or focus behavior by hand unless explicitly requested

## Interaction

MUST use an AlertDialog for destructive or irreversible actions
SHOULD use structural skeletons for loading states
NEVER use h-screen, use h-dvh
MUST respect safe-area-inset for fixed elements
MUST show errors next to where the action happens
NEVER block paste in input or textarea elements

## Animation (Revised)

NEVER add decorative animation unless explicitly requested
MUST provide functional animation for state feedback (hover, press, focus, disabled)
MUST animate only compositor props (transform, opacity)
NEVER animate layout properties (width, height, top, left, margin, padding)
SHOULD avoid animating paint properties (background, color) except for small, local UI (text, icons, state indicators)
SHOULD use ease-out on entrance, ease-in on exit, ease-in-out for reversible interactions
NEVER exceed 200ms for interaction feedback, 300ms for entrance/exit
MUST pause looping animations when off-screen
MUST respect prefers-reduced-motion by removing non-essential motion
NEVER introduce custom easing curves unless explicitly requested
SHOULD avoid animating large images or full-screen surfaces

## Typography

MUST use text-balance for headings and text-pretty for body/paragraphs
MUST use tabular-nums for data tables and numeric comparisons
SHOULD use truncate or line-clamp for dense UI
NEVER modify letter-spacing (tracking-*) unless explicitly requested
MUST maintain minimum 16px base font size for body text
SHOULD use system font stack unless brand typography is explicitly required

## Layout

MUST use a fixed z-index scale: 0 (base), 10 (dropdowns), 20 (sticky headers), 30 (modals), 40 (popovers), 50 (toasts)
SHOULD use size-* for square elements instead of w-* + h-*
MUST design mobile-first, enhance at sm: (640px), md: (768px), lg: (1024px), xl: (1280px)
SHOULD use container queries (@container) for component-level responsive behavior
NEVER rely on specific pixel dimensions for touch targets - MUST be minimum 44×44px

## Performance

NEVER animate large blur() or backdrop-filter surfaces
NEVER apply will-change outside an active animation
NEVER use useEffect for anything that can be expressed as render logic
MUST lazy-load images below the fold with loading="lazy"
SHOULD debounce search inputs and autocomplete (minimum 300ms)
MUST virtualize lists with 100+ items

## Design (Revised)

NEVER use gradients unless explicitly requested
NEVER use purple or multicolor gradients
NEVER use glow effects as primary affordances
SHOULD use Tailwind CSS default shadow scale unless explicitly requested
MUST give empty states one clear next action
SHOULD limit primary accent color to one per view
MAY use semantic colors (success/warning/error/info) in addition to primary accent
SHOULD use existing theme or Tailwind CSS color tokens before introducing new ones
MUST maintain 4.5:1 contrast ratio for body text, 3:1 for large text (WCAG AA)

## Form Validation

MUST validate on blur for individual fields, on submit for entire form
NEVER validate on every keystroke unless explicitly required (e.g., password strength)
MUST show field-level errors inline, immediately below the input
SHOULD show success states only for high-stakes fields (password, email verification)
MUST disable submit button only when form is submitting, not when invalid
SHOULD provide helpful error messages with actionable guidance, not just "Invalid input"
MUST maintain focus on the first invalid field after failed submission
NEVER clear form data on validation error unless explicitly requested

## Loading States

MUST show skeleton UI for content that's loading for the first time
SHOULD show spinners only for quick actions (<3 seconds expected)
MUST show progress indicators for operations >3 seconds with known duration
SHOULD show optimistic UI updates for mutations when rollback is possible
NEVER block the entire page for partial data loading
MUST provide "Cancel" for long-running operations when feasible
SHOULD cache and show stale data with indicator while revalidating

## State Management

MUST use URL state for shareable/bookmarkable UI (filters, tabs, search, pagination)
SHOULD use server state libraries (TanStack Query, SWR) for async data
MUST colocate component state with useState unless needed by siblings
SHOULD lift state only as high as necessary for sharing
NEVER store derived values in state - compute during render
MUST use reducers for complex state with multiple related updates
SHOULD avoid prop drilling beyond 2-3 levels - use context or composition

## Error Handling

MUST show user-friendly error messages, never raw technical errors
SHOULD provide retry mechanism for failed network requests
MUST preserve user input during errors (form data, drafts)
SHOULD log errors to monitoring service (Sentry, LogRocket) with user context
MUST have error boundaries for top-level route/page components
SHOULD show graceful fallback UI in error boundaries, not blank screens
NEVER use console.error as primary error handling strategy

## Data Fetching

MUST handle loading, success, and error states for all async operations
SHOULD implement request deduplication for concurrent identical requests
MUST set reasonable timeouts (10-30s depending on operation)
SHOULD implement retry logic with exponential backoff for transient failures
MUST cancel pending requests on component unmount or navigation
SHOULD prefetch data for likely next user actions (hover, route preload)

## Accessibility (Extended)

MUST provide visible focus indicators that meet 3:1 contrast ratio
MUST ensure all interactive elements are keyboard accessible
SHOULD follow ARIA Authoring Practices for complex widgets
MUST provide alt text for informative images, empty alt for decorative
SHOULD announce dynamic content changes to screen readers via ARIA live regions
MUST support keyboard shortcuts for power users without breaking screen readers
SHOULD provide skip links for keyboard navigation on content-heavy pages

## Mobile Considerations

MUST prevent zoom on input focus (use 16px minimum font size)
SHOULD use native inputs (type="email", type="tel") for appropriate mobile keyboards
MUST make tap targets minimum 44×44px with adequate spacing
SHOULD use inputmode attribute to show optimized mobile keyboards
MUST handle orientation changes gracefully
SHOULD minimize fixed elements that consume vertical space on mobile
NEVER rely on hover states for critical functionality
