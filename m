Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA7BBC43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jul 2022 06:34:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6vfEIEh3q7/okQhQD5CPf9irrUvP2RI9wWVtA+C1RRI=; b=ECMrY1DbYeJYgYRikWKUvra7jc
	2iwJtWTd4YikQTRNazN1eQ4WgdH0dZSz0PnYa7NfoRRuzX+yZhQJTbFRWzMqefPtF6RRnf/7j2kMj
	4TT8t8T9RJttHzu9a2yMNhb6tuLNH24EHFhOOJHjYUQVt95tWt+VfC4CJN6lT50pUtJKLgMZKgGch
	7AoCTiHWVsdoznjjRS6y3CNgekXKoCfZn1eBIOWMMTjrHR3nx5Qz+fifAmUMV8ps4+C/8LeNiIaNW
	LMYXOqbhKlFybgOuHEXYkE/RQE58HSVmSF2Jpt/92/AkVV7ir3J/nHLS+gmg1hVm8SI2f9y1e+u8+
	YAN8QX2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAmzQ-00GSB4-Ui; Mon, 11 Jul 2022 06:33:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oAmzG-00GS8u-3S; Mon, 11 Jul 2022 06:33:43 +0000
X-UUID: 3562f1370d3a45c4b08363f43de4bf34-20220710
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:a39e9b91-8af7-4ad4-b285-f9b489667e42,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:cfc8ef63-0b3f-4b2c-b3a6-ed5c044366a0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 3562f1370d3a45c4b08363f43de4bf34-20220710
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1320743630; Sun, 10 Jul 2022 23:33:36 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Mon, 11 Jul 2022 13:52:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Jul 2022 13:52:51 +0800
Message-ID: <632d03e8773520faf0eba3bb7c716435b54b6794.camel@mediatek.com>
Subject: Re: [PATCH v24 04/10] soc: mediatek: add mtk_mmsys_update_bits API
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>
CC: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Mon, 11 Jul 2022 13:52:49 +0800
In-Reply-To: <d1a93418-587b-a03d-ed9b-01646345deeb@gmail.com>
References: <20220622130824.29143-1-nancy.lin@mediatek.com>
	 <20220622130824.29143-5-nancy.lin@mediatek.com>
	 <d1a93418-587b-a03d-ed9b-01646345deeb@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220710_233342_154150_A2292813 
X-CRM114-Status: GOOD (  23.14  )
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

Hi Matthias,

Thanks for the review.

On Fri, 2022-07-08 at 17:34 +0200, Matthias Brugger wrote:
> 
> On 22/06/2022 15:08, Nancy.Lin wrote:
> > Add mtk_mmsys_update_bits API. Simplify code for update  mmsys reg.
> > It is a preparation for adding support for mmsys config API.
> > 
> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
> > Reviewed-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > Tested-by: AngeloGioacchino Del Regno <
> > angelogioacchino.delregno@collabora.com>
> > Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/soc/mediatek/mtk-mmsys.c | 37 +++++++++++++------------
> > -------
> >   1 file changed, 15 insertions(+), 22 deletions(-)
> > 
> > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > b/drivers/soc/mediatek/mtk-mmsys.c
> > index a74c86197d6a..ca5bf07114fa 100644
> > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > @@ -192,22 +192,27 @@ static int
> > mtk_mmsys_find_match_drvdata(struct mtk_mmsys *mmsys,
> >   	return -EINVAL;
> >   }
> >   
> > +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32
> > offset, u32 mask, u32 val)
> > +{
> > +	u32 tmp;
> > +
> > +	tmp = readl_relaxed(mmsys->regs + offset);
> > +	tmp = (tmp & ~mask) | val;
> > +	writel_relaxed(tmp, mmsys->regs + offset);
> > +}
> > +
> >   void mtk_mmsys_ddp_connect(struct device *dev,
> >   			   enum mtk_ddp_comp_id cur,
> >   			   enum mtk_ddp_comp_id next)
> >   {
> >   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> >   	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> > -	u32 reg;
> >   	int i;
> >   
> >   	for (i = 0; i < mmsys->data->num_routes; i++)
> > -		if (cur == routes[i].from_comp && next ==
> > routes[i].to_comp) {
> > -			reg = readl_relaxed(mmsys->regs +
> > routes[i].addr);
> > -			reg &= ~routes[i].mask;
> > -			reg |= routes[i].val;
> > -			writel_relaxed(reg, mmsys->regs +
> > routes[i].addr);
> > -		}
> > +		if (cur == routes[i].from_comp && next ==
> > routes[i].to_comp)
> > +			mtk_mmsys_update_bits(mmsys, routes[i].addr,
> > routes[i].mask,
> > +					      routes[i].val);
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_connect);
> >   
> > @@ -217,15 +222,11 @@ void mtk_mmsys_ddp_disconnect(struct device
> > *dev,
> >   {
> >   	struct mtk_mmsys *mmsys = dev_get_drvdata(dev);
> >   	const struct mtk_mmsys_routes *routes = mmsys->data->routes;
> > -	u32 reg;
> >   	int i;
> >   
> >   	for (i = 0; i < mmsys->data->num_routes; i++)
> > -		if (cur == routes[i].from_comp && next ==
> > routes[i].to_comp) {
> > -			reg = readl_relaxed(mmsys->regs +
> > routes[i].addr);
> > -			reg &= ~routes[i].mask;
> > -			writel_relaxed(reg, mmsys->regs +
> > routes[i].addr);
> > -		}
> > +		if (cur == routes[i].from_comp && next ==
> > routes[i].to_comp)
> > +			mtk_mmsys_update_bits(mmsys, routes[i].addr,
> > routes[i].mask, 0);
> >   }
> >   EXPORT_SYMBOL_GPL(mtk_mmsys_ddp_disconnect);
> >   
> > @@ -234,18 +235,10 @@ static int mtk_mmsys_reset_update(struct
> > reset_controller_dev *rcdev, unsigned l
> >   {
> >   	struct mtk_mmsys *mmsys = container_of(rcdev, struct mtk_mmsys,
> > rcdev);
> >   	unsigned long flags;
> > -	u32 reg;
> >   
> >   	spin_lock_irqsave(&mmsys->lock, flags);
> >   
> > -	reg = readl_relaxed(mmsys->regs + mmsys->data->sw0_rst_offset);
> > -
> > -	if (assert)
> > -		reg &= ~BIT(id);
> > -	else
> > -		reg |= BIT(id);
> > -
> > -	writel_relaxed(reg, mmsys->regs + mmsys->data->sw0_rst_offset);
> > +	mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset,
> > BIT(id), assert ? 0 : BIT(id));
> 
> Let's be this a normal if (assert) else but calling
> mtk_mmsys_update_bits().
> 
> Other then that patch looks good.
> 
> Matthias
> 
OK, I will change to

if (asssert)
    mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id),
0);
else
    mtk_mmsys_update_bits(mmsys, mmsys->data->sw0_rst_offset, BIT(id),
BIT(id));

BRs,
Nancy

> >   
> >   	spin_unlock_irqrestore(&mmsys->lock, flags);
> >   


