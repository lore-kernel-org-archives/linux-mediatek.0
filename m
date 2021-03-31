Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2E9BDC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 09:16:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C015A619C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 09:16:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C015A619C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8IFsW8cvdFRiaqvhORaoRRHvPIwKnWWYkHcmkya32zQ=; b=JuuTaqPHtdWbY67H0avpwTcVG
	PhjG+w5/RqWeertbJuKGW9PJ3f7JbA0NS5/Jue0hEYNjv8tQDOkbn896qp9H95bg8PDsyJvbLCnJf
	+laLgtCl/uYzdnDNqObenyHtW25EbPojoYDm2T3XKeh58pAblReHKhIRVQQl9aNZ49D/8B2iEweCV
	QrGBnn+tJ+r0Z1+GBKbSNhayaMyJsT/wql51pz9JASArBIHrVcvWJz7tayy1jksMD3gamIM+0rNmw
	DCFciHr72+FngiMj2mZWe9oSZvqs63Cc2XMfuqJUVsW4HsBYJcLPba+gbydOeGVa0NnhzgmlZqoIt
	LIetzgc+Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRWxh-0065bc-4P; Wed, 31 Mar 2021 09:16:29 +0000
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRWx9-0065RZ-Rx
 for linux-mediatek@lists.infradead.org; Wed, 31 Mar 2021 09:16:08 +0000
Received: by mail-io1-xd2e.google.com with SMTP id k25so19398431iob.6
 for <linux-mediatek@lists.infradead.org>; Wed, 31 Mar 2021 02:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=zzwjjkojBahFkPk5yx+4KLV3mmMczPvY6jdqhG6LqMo=;
 b=O+szBsNMcfZXmAhipiZBpQSU0MGTPHP99mxMxJWTt39iw0+98klUogwZZm5UNSIL32
 Pw5jvXD0cjN0d3xWz/W94US6xRFW1LOOqDORgpCrEUiauRX7zP3/GUm65rXn5h0O/wwE
 slVPcu8ewUx4Kl47JEJFro8f0MoIaonhfcgmI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=zzwjjkojBahFkPk5yx+4KLV3mmMczPvY6jdqhG6LqMo=;
 b=LWvHwuSAIt/gBHkdU0pwyQWQ6160n8vxep3EivhJVVsJxrN8Js0xmQzOZOkeiRfPe6
 R9HPKMIeBZb00bcN40Ido4a6S+jYUEMqEkyOSQtVrnHV2VuEPZCvrzaKKoUcY4K3qKtw
 NZh0/mc+x6XYj8l6TJfNqLo7zIjQ5/NGhXJpT7hrHylo2zkqZNqLvuMf/HmJW36qk+Fl
 KH75y6GfbN8Rztm6CZ2fOW+CTVNIFWnSUN/vweUNravdSVvgYTBqb0AM69812VeeZdub
 T5ps37mOvTBdk6WjXfJH9ToD7bGZpIv7Lxrab8/1QE43kkGwP0m9ZdsCzrFXUCPfSBG8
 U3tg==
X-Gm-Message-State: AOAM533oP1a8GubSSc2faPUUbgU+u2pKG2B8j5ly0tBlu+uo2RvZkFGt
 Qm4LGzM/afbvOeCizTzQO035lkIrPycrD1uUQUMWNA==
X-Google-Smtp-Source: ABdhPJwjo7tM7F+sIstrfOpUM82LTDQwJZRYMDcMKJTuSLaawUPoVrxDRap9cWz8IYHdEvwwzMDU9O3aqODrAQMCt6o=
X-Received: by 2002:a05:6638:371e:: with SMTP id
 k30mr2137695jav.4.1617182154622; 
 Wed, 31 Mar 2021 02:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210331090659.4169966-1-enric.balletbo@collabora.com>
