Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A4FBC25B0E
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 04:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oi64ZAN56SKAouCD2c1g9twrjMLE3pr2hOeKSFbJBlc=; b=GrBntlAWbnKxdRJpeSxQg+R1VB
	L60NvDKF8oT0W6SWiWqEpgc5GC3ka/i/3KfTY2UuYW1PGc4of0urXKSK7LeFvrO5iBreymrBF3gFr
	PTsaoj8kjk4BOLxEirl68pDUrf4RV6Ad7krHDikF+29bHpKJyhU8vUPJfJ4TlkOJvQ5/OEohKmchW
	oc8OzYhvfwBHlhA5+AbDfQgO36jg442A6miKfSSRPpKJshhQ+mBq35MoOQyW9NoAdXKe9dee1wDr/
	mcDOHtJopMpCsjCiWdvKmorgIZE20tw0IzMn9RPkglJHNNt2C6EP109big/YKHCw0t6ZRiBzcyMNO
	dOYa/FoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOtYQ-00HS6Y-Jx; Fri, 19 Aug 2022 04:24:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOtYB-00HS0P-0C; Fri, 19 Aug 2022 04:24:04 +0000
X-UUID: ebd772edfc72470da045e56df123af68-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=oi64ZAN56SKAouCD2c1g9twrjMLE3pr2hOeKSFbJBlc=;
	b=kLqGjSNz8+1XbllMVOPZaqWOF46ITVExEFcvFk97u5dfpFRFZx+vvpwvBsy/woIzSjfSNqW1OwNA6ua5MTVfF15tr2X+7vri2Ybs2VR0Srvr3RkE091dPV7oAQJsr4qCIEyrbRntJrSe9SKSCPzkqvbbE289PujB7VTS4DwCJSg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:d49889b8-089c-4148-a9e2-af1fda1b87c6,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:b73fc1fd-9e71-4a0f-ba6b-417998daea35,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ebd772edfc72470da045e56df123af68-20220818
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 710081993; Thu, 18 Aug 2022 21:23:58 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 12:13:24 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 19 Aug 2022 12:13:24 +0800
Message-ID: <12062a2e2957113d40b4bf3c1c62d18418b51a12.camel@mediatek.com>
Subject: Re: [PATCH v25 07/10] soc: mediatek: mmsys: add mmsys for support
 64 reset bits
From: Nancy.Lin <nancy.lin@mediatek.com>
To: "=?ISO-8859-1?Q?N=EDcolas?= F. R. A. Prado" <nfraprado@collabora.com>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>, <wim@linux-watchdog.org>, "AngeloGioacchino
 Del Regno" <angelogioacchino.delregno@collabora.com>, <linux@roeck-us.net>,
	David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Nathan
 Chancellor" <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
	"jason-jh . lin" <jason-jh.lin@mediatek.com>, Yongqiang Niu
	<yongqiang.niu@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
	<llvm@lists.linux.dev>, <singo.chang@mediatek.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 19 Aug 2022 12:13:23 +0800
In-Reply-To: <d7ccb3fb2630c1c0b6dda2990cff72169e5e5d0b.camel@mediatek.com>
References: <20220711075245.10492-1-nancy.lin@mediatek.com>
	 <20220711075245.10492-8-nancy.lin@mediatek.com>
	 <20220818214715.spbyic34szubx3gi@notapiano>
	 <d7ccb3fb2630c1c0b6dda2990cff72169e5e5d0b.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_212403_064323_04FB5EBD 
X-CRM114-Status: GOOD (  25.33  )
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

Hi Nicolas,


On Fri, 2022-08-19 at 10:09 +0800, Nancy.Lin wrote:
> Hi Nicolas,
> 
> Thanks for the review.
> 
> On Thu, 2022-08-18 at 17:47 -0400, Nícolas F. R. A. Prado wrote:
> > Hi Nancy,
> > 
> > On Mon, Jul 11, 2022 at 03:52:42PM +0800, Nancy.Lin wrote:
> > [..]
> > >  static const struct mtk_mmsys_driver_data
> > > mt2701_mmsys_driver_data
> > > = {
> > >  	.clk_driver = "clk-mt2701-mm",
> > >  	.routes = mmsys_default_routing_table,
> > > @@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data
> > > mt8173_mmsys_driver_data = {
> > >  	.routes = mmsys_default_routing_table,
> > >  	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
> > >  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> > > +	.num_resets = 32,
> > >  };
> > >  
> > >  static const struct mtk_mmsys_match_data mt8173_mmsys_match_data
> > > =
> > > {
> > > @@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data
> > > mt8183_mmsys_driver_data = {
> > >  	.routes = mmsys_mt8183_routing_table,
> > >  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
> > >  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> > > +	.num_resets = 32,
> > >  };
> > >  
> > >  static const struct mtk_mmsys_match_data mt8183_mmsys_match_data
> > > =
> > > {
> > > @@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data
> > > mt8186_mmsys_driver_data = {
> > >  	.routes = mmsys_mt8186_routing_table,
> > >  	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
> > >  	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> > > +	.num_resets = 32,
> > >  };
> > 
> > [..]
> > > @@ -351,18 +362,6 @@ static int mtk_mmsys_probe(struct
> > > platform_device *pdev)
> > >  		return ret;
> > >  	}
> > >  
> > > -	spin_lock_init(&mmsys->lock);
> > > -
> > > -	mmsys->rcdev.owner = THIS_MODULE;
> > > -	mmsys->rcdev.nr_resets = 32;
> > 
> > The number of resets was previously always set to 32, and now
> > you're
> > instead
> > setting it based on num_resets from each machine. The issue is,
> > you're
> > forgetting a bunch of them.
> > 
> > mt8192 didn't get a num_reset, so this commit breaks the display on
> > mt8192 based
> > devices. But mt8192 isn't the only one, there are other platforms
> > missing this
> > property. Please set num_resets to 32 in every single one of them,
> > otherwise
> > there will be display regressions.
> > 
> > Thanks,
> > Nícolas
> 
> It's my mistake. I will set num_resets to 32 for every mmsys driver.
> 
> Thanks,
> Nancy

After review the code, I think only the mmsys driver with the
sw0_rst_offset setting should set num_resets to 32, otherwise it would
set wrong addr in the mtk_mmsys_reset_update() function. Those mmsys
without sw0_rst_offset set should not set num_resets to 32.

Thanks,
Nancy


