Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE94AC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 09:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XBlp2DOijU5hXQ9AriUwp9vEVLgfxcCQxHX+sSZSvOs=; b=EDdnM7ouMpz54u7Y22rdEFwieq
	9H04IMIoLp/syH/iCbF+zCvVzLdnoh5+dtxbaBSqH3P4gcI1/YEzyxsuU1j2ENY0U8D9Osl2Vo+Zp
	nYpwiIMOtkM84dg2vDRNUmWjGyEVz6Rx96sYTr5cVL2Mep8OhIvsNGBxRYnqUBjexQHmX2EjDw0w+
	mLm/m2OolcgydrMAjZBGQxYGfyZJ/44LDHPg+mIBlZPOLZXW8Hi9Gnkv0ULRJS4fXakC1smcePfCq
	xqR557VA/Zmp6B2inP/b3IS1L2qXPt6C4HRVP4yIwIXmmmTRPO4VqPGMadahtGDCfob6s7dcLvqgs
	z6syF25A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9fZ-009NNV-Be; Wed, 02 Nov 2022 09:04:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oq9fM-009NBf-1z
	for linux-mediatek@lists.infradead.org; Wed, 02 Nov 2022 09:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667379843;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XBlp2DOijU5hXQ9AriUwp9vEVLgfxcCQxHX+sSZSvOs=;
	b=cU6CaU/T3cRlN3WmIu3UEc7d6/fczr3AsteLEeSis2kQhSs1jBTSH6BOdcbi98+L1CS4Ff
	dKMMJcQ9Qorjv5Px2oNHPiQBogLkzL3IpXhZQ2qdQ7DSS4cLXg+T1b+/c8PHb2DjBMo67F
	JpmKjCMX4nYr+UYWvXcW7BFgqEGjVdg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-587-hEtNbx-MMtCJchmDbRcNWA-1; Wed, 02 Nov 2022 05:04:01 -0400
X-MC-Unique: hEtNbx-MMtCJchmDbRcNWA-1
Received: by mail-wm1-f71.google.com with SMTP id 1-20020a05600c028100b003cf7833293cso804075wmk.3
        for <linux-mediatek@lists.infradead.org>; Wed, 02 Nov 2022 02:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XBlp2DOijU5hXQ9AriUwp9vEVLgfxcCQxHX+sSZSvOs=;
        b=dh1THxDIoGl7uBASj4dsSjo0CdVwWdVLVfcQsA0F9Juj7ztOZG8IQhFrRUdDsZAwu0
         zCSJsvBAjxf3MFcKx94DCK4YurNhwH1YX0YYGg0xJO8OFjVrp4pJCDBn8mO3rDBOfwgU
         Bs3BtBCnr7oFNCCXWeLiMUlwDR8fHPc0kYxCTSYOF7TI0JXHPYM5TFCbYl3lpWm+NRX5
         JR0rOu790PMtnNeS6BsKasfo1JyLnZOL0jvgyuSdjw+1wA4ny7KXFvFzbsSh1stQYlfC
         bGd7k7Eck3R4C3EtERnTprZSwcBY2ApLbgQYufB3L41ZyTBVmypL0YIZvHMfLmvwk0AB
         EP2Q==
X-Gm-Message-State: ACrzQf37KiFzBxx0QyBQuqaflZkB6MrQbxgeph8GDrBVSlqYWsCXMCJg
	8z05dLA5prAFUcf+fi2FEauBRqqOBwGH7v1uzL0lZjiVWOuIEUHY3+ot1Qjs/pFMnZV3kmNTlde
	yuhX0AAhKqnhUxJJ9oWrPE0LsN01TKlht
X-Received: by 2002:a7b:c409:0:b0:3cf:4c81:8936 with SMTP id k9-20020a7bc409000000b003cf4c818936mr24380824wmi.38.1667379840274;
        Wed, 02 Nov 2022 02:04:00 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM72ckpdUoZR+NwXtu1sv2+7NmgS+YMIWWHB7QdeKnWTKduGDRl7tg4bkpenTZv0mX1kFf34kw==
X-Received: by 2002:a7b:c409:0:b0:3cf:4c81:8936 with SMTP id k9-20020a7bc409000000b003cf4c818936mr24380784wmi.38.1667379840046;
        Wed, 02 Nov 2022 02:04:00 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id b13-20020a5d550d000000b002366b17ca8bsm14083933wrv.108.2022.11.02.02.03.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Nov 2022 02:03:59 -0700 (PDT)
Message-ID: <87284e5e-859e-3b1c-7142-28d4fa7a7939@redhat.com>
Date: Wed, 2 Nov 2022 10:03:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 15/21] drm/fb-helper: Disconnect damage worker from
 update logic
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
 <20221024111953.24307-16-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-16-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_020408_181825_32A15FE5 
X-CRM114-Status: GOOD (  14.49  )
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
> The fbdev helpers implement a damage worker that forwards fbdev
> updates to the DRM driver. The worker's update logic depends on
> the generic fbdev emulation. Separate the two via function pointer.
> 
> The generic fbdev emulation sets struct drm_fb_helper_funcs.fb_dirty,
> a new callback that hides the update logic from the damage worker.
> It's not possible to use the generic logic with other fbdev emulation,
> because it contains additional code for the shadow buffering that
> the generic emulation employs.
> 
> DRM drivers with internal fbdev emulation can set fb_dirty to their
> own implementation if they require damage handling; although no such
> drivers currently exist.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

[...]

>  static void drm_fb_helper_damage_work(struct work_struct *work)
>  {
> -	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper,
> -						    damage_work);
> -	struct drm_device *dev = helper->dev;
> +	struct drm_fb_helper *helper = container_of(work, struct drm_fb_helper, damage_work);

This line is an unrelated code style change. But I guess it's OK.

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


