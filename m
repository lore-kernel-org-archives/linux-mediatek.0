Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA623C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Apr 2022 13:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wqX7LQh+M+mZkjClmLR9qzsYFtpz939eo71zke3J0Ws=; b=Bf+2w8KTHp4muh
	cHHuPn6UIV+bp62rgdINGHTROOJ31xOd+JYmCcsPO0TlCmaRovkGMPlefotXkep8MK6zJBnU3sp0E
	OY25K1zHuN62T8LCaAu+hHBxOiSz5PJARXjZZmJY8CUiuxY/5UGK9KA5b4mVIIZ5vXcBhUAz3tSTY
	hAZ7/NpLozaRfHyi4xpbRDv4ti3IRdn6lYUZZ6Iu0wwcZnCg5NqD4zJ1vhk0/DerTEfaDPekP+MIp
	wDtR94g156PnzU6c+PcHCQaQnjs2uWhVxRMC+/Lag4tnDYBn34vPewPBHD7CEcbhwaNgHCRri2E1W
	QelmxURTapn4FQWjjP3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njhtr-001cFs-Fq; Wed, 27 Apr 2022 13:40:11 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njhsf-001bi1-Tf; Wed, 27 Apr 2022 13:38:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 956B71F442A0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651066736;
 bh=1QN1p0eSZK217vpy0gh2KrOhLqzPHhjrtvyCvtKYhTw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=a8JjF3xZKEK8YYakI94IeHbit/xUc+NIVPgf34JNUrK2ASU/PqnZ2Rz2AUqkWDv4G
 Yb7ZhR/WEIB/3pk6KNLowcOCyBHXOHohxyW4SPvsUROWFUuXj9fhgLSCk4s8ut6WUO
 N5bWehMn06s/zLun16wWL8cf3+oo0UNg6sc1l/jE63Z+RMN/2FbTZbVghViVHaltX9
 YOyEgD/p28wmGR2ekTpzJoO93MfmQ91qbInCdwlISlmK5K18pfZ+37zoy727SYdf4v
 4q+CXFkOQBFMj55XWfTA0WyynWgtkTfRLlNuWKJJArAb1DsTC3bwPGRYCprTXZdziM
 ak8gZYZ6iGJ0w==
Message-ID: <c643d877-bc0a-a92c-d366-bd27bf580739@collabora.com>
Date: Wed, 27 Apr 2022 15:38:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V4 07/15] clk: mediatek: reset: Support nonsequence base
 offsets of reset registers
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, mturquette@baylibre.com,
 sboyd@kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Cc: p.zabel@pengutronix.de, chun-jie.chen@mediatek.com, wenst@chromium.org,
 runyang.chen@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220427030950.23395-1-rex-bc.chen@mediatek.com>
 <20220427030950.23395-8-rex-bc.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220427030950.23395-8-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220427_063858_282390_4936A6C6 
X-CRM114-Status: GOOD (  21.91  )
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

Il 27/04/22 05:09, Rex-BC Chen ha scritto:
> The bank offsets are not serial for all reset registers.
> For example, there are five infra reset banks for MT8192: 0x120, 0x130,
> 0x140, 0x150 and 0x730.
> 
> To support this,
> - Change reg_ofs to rst_bank_ofs which is a pointer to base offsets of
>    the reset register.
> - Add a new define RST_NR_PER_BANK to define reset number for each
>    reset bank.
> 
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>   drivers/clk/mediatek/clk-mt2701-eth.c |  6 ++++--
>   drivers/clk/mediatek/clk-mt2701-g3d.c |  6 ++++--
>   drivers/clk/mediatek/clk-mt2701-hif.c |  6 ++++--
>   drivers/clk/mediatek/clk-mt2701.c     | 11 +++++++----
>   drivers/clk/mediatek/clk-mt2712.c     | 15 +++++++++------
>   drivers/clk/mediatek/clk-mt7622-eth.c |  6 ++++--
>   drivers/clk/mediatek/clk-mt7622-hif.c |  6 ++++--
>   drivers/clk/mediatek/clk-mt7622.c     | 11 +++++++----
>   drivers/clk/mediatek/clk-mt7629-eth.c |  6 ++++--
>   drivers/clk/mediatek/clk-mt7629-hif.c |  6 ++++--
>   drivers/clk/mediatek/clk-mt8135.c     | 11 +++++++----
>   drivers/clk/mediatek/clk-mt8173.c     | 11 +++++++----
>   drivers/clk/mediatek/clk-mt8183.c     | 14 ++++++++++++--
>   drivers/clk/mediatek/reset.c          | 11 ++++++-----
>   drivers/clk/mediatek/reset.h          |  6 ++++--
>   15 files changed, 87 insertions(+), 45 deletions(-)
> 

