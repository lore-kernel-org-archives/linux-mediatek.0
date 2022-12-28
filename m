Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBFA1C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Dec 2022 09:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GcaUuOgVIhiyz19WJXVeJeBFNH9yp3Z0VXXuo9zLxwE=; b=Y2+3WdWm7OM7ppSDhf3d4JygzL
	cU5XFyMu6SBh+DmRM036maCCao51azxHoc5vVUS0hiqSaCG4EL2NU2Kd4pE9k+uk+Wt+XeQDhoWdq
	7y958Mra2jHJVmJVbROHhKcQg7jDcoH1T02d600JHNkWKwKqfqfwWPbnFSUYulGcqv6LjXud7flGB
	7A1UjhqRxjtlSqFCef+wJXCPAasqQO7cB0J+QRQ9skSdm/bSjzlOwDrSe6nXfXswPsVQe80bOXnm0
	YlGee1R8R0of6z6s4gGxa0zgtgDAl0aFBrZqoodhTJaT43AvHWsAPwe0AW/sZc9FadWwPbptCDnDJ
	nhuBAvfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pASQE-003X3w-Lz; Wed, 28 Dec 2022 09:08:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pASQC-003X1b-Hi; Wed, 28 Dec 2022 09:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GcaUuOgVIhiyz19WJXVeJeBFNH9yp3Z0VXXuo9zLxwE=; b=NNJs3TPEiVJ924sh0dvq8fPCNY
	xFWU47XELF+HCnN/roEu+UkJAoZ6gNw1QRmw0wQKdMMLP2GkQh3GDWd8nHwR/pWrtQ5Gb8jnUhFmf
	DLasHaEimk2LW4+ilXWxUcqxay4p/fM4A8An4F504C5m1m2Nw3AQUVjq/lh8BluSGClXEZUo0Mr/d
	Jawoft2Q2f8vtwjo4Ykqxn5o0unbKcfQIJ3GXr7TeqJ+HdOZNOvB0brTp+f0At/D4h87OY+bNwzUU
	y5y78kzirLQ0inoat/KKZYny5fF70xF9y3V9fCTk9DUkuPCBJ4R+spWcLox7btd9gwMKhttLrJFfe
	ensbZyww==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pASQ3-00FwGW-0N;
	Wed, 28 Dec 2022 09:08:19 +0000
X-UUID: 6f6ee06b4952414cb85da41ad248d801-20221228
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GcaUuOgVIhiyz19WJXVeJeBFNH9yp3Z0VXXuo9zLxwE=;
	b=R2xxp2UmDyyobUZ8BvIrb3wAqgq6lA2PzJcjaKucTsEmAqjUhs47HQbUPjJ2o63v6CXMKRYvhMdbL9nPN+eFmC15d5kCAzvq00Edm2dEMXhQAr9O0M2AXty9KdQrKWf5UMfs+kBZn2mpn1psB2Yg9uWPC9NLTFKbQ2klZxE6phQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:9904dfb9-7487-41a6-aa8d-654e357491d3,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:fcb69f8a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 6f6ee06b4952414cb85da41ad248d801-20221228
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2023118130; Wed, 28 Dec 2022 01:52:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Dec 2022 16:31:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 28 Dec 2022 16:31:23 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <chun-jie.chen@mediatek.com>, <daniel@makrotopia.org>,
	<devicetree@vger.kernel.org>, <fparent@baylibre.com>, <ikjn@chromium.org>,
	<johnson.wang@mediatek.com>, <jose.exposito89@gmail.com>,
	<kernel@collabora.com>, <krzysztof.kozlowski+dt@linaro.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <miles.chen@mediatek.com>, <msp@baylibre.com>,
	<mturquette@baylibre.com>, <nfraprado@collabora.com>,
	<pablo.sun@mediatek.com>, <rex-bc.chen@mediatek.com>, <robh+dt@kernel.org>,
	<ryder.lee@kernel.org>, <sam.shih@mediatek.com>, <sboyd@kernel.org>,
	<weiyi.lu@mediatek.com>, <wenst@chromium.org>, <y.oudjana@protonmail.com>,
	<yangyingliang@huawei.com>
Subject: Re: [PATCH v2 15/23] clk: mediatek: mt8192: Join top_adj_divs and top_muxes
Date: Wed, 28 Dec 2022 16:31:23 +0800
Message-ID: <20221228083123.15298-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223094259.87373-16-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-16-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_090815_984045_03F8E63F 
X-CRM114-Status: GOOD (  10.04  )
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

Hi,

> These two are both mtk_composite arrays, one dependent on another, but
> that's something that the clock framework is supposed to sort out and
> anyway registering them separately isn't going to ease the framework's
> job in checking dependencies.
> 
> Put the contents of top_adj_divs in top_muxes to join them together
> and register them in one shot.
> 

In mt8192, we can join top_adj_divs and top_muxes:

mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base, &mt8192_clk_lock,
		top_clk_data);
mtk_clk_register_composites(top_adj_divs, ARRAY_SIZE(top_adj_divs), base, &mt8192_clk_lock,
		top_clk_data);

However, there are other top_adj_divs[] and top_muxes[] in different types so 
we cannot join them.

For example:
in drivers/clk/mediatek/clk-mt8167.c:mtk_topckgen_init():

mtk_clk_register_composites(top_muxes, ARRAY_SIZE(top_muxes), base,
		&mt8167_clk_lock, clk_data);
mtk_clk_register_dividers(top_adj_divs, ARRAY_SIZE(top_adj_divs),
		base, &mt8167_clk_lock, clk_data);

So we can join top_adj_divs and top_muxes in some platforms, but we
cannot join top_adj_divs and top_muxes in some other platforms.

I'm afraid that this will confuses people.


thanks,
Miles

