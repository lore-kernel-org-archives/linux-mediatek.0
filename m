Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CA30C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 05:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VrInhxy2LT+9BG5IAoJs46UXO2nufi2acG8yCWXxouk=; b=KFrugWZ9pQtrc9
	3nPdpczdxOmQDPE4ejahHbTMs551tOKJu//M8+JrXXUrsaDqvpiZ3rFo8WOK8gOFqLyZLyKMwf7t/
	V+k9K3A75XaeA8bmf322uRdZaZyiPWlxhS1DLWOaTfCUwe8d9XYtl7eeSRPR7OwX6X054ARdf35nj
	vpFQSVym+4mHrk5VOW2+iVNf6FWbgByusNWGEvDmq2IEdPvPjY4vxGtOXI9S8+lzzlE+67+vp0okH
	bLSJY1vKfEhicFc33BijRjDSDWhbWXAY0mSElDDPL2n98n9gU3HIcs8Sg29khLg475ygup2b1G/B7
	tkG0Z1oUxck+YTf1f/0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhlU5-00G96z-QT; Fri, 22 Apr 2022 05:05:33 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhlU1-00G95q-LD; Fri, 22 Apr 2022 05:05:32 +0000
X-UUID: f8c4fa4d22fa45a19977a032e89d5dbc-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:01a4824e-2940-4bee-b9fc-11b469d1f608, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:10
X-CID-META: VersionHash:faefae9, CLOUDID:d9ab90f0-da02-41b4-b6df-58f4ccd36682,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f8c4fa4d22fa45a19977a032e89d5dbc-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1462750012; Thu, 21 Apr 2022 22:05:20 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 22:05:18 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 13:05:16 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 13:05:16 +0800
Message-ID: <1418de018e42343fead3a81dc59209158369d3a9.camel@mediatek.com>
Subject: Re: [PATCH V2 08/12] clk: mediatek: reset: Add new register reset
 function with device
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <allen-kh.cheng@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 22 Apr 2022 13:05:16 +0800
In-Reply-To: <bff10500-4b63-9553-2ce0-3e46eb261d7a@collabora.com>
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-9-rex-bc.chen@mediatek.com>
 <bff10500-4b63-9553-2ce0-3e46eb261d7a@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_220529_748918_01214792 
X-CRM114-Status: GOOD (  18.78  )
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

On Thu, 2022-04-21 at 11:07 +0200, AngeloGioacchino Del Regno wrote:
> Il 20/04/22 15:05, Rex-BC Chen ha scritto:
> > Some clock drvier only support device_node, so we still remain
> > register reset function with device_node and add a function to
> > register reset controller with device.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/clk/mediatek/clk-mt2701-eth.c |  2 +-
> >   drivers/clk/mediatek/clk-mt2701-g3d.c |  2 +-
> >   drivers/clk/mediatek/clk-mt2701-hif.c |  2 +-
> >   drivers/clk/mediatek/clk-mt2701.c     |  4 +--
> >   drivers/clk/mediatek/clk-mt2712.c     |  4 +--
> >   drivers/clk/mediatek/clk-mt7622-eth.c |  2 +-
> >   drivers/clk/mediatek/clk-mt7622-hif.c |  4 +--
> >   drivers/clk/mediatek/clk-mt7622.c     |  4 +--
> >   drivers/clk/mediatek/clk-mt7629-eth.c |  2 +-
> >   drivers/clk/mediatek/clk-mt7629-hif.c |  4 +--
> >   drivers/clk/mediatek/clk-mt8183.c     |  2 +-
> >   drivers/clk/mediatek/reset.c          | 43
> > +++++++++++++++++++++++++++
> >   drivers/clk/mediatek/reset.h          |  2 ++
> >   13 files changed, 61 insertions(+), 16 deletions(-)
> > 
> 
> 
> ..snip..
> 
> > diff --git a/drivers/clk/mediatek/reset.c
> > b/drivers/clk/mediatek/reset.c
> > index b164b1da7dd3..1173111af3ab 100644
> > --- a/drivers/clk/mediatek/reset.c
> > +++ b/drivers/clk/mediatek/reset.c
> > @@ -107,4 +107,47 @@ int mtk_clk_register_rst_ctrl(struct
> > device_node *np,
> >   	return ret;
> >   }
> >   
> > +int mtk_clk_register_rst_ctrl_with_dev(struct device *dev,
> > +				       const struct mtk_clk_rst_desc
> > *desc)
> > +{
> > +	struct device_node *np = dev->of_node;
> > +	struct regmap *regmap;
> > +	struct mtk_clk_rst_data *data;
> > +	int ret;
> > +
> > +	if (!desc) {
> > +		dev_err(dev, "mtk clock reset desc is NULL\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (desc->version >= MTK_RST_MAX) {
> > +		dev_err(dev, "Error version number: %d\n", desc-
> > >version);
> > +		return -EINVAL;
> > +	}
> > +
> > +	regmap = device_node_to_regmap(np);
> > +	if (IS_ERR(regmap)) {
> > +		dev_err(dev, "Cannot find regmap %pe\n", regmap);
> > +		return -EINVAL;
> > +	}
> > +
> > +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> > +	if (!data)
> > +		return -ENOMEM;
> > +
> > +	data->desc = desc;
> > +	data->regmap = regmap;
> > +	data->rcdev.owner = THIS_MODULE;
> > +	data->rcdev.nr_resets = desc->reg_num * 32;
> > +	data->rcdev.ops = rst_op[desc->version];
> > +	data->rcdev.of_node = np;
> > +	data->rcdev.dev = dev;
> > +
> > +	ret = devm_reset_controller_register(dev, &data->rcdev);
> > +	if (ret)
> > +		dev_err(dev, "could not register reset controller:
> > %d\n", ret);
> 
> 	if (ret) {
> 		dev_err(dev, "could not register reset controller:
> %d\n", ret);
> 		return ret;
> 	}
> 
> 	return 0;
> 
> > +
> > +	return ret;
> > +}
> > +
> >   MODULE_LICENSE("GPL");

Hello Angelo,

ok, I will do this in next version.

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
