Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5148AC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 16:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KjTfCxEk17mysnpAgsiwHpZasvsfyaop86UlFZsPCSw=; b=AU0pCz0fH3G1NU
	x0nT3lWvwEID/UhTVS6nXEGmCz33NkA+zdHApnhqcsqicRF644UPeciUWNDAjoSB2qbmVRmnbXX2t
	0IV9Yt5ZGsW26mieVOwu5Ya3WjqwIOLgPbUTiNOUQVyyQpCla5mq0uXElkdZZc6tQGkN+bmmarl+S
	AqGkKV2xusNabVoYa0IDxAYlcI7OV6Soa92wvG+TeDGhJU2Z8cGE3HIKBc8+Yz7rbpPZwC6QdUEIc
	8bcuInQBmmon9lO8sHbVx6cVjbMWVl/T/Mp3H6cD7ql7BYEiySTffROd4uFq49DiO1R9xw4eYvEvr
	qPF9Az/iFubWICmAysrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8P7t-009gtf-4h; Fri, 14 Jan 2022 16:08:29 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8P7g-009gpy-Ji; Fri, 14 Jan 2022 16:08:18 +0000
Received: by mail-wr1-x435.google.com with SMTP id s1so16399451wra.6;
 Fri, 14 Jan 2022 08:08:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=mauDon0Ze5CNx6RqfAB2vnManqQEoFIWda3Z8TQdMiQ=;
 b=eS6/nLFcn9omwLcw30gS4TmgrYFjVKhGHyOxJcP/JSojk+7Wo9TlL5CJ1K0dpDu3XY
 cWLAMHOLexHyo51Im3O3uwUPnh+OWnPpZJZoslh3/wJAzFNhRs2qDOEl0Zdo208fYzhn
 NArk2vAHlhr7YIiu6g+NxCFgu5H2jqZPQ9xheUVF/tIo1V7YvOoTMILOMhtgSvsWe9Z7
 f0bcFOBR1T2yhn0bYRqlOY1IBTmBoy+muFV8BVKWT0N//whW9yoMWcOXcYAHWjT1bRYK
 2zJgVAkaPwC08ivxQhgsZERjL7/NsgigdtNWinxZ52RwZpTLCpHgI1pqQ2Fd1E4w7aoV
 gJGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=mauDon0Ze5CNx6RqfAB2vnManqQEoFIWda3Z8TQdMiQ=;
 b=JvYyoCYv+npt5oShQwhz99hsa78r3maJs/iGaHuJlNvcrhxMGQfn3TfIJFB95wxWj4
 44bEVu7+pypaI+OYv7RTVlaiIkarDvKko2RHtKG16VkE54n7dRcDXI3Ov2HghGBhvweV
 WcUpJ3MOFFESFeBe3dTWUloPQIT2cHNm3RyA5jtgT+lS+da11D9oDXXY4n6/yI6FGlKt
 QayjfNxrtPaZrkKz3kYprPDQ/o+wx7XHYJFJxmuZNDCq++Z1YzttcHzlgnpWdn0OW10c
 ohrFbIu6NNFAPyYgodb6Mx9EumquzSqMaguJBzlxFi/1tpUHAuYODI2/C88KNNn9HY9+
 Qtcg==
X-Gm-Message-State: AOAM531HmRdrx1phelWorRQQdNZmA2iJ3cwO3K4WJIi11vzn3sZZNOGg
 rNRiBxviXxpNH3D1cL3IsUA=
X-Google-Smtp-Source: ABdhPJyx5zzmW3QSzrf42uEBroN2Jf7QfRH7+1gCWzHYLdFxaoMN2nY//QiK+84m+z1JGChBInza2w==
X-Received: by 2002:adf:9789:: with SMTP id s9mr8015378wrb.271.1642176494702; 
 Fri, 14 Jan 2022 08:08:14 -0800 (PST)
Received: from [192.168.0.14] ([37.223.145.74])
 by smtp.gmail.com with ESMTPSA id u12sm1117827wrm.106.2022.01.14.08.08.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 08:08:14 -0800 (PST)