..snip..

> diff --git a/drivers/clk/mediatek/clk-mt2701.c b/drivers/clk/mediatek/clk-mt2701.c
> index 70a934faa529..ebb1b9975ab0 100644
> --- a/drivers/clk/mediatek/clk-mt2701.c
> +++ b/drivers/clk/mediatek/clk-mt2701.c
> @@ -735,18 +735,21 @@ static const struct mtk_fixed_factor infra_fixed_divs[] = {
>   	FACTOR(CLK_INFRA_CLK_13M, "clk13m", "clk26m", 1, 2),
>   };
>   
> +static u16 infrasys_rst_ofs[] = { 0x30, 0x34, };
> +static u16 perfcfg_rst_ofs[] = { 0x0, 0x4, };

Typo: perfcfg -> pericfg ... here and in some more files :))

> +
>   static const struct mtk_clk_rst_desc clk_rst_desc[] = {
>   	/* infrasys */
>   	{
>   		.version = MTK_RST_SIMPLE,
> -		.rst_bank_nr = 2,
> -		.reg_ofs = 0x30,
> +		.rst_bank_ofs = infrasys_rst_ofs,
> +		.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
>   	},
>   	/* pericfg */
>   	{
>   		.version = MTK_RST_SIMPLE,
> -		.rst_bank_nr = 2,
> -		.reg_ofs = 0x0,
> +		.rst_bank_ofs = perfcfg_rst_ofs,
> +		.rst_bank_nr = ARRAY_SIZE(perfcfg_rst_ofs),
>   	},
>   };
>   
> diff --git a/drivers/clk/mediatek/clk-mt2712.c b/drivers/clk/mediatek/clk-mt2712.c
> index cef7c79788ec..2a9d70dd97d6 100644
> --- a/drivers/clk/mediatek/clk-mt2712.c
> +++ b/drivers/clk/mediatek/clk-mt2712.c
> @@ -1258,18 +1258,21 @@ static const struct mtk_pll_data plls[] = {
>   		0, 31, 0x0300, 4, 0, 0, 0, 0x0304, 0),
>   };
>   
> +static u16 infrasys_rst_ofs[] = { 0x30, 0x34, };
> +static u16 perfcfg_rst_ofs[] = { 0x0, 0x4, };
> +
>   static const struct mtk_clk_rst_desc clk_rst_desc[] = {
> -	/* infra */
> +	/* infrasys */

Instead of renaming these here, if you really want this renamed, can you please
do that in patch [06/15]?

>   	{
>   		.version = MTK_RST_SIMPLE,
> -		.rst_bank_nr = 2,
> -		.reg_ofs = 0x30,
> +		.rst_bank_ofs = infrasys_rst_ofs,
> +		.rst_bank_nr = ARRAY_SIZE(infrasys_rst_ofs),
>   	},

..snip..

> diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
> index 91358e8cb851..83840ecf8b27 100644
> --- a/drivers/clk/mediatek/reset.h
> +++ b/drivers/clk/mediatek/reset.h
> @@ -9,6 +9,8 @@
>   #include <linux/reset-controller.h>
>   #include <linux/types.h>
>   
> +#define RST_NR_PER_BANK 32
> +
>   /**
>    * enum mtk_reset_version - Version of MediaTek clock reset controller.
>    * @MTK_RST_SIMPLE: Use the same registers for bit set and clear.
> @@ -24,12 +26,12 @@ enum mtk_reset_version {
>   /**
>    * struct mtk_clk_rst_desc - Description of MediaTek clock reset.
>    * @version: Reset version which is defined in enum mtk_reset_version.
> - * @reg_ofs: Base offset of the reset register.
> + * @rst_bank_ofs: Pointer to base offsets of the reset register.

Instead of generically saying that this is a pointer, it would be more
appropriate to say that this is a pointer to an array containing base
offsets (etc).

Thanks,
Angelo

>    * @rst_bank_nr: Quantity of reset bank.
>    */
>   struct mtk_clk_rst_desc {
>   	u8 version;
> -	u16 reg_ofs;
> +	u16 *rst_bank_ofs;
>   	u32 rst_bank_nr;
>   };
>   

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
