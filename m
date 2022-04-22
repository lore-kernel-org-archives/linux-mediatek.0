Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1119C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 05:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hJbd/Y+W2/gadhNu3GkwcnxdKRKJbjPnE9Fy1iPCq7E=; b=t2TVEwPwi6u+pO
	UdtF+C+SxV3hbPWut62kWebFiQ8eCQ1WHnMEqlFge3UlVSZRxWY7hGVHnmAVGbuomYxZv+paDym0y
	qjH3rM8q9PuqHzywjMMwkHmx/KlEwvD5ROo0DtVLJU3AR5bCaJpDTOX/SjnYie+d+qilf7/yppxjF
	Zn4dNtji5h8LmNMYFgQNef4MgwQBDhli78Sxenfkv5cJnp3S89aM5gIaY53Eb3o0HUxeo5Q5ojURj
	L7c7ufltO2jwZD+QloXuYzAg5ipNirPQ+gMMDSi6ti6EqZDAaN4Ka7syhLJhcVUxmoPZXqT3jPtnd
	ulfMWKqLhazBrbvH/xIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhlUt-00G9IL-Is; Fri, 22 Apr 2022 05:06:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhlUq-00G9GL-Nz; Fri, 22 Apr 2022 05:06:22 +0000
X-UUID: 4177e1eede354bf19bc1a21004d7a191-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:430ed347-5cd2-44a7-b84c-ec9fe4e66d4a, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:2,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:2
X-CID-META: VersionHash:faefae9, CLOUDID:7cbdbaef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:4,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 4177e1eede354bf19bc1a21004d7a191-20220421
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 7818004; Thu, 21 Apr 2022 22:06:14 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 22:06:12 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 13:06:11 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 13:06:11 +0800
Message-ID: <59876cd509fed9348f3ec80a468409dd25ab5efe.camel@mediatek.com>
Subject: Re: [PATCH V2 09/12] clk: mediatek: reset: Add support for input
 offset and bit from DT
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <mturquette@baylibre.com>, <sboyd@kernel.org>
CC: <matthias.bgg@gmail.com>, <p.zabel@pengutronix.de>,
 <chun-jie.chen@mediatek.com>, <wenst@chromium.org>,
 <runyang.chen@mediatek.com>, <linux-kernel@vger.kernel.org>,
 <allen-kh.cheng@mediatek.com>, <linux-clk@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 22 Apr 2022 13:06:11 +0800
In-Reply-To: <b9839f51-fef1-c54a-3024-674209987f13@collabora.com>
References: <20220420130527.23200-1-rex-bc.chen@mediatek.com>
 <20220420130527.23200-10-rex-bc.chen@mediatek.com>
 <b9839f51-fef1-c54a-3024-674209987f13@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_220620_837848_8CB04B9B 
X-CRM114-Status: GOOD (  24.95  )
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
> > To use the clock reset function easier, we implement the of_xlate.
> > This function is only adopted in version MTK_SET_CLR because of
> > the method of id calculation.
> > 
> > There is no impact for original use. If the argument number is not
> > larger than 1, it will return original id.
> > 
> > With this implementation if we want to set offset 0x120 and bit 16,
> > we can just write something like "resets = <&infra_rst 0x120 16>;".
> > 
> > Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> > ---
> >   drivers/clk/mediatek/reset.c | 24 ++++++++++++++++++++++++
> >   drivers/clk/mediatek/reset.h |  1 +
> >   2 files changed, 25 insertions(+)
> > 
> > diff --git a/drivers/clk/mediatek/reset.c
> > b/drivers/clk/mediatek/reset.c
> > index 1173111af3ab..dbe812062bf5 100644
> > --- a/drivers/clk/mediatek/reset.c
> > +++ b/drivers/clk/mediatek/reset.c
> > @@ -59,6 +59,20 @@ static const struct reset_control_ops
> > mtk_reset_ops_set_clr = {
> >   	.reset = mtk_reset_set_clr,
> >   };
> >   
> > +static int reset_xlate(struct reset_controller_dev *rcdev,
> > +		       const struct of_phandle_args *reset_spec)
> > +{
> > +	unsigned int offset, bit;
> > +
> > +	if (reset_spec->args_count <= 1)
> > +		return reset_spec->args[0];
> > +
> > +	offset = reset_spec->args[0];
> > +	bit = reset_spec->args[1];
> > +
> > +	return (offset >> 4) * 32 + bit;
> > +}
> > +
> >   static const struct reset_control_ops *rst_op[MTK_RST_MAX] = {
> >   	[MTK_RST_SIMPLE] = &reset_simple_ops,
> >   	[MTK_RST_SET_CLR] = &mtk_reset_ops_set_clr,
> > @@ -98,6 +112,11 @@ int mtk_clk_register_rst_ctrl(struct
> > device_node *np,
> >   	data->rcdev.ops = rst_op[desc->version];
> >   	data->rcdev.of_node = np;
> >   
> > +	if (desc->version == MTK_RST_SET_CLR) {
> 
> ...following my previous advice to use switch(version), this would
> fit in
> just fine :-)
> 
> Everything else looks ok.
> 
> Cheers,
> Angelo

Hello Angelo,

I will add this judgement in reset_xlate()

BRs,
Rex


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
