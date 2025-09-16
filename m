Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B629CAC598
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Sep 2025 09:02:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GlQGh69yHm0lQ+UWWShJAiq9okk/v7mEfebImd0fp68=; b=ivVRElVBBPb7M0oDqlQ8qMTzDt
	0c/ueHHxXpBvcih3Bgmv6QEcHQ8Ka5Cy+MsY34URG1SYRYUwa70SaJ9SmeEaV6cCP2iVHFDGWGnwi
	SNBhSg8i1abwxB/YcEmhkh4miMUgVR17Imn8AS+smve1WYglc/NCl6EoGolf5a2vIwv7V2CDYZQ7Z
	lcRQ5b+1DSeMu4iyCHigUbYxlivdR1h4YJoaewqpLqAxcmLzbqStaOowsjpyp8g6e1GV07VRC2Z3Y
	YEh63i7NP3vz150PLzKMfQOL2WUiQ+Q5G3fdlqM3btK2MzTyyIcs4Ff8zlMYsANuIQAWFOUANPnOX
	kD9wcGMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRZk-00000007IEJ-23BT;
	Tue, 16 Sep 2025 09:02:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyRZi-00000007IBm-03ta;
	Tue, 16 Sep 2025 09:02:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758013327;
	bh=v3B0hVI686Dj3OG7cFwf+eQKcuBwiCWRRhpE80lgPZs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y5Db+x4rrd8V2wd6WxmV+e32jR3fQImJLjYmSDX41phsBEC2oPL5Dzzb+oxS7Z8ZY
	 dmyfScInfaaoon3VSpS2VapUMRdR+XCDhHi/lEJ5SYLoTLyRCBprxLwfbIg4rdpr15
	 MCgPmZ4iPJcv2DcC4ZON/skyZp1uZ1FEHm1WBwW8yzTMdeKN49Q2qlhRBdrnjJBEsU
	 OavZs6DeuMKY7WO8cUKMRiFFVOqVY+xsApIf4SwN3QeKwln3EQzXgt04XRwNi1oNCy
	 z1mMVP8tphFmoFT9N7agtsuO/G4OMOrhg8lWZTrN2G06WrGEXtJSXeedXyPTkgjmfn
	 /3sWIwqnNH4pg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7EB7917E0F88;
	Tue, 16 Sep 2025 11:02:07 +0200 (CEST)
Message-ID: <d7a9e83d-7b79-48eb-a90a-dfe3cf26cf49@collabora.com>
Date: Tue, 16 Sep 2025 11:02:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] spi: mt65xx: add dual and quad mode for standard spi
 device
To: Tim Kuo <Tim.Kuo@mediatek.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Steven Liu <Steven.Liu@mediatek.com>, Sky Huang <Skylake.Huang@mediatek.com>
References: <20250916081515.324130-1-Tim.Kuo@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250916081515.324130-1-Tim.Kuo@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_020210_249283_6332EB21 
X-CRM114-Status: GOOD (  19.69  )
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

Il 16/09/25 10:15, Tim Kuo ha scritto:
> From: "Tim Kuo" <Tim.Kuo@mediatek.com>
> 
> Mediatek SPI hardware natively supports dual and quad modes, and these
> modes are already enabled for SPI flash devices under spi-mem framework
> in MTK SPI controller spi-mt65xx. However, other SPI devices, such as
> touch panels, are limited to single mode because spi-mt65xx lacks SPI
> mode argument parsing from SPI framework for these SPI devices outside
> spi-mem framework.
> 
> This patch adds dual and quad mode support for these SPI devices by
> introducing a new API, mtk_spi_set_nbits, for SPI mode argument parsing.
> 
> Signed-off-by: Tim Kuo <Tim.Kuo@mediatek.com>
> ---
>   drivers/spi/spi-mt65xx.c | 33 ++++++++++++++++++++++++++++++---
>   1 file changed, 30 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/spi/spi-mt65xx.c b/drivers/spi/spi-mt65xx.c
> index 8a3c00c3af42..591740805740 100644
> --- a/drivers/spi/spi-mt65xx.c
> +++ b/drivers/spi/spi-mt65xx.c
> @@ -563,6 +563,27 @@ static void mtk_spi_setup_packet(struct spi_controller *host)
>   	writel(reg_val, mdata->base + SPI_CFG1_REG);
>   }
>   
> +inline u32 mtk_spi_set_nbit(u32 nbit)
> +{
> +	u32 ret = 0;

You don't need ret here.

> +
> +	switch (nbit) {

	default:
		pr_warn_once("Unknown nbit mode %u. Falling back to single mode\n",
			     nbit);
		fallthrough;
	case SPI_NBITS_SINGLE:
		return 0x0;
	case SPI_NBITS_DUAL:
		return 0x1;
	case SPI_NBITS_QUAD:
		return 0x2;

> +	case SPI_NBITS_SINGLE:
> +		ret = 0x0;
> +		break;
> +	case SPI_NBITS_DUAL:
> +		ret = 0x1;
> +		break;
> +	case SPI_NBITS_QUAD:
> +		ret = 0x2;
> +		break;
> +	default:
> +		pr_info("unknown spi nbit mode, use single mode!");
> +		break;
> +	}
> +	return ret;
> +}
> +
>   static void mtk_spi_enable_transfer(struct spi_controller *host)
>   {
>   	u32 cmd;
> @@ -729,10 +750,16 @@ static int mtk_spi_transfer_one(struct spi_controller *host,
>   
>   	/* prepare xfer direction and duplex mode */
>   	if (mdata->dev_comp->ipm_design) {
> -		if (!xfer->tx_buf || !xfer->rx_buf) {
> +		if (xfer->tx_buf && xfer->rx_buf) {
> +			reg_val &= ~SPI_CFG3_IPM_HALF_DUPLEX_EN;
> +		} else if (xfer->tx_buf) {
> +			reg_val |= SPI_CFG3_IPM_HALF_DUPLEX_EN;
> +			reg_val &= ~SPI_CFG3_IPM_HALF_DUPLEX_DIR;
> +			reg_val |= mtk_spi_set_nbit(xfer->tx_nbits);
> +		} else {
>   			reg_val |= SPI_CFG3_IPM_HALF_DUPLEX_EN;
> -			if (xfer->rx_buf)
> -				reg_val |= SPI_CFG3_IPM_HALF_DUPLEX_DIR;
> +			reg_val |= SPI_CFG3_IPM_HALF_DUPLEX_DIR;
> +			reg_val |= mtk_spi_set_nbit(xfer->rx_nbits);
>   		}
>   		writel(reg_val, mdata->base + SPI_CFG3_IPM_REG);
>   	}

Everything else LGTM. So, after adding the requested changes

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

