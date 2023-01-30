Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53904C54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 10:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oignEp2U2ztD3lTRjnlIdle6tQ6e+ERR+lWNGqVilPM=; b=HNCOBoc5tL/a98FP37H1XGBV51
	mURTA44avLum2w/fBYHAJYVduUEoJFd0UVC4huClik7P+x+ypvAvm+UPQu1PJOWiihw/IG7ZsxNTm
	jrkiOhs4mqX2DwVlT33KkJnEEF0VyvM3fwk6LupmReocacGwoHc96EaJX3+3PbDC6YYkApQ/XfnsG
	pnMQmPLtoV6LtEFzmfnON7NSeSM6GlyjECBvRtgSQlMC8gUaPGn/3DFrq9MY+dXS0QxGXbadwNF0S
	gAIV5OzItKopjSaY32NapCzvhtPcm/dQ+o2ypBcC9c2eOdA11keOdmTa/Fqnq5xKotdF5YcLdiLzI
	cWkLJ+Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRTh-0038j5-KJ; Mon, 30 Jan 2023 10:33:33 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMROq-0037hk-IN; Mon, 30 Jan 2023 10:28:34 +0000
Received: by mail-wm1-x32f.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so7786962wms.2;
        Mon, 30 Jan 2023 02:28:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oignEp2U2ztD3lTRjnlIdle6tQ6e+ERR+lWNGqVilPM=;
        b=RdS1M/H+ehaco90qpX5RnPBUBzVzksFO5L8nBDFiZ0VbKR2yIKUmLCuqXDyYFZPPEB
         73sCPNokH4rElgOQSufZe3FKIKIoRSdINqz+xtCYbBZ+ZtmjdvcslpV1Rgfx+tm2vN4w
         3pwWL9qlT8u34pDMVFvv5xuo8w6Qjupw/URNznt4pZyAN9R/WKap3pUfiMbK5djI6bAU
         MtFhtJxJjlYgo7s9Xto4YKqavghETkyKV1hkonGRtDjsZrvnmuU02YXCCAJNVbUN1vpV
         qkrzn9oMoMxJTauE1D06iHFjTr7Qf3+u1w7XTdMJFrxnjDfB5MyrjyaCGon1qO9M3Tyi
         s3BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oignEp2U2ztD3lTRjnlIdle6tQ6e+ERR+lWNGqVilPM=;
        b=ee40iAdc0kP4zuKFBVcY8kcHue+VJ8xAJx7sdp43IqAqlihltQdD2DUxvm18nl5RO7
         mG3vW5bVjI/42cGvwV8p3zxmeTwm+BXVoNgE8C/U7PZ/YUABkXsy8JW6Xwr6btEQehEk
         k+LCe8947peLxefVhnljgv8QfxmUL/6to4Mr8kNZ/0YWDudIZWt5PgUeMq9NU5ck7tSU
         qJ4YtBvRp+dwruME/jcsSfzEfJeVeHJHCbi+RQkDD/bVuXFsXBR1m2XhtJlZU3Nb+l2G
         qOOvVQRAKQcNYsNPqcemKjD1W1MuCnpGEZ05fVdi2OECXcH7fQOymExgyaqKkbefM4VY
         KWeA==
X-Gm-Message-State: AFqh2krugSBAlM0axUVABKaDYLksn5/NNB0/CZGs3i+goGwWaFVaZ3cS
	juyiQN6Bv4opP5Azy6uBrtTJ7XVfjw4=
X-Google-Smtp-Source: AMrXdXsNO+9z4W2HmajhsxubSeM0DmQDQczN1hzqV+mOF0WIGxqaIkKQwTTBIYfAlCoIUalzdFBbSQ==
X-Received: by 2002:a05:600c:2d84:b0:3d9:e8b3:57f9 with SMTP id i4-20020a05600c2d8400b003d9e8b357f9mr52406806wmg.8.1675074510199;
        Mon, 30 Jan 2023 02:28:30 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id t1-20020a05600c41c100b003dc47d458cdsm6969452wmh.15.2023.01.30.02.28.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jan 2023 02:28:29 -0800 (PST)
Message-ID: <5db81715-bbf8-1c8a-a463-a686d9606352@gmail.com>
Date: Mon, 30 Jan 2023 11:28:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RESEND PATCH v3] soc: mediatek: Introduce
 mediatek-regulator-coupler driver
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 alyssa.rosenzweig@collabora.com, nfraprado@collabora.com,
 dmitry.osipenko@collabora.com
References: <20221006115816.66853-1-angelogioacchino.delregno@collabora.com>
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221006115816.66853-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_022832_646310_459CF139 
X-CRM114-Status: GOOD (  43.61  )
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



On 06/10/2022 13:58, AngeloGioacchino Del Regno wrote:
> This driver currently deals with GPU-SRAM regulator coupling, ensuring
> that the SRAM voltage is always between a specific range of distance to
> the GPU voltage, depending on the SoC, necessary in order to achieve
> system stability across the full range of supported GPU frequencies.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

