From: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v1 11/11] drm: drop uapi dependency from drm_file.h
Date: Thu, 18 Jul 2019 14:40:09 -0400
Message-ID: <20190718184009.GB104440@art_vandelay>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-12-sam@ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <20190718161507.2047-12-sam@ravnborg.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Sam Ravnborg <sam@ravnborg.org>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <Liviu.Dudau@arm.com>, dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>, Eric Anholt <eric@anholt.net>, Rob Herring <robh@kernel.org>, Stefan Agner <stefan@agner.ch>, Maxime Ripard <maxime.ripard@bootlin.com>, CK Hu <ck.hu@mediatek.com>, Thierry Reding <treding@nvidia.com>, Daniel Vetter <daniel@ffwll.ch>, Chunming Zhou <david1.zhou@amd.com>, Jani Nikula <jani.nikula@intel.com>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, linux-mediatek@lists.infradead.org, Lionel Landwerlin <lionel.g.landwerlin@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org, Boris Brezillon <bbrezillon@kernel.org>, Thomas Zimmermann <tzimmermann@suse.d>
List-Id: linux-mediatek@lists.infradead.org

On Thu, Jul 18, 2019 at 06:15:07PM +0200, Sam Ravnborg wrote:
> drm_file used drm_magic_t from uapi/drm/drm.h.
> This is a simple unsigned int.
> Just opencode it as such to break the dependency from this header file
> to uapi.
> 
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Passes my build tests, thanks for the clean-ups!

Reviewed-by: Sean Paul <sean@poorly.run>

> Suggested-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Sean Paul <seanpaul@chromium.org>
> Cc: Liviu Dudau <Liviu.Dudau@arm.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Eric Anholt <eric@anholt.net>
> ---
>  include/drm/drm_file.h | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
> index 67af60bb527a..046cd1bf91eb 100644
> --- a/include/drm/drm_file.h
> +++ b/include/drm/drm_file.h
> @@ -34,8 +34,6 @@
>  #include <linux/completion.h>
>  #include <linux/idr.h>
>  
> -#include <uapi/drm/drm.h>
> -
>  #include <drm/drm_prime.h>
>  
>  struct dma_fence;
> @@ -227,7 +225,7 @@ struct drm_file {
>  	struct pid *pid;
>  
>  	/** @magic: Authentication magic, see @authenticated. */
> -	drm_magic_t magic;
> +	unsigned int magic;
>  
>  	/**
>  	 * @lhead:
> -- 
> 2.20.1
> 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
