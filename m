Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091FEC4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Oct 2022 07:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qCNxzOKYmtTnoInV5j5hFtdhCGIPCn3WQ0Hs3Sj6Pog=; b=i5QRgmw8I2TQxe1NCwxjLLAhtn
	J+1OwAgjAfhfL7BfZGLjLatDHsF9felEz2ecGNhEmEU4nPNraZWXC245Btc9TBy39Po6UtiXJw3H7
	T0aJ2EhVWzqb1uK3KW1iDM/ezFmRVXIFbxaUkdu/3seD74WaKYa5dGwSwXkDwEVicHwa9myHkTXW2
	iWyHkPwtyy+fCCwBGLtPTpKLMlKS74bMedrk+Vu81xqhzdIc+yZ/Ueuo1Yg0zKImUs0GpRxNEC/Kk
	UmxiUSy8jRwqnDOX7HUr/sdrN+cVwjoRadsWiTstJUB5JRFPagruHSK3b87eUaeFSr2aJfLsxYyLM
	DWvwzsHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiWUq-007E6m-O1; Wed, 12 Oct 2022 07:49:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiWUg-007E4r-1F; Wed, 12 Oct 2022 07:49:35 +0000
X-UUID: d5614043fe654be3bb52eef49c5d05bc-20221012
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=qCNxzOKYmtTnoInV5j5hFtdhCGIPCn3WQ0Hs3Sj6Pog=;
	b=I3OTq+rcx8A2HDQxU0o2cq7Hii9ef5RRMQiZgq4tqT1hmMxM9w5276pin9vm6o//pkiGE5FPQYEAcJ8PvL1QZhqrFGEcULEeV5C+TPiNNVv7ANLsw7UDsRkIjFV4BIuYknvpwrJsdk0HcUM4DA8W6Wo8hGgzJRp5tUXAlqUcMzg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:2383360a-16f1-4509-b33f-b4cd8897fdb2,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:4ae83b01-cdeb-479d-93af-53f947adce9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: d5614043fe654be3bb52eef49c5d05bc-20221012
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xinlei.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 395312408; Wed, 12 Oct 2022 00:49:15 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 12 Oct 2022 15:48:41 +0800
Received: from mszsdhlt06 (10.16.6.206) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 12 Oct 2022 15:48:40 +0800
Message-ID: <9fe3a2381746b46bde171f01635d30da2cb93d64.camel@mediatek.com>
Subject: Re: [PATCH] drm: mediatek: Modify dpi power on/off sequence.
From: xinlei.lee <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
	<daniel@ffwll.ch>, <matthias.bgg@gmail.com>, <jitao.shi@mediatek.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 12 Oct 2022 15:48:46 +0800
In-Reply-To: <1662386033-4463-1-git-send-email-xinlei.lee@mediatek.com>
References: <1662386033-4463-1-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_004934_106653_96D73379 
X-CRM114-Status: GOOD (  19.37  )
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

On Mon, 2022-09-05 at 21:53 +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Modify dpi power on/off sequence so that the first gpio operation
> will take effect.
> 
> Fixes: 6bd4763fd532 ("drm/mediatek: set dpi pin mode to gpio low to
> avoid leakage
> current")
> 
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> ---
> Base on the branch of Linux-next/master.
> Because dpi power_on/off is protected by dpi->refcount, the first
> time
> it cannot be powered on and off successfully, it will cause leakage.
> ---
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index 630a4e301ef6..2ce1a39ce3bf 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -462,9 +462,6 @@ static void mtk_dpi_power_off(struct mtk_dpi
> *dpi)
>  	if (--dpi->refcount != 0)
>  		return;
>  
> -	if (dpi->pinctrl && dpi->pins_gpio)
> -		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
> -
>  	mtk_dpi_disable(dpi);
>  	clk_disable_unprepare(dpi->pixel_clk);
>  	clk_disable_unprepare(dpi->engine_clk);
> @@ -489,9 +486,6 @@ static int mtk_dpi_power_on(struct mtk_dpi *dpi)
>  		goto err_pixel;
>  	}
>  
> -	if (dpi->pinctrl && dpi->pins_dpi)
> -		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> -
>  	return 0;
>  
>  err_pixel:
> @@ -721,6 +715,9 @@ static void mtk_dpi_bridge_disable(struct
> drm_bridge *bridge)
>  {
>  	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>  
> +	if (dpi->pinctrl && dpi->pins_gpio)
> +		pinctrl_select_state(dpi->pinctrl, dpi->pins_gpio);
> +
>  	mtk_dpi_power_off(dpi);
>  }
>  
> @@ -728,6 +725,9 @@ static void mtk_dpi_bridge_enable(struct
> drm_bridge *bridge)
>  {
>  	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
>  
> +	if (dpi->pinctrl && dpi->pins_dpi)
> +		pinctrl_select_state(dpi->pinctrl, dpi->pins_dpi);
> +
>  	mtk_dpi_power_on(dpi);
>  	mtk_dpi_set_display_mode(dpi, &dpi->mode);
>  	mtk_dpi_enable(dpi);

Hi CK,

Gentle ping for this patch, if there is anything I need to modify,
please kindly let me know.

Best Regards!
xinlei


