Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B31ECAAD1
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 14:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=us85x22JTlrF7wD8uYoUk5r++buWfK/pYA6gIAEUhK8=; b=QOVSmzSghvLx5UmdfXMapbJIaI
	8pYWmJgfItHd5hFrPY2rCEhI0d1B8A1rvQljFr3ryw7F4vysHOLe4/QGPa4bWwQ4858W0wOOsaM4I
	44fI0wyo7dKEZ6IjCIr1MWpt1vBiyUeIO1x2l52ltFHBLvlQt31Ai15QDR3yrE6TjnekmShmBSgv2
	8jJhDs9/dF65BLPkDdCEFToytEOyf428U4chHlVl1c84+4sjJSTBd2RsZX43ObgM2pXzQZrdiWytu
	rIRHS0fejEBCFXA3a5g7xliov/xVI/d/lbqzlTMMTztrTkZPcakxoneLjJH7+EbsJVgV+BLdi9OzK
	SV6fjTRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2Lk-0002NZ-LG; Tue, 30 Aug 2022 14:36:20 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT2LZ-0002LJ-Gg; Tue, 30 Aug 2022 14:36:11 +0000
Received: by mail-wm1-x329.google.com with SMTP id n17-20020a05600c501100b003a84bf9b68bso1320842wmr.3;
        Tue, 30 Aug 2022 07:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=us85x22JTlrF7wD8uYoUk5r++buWfK/pYA6gIAEUhK8=;
        b=COOUiPIa2mOTQAJAn8kcVFqO05W8SHxtgh7b277tT2ei9x7z1DlxP/I6+fCfgtXVaS
         DfTXuR6UyDGanIwCYIhuUUS3NJtEr907BQ1Make7tQF5GU4M0ryo/bW4rvpVGQwFq+aH
         msWjVaqTnDps1MT+EzzGVFSFAuJu2sLdk1mmfb6qdFeWEk0mikllVRaq3nrWJW/+sCMP
         8+rLTZ+y0F+NsCyJq3WR72a93Tc3OSa67utCt9paFoAjiox+jKfJ4k8N/wOmRgiZdCVN
         rELqFydlcMqkyHlVAebu6OU6waJT+32kwn8NKCTmQKPZ0MaEOuJrhBYxtxX+8nOgYPo8
         oXiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=us85x22JTlrF7wD8uYoUk5r++buWfK/pYA6gIAEUhK8=;
        b=xaP9bhh021AfqyxxYSs4uJnM4YiO6B1D+shAprBtiJRRKrNWyBuD9S/WzYQdGGm0tl
         esDxwbbaERmpKCSHNskRdVhAUSxmgDItp7u5OOu8mm12Ypz3GjtivS/fHeq+QTNsKx/k
         m70aybiHXBQcB3Xn7boh9l3euhZEOEXIB++4Po8HlanLZnJzurOWLJ0AANHk6wJzT37A
         mJpE9Pv/Qqb7/FFZXPZuCNkkeNiXi8zFUXCHFWrGvs1bfTLD08E0Md/M96h0i/wpDSLD
         zGms/Jca50Z9LFcQ0MP+EzdajS7MT/yvcOUW2WnaU3A4QFt+zopkbxDURSkh4+Ti4qA5
         WZHA==
X-Gm-Message-State: ACgBeo1G2BZjPRcTULHNrcvyeEBLn/vOqbpxEVn8eIHeImVVLS/R4KGn
	fKjWvEPT1K8w7iJC4dSshT8=
X-Google-Smtp-Source: AA6agR45ExdTimhT2F8/OeCUtb+YhaF+hFoTBufVmwvO9EZdJ+yS+f8N6ztPsowvo7qAi2/nYByS0g==
X-Received: by 2002:a05:600c:3b05:b0:3a8:4c81:54df with SMTP id m5-20020a05600c3b0500b003a84c8154dfmr3282778wms.129.1661870166813;
        Tue, 30 Aug 2022 07:36:06 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id i17-20020a5d55d1000000b00226d945c72esm6686369wrw.96.2022.08.30.07.36.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Aug 2022 07:36:05 -0700 (PDT)
