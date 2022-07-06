Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF89C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 13:32:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7TOtOp9DDgCuQFSmCL0sSxp9HqC0uywGNi7BY5wOYCA=; b=4ArH0AnPlVafZiz+5y5O6g3fne
	kVvgtnKfaCjcUkLby1n4watAEP7X/RItc3UU+Zj77t+cV0ppxuhw6xVcNGmmnEvfe741PVjf3aetm
	Jafn4hHq+oIp+wi8xO5i345+B4gD2yNaEK5g50XgPICvfw2kGH1+6l3r4h8YbU1rDMTeliri264Ar
	hpc4B2nMVbf/U4n8xK3YDwKprrnUO8vhSV2JlS0mfC5NYaNH7YFEwXY4iRM3XUdUOsPb5MTbPn9mA
	lAUeqcp5OzCHGu15aRhl1jsk+k28kvdps/eAYWMRfV8ZGLzCtlBF8olq/m6HJjOFjitVRV6hLXv8H
	shvy5wbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o958y-00AHxG-EW; Wed, 06 Jul 2022 13:32:40 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o958m-00AHtD-Ta; Wed, 06 Jul 2022 13:32:30 +0000
Received: by mail-wr1-x430.google.com with SMTP id o4so22111817wrh.3;
        Wed, 06 Jul 2022 06:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7TOtOp9DDgCuQFSmCL0sSxp9HqC0uywGNi7BY5wOYCA=;
        b=bRnI/QO6vg4k8EqqvSMs5qADxX5jIJ6eBSi6z9cxmtdCZ6pn8MmZaDruaPDiFCRW44
         4vrK6+n0L+rfVeCHD4l8M5mqxvJrmLNNy6ZtqR5peJVf76356NqgakFYRnvwljBvseYQ
         gc7F2WqinIjZ27hbPncGJeZg076luDZ2ODOXZWK2XfES6ybnBZl728M4/lLajrxxVCeL
         SY/UbVcxT+yz38R4XaVFFc5J6n92ILHZAzya7qe/6soAiUkxZBx/ZjCzvlO1ZoUJvi79
         rOZro0xXlpBpMOSghLPvoHSjYqCFHqpTUJ0tcAskTrGhjSzuh9j68rkPP0GKuk34Iciw
         PjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7TOtOp9DDgCuQFSmCL0sSxp9HqC0uywGNi7BY5wOYCA=;
        b=twIS/X6ekiDsmQ4WR/FjNzD999Oa2pAUANH/s5e8D2P++WdR3Droklu0Wis6AEDaS5
         rFOp5HgPsvxVG/YcwcBnzrlqWBLcgjmy3WzXgiM/yCsgLawECHpIcix5Of4B/G6W+LKI
         z0qohj++w2igIXMfwz5V/EVY9U9ilogpY24WkbsQtqr9fqoyxfNiNFaIUG26i1+yFlrh
         CUc4unCJtiKL5GZHR5gnWxGDBGv9AummxpKx3a07Mh5Jf6Z7CpBP9W6nl3EveNLLeqsP
         EgLOqEWw4Viw0uaBTuyZEE1NQhHC1PgYg08GLfyWe17X82ZGR8WSrF1RiET8DhbzLRSO
         fJyA==
X-Gm-Message-State: AJIora9++kHPnyLh6aZYUcbH8rQMB98vCYt65sKk46NH2aI26FYWeV3F
	VtHPXhuDb2Cna03NkFD3xUE=
X-Google-Smtp-Source: AGRyM1ti/Wxh3IDrjkuHFZmYCXFfWmQQ6PkxajNWY5pbRz/P7qnGbOgcbRrWKoyx1dmMIHkIvV6XRw==
X-Received: by 2002:a5d:4aca:0:b0:21d:6793:1c11 with SMTP id y10-20020a5d4aca000000b0021d67931c11mr17085716wrs.202.1657114344966;
        Wed, 06 Jul 2022 06:32:24 -0700 (PDT)