Message-ID: <58601613-9aac-97ef-265f-fb27e5d6b2e4@gmail.com>
Date: Fri, 14 Jan 2022 17:08:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/2] soc: mediatek: pwrap: add pwrap driver for MT8186
 SoC
Content-Language: en-US
To: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 angelogioacchino.delregno@collabora.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220107104633.7500-1-johnson.wang@mediatek.com>
 <20220107104633.7500-2-johnson.wang@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220107104633.7500-2-johnson.wang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_080816_706711_8436A2EB 
X-CRM114-Status: GOOD (  22.99  )
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

Hi Johnson,

It looks like my review from a few minutes got lost, so here again:

On 07/01/2022 11:46, Johnson Wang wrote:
> MT8186 are highly integrated SoC and use PMIC_MT6366 for
> power management. This patch adds pwrap master driver to
> access PMIC_MT6366.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 72 ++++++++++++++++++++++++++++
>   1 file changed, 72 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 952bc554f443..78866ebf7f04 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -30,6 +30,7 @@
>   #define PWRAP_GET_WACS_REQ(x)		(((x) >> 19) & 0x00000001)
>   #define PWRAP_STATE_SYNC_IDLE0		BIT(20)
>   #define PWRAP_STATE_INIT_DONE0		BIT(21)
> +#define PWRAP_STATE_INIT_DONE0_V2	BIT(22)

This name is rather strange. Is the reason that the datasheet names it like this?

>   #define PWRAP_STATE_INIT_DONE1		BIT(15)
>   
>   /* macro for WACS FSM */
> @@ -77,6 +78,8 @@
>   #define PWRAP_CAP_INT1_EN	BIT(3)
>   #define PWRAP_CAP_WDT_SRC1	BIT(4)
>   #define PWRAP_CAP_ARB		BIT(5)
> +#define PWRAP_CAP_MONITOR_V2	BIT(6)

Not used capability, please drop.

Regards,
Matthias

