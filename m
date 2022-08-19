Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACDB5C00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 02:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h+l8o7r9XPTFomhUEyaLhpaCiOEqcWb83H4GxU7r5Ng=; b=j0PXvpd+Dm/iHsQl2xhHkBvfhX
	5/1Bj7JCVaNV/IVIsVxG7FSzws0vcJYKjsA7g8s9QdtoyZ4aYZVh8+5sRRBSoUzD/SiEsrga6KU+7
	nXoOEDefwQ2548MsrbsKJsDWlHsEEEAWC3QSwQSg9eV4mH7Rluc1zVnziSmWCcogSh1+mV1fnjtT/
	w7eA3c5yoTklOq5dKAG7HQAqHA1nWWwjvFVklFO/3YAiJ/6riqlAY8akwWLFA7qO2Qvi2nBxRfBhN
	03FCCNCbK/TdzB2wxku8iuJk120BpYUFwPX0MgjfvAC/VTvX3IRl85BnAA+ZstVmVyCZ7NgSVx8DF
	FhfQfVNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOrdO-00ENeM-Ud; Fri, 19 Aug 2022 02:21:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOrdB-00ENK8-Uh; Fri, 19 Aug 2022 02:21:08 +0000
X-UUID: 0c77d6029bca471a9c3307f69bb18f52-20220818
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=h+l8o7r9XPTFomhUEyaLhpaCiOEqcWb83H4GxU7r5Ng=;
	b=cClyh/60WEUymLdlcqu28SR4XchPdZZrmbudxu+Rvy60LIn4kc9TJ3/LaFVX9Jy9ezPXdKkLsrpZSRH/iFqI5QbN+2LjbeiIJMLxeHrrPyiLQHPEvn/cF3ZDDHoH8D3NCf6fG+/ApLOFYgav7BuY5lyGKaO5ov/+DSRBjpxyvxg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:236f217f-ff84-4f74-a35d-3b33ccb42808,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
	Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18,CLOUDID:36d63eaf-9535-44a6-aa9b-7f62b79b6ff6,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0c77d6029bca471a9c3307f69bb18f52-20220818
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 947130380; Thu, 18 Aug 2022 19:21:02 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 10:09:58 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 19 Aug 2022 10:09:57 +0800
Message-ID: <d7ccb3fb2630c1c0b6dda2990cff72169e5e5d0b.camel@mediatek.com>
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
Date: Fri, 19 Aug 2022 10:09:57 +0800
In-Reply-To: <20220818214715.spbyic34szubx3gi@notapiano>
References: <20220711075245.10492-1-nancy.lin@mediatek.com>
	 <20220711075245.10492-8-nancy.lin@mediatek.com>
	 <20220818214715.spbyic34szubx3gi@notapiano>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_192106_290672_774492E4 
X-CRM114-Status: GOOD (  19.11  )
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

Thanks for the review.

On Thu, 2022-08-18 at 17:47 -0400, Nícolas F. R. A. Prado wrote:
> Hi Nancy,
> 
> On Mon, Jul 11, 2022 at 03:52:42PM +0800, Nancy.Lin wrote:
> [..]
> >  static const struct mtk_mmsys_driver_data mt2701_mmsys_driver_data
> > = {
> >  	.clk_driver = "clk-mt2701-mm",
> >  	.routes = mmsys_default_routing_table,
> > @@ -86,6 +88,7 @@ static const struct mtk_mmsys_driver_data
> > mt8173_mmsys_driver_data = {
> >  	.routes = mmsys_default_routing_table,
> >  	.num_routes = ARRAY_SIZE(mmsys_default_routing_table),
> >  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> > +	.num_resets = 32,
> >  };
> >  
> >  static const struct mtk_mmsys_match_data mt8173_mmsys_match_data =
> > {
> > @@ -100,6 +103,7 @@ static const struct mtk_mmsys_driver_data
> > mt8183_mmsys_driver_data = {
> >  	.routes = mmsys_mt8183_routing_table,
> >  	.num_routes = ARRAY_SIZE(mmsys_mt8183_routing_table),
> >  	.sw0_rst_offset = MT8183_MMSYS_SW0_RST_B,
> > +	.num_resets = 32,
> >  };
> >  
> >  static const struct mtk_mmsys_match_data mt8183_mmsys_match_data =
> > {
> > @@ -114,6 +118,7 @@ static const struct mtk_mmsys_driver_data
> > mt8186_mmsys_driver_data = {
> >  	.routes = mmsys_mt8186_routing_table,
> >  	.num_routes = ARRAY_SIZE(mmsys_mt8186_routing_table),
> >  	.sw0_rst_offset = MT8186_MMSYS_SW0_RST_B,
> > +	.num_resets = 32,
> >  };
> 
> [..]
> > @@ -351,18 +362,6 @@ static int mtk_mmsys_probe(struct
> > platform_device *pdev)
> >  		return ret;
> >  	}
> >  
> > -	spin_lock_init(&mmsys->lock);
> > -
> > -	mmsys->rcdev.owner = THIS_MODULE;
> > -	mmsys->rcdev.nr_resets = 32;
> 
> The number of resets was previously always set to 32, and now you're
> instead
> setting it based on num_resets from each machine. The issue is,
> you're
> forgetting a bunch of them.
> 
> mt8192 didn't get a num_reset, so this commit breaks the display on
> mt8192 based
> devices. But mt8192 isn't the only one, there are other platforms
> missing this
> property. Please set num_resets to 32 in every single one of them,
> otherwise
> there will be display regressions.
> 
> Thanks,
> Nícolas

It's my mistake. I will set num_resets to 32 for every mmsys driver.

Thanks,
Nancy


