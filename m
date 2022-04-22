Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F28C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 05:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yga1whZFtCjeDAh0DrBGQF7HF49Bj+1qe2WZuUQypcI=; b=2QDkuwf3JhI9jj
	7D/z1sD7eYW0+JlFfODawM8fKVeCVyj/OQ9ppZYr+sUMVb3EXD+tkcgtjg1qqW0z0lRe+JmvbBYR0
	W81F42l+4Pdz9/k37LyC3WnaJG5aqa0YtLlE9Gq95subTmBiiSzc/3KcYQugw3jnz+4M8djl9sjch
	Y+CMDaRVWCBh2x+UJOqA25bpRnBI2xKBFuePexaWSmR07MhBaklbnBLsdgHz3s+KS+Y6ivlcmwqcq
	ugurzbFMEHxvi+3brUO1w03KH9B9xSTLY9i7fn0FT8z+3YT5rWXyQW5eZOMRh00h8xR+aoEvjKJO6
	tZAvP/4+TI9wseZEN8sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhlWm-00G9sC-JS; Fri, 22 Apr 2022 05:08:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhlWP-00G9iw-AK; Fri, 22 Apr 2022 05:07:58 +0000
X-UUID: 14146add83f7427da78a0b90393f6d92-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:9a51f7a8-036a-4ab6-98d8-9d3564a10d8e, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:2
X-CID-META: VersionHash:faefae9, CLOUDID:74c8baef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 14146add83f7427da78a0b90393f6d92-20220421
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1757750165; Thu, 21 Apr 2022 22:07:51 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 22:04:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 13:04:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 13:04:11 +0800
Message-ID: <aa9ae5783f5fb7965e055031984b430c47016b7f.camel@mediatek.com>
Subject: Re: [PATCH V2 06/12] clk: mediatek: reset: Revise structure to
 control reset register
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <allen-kh.cheng@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 22 Apr 2022 13:04:11 +0800
In-Reply-To: <801c6a22-1772-2673-1fcf-5cfed54efab1@collabora.com>
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-7-rex-bc.chen@mediatek.com>
 <801c6a22-1772-2673-1fcf-5cfed54efab1@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_220757_379359_335D4149 
X-CRM114-Status: GOOD (  19.84  )
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
> > Add mtk_clk_rst_desc to input the reset register data, and replace
> > the
> > structure "struct mtk_reset" to reset.h, and rename it as
> > "mtk_clk_rst_data". We use them to store reset register data and
> > store reset controller device.
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/clk/mediatek/clk-mt2701-eth.c |  8 +++++-
> >   drivers/clk/mediatek/clk-mt2701-g3d.c |  8 +++++-
> >   drivers/clk/mediatek/clk-mt2701-hif.c |  8 +++++-
> >   drivers/clk/mediatek/clk-mt2701.c     | 19 ++++++++++++--
> >   drivers/clk/mediatek/clk-mt2712.c     | 19 ++++++++++++--
> >   drivers/clk/mediatek/clk-mt7622-eth.c |  8 +++++-
> >   drivers/clk/mediatek/clk-mt7622-hif.c | 10 ++++++--
> >   drivers/clk/mediatek/clk-mt7622.c     | 19 ++++++++++++--
> >   drivers/clk/mediatek/clk-mt7629-eth.c |  8 +++++-
> >   drivers/clk/mediatek/clk-mt7629-hif.c | 10 ++++++--
> >   drivers/clk/mediatek/clk-mt8135.c     | 19 ++++++++++++--
> >   drivers/clk/mediatek/clk-mt8173.c     | 19 ++++++++++++--
> >   drivers/clk/mediatek/clk-mt8183.c     |  9 +++++--
> >   drivers/clk/mediatek/reset.c          | 36 +++++++++++++---------
> > -----
> >   drivers/clk/mediatek/reset.h          | 15 ++++++++++-
> >   15 files changed, 174 insertions(+), 41 deletions(-)
> > 
> 
> ..snip..
> 
> > diff --git a/drivers/clk/mediatek/reset.c
> > b/drivers/clk/mediatek/reset.c
> > index 8e42deee80a3..d67c13958458 100644
> > --- a/drivers/clk/mediatek/reset.c
> > +++ b/drivers/clk/mediatek/reset.c
> > @@ -14,25 +14,19 @@
> >   
> >   #include "clk-mtk.h"
> >   
> > -struct mtk_reset {
> > -	struct regmap *regmap;
> > -	int regofs;
> > -	struct reset_controller_dev rcdev;
> > -};
> > -
> > -static inline struct mtk_reset *to_rst_data(struct
> > reset_controller_dev *rcdev)
> > +static inline struct mtk_clk_rst_data *to_rst_data(struct
> > reset_controller_dev *rcdev)
> >   {
> 
> to_mtk_clk_rst_data()...
> by the way, it's probably better if you introduce this helper here
> directly,
> instead of introducing it in commit 03/12 and changing it entirely in
> 06/12.
> 
> The rest of the code looks good to me, I'm sure that you'll get my R-
> b in the
> next version.
> 

Hello Angelo,

I will do this in next version.
Thanks!

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
