Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C601C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 09:51:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wxrs3VuQVytUW3NUc+8cZn90cUHSXVv71EVbSt8uOhk=; b=OtprVpfgzQeGtL
	hG7ANELPdXY4eYUpfNMchw/uUzfDnwyxwlWQX0R4qJc4JpnyV0nLjXW9y3lfK1Ddq55HZFMRJdCRR
	1BZk6kmHgy7uTOGbiiJNZezapqVG4Ilyt+AL7HzwY5EcgZHZeXPmtSqgcNGzbLhbtKuf4BTHozyi7
	xjE5Tscz4+OoS94beb7xmxVtKKCx4F+gLFanSBWE87Ob56LFk7FWkgJ7tYE5LYr2maGXi9UJKYQkc
	SnLzUUhzQYcMCBQ/SZV9sTqJw+eCjRQhlKC0YWfUUHkAZJeONtHaSkn1DeijvtObxOgUaA5msWpKb
	toTEB8faXytCUq2umZqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqXNj-006yJI-LW; Mon, 16 May 2022 09:51:15 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqXNW-006yGs-9j; Mon, 16 May 2022 09:51:06 +0000
X-UUID: 56a8fdd12da74befb379de6fa15f8984-20220516
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:c37a8acc-a752-4c67-9405-2302d4dc7106, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:b4f82c94-563e-4fc2-8a0d-fda4821947ab,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:0,BEC:nil
X-UUID: 56a8fdd12da74befb379de6fa15f8984-20220516
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1350817678; Mon, 16 May 2022 02:50:57 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 16 May 2022 02:50:41 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Mon, 16 May 2022 17:50:40 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Mon, 16 May 2022 17:50:40 +0800
Message-ID: <4b5d6607b90f3e36fce7e61e1768da55693546aa.camel@mediatek.com>
Subject: Re: [PATCH] soc: mediatek: mtk-mmsys: Add support for MT6795 Helio X10
From: CK Hu <ck.hu@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <konrad.dybcio@somainline.org>, <marijn.suijten@somainline.org>,
 <martin.botka@somainline.org>, <~postmarketos/upstreaming@lists.sr.ht>,
 <phone-devel@vger.kernel.org>, <paul.bouchara@somainline.org>,
 <kernel@collabora.com>
Date: Mon, 16 May 2022 17:50:39 +0800
In-Reply-To: <a7afc559-4e0a-6552-190c-19e58851ce68@collabora.com>
References: <20220513170350.502501-1-angelogioacchino.delregno@collabora.com>
 <7c996c665a57fdd9ba8d6df4dc085f70afc1b933.camel@mediatek.com>
 <a7afc559-4e0a-6552-190c-19e58851ce68@collabora.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_025102_394455_96F2B43C 
X-CRM114-Status: GOOD (  33.79  )
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

On Mon, 2022-05-16 at 10:44 +0200, AngeloGioacchino Del Regno wrote:
> Il 16/05/22 07:43, CK Hu ha scritto:
> > Hi, Angelo:
> > 
> > On Fri, 2022-05-13 at 19:03 +0200, AngeloGioacchino Del Regno
> > wrote:
> > > Add MM support for the MT6795 SoC, using the mmsys default
> > > routing
> > > table.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <
> > > angelogioacchino.delregno@collabora.com>
> > > ---
> > > 
> > > In order for this patch to have any meaning and functionality, it
> > > is
> > > required to also have in-tree the [1] MT6795 clocks series, even
> > > though that's not required to actually compile this code.
> > > 
> > > [1]
> > > 
https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/list/?series=641493__;!!CTRNKA9wMg0ARbw!ywDb_Gj4oV0iYHK_PbtJSNejzsJGlFVjX-1O0G1mR0vZX_5VeMtlZJ_AS6K_Mg$
> > >   
> > > 
> > >   drivers/soc/mediatek/mtk-mmsys.c | 11 +++++++++++
> > >   1 file changed, 11 insertions(+)
> > > 
> > > diff --git a/drivers/soc/mediatek/mtk-mmsys.c
> > > b/drivers/soc/mediatek/mtk-mmsys.c
> > > index 06d8e83a2cb5..38b36b881a3b 100644
> > > --- a/drivers/soc/mediatek/mtk-mmsys.c
> > > +++ b/drivers/soc/mediatek/mtk-mmsys.c
> > > @@ -57,6 +57,13 @@ static const struct mtk_mmsys_match_data
> > > mt6779_mmsys_match_data = {
> > >   	},
> > >   };
> > >   
> > > +static const struct mtk_mmsys_driver_data
> > > mt6795_mmsys_driver_data =
> > > {
> > > +	.clk_driver = "clk-mt6795-mm",
> > > +	.routes = mmsys_default_routing_table,
> > 
> > mt6795 should have its own routing table instead of default one.
> > The
> > default one is used for mt8173, mt2701, mt2712 which no one knows
> > how
> > to separate them. If you don't know the routing table of mt6795,
> > just
> > left this as NULL.
> > 
> 
> Hello CK,
> 
> I agree with you, in fact the first test that I've done was with
> leaving
> routes to NULL, but that did not work (I couldn't get the display to
> work),
> while assigning the default routing table resulted in having a
> working
> internal (DSI) display et al, which is why I have done that.
> 
> I am sure that this may be a quirk that is required due to my
> platform's
> bootloader, but still, it won't work otherwise.
> 
> If anyone from MediaTek wants to help with providing a better
> solution for
> that, you're welcome to - but otherwise, my proposal is to configure
> MT6795
> with that default routing table and eventually come back to this
> later if
> any issue with this gets discovered... I couldn't find any, though.

So you have a drm driver which support mt6795 and it would call
mtk_mmsys_ddp_connect() to setup routing routing register. You could
generate mt6795 routing table from default one by partial element that
you use in mt6795. I think this table would be smaller than the default
one.

Regards,
CK

> 
> Cheers,
> Angelo
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
