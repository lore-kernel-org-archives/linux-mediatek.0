Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 770EEC433C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 09:17:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20E3B619D6
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 09:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20E3B619D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GbbigBRLyVTJpqBM03rvBBsc3ZhnGkCJUDQnqBsJjxU=; b=TGy7Q2IqOZpHpadzogLCYBm7o
	4vmwPdNv4uyXxGYA4frBqBFptfgEIb5WFgtC7wyLCtOnurrhK9hc2ItWISSzAz9Ckilj8PTXZqt8Z
	uuBXrkVJKgCDnBUA212RKhfeLvRontAhtl3C0HRjT1h2Y5bkJ59nmpRdJ9/XFUSTvc+YI2z1uvjgI
	QNEulWreGOkh6QjpEl6YCjX5r0dI/WZ4p3EDYXgXeF9rjONlls20W3Ov/Rlz3dlkgKJmc87fuwCM2
	NHBprBeiIo2sRpYA6X/2cGA/ndpM8TuZfFFZByh0mB34ertCyMTCLdYZQuS6FhKyJTcEiRIhA12IF
	g3VBsBIrA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRWyt-0065yw-C6; Wed, 31 Mar 2021 09:17:44 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRWxN-0065Ul-Rs
 for linux-mediatek@lists.infradead.org; Wed, 31 Mar 2021 09:16:13 +0000
Received: by mail-io1-xd36.google.com with SMTP id v26so19385414iox.11
 for <linux-mediatek@lists.infradead.org>; Wed, 31 Mar 2021 02:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cTMPs2SgYmJwp4UhdhuuT2INlWhxFLMPnLXPbu2mNao=;
 b=d+yAUQ1MQhncfG9xmpzYJoc7BbjeHST/9O/D4kawpu93JxeNCFWcO6IA1qIdjNN5tg
 PXtBrqjR4fpOi3U1ixkgBceAo3bf0yZHKz1XRXH2psHkcKh0t9nz0KstibxuQeXctg9f
 7cEnoB9UyGpWSEoLDgHgiZXfv64nhba9sAADM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cTMPs2SgYmJwp4UhdhuuT2INlWhxFLMPnLXPbu2mNao=;
 b=OcSPVMQUHoaG6Q0GzeU630TMpqWCrwqeo99ZKxFt7iIIiqkhbN7b1NL3w/7UB4iBY+
 geqLRikbfYb6X5wVwV8/ao2I85xaW4f9hJp29TioDRbdBz8fWfbPT3n6z+R8CS12w4ek
 XlPEPejrCBQiQ+a/BWwBSQvnFqSNlUMUQeHta3rI4p6hPu0vrFvye4U+h8XIVYLocS6l
 SVtsJ46Fqm+GHbQ8XCW92a/GnxuFy6kcqcRW1vHh+370vIvjKVeyXScDwvkOwW3ouKI9
 KjWyuNGSIyNPZoYmpWht2PdoTiX2u257JdOv2jztaHfEImwGyLdZB1el8SAdf27lMNg6
 Abgg==
X-Gm-Message-State: AOAM531vlMbEEkXDwN3+vfyaa0nxyFjZN2afvigmxtl5vVOukh237FYD
 kG4xwBPAIFWl57KtG5eN/tLK7RvHCYQn/fHmhRCYGw==
X-Google-Smtp-Source: ABdhPJyUcOCXlKhc8WLb+slH96RHwWHk8tbEKRlfVJXCa7ZxGet90BJLoDrbJaK9d11NA9fRzfijIMD0uLRQm+5uDRE=
X-Received: by 2002:a05:6638:238c:: with SMTP id
 q12mr2190200jat.114.1617182168349; 
 Wed, 31 Mar 2021 02:16:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210331090659.4169966-1-enric.balletbo@collabora.com>
 <20210331090659.4169966-2-enric.balletbo@collabora.com>