> +#define PWRAP_CAP_ARB_V2	BIT(8)
>   
>   /* defines for slave device wrapper registers */
>   enum dew_regs {
> @@ -1063,6 +1066,55 @@ static int mt8516_regs[] = {
>   	[PWRAP_MSB_FIRST] =		0x170,
>   };
>   
> +static int mt8186_regs[] = {
> +	[PWRAP_MUX_SEL] =		0x0,
> +	[PWRAP_WRAP_EN] =		0x4,
> +	[PWRAP_DIO_EN] =		0x8,
> +	[PWRAP_RDDMY] =			0x20,
> +	[PWRAP_CSHEXT_WRITE] =		0x24,
> +	[PWRAP_CSHEXT_READ] =		0x28,
> +	[PWRAP_CSLEXT_WRITE] =		0x2C,
> +	[PWRAP_CSLEXT_READ] =		0x30,
> +	[PWRAP_EXT_CK_WRITE] =		0x34,
> +	[PWRAP_STAUPD_CTRL] =		0x3C,
> +	[PWRAP_STAUPD_GRPEN] =		0x40,
> +	[PWRAP_EINT_STA0_ADR] =		0x44,
> +	[PWRAP_EINT_STA1_ADR] =		0x48,
> +	[PWRAP_INT_CLR] =		0xC8,
> +	[PWRAP_INT_FLG] =		0xC4,
> +	[PWRAP_MAN_EN] =		0x7C,
> +	[PWRAP_MAN_CMD] =		0x80,
> +	[PWRAP_WACS0_EN] =		0x8C,
> +	[PWRAP_WACS1_EN] =		0x94,
> +	[PWRAP_WACS2_EN] =		0x9C,
> +	[PWRAP_INIT_DONE0] =		0x90,
> +	[PWRAP_INIT_DONE1] =		0x98,
> +	[PWRAP_INIT_DONE2] =		0xA0,
> +	[PWRAP_INT_EN] =		0xBC,
> +	[PWRAP_INT1_EN] =		0xCC,
> +	[PWRAP_INT1_FLG] =		0xD4,
> +	[PWRAP_INT1_CLR] =		0xD8,
> +	[PWRAP_TIMER_EN] =		0xF0,
> +	[PWRAP_WDT_UNIT] =		0xF8,
> +	[PWRAP_WDT_SRC_EN] =		0xFC,
> +	[PWRAP_WDT_SRC_EN_1] =		0x100,
> +	[PWRAP_WDT_FLG] =		0x104,
> +	[PWRAP_SPMINF_STA] =		0x1B4,
> +	[PWRAP_DCM_EN] =		0x1EC,
> +	[PWRAP_DCM_DBC_PRD] =		0x1F0,
> +	[PWRAP_GPSINF_0_STA] =		0x204,
> +	[PWRAP_GPSINF_1_STA] =		0x208,
> +	[PWRAP_WACS0_CMD] =		0xC00,
> +	[PWRAP_WACS0_RDATA] =		0xC04,
> +	[PWRAP_WACS0_VLDCLR] =		0xC08,
> +	[PWRAP_WACS1_CMD] =		0xC10,
> +	[PWRAP_WACS1_RDATA] =		0xC14,
> +	[PWRAP_WACS1_VLDCLR] =		0xC18,
> +	[PWRAP_WACS2_CMD] =		0xC20,
> +	[PWRAP_WACS2_RDATA] =		0xC24,
> +	[PWRAP_WACS2_VLDCLR] =		0xC28,
> +};
> +
>   enum pmic_type {
>   	PMIC_MT6323,
>   	PMIC_MT6351,
> @@ -1083,6 +1135,7 @@ enum pwrap_type {
>   	PWRAP_MT8135,
>   	PWRAP_MT8173,
>   	PWRAP_MT8183,
> +	PWRAP_MT8186,
>   	PWRAP_MT8195,
>   	PWRAP_MT8516,
>   };
> @@ -1535,6 +1588,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
>   	case PWRAP_MT6779:
>   	case PWRAP_MT6797:
>   	case PWRAP_MT8173:
> +	case PWRAP_MT8186:
>   	case PWRAP_MT8516:
>   		pwrap_writel(wrp, 1, PWRAP_CIPHER_EN);
>   		break;
> @@ -2069,6 +2123,19 @@ static struct pmic_wrapper_type pwrap_mt8516 = {
>   	.init_soc_specific = NULL,
>   };
>   
> +static struct pmic_wrapper_type pwrap_mt8186 = {
> +	.regs = mt8186_regs,
> +	.type = PWRAP_MT8186,
> +	.arb_en_all = 0xfb27f,
> +	.int_en_all = 0xfffffffe, /* disable WatchDog Timeout for bit 1 */
> +	.int1_en_all =  0x000017ff, /* disable Matching interrupt for bit 13 */
> +	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
> +	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
> +	.caps = PWRAP_CAP_INT1_EN | PWRAP_CAP_MONITOR_V2 | PWRAP_CAP_ARB_V2,
> +	.init_reg_clock = pwrap_common_init_reg_clock,
> +	.init_soc_specific = NULL,
> +};
> +
>   static const struct of_device_id of_pwrap_match_tbl[] = {
>   	{
>   		.compatible = "mediatek,mt2701-pwrap",
> @@ -2097,6 +2164,9 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
>   	}, {
>   		.compatible = "mediatek,mt8183-pwrap",
>   		.data = &pwrap_mt8183,
> +	}, {
> +		.compatible = "mediatek,mt8186-pwrap",
> +		.data = &pwrap_mt8186,
>   	}, {
>   		.compatible = "mediatek,mt8195-pwrap",
>   		.data = &pwrap_mt8195,
> @@ -2209,6 +2279,8 @@ static int pwrap_probe(struct platform_device *pdev)
>   
>   	if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB))
>   		mask_done = PWRAP_STATE_INIT_DONE1;
> +	else if (HAS_CAP(wrp->master->caps, PWRAP_CAP_ARB_V2))
> +		mask_done = PWRAP_STATE_INIT_DONE0_V2;
>   	else
>   		mask_done = PWRAP_STATE_INIT_DONE0;
>   
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