Applied, thanks!
Matthias

> ---
> 
> This driver was successfully tested for more than 3 months.
> GPU DVFS works correctly with no stability issues.
> 
> Changes in RESEND,v3:
>   Rebased over next-20221005
> 
> Changes in v3:
>   - Added braces to else-if branch
> 
> Changes in v2:
>   - Added check for n_coupled
>   - Added check for vgpu to enforce attaching to vgpu<->sram coupling only
> 
> Context:
> This driver is the last of the pieces of a bigger puzzle, aiming to finally
> enable Dynamic Voltage/Frequency Scaling for Mali GPUs found on MediaTek
> SoCs on the fully open source graphics stack (Panfrost driver).
> 
> No devicetree bindings are provided because this does not require any
> driver-specific binding at all.
> 
> Last but not least: it was chosen to have this driver enabled for
> ( ARCH_MEDIATEK && REGULATOR ) without really giving a free configuration
> choice because, once the DVFS mechanism will be fully working, using one
> of the listed MediaTek SoCs *without* this coupling mechanism *will* lead
> to unstabilities and system crashes.
> For COMPILE_TEST, choice is given for obvious reasons.
> 
>   drivers/soc/mediatek/Kconfig                 |   5 +
>   drivers/soc/mediatek/Makefile                |   1 +
>   drivers/soc/mediatek/mtk-regulator-coupler.c | 159 +++++++++++++++++++
>   3 files changed, 165 insertions(+)
>   create mode 100644 drivers/soc/mediatek/mtk-regulator-coupler.c
> 
> diff --git a/drivers/soc/mediatek/Kconfig b/drivers/soc/mediatek/Kconfig
> index 40d0cc600cae..30b5afc0e51d 100644
> --- a/drivers/soc/mediatek/Kconfig
> +++ b/drivers/soc/mediatek/Kconfig
> @@ -44,6 +44,11 @@ config MTK_PMIC_WRAP
>   	  on different MediaTek SoCs. The PMIC wrapper is a proprietary
>   	  hardware to connect the PMIC.
>   
> +config MTK_REGULATOR_COUPLER
> +	bool "MediaTek SoC Regulator Coupler" if COMPILE_TEST
> +	default ARCH_MEDIATEK
> +	depends on REGULATOR
> +
>   config MTK_SCPSYS
>   	bool "MediaTek SCPSYS Support"
>   	default ARCH_MEDIATEK
> diff --git a/drivers/soc/mediatek/Makefile b/drivers/soc/mediatek/Makefile
> index 0e9e703c931a..8c0ddacbcde8 100644
> --- a/drivers/soc/mediatek/Makefile
> +++ b/drivers/soc/mediatek/Makefile
> @@ -3,6 +3,7 @@ obj-$(CONFIG_MTK_CMDQ) += mtk-cmdq-helper.o
>   obj-$(CONFIG_MTK_DEVAPC) += mtk-devapc.o
>   obj-$(CONFIG_MTK_INFRACFG) += mtk-infracfg.o
>   obj-$(CONFIG_MTK_PMIC_WRAP) += mtk-pmic-wrap.o
> +obj-$(CONFIG_MTK_REGULATOR_COUPLER) += mtk-regulator-coupler.o
>   obj-$(CONFIG_MTK_SCPSYS) += mtk-scpsys.o
>   obj-$(CONFIG_MTK_SCPSYS_PM_DOMAINS) += mtk-pm-domains.o
>   obj-$(CONFIG_MTK_MMSYS) += mtk-mmsys.o
> diff --git a/drivers/soc/mediatek/mtk-regulator-coupler.c b/drivers/soc/mediatek/mtk-regulator-coupler.c
> new file mode 100644
> index 000000000000..ad2ed42aa697
> --- /dev/null
> +++ b/drivers/soc/mediatek/mtk-regulator-coupler.c
> @@ -0,0 +1,159 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Voltage regulators coupler for MediaTek SoCs
> + *
> + * Copyright (C) 2022 Collabora, Ltd.
> + * Author: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/init.h>
> +#include <linux/kernel.h>
> +#include <linux/of.h>
> +#include <linux/regulator/coupler.h>
> +#include <linux/regulator/driver.h>
> +#include <linux/regulator/machine.h>
> +#include <linux/suspend.h>
> +
> +#define to_mediatek_coupler(x)	container_of(x, struct mediatek_regulator_coupler, coupler)
> +
> +struct mediatek_regulator_coupler {
> +	struct regulator_coupler coupler;
> +	struct regulator_dev *vsram_rdev;
> +};
> +
> +/*
> + * We currently support only couples of not more than two vregs and
> + * modify the vsram voltage only when changing voltage of vgpu.
> + *
> + * This function is limited to the GPU<->SRAM voltages relationships.
> + */
> +static int mediatek_regulator_balance_voltage(struct regulator_coupler *coupler,
> +					      struct regulator_dev *rdev,
> +					      suspend_state_t state)
> +{
> +	struct mediatek_regulator_coupler *mrc = to_mediatek_coupler(coupler);
> +	int max_spread = rdev->constraints->max_spread[0];
> +	int vsram_min_uV = mrc->vsram_rdev->constraints->min_uV;
> +	int vsram_max_uV = mrc->vsram_rdev->constraints->max_uV;
> +	int vsram_target_min_uV, vsram_target_max_uV;
> +	int min_uV = 0;
> +	int max_uV = INT_MAX;
> +	int ret;
> +
> +	/*
> +	 * If the target device is on, setting the SRAM voltage directly
> +	 * is not supported as it scales through its coupled supply voltage.
> +	 *
> +	 * An exception is made in case the use_count is zero: this means
> +	 * that this is the first time we power up the SRAM regulator, which
> +	 * implies that the target device has yet to perform initialization
> +	 * and setting a voltage at that time is harmless.
> +	 */
> +	if (rdev == mrc->vsram_rdev) {
> +		if (rdev->use_count == 0)
> +			return regulator_do_balance_voltage(rdev, state, true);
> +
> +		return -EPERM;
> +	}
> +
> +	ret = regulator_check_consumers(rdev, &min_uV, &max_uV, state);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (min_uV == 0) {
> +		ret = regulator_get_voltage_rdev(rdev);
> +		if (ret < 0)
> +			return ret;
> +		min_uV = ret;
> +	}
> +
> +	ret = regulator_check_voltage(rdev, &min_uV, &max_uV);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * If we're asked to set a voltage less than VSRAM min_uV, set
> +	 * the minimum allowed voltage on VSRAM, as in this case it is
> +	 * safe to ignore the max_spread parameter.
> +	 */
> +	vsram_target_min_uV = max(vsram_min_uV, min_uV + max_spread);
> +	vsram_target_max_uV = min(vsram_max_uV, vsram_target_min_uV + max_spread);
> +
> +	/* Make sure we're not out of range */
> +	vsram_target_min_uV = min(vsram_target_min_uV, vsram_max_uV);
> +
> +	pr_debug("Setting voltage %d-%duV on %s (minuV %d)\n",
> +		 vsram_target_min_uV, vsram_target_max_uV,
> +		 rdev_get_name(mrc->vsram_rdev), min_uV);
> +
> +	ret = regulator_set_voltage_rdev(mrc->vsram_rdev, vsram_target_min_uV,
> +					 vsram_target_max_uV, state);
> +	if (ret)
> +		return ret;
> +
> +	/* The sram voltage is now balanced: update the target vreg voltage */
> +	return regulator_do_balance_voltage(rdev, state, true);
> +}
> +
> +static int mediatek_regulator_attach(struct regulator_coupler *coupler,
> +				     struct regulator_dev *rdev)
> +{
> +	struct mediatek_regulator_coupler *mrc = to_mediatek_coupler(coupler);
> +	const char *rdev_name = rdev_get_name(rdev);
> +
> +	/*
> +	 * If we're getting a coupling of more than two regulators here and
> +	 * this means that this is surely not a GPU<->SRAM couple: in that
> +	 * case, we may want to use another coupler implementation, if any,
> +	 * or the generic one: the regulator core will keep walking through
> +	 * the list of couplers when any .attach_regulator() cb returns 1.
> +	 */
> +	if (rdev->coupling_desc.n_coupled > 2)
> +		return 1;
> +
> +	if (strstr(rdev_name, "sram")) {
> +		if (mrc->vsram_rdev)
> +			return -EINVAL;
> +		mrc->vsram_rdev = rdev;
> +	} else if (!strstr(rdev_name, "vgpu") && !strstr(rdev_name, "Vgpu")) {
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int mediatek_regulator_detach(struct regulator_coupler *coupler,
> +				     struct regulator_dev *rdev)
> +{
> +	struct mediatek_regulator_coupler *mrc = to_mediatek_coupler(coupler);
> +
> +	if (rdev == mrc->vsram_rdev)
> +		mrc->vsram_rdev = NULL;
> +
> +	return 0;
> +}
> +
> +static struct mediatek_regulator_coupler mediatek_coupler = {
> +	.coupler = {
> +		.attach_regulator = mediatek_regulator_attach,
> +		.detach_regulator = mediatek_regulator_detach,
> +		.balance_voltage = mediatek_regulator_balance_voltage,
> +	},
> +};
> +
> +static int mediatek_regulator_coupler_init(void)
> +{
> +	if (!of_machine_is_compatible("mediatek,mt8183") &&
> +	    !of_machine_is_compatible("mediatek,mt8186") &&
> +	    !of_machine_is_compatible("mediatek,mt8192"))
> +		return 0;
> +
> +	return regulator_coupler_register(&mediatek_coupler.coupler);
> +}
> +arch_initcall(mediatek_regulator_coupler_init);
> +
> +MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
> +MODULE_DESCRIPTION("MediaTek Regulator Coupler driver");
> +MODULE_LICENSE("GPL");