Message-ID: <8b4da979-fe50-4d09-f679-277053730ff1@gmail.com>
Date: Tue, 30 Aug 2022 16:36:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.1.2
Subject: Re: [PATCH V2 1/2] nvmem: prefix all symbols with NVMEM_
Content-Language: en-US
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Russell King <linux@armlinux.org.uk>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 Thara Gopinath <thara.gopinath@gmail.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <joel@jms.id.au>,
 Florian Fainelli <f.fainelli@gmail.com>, Thierry Reding
 <treding@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 Mark Brown <broonie@kernel.org>, Stephan Gerhold <stephan@gerhold.net>,
 Michael Walle <michael@walle.cc>, Shawn Guo <shawnguo@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Vinod Koul <vkoul@kernel.org>,
 "H . Nikolaus Schaller" <hns@goldelico.com>,
 Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
References: <20220830134059.18744-1-zajec5@gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220830134059.18744-1-zajec5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_073609_586464_05AEF2E0 
X-CRM114-Status: GOOD (  21.57  )
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



On 30/08/2022 15:40, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This unifies all NVMEM symbols. They follow one style now.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

For the MediaTek part:
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   arch/arm/configs/multi_v7_defconfig |  6 +++---
>   arch/arm/configs/qcom_defconfig     |  2 +-
>   arch/arm64/configs/defconfig        | 10 +++++-----
>   arch/mips/configs/ci20_defconfig    |  2 +-
>   drivers/cpufreq/Kconfig.arm         |  2 +-
>   drivers/nvmem/Kconfig               | 24 ++++++++++++------------
>   drivers/nvmem/Makefile              | 24 ++++++++++++------------
>   drivers/soc/mediatek/Kconfig        |  2 +-
>   drivers/thermal/qcom/Kconfig        |  2 +-
>   9 files changed, 37 insertions(+), 37 deletions(-)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index b1a25b8c11e7..b61b2e3d116b 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -1188,11 +1188,11 @@ CONFIG_TI_PIPE3=y
>   CONFIG_TWL4030_USB=m
>   CONFIG_RAS=y
>   CONFIG_NVMEM_IMX_OCOTP=y
> -CONFIG_QCOM_QFPROM=y
> -CONFIG_ROCKCHIP_EFUSE=m
> +CONFIG_NVMEM_QCOM_QFPROM=y
> +CONFIG_NVMEM_ROCKCHIP_EFUSE=m
>   CONFIG_NVMEM_SUNXI_SID=y
>   CONFIG_NVMEM_VF610_OCOTP=y
> -CONFIG_MESON_MX_EFUSE=m
> +CONFIG_NVMEM_MESON_MX_EFUSE=m
>   CONFIG_NVMEM_RMEM=m
>   CONFIG_FSI=m
>   CONFIG_FSI_MASTER_GPIO=m
> diff --git a/arch/arm/configs/qcom_defconfig b/arch/arm/configs/qcom_defconfig
> index 12b82c662359..8e1f13faeee5 100644
> --- a/arch/arm/configs/qcom_defconfig
> +++ b/arch/arm/configs/qcom_defconfig
> @@ -282,7 +282,7 @@ CONFIG_PHY_QCOM_QMP=y
>   CONFIG_PHY_QCOM_USB_HS=y
>   CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=y
>   CONFIG_PHY_QCOM_USB_HSIC=y
> -CONFIG_QCOM_QFPROM=y
> +CONFIG_NVMEM_QCOM_QFPROM=y
>   CONFIG_INTERCONNECT=y
>   CONFIG_INTERCONNECT_QCOM=y
>   CONFIG_INTERCONNECT_QCOM_MSM8974=m
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 265454620682..91e58cf59c99 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -1238,12 +1238,12 @@ CONFIG_QCOM_L3_PMU=y
>   CONFIG_HISI_PMU=y
>   CONFIG_NVMEM_IMX_OCOTP=y
>   CONFIG_NVMEM_IMX_OCOTP_SCU=y
> -CONFIG_MTK_EFUSE=y
> -CONFIG_QCOM_QFPROM=y
> -CONFIG_ROCKCHIP_EFUSE=y
> +CONFIG_NVMEM_MTK_EFUSE=y
> +CONFIG_NVMEM_QCOM_QFPROM=y
> +CONFIG_NVMEM_ROCKCHIP_EFUSE=y
>   CONFIG_NVMEM_SUNXI_SID=y
> -CONFIG_UNIPHIER_EFUSE=y
> -CONFIG_MESON_EFUSE=m
> +CONFIG_NVMEM_UNIPHIER_EFUSE=y
> +CONFIG_NVMEM_MESON_EFUSE=m
>   CONFIG_NVMEM_RMEM=m
>   CONFIG_NVMEM_LAYERSCAPE_SFP=m
>   CONFIG_FPGA=y
> diff --git a/arch/mips/configs/ci20_defconfig b/arch/mips/configs/ci20_defconfig
> index 955b6ac581ab..11f08b6a3013 100644
> --- a/arch/mips/configs/ci20_defconfig
> +++ b/arch/mips/configs/ci20_defconfig
> @@ -143,7 +143,7 @@ CONFIG_MEMORY=y
>   CONFIG_JZ4780_NEMC=y
>   CONFIG_PWM=y
>   CONFIG_PWM_JZ4740=m
> -CONFIG_JZ4780_EFUSE=y
> +CONFIG_NVMEM_JZ4780_EFUSE=y
>   CONFIG_JZ4770_PHY=y
>   CONFIG_EXT4_FS=y
>   # CONFIG_DNOTIFY is not set
> diff --git a/drivers/cpufreq/Kconfig.arm b/drivers/cpufreq/Kconfig.arm
> index 954749afb5fe..82e5de1f6f8c 100644
> --- a/drivers/cpufreq/Kconfig.arm
> +++ b/drivers/cpufreq/Kconfig.arm
> @@ -153,7 +153,7 @@ config ARM_OMAP2PLUS_CPUFREQ
>   config ARM_QCOM_CPUFREQ_NVMEM
>   	tristate "Qualcomm nvmem based CPUFreq"
>   	depends on ARCH_QCOM
> -	depends on QCOM_QFPROM
> +	depends on NVMEM_QCOM_QFPROM
>   	depends on QCOM_SMEM
>   	select PM_OPP
>   	help
> diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig
> index bab8a29c9861..691375c13381 100644
> --- a/drivers/nvmem/Kconfig
> +++ b/drivers/nvmem/Kconfig
> @@ -52,7 +52,7 @@ config NVMEM_IMX_OCOTP_SCU
>   	  This is a driver for the SCU On-Chip OTP Controller (OCOTP)
>   	  available on i.MX8 SoCs.
>   
> -config JZ4780_EFUSE
> +config NVMEM_JZ4780_EFUSE
>   	tristate "JZ4780 EFUSE Memory Support"
>   	depends on MACH_INGENIC || COMPILE_TEST
>   	depends on HAS_IOMEM
> @@ -96,7 +96,7 @@ config NVMEM_MXS_OCOTP
>   	  This driver can also be built as a module. If so, the module
>   	  will be called nvmem-mxs-ocotp.
>   
> -config MTK_EFUSE
> +config NVMEM_MTK_EFUSE
>   	tristate "Mediatek SoCs EFUSE support"
>   	depends on ARCH_MEDIATEK || COMPILE_TEST
>   	depends on HAS_IOMEM
> @@ -107,7 +107,7 @@ config MTK_EFUSE
>   	  This driver can also be built as a module. If so, the module
>   	  will be called efuse-mtk.
>   
> -config MICROCHIP_OTPC
> +config NVMEM_MICROCHIP_OTPC
>   	tristate "Microchip OTPC support"
>   	depends on ARCH_AT91 || COMPILE_TEST
>   	help
> @@ -126,7 +126,7 @@ config NVMEM_NINTENDO_OTP
>   	  This driver can also be built as a module. If so, the module
>   	  will be called nvmem-nintendo-otp.
>   
> -config QCOM_QFPROM
> +config NVMEM_QCOM_QFPROM
>   	tristate "QCOM QFPROM Support"
>   	depends on ARCH_QCOM || COMPILE_TEST
>   	depends on HAS_IOMEM
> @@ -145,7 +145,7 @@ config NVMEM_SPMI_SDAM
>   	  Qualcomm Technologies, Inc. PMICs. It provides the clients
>   	  an interface to read/write to the SDAM module's shared memory.
>   
> -config ROCKCHIP_EFUSE
> +config NVMEM_ROCKCHIP_EFUSE
>   	tristate "Rockchip eFuse Support"
>   	depends on ARCH_ROCKCHIP || COMPILE_TEST
>   	depends on HAS_IOMEM
> @@ -156,7 +156,7 @@ config ROCKCHIP_EFUSE
>   	  This driver can also be built as a module. If so, the module
>   	  will be called nvmem_rockchip_efuse.
>   
> -config ROCKCHIP_OTP
> +config NVMEM_ROCKCHIP_OTP
>   	tristate "Rockchip OTP controller support"
>   	depends on ARCH_ROCKCHIP || COMPILE_TEST
>   	depends on HAS_IOMEM
> @@ -199,7 +199,7 @@ config NVMEM_SUNXI_SID
>   	  This driver can also be built as a module. If so, the module
>   	  will be called nvmem_sunxi_sid.
>   
> -config UNIPHIER_EFUSE
> +config NVMEM_UNIPHIER_EFUSE
>   	tristate "UniPhier SoCs eFuse support"
>   	depends on ARCH_UNIPHIER || COMPILE_TEST
>   	depends on HAS_IOMEM
> @@ -221,7 +221,7 @@ config NVMEM_VF610_OCOTP
>   	  This driver can also be build as a module. If so, the module will
>   	  be called nvmem-vf610-ocotp.
>   
> -config MESON_EFUSE
> +config NVMEM_MESON_EFUSE
>   	tristate "Amlogic Meson GX eFuse Support"
>   	depends on (ARCH_MESON || COMPILE_TEST) && MESON_SM
>   	help
> @@ -231,7 +231,7 @@ config MESON_EFUSE
>   	  This driver can also be built as a module. If so, the module
>   	  will be called nvmem_meson_efuse.
>   
> -config MESON_MX_EFUSE
> +config NVMEM_MESON_MX_EFUSE
>   	tristate "Amlogic Meson6/Meson8/Meson8b eFuse Support"
>   	depends on ARCH_MESON || COMPILE_TEST
>   	help
> @@ -251,13 +251,13 @@ config NVMEM_SNVS_LPGPR
>   	  This driver can also be built as a module. If so, the module
>   	  will be called nvmem-snvs-lpgpr.
>   
> -config RAVE_SP_EEPROM
> +config NVMEM_RAVE_SP_EEPROM
>   	tristate "Rave SP EEPROM Support"
>   	depends on RAVE_SP_CORE
>   	help
>   	  Say y here to enable Rave SP EEPROM support.
>   
> -config SC27XX_EFUSE
> +config NVMEM_SC27XX_EFUSE
>   	tristate "Spreadtrum SC27XX eFuse Support"
>   	depends on MFD_SC27XX_PMIC || COMPILE_TEST
>   	depends on HAS_IOMEM
> @@ -278,7 +278,7 @@ config NVMEM_ZYNQMP
>   
>   	  If sure, say yes. If unsure, say no.
>   
> -config SPRD_EFUSE
> +config NVMEM_SPRD_EFUSE
>   	tristate "Spreadtrum SoC eFuse Support"
>   	depends on ARCH_SPRD || COMPILE_TEST
>   	depends on HAS_IOMEM
> diff --git a/drivers/nvmem/Makefile b/drivers/nvmem/Makefile
> index 399f9972d45b..7ac988c6966e 100644
> --- a/drivers/nvmem/Makefile
> +++ b/drivers/nvmem/Makefile
> @@ -15,7 +15,7 @@ obj-$(CONFIG_NVMEM_IMX_OCOTP)	+= nvmem-imx-ocotp.o
>   nvmem-imx-ocotp-y		:= imx-ocotp.o
>   obj-$(CONFIG_NVMEM_IMX_OCOTP_SCU)	+= nvmem-imx-ocotp-scu.o
>   nvmem-imx-ocotp-scu-y		:= imx-ocotp-scu.o
> -obj-$(CONFIG_JZ4780_EFUSE)		+= nvmem_jz4780_efuse.o
> +obj-$(CONFIG_NVMEM_JZ4780_EFUSE)		+= nvmem_jz4780_efuse.o
>   nvmem_jz4780_efuse-y		:= jz4780-efuse.o
>   obj-$(CONFIG_NVMEM_LPC18XX_EEPROM)	+= nvmem_lpc18xx_eeprom.o
>   nvmem_lpc18xx_eeprom-y	:= lpc18xx_eeprom.o
> @@ -25,37 +25,37 @@ obj-$(CONFIG_NVMEM_MXS_OCOTP)	+= nvmem-mxs-ocotp.o
>   nvmem-mxs-ocotp-y		:= mxs-ocotp.o
>   obj-$(CONFIG_NVMEM_NINTENDO_OTP)	+= nvmem-nintendo-otp.o
>   nvmem-nintendo-otp-y		:= nintendo-otp.o
> -obj-$(CONFIG_MTK_EFUSE)		+= nvmem_mtk-efuse.o
> +obj-$(CONFIG_NVMEM_MTK_EFUSE)		+= nvmem_mtk-efuse.o
>   nvmem_mtk-efuse-y		:= mtk-efuse.o
> -obj-$(CONFIG_QCOM_QFPROM)	+= nvmem_qfprom.o
> +obj-$(CONFIG_NVMEM_QCOM_QFPROM)	+= nvmem_qfprom.o
>   nvmem_qfprom-y			:= qfprom.o
>   obj-$(CONFIG_NVMEM_SPMI_SDAM)	+= nvmem_qcom-spmi-sdam.o
>   nvmem_qcom-spmi-sdam-y		+= qcom-spmi-sdam.o
> -obj-$(CONFIG_ROCKCHIP_EFUSE)	+= nvmem_rockchip_efuse.o
> +obj-$(CONFIG_NVMEM_ROCKCHIP_EFUSE)	+= nvmem_rockchip_efuse.o
>   nvmem_rockchip_efuse-y		:= rockchip-efuse.o
> -obj-$(CONFIG_ROCKCHIP_OTP)	+= nvmem-rockchip-otp.o
> +obj-$(CONFIG_NVMEM_ROCKCHIP_OTP)	+= nvmem-rockchip-otp.o
>   nvmem-rockchip-otp-y		:= rockchip-otp.o
>   obj-$(CONFIG_NVMEM_SUNXI_SID)	+= nvmem_sunxi_sid.o
>   nvmem_stm32_romem-y 		:= stm32-romem.o
>   obj-$(CONFIG_NVMEM_STM32_ROMEM) += nvmem_stm32_romem.o
>   nvmem_sunxi_sid-y		:= sunxi_sid.o
> -obj-$(CONFIG_UNIPHIER_EFUSE)	+= nvmem-uniphier-efuse.o
> +obj-$(CONFIG_NVMEM_UNIPHIER_EFUSE)	+= nvmem-uniphier-efuse.o
>   nvmem-uniphier-efuse-y		:= uniphier-efuse.o
>   obj-$(CONFIG_NVMEM_VF610_OCOTP)	+= nvmem-vf610-ocotp.o
>   nvmem-vf610-ocotp-y		:= vf610-ocotp.o
> -obj-$(CONFIG_MESON_EFUSE)	+= nvmem_meson_efuse.o
> +obj-$(CONFIG_NVMEM_MESON_EFUSE)	+= nvmem_meson_efuse.o
>   nvmem_meson_efuse-y		:= meson-efuse.o
> -obj-$(CONFIG_MESON_MX_EFUSE)	+= nvmem_meson_mx_efuse.o
> +obj-$(CONFIG_NVMEM_MESON_MX_EFUSE)	+= nvmem_meson_mx_efuse.o
>   nvmem_meson_mx_efuse-y		:= meson-mx-efuse.o
>   obj-$(CONFIG_NVMEM_SNVS_LPGPR)	+= nvmem_snvs_lpgpr.o
>   nvmem_snvs_lpgpr-y		:= snvs_lpgpr.o
> -obj-$(CONFIG_RAVE_SP_EEPROM)	+= nvmem-rave-sp-eeprom.o
> +obj-$(CONFIG_NVMEM_RAVE_SP_EEPROM)	+= nvmem-rave-sp-eeprom.o
>   nvmem-rave-sp-eeprom-y		:= rave-sp-eeprom.o
> -obj-$(CONFIG_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
> +obj-$(CONFIG_NVMEM_SC27XX_EFUSE)	+= nvmem-sc27xx-efuse.o
>   nvmem-sc27xx-efuse-y		:= sc27xx-efuse.o
>   obj-$(CONFIG_NVMEM_ZYNQMP)	+= nvmem_zynqmp_nvmem.o
>   nvmem_zynqmp_nvmem-y		:= zynqmp_nvmem.o
> -obj-$(CONFIG_SPRD_EFUSE)	+= nvmem_sprd_efuse.o
> +obj-$(CONFIG_NVMEM_SPRD_EFUSE)	+= nvmem_sprd_efuse.o
>   nvmem_sprd_efuse-y		:= sprd-efuse.o
>   obj-$(CONFIG_NVMEM_RMEM) 	+= nvmem-rmem.o
>   nvmem-rmem-y			:= rmem.o
> @@ -67,7 +67,7 @@ obj-$(CONFIG_NVMEM_SUNPLUS_OCOTP)	+= nvmem_sunplus_ocotp.o
>   nvmem_sunplus_ocotp-y		:= sunplus-ocotp.o
>   obj-$(CONFIG_NVMEM_APPLE_EFUSES)	+= nvmem-apple-efuses.o
>   nvmem-apple-efuses-y 		:= apple-efuses.o
> -obj-$(CONFIG_MICROCHIP_OTPC)	+= nvmem-microchip-otpc.o
> +obj-$(CONFIG_NVMEM_MICROCHIP_OTPC)	+= nvmem-microchip-otpc.o
>   nvmem-microchip-otpc-y		:= microchip-otpc.o
>   obj-$(CONFIG_NVMEM_U_BOOT_ENV)	+= nvmem_u-boot-env.o
>   nvmem_u-boot-env-y		:= u-boot-env.o
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index 73e63920b1b9..40d0cc600cae 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -77,7 +77,7 @@ config MTK_MMSYS
>   
>   config MTK_SVS
>   	tristate "MediaTek Smart Voltage Scaling(SVS)"
> -	depends on MTK_EFUSE && NVMEM
> +	depends on NVMEM_MTK_EFUSE && NVMEM
>   	help
>   	  The Smart Voltage Scaling(SVS) engine is a piece of hardware
>   	  which has several controllers(banks) for calculating suitable
> diff --git a/drivers/thermal/qcom/Kconfig b/drivers/thermal/qcom/Kconfig
> index bfd889422dd3..2c7f3f9a26eb 100644
> --- a/drivers/thermal/qcom/Kconfig
> +++ b/drivers/thermal/qcom/Kconfig
> @@ -1,7 +1,7 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   config QCOM_TSENS
>   	tristate "Qualcomm TSENS Temperature Alarm"
> -	depends on QCOM_QFPROM
> +	depends on NVMEM_QCOM_QFPROM
>   	depends on ARCH_QCOM || COMPILE_TEST
>   	help
>   	  This enables the thermal sysfs driver for the TSENS device. It shows