In-Reply-To: <20210331090659.4169966-1-enric.balletbo@collabora.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 31 Mar 2021 17:15:28 +0800
Message-ID: <CAJMQK-jO=yfXDa4t1WzNVmyoQnaBkQP1t1G3HgThWCRAseWk3g@mail.gmail.com>
Subject: Re: [RESEND PATCH 1/2] arm64: defconfig: Allow mt8173-based boards to
 boot from usb
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
 Jagan Teki <jagan@amarulasolutions.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
 Max Krummenacher <max.oss.09@gmail.com>, Michael Walle <michael@walle.cc>,
 Nishanth Menon <nm@ti.com>, 
 Shawn Guo <shawnguo@kernel.org>, Will Deacon <will@kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_101606_306841_83B1454D 
X-CRM114-Status: GOOD (  15.03  )
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
> Enable the option necessary to boot mt8173-based boards to boot from
> usb devices, like its phy and the regulators needed to have proper
> support.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> ---
Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>

> This is only a resend rebased on top of mainline to fix some trivial
> conflicts.
>
>  arch/arm64/configs/defconfig | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index d612f633b771..7b4be3807b6d 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -448,6 +448,7 @@ CONFIG_I2C_GPIO=m
>  CONFIG_I2C_IMX=y
>  CONFIG_I2C_IMX_LPI2C=y
>  CONFIG_I2C_MESON=y
> +CONFIG_I2C_MT65XX=y
>  CONFIG_I2C_MV64XXX=y
>  CONFIG_I2C_OMAP=y
>  CONFIG_I2C_OWL=y
> @@ -594,6 +595,7 @@ CONFIG_MFD_EXYNOS_LPASS=m
>  CONFIG_MFD_HI6421_PMIC=y
>  CONFIG_MFD_HI655X_PMIC=y
>  CONFIG_MFD_MAX77620=y
> +CONFIG_MFD_MT6397=y
>  CONFIG_MFD_SPMI_PMIC=y
>  CONFIG_MFD_RK808=y
>  CONFIG_MFD_SEC_CORE=y
> @@ -611,6 +613,8 @@ CONFIG_REGULATOR_HI655X=y
>  CONFIG_REGULATOR_MAX77620=y
>  CONFIG_REGULATOR_MAX8973=y
>  CONFIG_REGULATOR_MP8859=y
> +CONFIG_REGULATOR_MT6358=y
> +CONFIG_REGULATOR_MT6397=y
>  CONFIG_REGULATOR_PCA9450=y
>  CONFIG_REGULATOR_PF8X00=y
>  CONFIG_REGULATOR_PFUZE100=y
> @@ -787,6 +791,7 @@ CONFIG_USB_RENESAS_USBHS_HCD=m
>  CONFIG_USB_RENESAS_USBHS=m
>  CONFIG_USB_ACM=m
>  CONFIG_USB_STORAGE=y
> +CONFIG_USB_MTU3=y
>  CONFIG_USB_MUSB_HDRC=y
>  CONFIG_USB_MUSB_SUNXI=y
>  CONFIG_USB_DWC3=y
> @@ -988,6 +993,7 @@ CONFIG_OWL_PM_DOMAINS=y
>  CONFIG_RASPBERRYPI_POWER=y
>  CONFIG_FSL_DPAA=y
>  CONFIG_FSL_MC_DPIO=y
> +CONFIG_MTK_PMIC_WRAP=y
>  CONFIG_QCOM_AOSS_QMP=y
>  CONFIG_QCOM_COMMAND_DB=y
>  CONFIG_QCOM_GENI_SE=y
> @@ -1064,6 +1070,7 @@ CONFIG_PHY_HI6220_USB=y
>  CONFIG_PHY_HISTB_COMBPHY=y
>  CONFIG_PHY_HISI_INNO_USB2=y
>  CONFIG_PHY_MVEBU_CP110_COMPHY=y
> +CONFIG_PHY_MTK_TPHY=y
>  CONFIG_PHY_QCOM_QMP=m
>  CONFIG_PHY_QCOM_QUSB2=m
>  CONFIG_PHY_QCOM_USB_HS=y
> --
> 2.30.2
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