In-Reply-To: <20210331090659.4169966-2-enric.balletbo@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 31 Mar 2021 17:15:42 +0800
Message-ID: <CAJMQK-ibWYhsEU3reUPjXZ5fRFzzircQfa35BjqZJ-vSn8ZJMQ@mail.gmail.com>
Subject: Re: [RESEND PATCH 2/2] arm64: defconfig: Enable options to support
 panel display for Mediatek Chromebooks
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: lkml <linux-kernel@vger.kernel.org>, 
 Collabora Kernel ML <kernel@collabora.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, 
 Arnd Bergmann <arnd@arndb.de>, Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Catalin Marinas <catalin.marinas@arm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>,
 =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>, 
 Jagan Teki <jagan@amarulasolutions.com>, Jon Hunter <jonathanh@nvidia.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Max Krummenacher <max.oss.09@gmail.com>, Michael Walle <michael@walle.cc>,
 Nishanth Menon <nm@ti.com>, 
 Shawn Guo <shawnguo@kernel.org>, Will Deacon <will@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_101610_584376_B7E6E002 
X-CRM114-Status: GOOD (  17.30  )
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

On Wed, Mar 31, 2021 at 5:07 PM Enric Balletbo i Serra
<enric.balletbo@collabora.com> wrote:
>
> There are some Mediatek based Chromebooks supported in the kernel. Enable the
> required config options to have the panel display working on both devices.
> This was tested on the ACER Chromebook R13 (MT8173) and the Lenovo
> Ideapad Duet (MT8183), but should also enable display support for similar
> devices.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

> This is only a resend rebased on top of mainline to fix some trivial
> conflicts.
>
>  arch/arm64/configs/defconfig | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7b4be3807b6d..f2dc42c9b932 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -686,6 +686,7 @@ CONFIG_DRM_MSM=m
>  CONFIG_DRM_TEGRA=m
>  CONFIG_DRM_PANEL_LVDS=m
>  CONFIG_DRM_PANEL_SIMPLE=m
> +CONFIG_DRM_PANEL_BOE_TV101WUM_NL6=m
>  CONFIG_DRM_PANEL_MANTIX_MLAF057WE51=m
>  CONFIG_DRM_PANEL_RAYDIUM_RM67191=m
>  CONFIG_DRM_PANEL_SITRONIX_ST7703=m
> @@ -693,6 +694,7 @@ CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>  CONFIG_DRM_DISPLAY_CONNECTOR=m
>  CONFIG_DRM_NWL_MIPI_DSI=m
>  CONFIG_DRM_LONTIUM_LT9611=m
> +CONFIG_DRM_PARADE_PS8640=m
>  CONFIG_DRM_SII902X=m
>  CONFIG_DRM_SIMPLE_BRIDGE=m
>  CONFIG_DRM_THINE_THC63LVD1024=m
> @@ -707,6 +709,8 @@ CONFIG_DRM_VC4=m
>  CONFIG_DRM_ETNAVIV=m
>  CONFIG_DRM_HISI_HIBMC=m
>  CONFIG_DRM_HISI_KIRIN=m
> +CONFIG_DRM_MEDIATEK=m
> +CONFIG_DRM_MEDIATEK_HDMI=m
>  CONFIG_DRM_MXSFB=m
>  CONFIG_DRM_MESON=m
>  CONFIG_DRM_PL111=m
> @@ -979,6 +983,7 @@ CONFIG_ROCKCHIP_IOMMU=y
>  CONFIG_TEGRA_IOMMU_SMMU=y
>  CONFIG_ARM_SMMU=y
>  CONFIG_ARM_SMMU_V3=y
> +CONFIG_MTK_IOMMU=y
>  CONFIG_QCOM_IOMMU=y
>  CONFIG_REMOTEPROC=y
>  CONFIG_QCOM_Q6V5_MSS=m
> @@ -1051,6 +1056,8 @@ CONFIG_PWM_BCM2835=m
>  CONFIG_PWM_CROS_EC=m
>  CONFIG_PWM_IMX27=m
>  CONFIG_PWM_MESON=m
> +CONFIG_PWM_MTK_DISP=m
> +CONFIG_PWM_MEDIATEK=m
>  CONFIG_PWM_RCAR=m
>  CONFIG_PWM_ROCKCHIP=y
>  CONFIG_PWM_SAMSUNG=y
> @@ -1095,6 +1102,7 @@ CONFIG_QCOM_L3_PMU=y
>  CONFIG_NVMEM_IMX_OCOTP=y
>  CONFIG_NVMEM_IMX_OCOTP_SCU=y
>  CONFIG_QCOM_QFPROM=y
> +CONFIG_MTK_EFUSE=y
>  CONFIG_ROCKCHIP_EFUSE=y
>  CONFIG_NVMEM_SUNXI_SID=y
>  CONFIG_UNIPHIER_EFUSE=y
> --
> 2.30.2
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
