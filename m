Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76395E77197
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Jan 2025 17:37:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NRmPm0ZNk/C3mZstvTuhKj0QjfwNtjAVVxCaUxWitUE=; b=1/qu55GW4RC2JmyTaWmcs/y5R3
	ix6E8H5BiPycwRJtIDW3EypH02CBO4kIZyGhuljx4IEhBw5tev+iiE49dt/VdHrDzq0wn9mYZQyFA
	rGQMW7OsWZbP6UKV1YZliAj9+qxfFw3yM7aw0wJtGZEjYcDEFdUbLGCfcno3kNYnGLbE3WbUpKB6t
	T7QYFMOMDmxsLQiDgWA2H4nNo4qw5rfo32KgS1dvHeJa1lVfyLpWZ1Nj9yqVzfTg/mZUitW8B3rbY
	AvWCIbUm3auVlJFZFzG7pcVN6ro7LtxvyCC1PX9SMm8AYgDyJuq2Cn06AVATFSIEwIYJxyhSDarCB
	rXe93mDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVwTF-0000000Cr62-0kd7;
	Thu, 09 Jan 2025 17:37:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvMc-0000000Cg1G-2Kri;
	Thu, 09 Jan 2025 16:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NRmPm0ZNk/C3mZstvTuhKj0QjfwNtjAVVxCaUxWitUE=; b=RHVajYWMBY1Ha6bWDI/CUSRtXj
	YcPbfko1ezBSZPYdywkE5dptgr22KPCl48FG2ANRX64tZFOed3G3CwUZdt3UrejGAC52p5OAyFX3g
	ZaE9l9jFTzXuknvTsKd6LfHS6rCxwNd+ky1t0eccf2pRuP+SyyHgCIQuat8u24RiK7KLnvketXoss
	LttLizwVupfhINoP0HRH8v0hsIc+Us17vnky6rDYnStgL86E6pxQJdR7zAFqHeKQ/zvQUxHIB3LQ0
	HLUZX+f3rKgB1bdXO4d26IID7sxEl2spxG95v5qe9w/ZpSduguYyAZdE7ivJsjjQYTj+q1HXqpAnX
	KOkmDwDA==;
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVvMZ-00000009bDR-0sQO;
	Thu, 09 Jan 2025 16:26:29 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 8BEF71F394;
	Thu,  9 Jan 2025 16:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736439985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NRmPm0ZNk/C3mZstvTuhKj0QjfwNtjAVVxCaUxWitUE=;
	b=sbSREeiq9iYjhEjeQW4qdyaKgpxCCvgX4XR/fBFVbBO4pMWr9sS4BXsXIGQmQ85imThdW3
	YEr9PS4vxUj00SkQvkhd+WdDG7ceEvYLGtYIwa15RLNL2aCvQCzad51udAuGukV2DSk9ep
	xC+VFiwxwgPTMZtQGbOekt/679hQbN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736439985;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NRmPm0ZNk/C3mZstvTuhKj0QjfwNtjAVVxCaUxWitUE=;
	b=Lfl2D7OwYEWe79nVY++MQKtG++F9vBKMfMM+7FkArBH4/ckhXi+TbuY3f0MHOm2XwF8VUk
	tzwhYX4d2YyHyaDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1736439985; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NRmPm0ZNk/C3mZstvTuhKj0QjfwNtjAVVxCaUxWitUE=;
	b=sbSREeiq9iYjhEjeQW4qdyaKgpxCCvgX4XR/fBFVbBO4pMWr9sS4BXsXIGQmQ85imThdW3
	YEr9PS4vxUj00SkQvkhd+WdDG7ceEvYLGtYIwa15RLNL2aCvQCzad51udAuGukV2DSk9ep
	xC+VFiwxwgPTMZtQGbOekt/679hQbN0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1736439985;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NRmPm0ZNk/C3mZstvTuhKj0QjfwNtjAVVxCaUxWitUE=;
	b=Lfl2D7OwYEWe79nVY++MQKtG++F9vBKMfMM+7FkArBH4/ckhXi+TbuY3f0MHOm2XwF8VUk
	tzwhYX4d2YyHyaDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 00C48139AB;
	Thu,  9 Jan 2025 16:26:24 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 9qu0ObD4f2fqBgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Thu, 09 Jan 2025 16:26:24 +0000
Message-ID: <6666af19-a98d-41d7-8329-7b50807c04a9@suse.de>
Date: Thu, 9 Jan 2025 17:26:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 23/25] drm/xe: Compute dumb-buffer sizes with
 drm_mode_size_dumb()
To: Matthew Auld <matthew.auld@intel.com>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 imx@lists.linux.dev, linux-samsung-soc@vger.kernel.org,
 nouveau@lists.freedesktop.org, virtualization@lists.linux.dev,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
 intel-xe@lists.freedesktop.org, xen-devel@lists.xenproject.org,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250109150310.219442-1-tzimmermann@suse.de>
 <20250109150310.219442-24-tzimmermann@suse.de>
 <91c904f8-ba47-4595-be65-6fb57dcc9c64@intel.com>
Content-Language: en-US
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAHNJ1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPsLAjgQTAQgAOAIb
 AwULCQgHAgYVCgkICwIEFgIDAQIeAQIXgBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftODH
 AAoJEGgNwR1TC3ojx1wH/0hKGWugiqDgLNXLRD/4TfHBEKmxIrmfu9Z5t7vwUKfwhFL6hqvo
 lXPJJKQpQ2z8+X2vZm/slsLn7J1yjrOsoJhKABDi+3QWWSGkaGwRJAdPVVyJMfJRNNNIKwVb
 U6B1BkX2XDKDGffF4TxlOpSQzdtNI/9gleOoUA8+jy8knnDYzjBNOZqLG2FuTdicBXblz0Mf
 vg41gd9kCwYXDnD91rJU8tzylXv03E75NCaTxTM+FBXPmsAVYQ4GYhhgFt8S2UWMoaaABLDe
 7l5FdnLdDEcbmd8uLU2CaG4W2cLrUaI4jz2XbkcPQkqTQ3EB67hYkjiEE6Zy3ggOitiQGcqp
 j//OwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHUE9eosYb
 T6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+qbU6
 3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWW
 GKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lv
 hFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsA
 EQEAAcLAdgQYAQgAIAIbDBYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJftOH6AAoJEGgNwR1T
 C3ojVSkIALpAPkIJPQoURPb1VWjh34l0HlglmYHvZszJWTXYwavHR8+k6Baa6H7ufXNQtThR
 yIxJrQLW6rV5lm7TjhffEhxVCn37+cg0zZ3j7zIsSS0rx/aMwi6VhFJA5hfn3T0TtrijKP4A
 SAQO9xD1Zk9/61JWk8OysuIh7MXkl0fxbRKWE93XeQBhIJHQfnc+YBLprdnxR446Sh8Wn/2D
 Ya8cavuWf2zrB6cZurs048xe0UbSW5AOSo4V9M0jzYI4nZqTmPxYyXbm30Kvmz0rYVRaitYJ
 4kyYYMhuULvrJDMjZRvaNe52tkKAvMevcGdt38H4KSVXAylqyQOW5zvPc4/sq9c=
In-Reply-To: <91c904f8-ba47-4595-be65-6fb57dcc9c64@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	FREEMAIL_TO(0.00)[intel.com,linux.intel.com,kernel.org,gmail.com,ffwll.ch];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[bootlin.com:url,suse.de:email,suse.de:mid]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_162627_691861_B813AAFF 
X-CRM114-Status: GOOD (  16.91  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi


Am 09.01.25 um 17:05 schrieb Matthew Auld:
> On 09/01/2025 14:57, Thomas Zimmermann wrote:
>> Call drm_mode_size_dumb() to compute dumb-buffer scanline pitch
>> and buffer size. Align the pitch to a multiple of 8. Align the
>> buffer size according to hardware requirements.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_bo.c | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
>> index e6c896ad5602..d75e3c39ab14 100644
>> --- a/drivers/gpu/drm/xe/xe_bo.c
>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/dma-buf.h>
>>     #include <drm/drm_drv.h>
>> +#include <drm/drm_dumb_buffers.h>
>>   #include <drm/drm_gem_ttm_helper.h>
>>   #include <drm/drm_managed.h>
>>   #include <drm/ttm/ttm_device.h>
>> @@ -2535,14 +2536,13 @@ int xe_bo_dumb_create(struct drm_file 
>> *file_priv,
>>       struct xe_device *xe = to_xe_device(dev);
>>       struct xe_bo *bo;
>>       uint32_t handle;
>> -    int cpp = DIV_ROUND_UP(args->bpp, 8);
>>       int err;
>>       u32 page_size = max_t(u32, PAGE_SIZE,
>>           xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K);
>>   -    args->pitch = ALIGN(args->width * cpp, 64);
>> -    args->size = ALIGN(mul_u32_u32(args->pitch, args->height),
>> -               page_size);
>> +    err = drm_mode_size_dumb(dev, args, SZ_64, page_size);
>
> AFAICT this looks to change the behaviour, where u64 size was 
> technically possible and was allowed given that args->size is u64, but 
> this helper is limiting the size to u32. Is that intentional? If so, 
> we should probably make that clear in the commit message.

That's an interesting observation; thanks. The ioctl's internal checks 
have always limited the size to 32 bit. [1] I think it is not supposed 
to be larger than that. We can change the helper to support 64-bit sizes 
as well.

Having said that, is there any use case? Dumb buffers are for software 
rendering only. Allocating more than a few dozen MiB seems like a 
mistake. Maybe we should rather limit the allowed allocation size instead?

Best regards
Thomas

[1] 
https://elixir.bootlin.com/linux/v6.12.6/source/drivers/gpu/drm/drm_dumb_buffers.c#L82

>
>> +    if (err)
>> +        return err;
>>         bo = xe_bo_create_user(xe, NULL, NULL, args->size,
>>                      DRM_XE_GEM_CPU_CACHING_WC,
>

-- 
--
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Frankenstrasse 146, 90461 Nuernberg, Germany
GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
HRB 36809 (AG Nuernberg)


