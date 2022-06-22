Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 976FBC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 03:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JhX+lIyz04gAU9sIiVT2MTdwWv9IooVrFWKkJPaMRLM=; b=MRgNIsoRxMpnAsGAPG4gc3YfQI
	AQYfxFnNqM5z9wNTS0O7PB75ZlRvmmTUUCoz7c6wBtwzRL7aceG7sKop+3aRdye6C6KKuWvIcM0Iy
	9IDMsJHAjYHEBSZPwN+g8SF0109JswPwjHWxn+HcVNs7qzqAXHCNfaM6DaCZH70heqtG6Wa6DrYWL
	GfBYdh94v3LUaPMGMVO7yIAUOkzKuesmidGBKvPTpEziNEwmzXT0siY76NYhOsdiTO5xlvs4kdJrf
	8JqvVFY7O9G4Wxv30p9c+pztESQngEimev6owr38p66sk0wC/aWE+yN2ljklE1UGBbRCI14gCkqc9
	ZJswBxIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3qcp-008FqF-71; Wed, 22 Jun 2022 03:01:51 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o3qcm-008FpH-Uj; Wed, 22 Jun 2022 03:01:50 +0000
X-UUID: 87afebcf6b1648b38686f0ae2cf2bbe9-20220621
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:0757d78e-ae08-4089-9183-bf5454a85c9a,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:b14ad71,CLOUDID:4c581f38-5e4b-44d7-80b2-bb618cb09d29,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 87afebcf6b1648b38686f0ae2cf2bbe9-20220621
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
	(envelope-from <ck.hu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1347393625; Tue, 21 Jun 2022 20:01:42 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Jun 2022 20:01:41 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jun 2022 11:01:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Jun 2022 11:01:39 +0800
Message-ID: <9265790479c0822796ec7cd02ae6304014edde33.camel@mediatek.com>
Subject: Re: [PATCH v23 04/10] soc: mediatek: add mtk_mmsys_update_bits API
From: CK Hu <ck.hu@mediatek.com>
To: Nancy.Lin <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	<wim@linux-watchdog.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: <devicetree@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>, "jason-jh .
 lin" <jason-jh.lin@mediatek.com>, <singo.chang@mediatek.com>,
	<llvm@lists.linux.dev>, Nick Desaulniers <ndesaulniers@google.com>,
	<linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>, "Nathan
 Chancellor" <nathan@kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Date: Wed, 22 Jun 2022 11:01:36 +0800
In-Reply-To: <20220620091801.27680-5-nancy.lin@mediatek.com>
References: <20220620091801.27680-1-nancy.lin@mediatek.com>
	 <20220620091801.27680-5-nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220621_200149_047031_38309632 
X-CRM114-Status: GOOD (  19.38  )
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

Hi, Nancy:

On Mon, 2022-06-20 at 17:17 +0800, Nancy.Lin wrote:
> Add mtk_mmsys_update_bits API. Simplify code for update  mmsys reg.
> It is a preparation for adding support for mmsys config API.
> 
> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/soc/mediatek/mtk-mmsys.c | 36 ++++++++++++++--------------
> ----
>  1 file changed, 16 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> b/drivers/soc/mediatek/mtk-mmsys.c
> index a74c86197d6a..b7c7cd469343 100644
> --- a/drivers/soc/mediatek/mtk-mmsys.c
> +++ b/drivers/soc/mediatek/mtk-mmsys.c
> @@ -192,22 +192,27 @@ static int mtk_mmsys_find_match_drvdata(struct
> mtk_mmsys *mmsys,
>  	return -EINVAL;
>  }
>  
> +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32
> offset, u32 mask, u32 val)
> +{
> +	u32 tmp;
> +
> +	tmp = readl_relaxed(mmsys->regs + offset);
> +	tmp = (tmp & ~mask) | val;
> +	writel_relaxed(tmp, mmsys->regs + offset);
> +}
> +
>  void mtk_mmsys_ddp_connect(struct device *dev,
>  			   enum mtk_ddp_comp_id cur,
>  			   enum mtk_ddp_comp_id next)
>  {
>  	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>  	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> -	u32 reg;
>  	int i;
>  
>  	for (i = 0; i < mmsys->data->num_routes; i++)
> -		if (cur == routes[i].from_comp && next ==
> routes[i].to_comp) {
> -			reg = readl_relaxed(mmsys->regs +
> routes[i].addr);
> -			reg &= ~routes[i].mask;
> -			reg |= routes[i].val;
> -			writel_relaxed(reg, mmsys->regs +
> routes[i].addr);
> -		}
> +		if (cur == routes[i].from_comp && next ==
> routes[i].to_comp)
> +			mtk_mmsys_update_bits(mmsys, routes[i].addr,
> routes[i].mask,
> +					      routes[i].val);
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
>  
> @@ -217,15 +222,11 @@ void mtk_mmsys_ddp_disconnect(struct device
> *dev,
>  {
>  	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
>  	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> -	u32 reg;
>  	int i;
>  
>  	for (i = 0; i < mmsys->data->num_routes; i++)
> -		if (cur == routes[i].from_comp && next ==
> routes[i].to_comp) {
> -			reg = readl_relaxed(mmsys->regs +
> routes[i].addr);
> -			reg &= ~routes[i].mask;
> -			writel_relaxed(reg, mmsys->regs +
> routes[i].addr);
> -		}
> +		if (cur == routes[i].from_comp && next ==
> routes[i].to_comp)
> +			mtk_mmsys_update_bits(mmsys, routes[i].addr,
> routes[i].mask, 0);
>  }
>  EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
>  
> @@ -234,18 +235,13 @@ static int mtk_mmsys_reset_update(struct
> reset_controller_dev *rcdev, unsigned l
>  {
>  	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys,
> rcdev);
>  	unsigned long flags;
> -	u32 reg;
>  
>  	spin_lock_irqsave(&mmsys->lock, flags);
>  
> -	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
> -
>  	if (assert)
> -		reg &= ~BIT(id);
> +		mtk_mmsys_update_bits(mmsys, mmsys->data-
> >sw0_rst_offset, BIT(id), 0);
>  	else
> -		reg |= BIT(id);
> -
> -	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
> +		mtk_mmsys_update_bits(mmsys, mmsys->data-
> >sw0_rst_offset, BIT(id), BIT(id));

More simple code:
mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id),
assert ? 0 : BIT(id));

After this modification,

Reviewed-by: CK Hu <ck.hu@mediatek.com>

>  
>  	spin_unlock_irqrestore(&mmsys->lock, flags);
>  


