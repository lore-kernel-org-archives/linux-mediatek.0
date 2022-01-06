Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9F2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jan 2022 09:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZzkP07igdvlXCsyZOJzR1V+OQicj6OC6wA1qtRWYnUQ=; b=ss+8mgpvYCMEdS
	nKEeeQkA7Xo+gpM8RTurH//0yC1p5zjrzMFu+4U1YFPkKb10b2t2l4fDMNo0H83qoxDPpifcou93i
	yp9az8tBXVKIBGh/gt7bs+Zhs09A5kgrC4BL0JzYfXlyycG8UhCyVZMl5D/cuQjiWmcDwLkaBbixs
	mxRaALF9Fc0iw5LY4OclXfGCJYUzbRxZLS+jj9Y5roO+uqfjtUdFx3lj5I8tkE043iD8NUrjBUm2S
	VJOtL0Bzv5U1qiTePXV6h8OP/v1/zaStQI5rEbTvwpuG+DmMFwTWEvo+shw31yiGJvBhukeoKAOia
	WYET9kCwOLsPvrKiL6wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5P28-00HDn9-QA; Thu, 06 Jan 2022 09:26:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5P26-00HDlN-2E; Thu, 06 Jan 2022 09:26:07 +0000
X-UUID: a42f24772c3c48338d2162557ff9e112-20220106
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=A63uuPZMtSqh1ZESnbnisY7ROOFlyVrDIxVM1ETvbl0=; 
 b=IT/o2Lv2eXfE0Xe6Y56IY8xZFoBHCSzxTk30f2tW/6B+RD74EoyBc/gezQDD3lwLYel7IzundCa0TSIvRtAvyxNGous/ZFCs0LcrS+LQOHerJuVI43+4IKlmLpRQrNNMDVQpKM5nFvLlDI96vP0+4p8bZqbPR3iLqayC9mhMgPk=;
X-UUID: a42f24772c3c48338d2162557ff9e112-20220106
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1827479464; Thu, 06 Jan 2022 02:26:04 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 01:24:09 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Jan 2022 17:24:07 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Jan 2022 17:24:07 +0800
Message-ID: <3a1bffc6f677ef9790749a366424fe5effda90f7.camel@mediatek.com>
Subject: Re: [PATCH 2/4] phy: mediatek: phy-mtk-hdmi: Reorder to remove
 forward declarations
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <chunkuang.hu@kernel.org>
CC: <p.zabel@pengutronix.de>, <kishon@ti.com>, <vkoul@kernel.org>,
 <matthias.bgg@gmail.com>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-phy@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Date: Thu, 6 Jan 2022 17:24:07 +0800
In-Reply-To: <20220103153055.50473-2-angelogioacchino.delregno@collabora.com>
References: <20220103153055.50473-1-angelogioacchino.delregno@collabora.com>
 <20220103153055.50473-2-angelogioacchino.delregno@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220106_012606_135907_E7D8935D 
X-CRM114-Status: GOOD (  13.63  )
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

On Mon, 2022-01-03 at 16:30 +0100, AngeloGioacchino Del Regno wrote:
> Forward declarations for mtk_hdmi_power_{on,off} aren't necessary:
> move mtk_hdmi_phy_dev_ops down to remove forward declarations.
> 
> Signed-off-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---
>  drivers/phy/mediatek/phy-mtk-hdmi.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/phy/mediatek/phy-mtk-hdmi.c
> b/drivers/phy/mediatek/phy-mtk-hdmi.c
> index 707e90691e6e..b4193cb4e4e3 100644
> --- a/drivers/phy/mediatek/phy-mtk-hdmi.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -6,15 +6,6 @@
>  
>  #include "phy-mtk-hdmi.h"
>  
> -static int mtk_hdmi_phy_power_on(struct phy *phy);
> -static int mtk_hdmi_phy_power_off(struct phy *phy);
> -
> -static const struct phy_ops mtk_hdmi_phy_dev_ops = {
> -	.power_on = mtk_hdmi_phy_power_on,
> -	.power_off = mtk_hdmi_phy_power_off,
> -	.owner = THIS_MODULE,
> -};
> -
>  inline struct mtk_hdmi_phy *to_mtk_hdmi_phy(struct clk_hw *hw)
>  {
>  	return container_of(hw, struct mtk_hdmi_phy, pll_hw);
> @@ -43,6 +34,12 @@ static int mtk_hdmi_phy_power_off(struct phy *phy)
>  	return 0;
>  }
>  
> +static const struct phy_ops mtk_hdmi_phy_dev_ops = {
> +	.power_on = mtk_hdmi_phy_power_on,
> +	.power_off = mtk_hdmi_phy_power_off,
> +	.owner = THIS_MODULE,
> +};
> +
>  static const struct phy_ops *
>  mtk_hdmi_phy_dev_get_ops(const struct mtk_hdmi_phy *hdmi_phy)
>  {
Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