Received: from [192.168.0.14] ([37.223.147.254])
        by smtp.gmail.com with ESMTPSA id k5-20020a05600c1c8500b003a0fb88a197sm25845925wms.16.2022.07.06.06.32.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Jul 2022 06:32:24 -0700 (PDT)
Message-ID: <56fca90e-3ab1-a655-4180-37b5d5bc431f@gmail.com>
Date: Wed, 6 Jul 2022 15:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 RESEND] Input: mtk-pmic-keys - Add support for MT6331
 PMIC keys
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 dmitry.torokhov@gmail.com
Cc: mkorpershoek@baylibre.com, linux-input@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220706101122.201007-1-angelogioacchino.delregno@collabora.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20220706101122.201007-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_063229_003535_594A8E17 
X-CRM114-Status: GOOD (  15.81  )
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



On 06/07/2022 12:11, AngeloGioacchino Del Regno wrote:
> Add support for PMIC Keys of the MT6331 PMIC.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>

> ---
>   drivers/input/keyboard/mtk-pmic-keys.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
> index 6404081253ea..9b34da0ec260 100644
> --- a/drivers/input/keyboard/mtk-pmic-keys.c
> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
> @@ -9,6 +9,7 @@
>   #include <linux/interrupt.h>
>   #include <linux/kernel.h>
>   #include <linux/mfd/mt6323/registers.h>
> +#include <linux/mfd/mt6331/registers.h>
>   #include <linux/mfd/mt6358/registers.h>
>   #include <linux/mfd/mt6397/core.h>
>   #include <linux/mfd/mt6397/registers.h>
> @@ -22,6 +23,10 @@
>   #define MTK_PMIC_PWRKEY_RST	BIT(6)
>   #define MTK_PMIC_HOMEKEY_RST	BIT(5)
>   
> +#define MTK_PMIC_MT6331_RST_DU_MASK	GENMASK(13, 12)
> +#define MTK_PMIC_MT6331_PWRKEY_RST	BIT(9)
> +#define MTK_PMIC_MT6331_HOMEKEY_RST	BIT(8)
> +
>   #define MTK_PMIC_PWRKEY_INDEX	0
>   #define MTK_PMIC_HOMEKEY_INDEX	1
>   #define MTK_PMIC_MAX_KEY_COUNT	2
> @@ -72,6 +77,19 @@ static const struct mtk_pmic_regs mt6323_regs = {
>   	.rst_lprst_mask = MTK_PMIC_RST_DU_MASK,
>   };
>   
> +static const struct mtk_pmic_regs mt6331_regs = {
> +	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
> +		MTK_PMIC_KEYS_REGS(MT6331_TOPSTATUS, 0x2,
> +				   MT6331_INT_MISC_CON, 0x4,
> +				   MTK_PMIC_MT6331_PWRKEY_RST),
> +	.keys_regs[MTK_PMIC_HOMEKEY_INDEX] =
> +		MTK_PMIC_KEYS_REGS(MT6331_TOPSTATUS, 0x4,
> +				   MT6331_INT_MISC_CON, 0x2,
> +				   MTK_PMIC_MT6331_HOMEKEY_RST),
> +	.pmic_rst_reg = MT6331_TOP_RST_MISC,
> +	.rst_lprst_mask = MTK_PMIC_MT6331_RST_DU_MASK,
> +};
> +
>   static const struct mtk_pmic_regs mt6358_regs = {
>   	.keys_regs[MTK_PMIC_PWRKEY_INDEX] =
>   		MTK_PMIC_KEYS_REGS(MT6358_TOPSTATUS,
> @@ -255,6 +273,9 @@ static const struct of_device_id of_mtk_pmic_keys_match_tbl[] = {
>   	}, {
>   		.compatible = "mediatek,mt6323-keys",
>   		.data = &mt6323_regs,
> +	}, {
> +		.compatible = "mediatek,mt6331-keys",
> +		.data = &mt6331_regs,
>   	}, {
>   		.compatible = "mediatek,mt6358-keys",
>   		.data = &mt6358_regs,

