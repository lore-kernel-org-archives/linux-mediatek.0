From: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH v1 02/11] drm: drop uapi dependency from drm_print.h
Date: Mon, 29 Jul 2019 15:45:35 +0300
Message-ID: <87tvb5nh5c.fsf@intel.com>
References: <20190718161507.2047-1-sam@ravnborg.org>
 <20190718161507.2047-3-sam@ravnborg.org>
 <156346840026.24728.936589728458336617@skylake-alporthouse-com>
 <460bf1e1-a38b-5f79-26e5-93764067f4e1@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <460bf1e1-a38b-5f79-26e5-93764067f4e1@amd.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Chris Wilson <chris@chris-wilson.co.uk>, Intel Graphics Development <intel-gfx@lists.freedesktop.org>, Sam Ravnborg <sam@ravnborg.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: Boris Brezillon <bbrezillon@kernel.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@ffwll.ch>, Liviu Dudau <Liviu.Dudau@arm.com>, Maxime Ripard <maxime.ripard@bootlin.com>, "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <seanpaul@chromium.org>, Thierry Reding <treding@nvidia.com>, Sean Paul <sean@poorly.run>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
List-Id: linux-mediatek@lists.infradead.org

On Fri, 19 Jul 2019, "Koenig, Christian" <Christian.Koenig@amd.com> wrote:
> Am 18.07.19 um 18:46 schrieb Chris Wilson:
>> Quoting Sam Ravnborg (2019-07-18 17:14:58)
>>> drm_print.h used DRM_NAME - thus adding a dependency from
>>> include/drm/drm_print.h => uapi/drm/drm.h
>>>
>>> Hardcode the name "drm" to break this dependency.
>>> The idea is that there shall be a minimal dependency
>>> between include/drm/* and uapi/*
>>>
>>> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
>>> Suggested-by: Daniel Vetter <daniel@ffwll.ch>
>>> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
>>> Cc: Sean Paul <sean@poorly.run>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Rob Clark <robdclark@gmail.com>
>>> Cc: Sean Paul <seanpaul@chromium.org>
>>> Cc: Chris Wilson <chris@chris-wilson.co.uk>
>>> Cc: Daniel Vetter <daniel@ffwll.ch>
>>> ---
>>>   include/drm/drm_print.h | 4 +---
>>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>>
>>> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
>>> index a5d6f2f3e430..760d1bd0eaf1 100644
>>> --- a/include/drm/drm_print.h
>>> +++ b/include/drm/drm_print.h
>>> @@ -32,8 +32,6 @@
>>>   #include <linux/device.h>
>>>   #include <linux/debugfs.h>
>>>   
>>> -#include <drm/drm.h>
>>> -
>>>   /**
>>>    * DOC: print
>>>    *
>>> @@ -287,7 +285,7 @@ void drm_err(const char *format, ...);
>>>   /* Macros to make printk easier */
>>>   
>>>   #define _DRM_PRINTK(once, level, fmt, ...)                             \
>>> -       printk##once(KERN_##level "[" DRM_NAME "] " fmt, ##__VA_ARGS__)
>>> +       printk##once(KERN_##level "[drm] " fmt, ##__VA_ARGS__)
>> I guess I'm th only one who
>>
>> #undef DRM_NAME
>> #define DRM_NAME i915
>>
>> just so that I didn't have inane logs?
>>
>> One might suggest that instead of hardcoding it, follow the pr_fmt()
>> pattern and only add "[drm]" for the drm core.
>>
>> Even then it so useless (which drm driver is this message for???) that I
>> want to remove them all :(
>
> Yeah, agree. I mean it is nice if the core drm functions use a prefix 
> for debug output.
>
> But I actually don't see the point for individual drivers.

We should all migrate to the versions with device...

BR,
Jani.


>
> Christian.
>
>> -Chris
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Jani Nikula, Intel Open Source Graphics Center
