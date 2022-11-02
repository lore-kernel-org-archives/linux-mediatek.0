Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A00EC43217
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 09:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCDrX0xKXyu8erIDNjxDiJKuT0hxZZKKE3HXuUGBVDQ=; b=H7fMMdUHI+kU8wU7N+kO9jRNMp
	WGq+UvuJeUxdDpG4g8Ioq+Dh4wyJ9zi4E/jzMBh6voV77OTMg9BzPgD7EmsKl7hutH7XGqMvb6Pby
	GmlA+sm8J9iqeQvIY61h50upco+CUO/e5h73lNbACmdMGXwYTybgu3ktXwLz61TC5ZZBRoBrSL9ev
	+v3ic6a0LIXuKEUkQqzFM8taoV7rip44ZsXVRndUTPr4z9nW3jRCnmlr61yIl285nufK7PPCazMSN
	qp0fCVD74rypJtsjEistT8GITPlsxWA5SmHeMJ2xxgQpTeQEam/GJK6Qz32qsuGj2RPOXeguv9Y3e
	ht9H2Ypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqA7g-00AHIO-3P; Wed, 02 Nov 2022 09:33:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqA6b-00AGlQ-RO
	for linux-mediatek@lists.infradead.org; Wed, 02 Nov 2022 09:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667381536;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qCDrX0xKXyu8erIDNjxDiJKuT0hxZZKKE3HXuUGBVDQ=;
	b=g86kVOmVqcJ3jvx7QLkap7dOJqWx4Jkz4xwCyM5E3D5uU39i8xAefQvqxOKN5H5LoxvUsS
	PIC72S+nNsAaw1AjBB0WT2jmkEDsxqvhrcNE9IXrbtcn7F5l8j3iSkrfnqjMOP901MtXZm
	CJcXGUj8XU5QGMG0V3YLjmFRZQfk710=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-95XhLoB2P-mLnnezEeB_Ow-1; Wed, 02 Nov 2022 05:32:15 -0400
X-MC-Unique: 95XhLoB2P-mLnnezEeB_Ow-1
Received: by mail-wm1-f70.google.com with SMTP id d13-20020a05600c34cd00b003ce1f62ac5aso832065wmq.4
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Nov 2022 02:32:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qCDrX0xKXyu8erIDNjxDiJKuT0hxZZKKE3HXuUGBVDQ=;
        b=N6kib2oeXggZ7cZ/Wk+Lfd34QrF41sS3KW/SqPdGhBfXmL5A+VMC5ACWHiyAzZZQOv
         d5DpJBOg9E+D8yZxaz2r1Qyvj8Pf0dHiX7UNHUi/T299AG1tpeUNH8XxrB2zS/N66Jbv
         itRaePmkyrO/w8HTgUrIaWp4C1fWNDv/ebxguZGvtO+toGNi7pnntP+oznWKZ+Ri31bn
         iT05ofKc/NrqJzHtpAO2NDYewhMBZut2aSFN3ms9iUZhy/DW8d4Efite4eFzCsfy15QE
         hhK1NZZJEkDg/CMSf0pzGrQrNEvpnpkxh3lqR29BMXHnf3YLtuKNeKhazK9QTP45DV70
         D/vQ==
X-Gm-Message-State: ACrzQf3OgixI/pyJb0a1U0R9WSvbza9O2i9/GkJdLFgJ9xtRs3EiKSVm
	gVDsh58hzPoJ0sl4FrQHeF25uQcEew8Yd6/eYi1T9yq+G7tterzbnnNwt8u9YKQEmIWkuXtUPGZ
	QBKUNt2f1Kv8QOpyqZuua4ugjScQTvybu
X-Received: by 2002:a05:600c:6023:b0:3cf:7dc1:e08e with SMTP id az35-20020a05600c602300b003cf7dc1e08emr5443614wmb.154.1667381534284;
        Wed, 02 Nov 2022 02:32:14 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7iks5yFnak5X2iZPcs6wSoPN4c8RmVdgyjVaQzUQOEwDY0j8GZM7MD/vLKrS0XyFefd22bEw==
