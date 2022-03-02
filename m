Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AB8EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Mar 2022 17:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k2ER6FL1umgPs+CmDvFAzO5vi4AJ+J4DYnv1n9kHEy0=; b=RLWf6lSqCtB0VJ
	0HqBCDkd8hDGP/hkMp2ZWWrtf1xw9Q0ShR0tp0scnp7DSO3TpTkKm71s/KTYB2+/KfWUDuxJMv932
	sEZq7/2y+BkM4xxJnWVvWTG1LfGE4NkPIm48WvcrTyMmtfHUAjh6Y57yInf7zGeajMpHG+SWh7zz2
	yf9VLBILrza4NTneffSduzcjG6TEbJkPiYW95VnUJu+C1nGV+GFCa+aOunMeD8hY/ediJWwZlWu6V
	tcDkK687LRVD/3sfM2I7JTN9RVQQxqGpkLjpmNKkO08TtMZ0Mce61TO9CyWxBNtOAZSDaErCPXry2
	oZ130xiMbzztR1siK+VA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPSZE-003V2V-5W; Wed, 02 Mar 2022 17:15:12 +0000
Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPSZA-003V0U-GN; Wed, 02 Mar 2022 17:15:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646241308; x=1677777308;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=quZJORXDoBJnmtXWeY1UEG0LMErZNbKWG4uR8GxuM8A=;
 b=Ji4xeN8+0PpbM3gvsn5FPEuortbq0cFB9BLXFsPEiE270qkhI1iaUN/+
 sS6umfpIQ/eMUBPm23fhyOlTrTR+Zk5O048xTs9DoJSQVNWQAz3gpKS7T
 BPvlqWbB+QeYQTM/HAGZE0TQhqWdyLNzpaLmzCKvTusAFNkoAt4+4P6JM
 jFOIVUn5vdHmtIFflurV/b6E8mI0nVWWCgh7VIbRSn18s7h0gShKjn2l7
 QnrNAnFwY32+3+8DRLnQZy9vRl9r2rgPsj3UUSorV7jAAeii+mpI0gKMg
 jCX2JsWfkgcqn/J+I+XnAfbvh/YaxKzQc2igisRE87QN8dJAZB7IgUKfQ A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="240871443"
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="240871443"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 09:15:05 -0800
X-IronPort-AV: E=Sophos;i="5.90,149,1643702400"; d="scan'208";a="551343768"
Received: from jbuller-mobl1.ger.corp.intel.com (HELO [10.213.194.231])
 ([10.213.194.231])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 09:14:53 -0800
Message-ID: <ed52ce3c-0f4a-a1e8-4176-543657d6228d@linux.intel.com>
Date: Wed, 2 Mar 2022 17:14:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [Intel-gfx] [PATCH 6/6] treewide: remove check of list iterator
 against head past the loop body
Content-Language: en-US
To: Jakob Koschel <jakobkoschel@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>
Cc: alsa-devel@alsa-project.org, linux-aspeed@lists.ozlabs.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>, linux-iio@vger.kernel.org,
 nouveau@lists.freedesktop.org, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 dri-devel@lists.freedesktop.org, Cristiano Giuffrida <c.giuffrida@vu.nl>,
 amd-gfx@lists.freedesktop.org, samba-technical@lists.samba.org,
 linux1394-devel@lists.sourceforge.net, drbd-dev@lists.linbit.com,
 linux-arch <linux-arch@vger.kernel.org>, linux-cifs@vger.kernel.org,
 kvm@vger.kernel.org, linux-scsi@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-staging@lists.linux.dev, "Bos, H.J." <h.j.bos@vu.nl>,
 Jason Gunthorpe <jgg@ziepe.ca>, intel-wired-lan@lists.osuosl.org,
 kgdb-bugreport@lists.sourceforge.net, bcm-kernel-feedback-list@broadcom.com,
 Dan Carpenter <dan.carpenter@oracle.com>, linux-media@vger.kernel.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergman <arnd@arndb.de>,
 linux-pm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Brian Johannesmeyer <bjohannesmeyer@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>, linux-fsdevel@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 v9fs-developer@lists.sourceforge.net, linux-tegra@vger.kernel.org,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-arm-kernel@lists.infradead.org, linux-sgx@vger.kernel.org,
 linux-block@vger.kernel.org, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 tipc-discussion@lists.sourceforge.net, linux-crypto@vger.kernel.org,
 dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Mike Rapoport <rppt@kernel.org>
References: <20220228110822.491923-1-jakobkoschel@gmail.com>
 <20220228110822.491923-7-jakobkoschel@gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <20220228110822.491923-7-jakobkoschel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220302_091508_719081_7A3A4A38 
