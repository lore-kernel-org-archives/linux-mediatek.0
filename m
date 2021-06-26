Return-Path: <SRS0=XU5C=LU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06020C49EA7
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 08:55:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDA7C60200
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Jun 2021 08:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDA7C60200
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FPFvSR0hZdjpaN6tznbStt2W7smPJf8R3dsbDcvVZhs=; b=Ys8fhC1/hnRAIH
	h4jiGKZAXTFQzNlrf8bi9/cTMNrfynKs+MbX9Q3u6P92sisXPeGMgq1XhVCrNDA2kDUJsaR6teREL
	csY6SKjkM0HUzp0najHSW3gaGj47EkOyIYpcLujZqzZvY22OTO8hFtv5UatfQxkZZutKsgEXIs53w
	x/9WNLuQK8M4X1hTyR6vPMeavTt8g8/aYzRFvh0ZqCcTRM0IYy6TS42JWaeEjwkuNRqqeDFkRFt10
	NyMdqtapvpp5xOma4RmAY/I1ZnWUswAc7NxIN5jL6e7m6pc4/GmLlwo4exK4ysUAeiqO11PcZIMOa
	PD9tWPzziYnGQDXlbvxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lx468-003kL5-Ti; Sat, 26 Jun 2021 08:55:32 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lx465-003kJx-5y; Sat, 26 Jun 2021 08:55:30 +0000
Received: by mail-wm1-x329.google.com with SMTP id
 u8-20020a7bcb080000b02901e44e9caa2aso7268816wmj.4; 
 Sat, 26 Jun 2021 01:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=ptTxiGNRR9tLNMxRNvuOfTEawaDh7PBZAwJYDWExn6A=;
 b=WXZPto5hzmyq5c5odNy0McigPUrb1U8D3ElSea0YA6x/fugujmRnICRwcXvzB0modn
 RFnxjMlR5rE8gEr/sN5IsPfVueKZ85sDhJDqHVQdokVO1mBkU5H75gAJjv02f5wgE+hn
 9LbJ/Lux2MkBxb4hmXxfyM2A54N/Inefn2dzazJZSSLXMuZel802aLRLHm61C95k4Knf
 Qzq1O1q8UbX4z+Di3lo98MSoo9TmKjBJp0IDDBkY80mplsdN197X8ah2DRZiZXdVKiON
 Ys/9hFDExx35ZaHsv4nZKEgcmZoYISMbZ7YT3aQ1MdLsDQFfdmlLJG04Z4poXicy4dGf
 XV4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=ptTxiGNRR9tLNMxRNvuOfTEawaDh7PBZAwJYDWExn6A=;
 b=PJQxZTyF9h/j0yIPeiIbOc1kxJajF0Jy5tRIGftLtUbr0vpxIdNBm1bdlMDpdGNVwv
 TArcSXU+DqInWtkZgUhs/8EM90v8DlKrOT3VQPj2tGAkvlYCBXcwcoVczXxrdVsQ72jA
 6I9F5b90x6hYi2N6U+XLWlwZMW7nG85y4F9b09QxpH95OxEcdgFMZ9cg9XHKj4W37Eqp
 7FJRSaIAJJjAti+/c3f+Eismmj2wkzhB87OFzFT24geHXQF2mEDSveqCl+h2Ndtiec3G
 hCVvFVLC/niY+TnfqBpyY0amfyyg8uL422/+he6jirRzg+JsDqUQ5wpLwpbQdnTHgbOk
 Hf5g==
X-Gm-Message-State: AOAM532ZHfxJg3QZYM/TSQh93UPkiNNixoj3Ltlf5JjW820eub+94TfR
 LRl0wzqZb92WSQT/ODwvZ/w=
X-Google-Smtp-Source: ABdhPJw6/VYXiHMo3tYPsIdCX2Czl9c8v5+Wa4nye0fP9/XfYl++WvluOveXRSNeUl+JlD1lODFXkg==
X-Received: by 2002:a05:600c:2243:: with SMTP id
 a3mr15630087wmm.86.1624697723317; 
 Sat, 26 Jun 2021 01:55:23 -0700 (PDT)
Received: from smtp.gmail.com (a95-92-181-29.cpe.netcabo.pt. [95.92.181.29])
 by smtp.gmail.com with ESMTPSA id n8sm7967502wrt.95.2021.06.26.01.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Jun 2021 01:55:22 -0700 (PDT)
Date: Sat, 26 Jun 2021 09:55:13 +0100
From: Melissa Wen <melissa.srw@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com,
 james.qian.wang@arm.com, liviu.dudau@arm.com,
 mihail.atanassov@arm.com, brian.starkey@arm.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 inki.dae@samsung.com, jy0922.shim@samsung.com,
 sw0312.kim@samsung.com, kyungmin.park@samsung.com,
 krzysztof.kozlowski@canonical.com, xinliang.liu@linaro.org,
 tiantao6@hisilicon.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 laurentiu.palcu@oss.nxp.com, l.stach@pengutronix.de,
 p.zabel@pengutronix.de, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com,
 chunkuang.hu@kernel.org, matthias.bgg@gmail.com, bskeggs@redhat.com,
 tomba@kernel.org, hjc@rock-chips.com, heiko@sntech.de,
 yannick.fertre@foss.st.com, philippe.cornu@foss.st.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 wens@csie.org, jernej.skrabec@gmail.com, thierry.reding@gmail.com,
 jonathanh@nvidia.com, jyri.sarha@iki.fi, emma@anholt.net,
 linux-graphics-maintainer@vmware.com, zackr@vmware.com,
 hyun.kwon@xilinx.com, laurent.pinchart@ideasonboard.com,
 michal.simek@xilinx.com, jani.nikula@linux.intel.com,
 rodrigo.vivi@intel.com, linux@armlinux.org.uk,
 kieran.bingham+renesas@ideasonboard.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, nouveau@lists.freedesktop.org,
 linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [PATCH v4 24/27] drm/vkms: Don't set struct drm_device.irq_enabled
Message-ID: <20210626085513.akf4cwyqpbchmycf@smtp.gmail.com>
References: <20210625082222.3845-1-tzimmermann@suse.de>
 <20210625082222.3845-25-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210625082222.3845-25-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210626_015529_324299_869CA9D1 
X-CRM114-Status: GOOD (  13.27  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 06/25, Thomas Zimmermann wrote:
> The field drm_device.irq_enabled is only used by legacy drivers
> with userspace modesetting. Don't set it in vkms.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

I've also checked here, lgtm.

Reviewed-by: Melissa Wen <melissa.srw@gmail.com>
> ---
>  drivers/gpu/drm/vkms/vkms_drv.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
> index 027ffe759440..496de38ad983 100644
> --- a/drivers/gpu/drm/vkms/vkms_drv.c
> +++ b/drivers/gpu/drm/vkms/vkms_drv.c
> @@ -163,8 +163,6 @@ static int vkms_create(struct vkms_config *config)
>  		goto out_devres;
>  	}
>  
> -	vkms_device->drm.irq_enabled = true;
> -
>  	ret = drm_vblank_init(&vkms_device->drm, 1);
>  	if (ret) {
>  		DRM_ERROR("Failed to vblank\n");
> -- 
> 2.32.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