X-Received: by 2002:a05:600c:6023:b0:3cf:7dc1:e08e with SMTP id az35-20020a05600c602300b003cf7dc1e08emr5443583wmb.154.1667381533975;
        Wed, 02 Nov 2022 02:32:13 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x21-20020a1c7c15000000b003b492753826sm1361990wmc.43.2022.11.02.02.32.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 02:32:13 -0700 (PDT)
Message-ID: <3ab32fc3-f2aa-1b42-fd87-557482ab56d5@redhat.com>
Date: Wed, 2 Nov 2022 10:32:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 17/21] drm/fb-helper: Perform all fbdev I/O with the
 same implementation
To: Thomas Zimmermann <tzimmermann@suse.de>, daniel@ffwll.ch,
 airlied@gmail.com, sam@ravnborg.org, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
 etnaviv@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
 linux-hyperv@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org,
 spice-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org
References: <20221024111953.24307-1-tzimmermann@suse.de>
 <20221024111953.24307-18-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-18-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_023218_041730_1A4955E5 
X-CRM114-Status: GOOD (  25.25  )
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

On 10/24/22 13:19, Thomas Zimmermann wrote:
> Implement the fbdev's read/write helpers with the same functions. Use
> the generic fbdev's code as template. Convert all drivers.
> 
> DRM's fb helpers must implement regular I/O functionality in struct
> fb_ops and possibly perform a damage update. Handle all this in the
> same functions and convert drivers. The functionality has been used
> as part of the generic fbdev code for some time. The drivers don't
> set struct drm_fb_helper.fb_dirty, so they will not be affected by
> damage handling.
> 
> For I/O memory, fb helpers now provide drm_fb_helper_cfb_read() and
> drm_fb_helper_cfb_write(). Several drivers require these. Until now
> tegra used I/O read and write, although the memory buffer appears to
> be in system memory. So use _sys_ helpers now.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

> +static ssize_t __drm_fb_helper_write(struct fb_info *info, const char __user *buf, size_t count,
> +				     loff_t *ppos, drm_fb_helper_write_screen write_screen)
> +{

[...]

> +	/*
> +	 * Copy to framebuffer even if we already logged an error. Emulates
> +	 * the behavior of the original fbdev implementation.
> +	 */
> +	ret = write_screen(info, buf, count, pos);
> +	if (ret < 0)
> +		return ret; /* return last error, if any */
> +	else if (!ret)
> +		return err; /* return previous error, if any */
> +
> +	*ppos += ret;
> +

Should *ppos be incremented even if the previous error is returned?

The write_screen() succeeded anyways, even when the count written was
smaller than what the caller asked for.

>  /**
> - * drm_fb_helper_sys_read - wrapper around fb_sys_read
> + * drm_fb_helper_sys_read - Implements struct &fb_ops.fb_read for system memory
>   * @info: fb_info struct pointer
>   * @buf: userspace buffer to read from framebuffer memory
>   * @count: number of bytes to read from framebuffer memory
>   * @ppos: read offset within framebuffer memory
>   *
> - * A wrapper around fb_sys_read implemented by fbdev core
> + * Returns:
> + * The number of read bytes on success, or an error code otherwise.
>   */

This sentence sounds a little bit off to me. Shouldn't be "number of bytes read"
instead? I'm not a native English speaker though, so feel free to just ignore me.

[...]

>  
> +static ssize_t fb_read_screen_base(struct fb_info *info, char __user *buf, size_t count,
> +				   loff_t pos)
> +{
> +	const char __iomem *src = info->screen_base + pos;
> +	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
> +	ssize_t ret = 0;
> +	int err = 0;

Do you really need these two? AFAIK ssize_t is a signed type
so you can just use the ret variable to store and return the
errno value.

[...]

> +static ssize_t fb_write_screen_base(struct fb_info *info, const char __user *buf, size_t count,
> +				    loff_t pos)
> +{
> +	char __iomem *dst = info->screen_base + pos;
> +	size_t alloc_size = min_t(size_t, count, PAGE_SIZE);
> +	ssize_t ret = 0;
> +	int err = 0;

Same here.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