X-CRM114-Status: GOOD (  31.00  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On 28/02/2022 11:08, Jakob Koschel wrote:
> When list_for_each_entry() completes the iteration over the whole list
> without breaking the loop, the iterator value will be a bogus pointer
> computed based on the head element.
> 
> While it is safe to use the pointer to determine if it was computed
> based on the head element, either with list_entry_is_head() or
> &pos->member == head, using the iterator variable after the loop should
> be avoided.
> 
> In preparation to limiting the scope of a list iterator to the list
> traversal loop, use a dedicated pointer to point to the found element.
> 
> Signed-off-by: Jakob Koschel <jakobkoschel@gmail.com>

[snip until i915 parts]

>   drivers/gpu/drm/i915/gem/i915_gem_context.c   | 14 +++---
>   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 15 ++++---
>   drivers/gpu/drm/i915/gt/intel_ring.c          | 15 ++++---

[snip]

> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_context.c b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> index 00327b750fbb..80c79028901a 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_context.c
> @@ -107,25 +107,27 @@ static void lut_close(struct i915_gem_context *ctx)
>   	radix_tree_for_each_slot(slot, &ctx->handles_vma, &iter, 0) {
>   		struct i915_vma *vma = rcu_dereference_raw(*slot);
>   		struct drm_i915_gem_object *obj = vma->obj;
> -		struct i915_lut_handle *lut;
> +		struct i915_lut_handle *lut = NULL;
> +		struct i915_lut_handle *tmp;
> 
>   		if (!kref_get_unless_zero(&obj->base.refcount))
>   			continue;
> 
>   		spin_lock(&obj->lut_lock);
> -		list_for_each_entry(lut, &obj->lut_list, obj_link) {
> -			if (lut->ctx != ctx)
> +		list_for_each_entry(tmp, &obj->lut_list, obj_link) {
> +			if (tmp->ctx != ctx)
>   				continue;
> 
> -			if (lut->handle != iter.index)
> +			if (tmp->handle != iter.index)
>   				continue;
> 
> -			list_del(&lut->obj_link);
> +			list_del(&tmp->obj_link);
> +			lut = tmp;
>   			break;
>   		}
>   		spin_unlock(&obj->lut_lock);
> 
> -		if (&lut->obj_link != &obj->lut_list) {
> +		if (lut) {
>   			i915_lut_handle_free(lut);
>   			radix_tree_iter_delete(&ctx->handles_vma, &iter, slot);

Looks okay although personally I would have left lut as is for a smaller 
diff and introduced a new local like 'found' or 'unlinked'.

>   			i915_vma_close(vma);
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> index 1736efa43339..fda9e3685ad2 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_execbuffer.c
> @@ -2444,7 +2444,8 @@ static struct i915_request *eb_throttle(struct i915_execbuffer *eb, struct intel
>   {
>   	struct intel_ring *ring = ce->ring;
>   	struct intel_timeline *tl = ce->timeline;
> -	struct i915_request *rq;
> +	struct i915_request *rq = NULL;
> +	struct i915_request *tmp;
> 
>   	/*
>   	 * Completely unscientific finger-in-the-air estimates for suitable
> @@ -2460,15 +2461,17 @@ static struct i915_request *eb_throttle(struct i915_execbuffer *eb, struct intel
>   	 * claiming our resources, but not so long that the ring completely
>   	 * drains before we can submit our next request.
>   	 */
> -	list_for_each_entry(rq, &tl->requests, link) {
> -		if (rq->ring != ring)
> +	list_for_each_entry(tmp, &tl->requests, link) {
> +		if (tmp->ring != ring)
>   			continue;
> 
> -		if (__intel_ring_space(rq->postfix,
> -				       ring->emit, ring->size) > ring->size / 2)
> +		if (__intel_ring_space(tmp->postfix,
> +				       ring->emit, ring->size) > ring->size / 2) {
> +			rq = tmp;
>   			break;
> +		}
>   	}
> -	if (&rq->link == &tl->requests)
> +	if (!rq)
>   		return NULL; /* weird, we will check again later for real */

Alternatively, instead of break could simply do "return 
i915_request_get(rq);" and replace the end of the function after the 
loop with "return NULL;". A bit smaller diff, or at least less "spread 
out" over the function, so might be easier to backport stuff touching 
this area in the future. But looks correct as is.

> 
>   	return i915_request_get(rq);
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring.c b/drivers/gpu/drm/i915/gt/intel_ring.c
> index 2fdd52b62092..4881c4e0c407 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring.c
> @@ -191,24 +191,27 @@ wait_for_space(struct intel_ring *ring,
>   	       struct intel_timeline *tl,
>   	       unsigned int bytes)
>   {
> -	struct i915_request *target;
> +	struct i915_request *target = NULL;
> +	struct i915_request *tmp;
>   	long timeout;
> 
>   	if (intel_ring_update_space(ring) >= bytes)
>   		return 0;
> 
>   	GEM_BUG_ON(list_empty(&tl->requests));
> -	list_for_each_entry(target, &tl->requests, link) {
> -		if (target->ring != ring)
> +	list_for_each_entry(tmp, &tl->requests, link) {
> +		if (tmp->ring != ring)
>   			continue;
> 
>   		/* Would completion of this request free enough space? */
> -		if (bytes <= __intel_ring_space(target->postfix,
> -						ring->emit, ring->size))
> +		if (bytes <= __intel_ring_space(tmp->postfix,
> +						ring->emit, ring->size)) {
> +			target = tmp;
>   			break;
> +		}
>   	}
> 
> -	if (GEM_WARN_ON(&target->link == &tl->requests))
> +	if (GEM_WARN_ON(!target))
>   		return -ENOSPC;
> 
>   	timeout = i915_request_wait(target,

Looks okay as well. Less clear here if there is a clean solution to make 
the diff smaller so no suggestions. I mean do I dare mention "goto 
found;" from inside the loop, where the break is, instead of the 
variable renames.. risky.. :) (And ofc "return -ENOSPC" immediately 
after the loop.)

As a summary changes looks okay, up to you if you want to try to make 
the diffs smaller or not. It doesn't matter hugely really, all I have is 
a vague and uncertain "maybe it makes backporting of something, someday 
easier". So for i915 it is good either way.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com> # i915 bits only

Regards,

Tvrtko

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
