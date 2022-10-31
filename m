Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76C9C38A02
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 12:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/x9mAjb8LNYXXK+HVNHKFir+j3ZwIeSko/dKjp9YLmY=; b=Su8/yk4+5XNMLibjBhOzk7a7GC
	bPtibPxl7B4ggIcU3/EkwR+9HYQM5pDA+rxV3XFPyPnk3M9LyLw+kPOHA3Gxb1vryyC5PKQHnhsV7
	ReS62QrQt6lrhwz5pgKMsij/E7beukCPFBNzrkraRV85AxtfT90rTZQwfBF48HEBxWiM61b8aOWY7
	XWiawu+X7PXzszgiK7N8WC0FtYtRrR8c+w2JubVMC7J0dE8WNr8JgxK8mA5w2ftP1V7iyQESO1EO7
	IPFD/5201Kmfi6kGTK0DNq9bsIQE8ZD63CgqipTTSDt/SFuaBIgPu77d203NCUg8jtY30CuQs5Eey
	MRCucA+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTt2-00Bfsh-4q; Mon, 31 Oct 2022 12:27:28 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opTsS-00Bfdg-4Y
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 12:26:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1667219211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/x9mAjb8LNYXXK+HVNHKFir+j3ZwIeSko/dKjp9YLmY=;
	b=AkQsTEKR1y9Fem7oTJ0E3dmo3tSyUuX34g7YcIEBfU/OXBSKRL/QiVX4biNYbj4VOFhn4W
	OCYtrt/Yx9m3DzmtnpA8LOacAJbORJ9GshIUa4dxrFXoxCS8kBtwGlqp6K0QEQc7VI3zeI
	6gqkmpi5G0SI5+1pENUOav6Ir2O/Na4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-218-2kTYFl9gMOG-Nyv8sRQuoQ-1; Mon, 31 Oct 2022 08:26:50 -0400
X-MC-Unique: 2kTYFl9gMOG-Nyv8sRQuoQ-1
Received: by mail-wr1-f69.google.com with SMTP id s7-20020adfa287000000b00236c367fcddso1360505wra.6
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Oct 2022 05:26:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/x9mAjb8LNYXXK+HVNHKFir+j3ZwIeSko/dKjp9YLmY=;
        b=RkJbav2OE3cvWgieqX9DSpWWAgejNEzsSNnwun79+WMaSSwfQWeIIVl7nn3q0JyagQ
         pLYtzCMN0qp1DBX8CrpRP69kmmZUbod1aM8y5lIuj+2pNqmwXfYwzWZaeE+hrUiL3YDo
         gUY1hrqEEJeRssDuiA9VwXiTpBxndPa/SDd1Lbnz0Q9RpPgMTaw9BEDv9vBtr/4+ZYpV
         Rq1r7jSFZg+/3GY9KBzJvLlZFo0qKI0cclb265XRhyCNBxg9i0te4kZ/YNgMsBRNldKD
         /4sL2USnAwHUEYkWoA+hb3TZu8yNEyjzmNjELjBRJMzBo6LIWVzyDMZtEKK/uSVpCI7o
         DRpQ==
X-Gm-Message-State: ACrzQf2/jXU4g/NuFXxb4rfgatYuBDN+J4q0Wr4paPXa5Isu8TU0b8sH
	NFyXapK5Zqg49U2SyHwgVensKGnoPyaPf85o0kzZ8deA59Rw9X+DPsOn9BjHiHJ+XNqo4+6PQER
	3/do7Ur/Amd4jL9Y3+IqXlLaSXWFMAAqN
X-Received: by 2002:a05:600c:4f10:b0:3c6:dcc6:51d7 with SMTP id l16-20020a05600c4f1000b003c6dcc651d7mr7887429wmq.91.1667219208978;
        Mon, 31 Oct 2022 05:26:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4eCY6FaPESRi0FBsuwSJAU0ypknopcItEy1BimghpIISJ8Db9xrgTY3spCPjOXKZ6zCgaGzA==
X-Received: by 2002:a05:600c:4f10:b0:3c6:dcc6:51d7 with SMTP id l16-20020a05600c4f1000b003c6dcc651d7mr7887399wmq.91.1667219208796;
        Mon, 31 Oct 2022 05:26:48 -0700 (PDT)
Received: from [192.168.1.130] (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q1-20020a1ce901000000b003b476cabf1csm4889352wmc.26.2022.10.31.05.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Oct 2022 05:26:48 -0700 (PDT)
Message-ID: <0d2250e4-dc26-2fc9-e429-0d43ef280e5b@redhat.com>
Date: Mon, 31 Oct 2022 13:26:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v2 13/21] drm/fb-helper: Rename drm_fb_helper_alloc_fbi()
 to use _info postfix
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
 <20221024111953.24307-14-tzimmermann@suse.de>
From: Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <20221024111953.24307-14-tzimmermann@suse.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_052652_314332_2E9E84A4 
X-CRM114-Status: UNSURE (   7.30  )
X-CRM114-Notice: Please train this message.
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
> Rename drm_fb_helper_alloc_fbi() to drm_fb_helper_alloc_info() as
> part of unifying the naming within fbdev helpers. Adapt drivers. No
> functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat


