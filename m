Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA97C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 16:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmwG34WOnnehmf+JqdIsNLaLLdUUliz/XW6HtiMKxJo=; b=UxIH1zmiqIp7OdgUjEVzV8vFC7
	UOszhHR5zYJI/1fjB157z8ByJ5TTgDKlIQp+nezGfp81q0Ll1eTYPebM7hYEQAlEcbzqrmD+Z3w4o
	/qLHzB3vlkPymIuRHyyURABicTmWcwKiPns4XViVNsPNbAB9VXAOBn7iKygOrVNdfj1JRDYaRpSjg
	GNLaiWHjDDlsuj8NwUXkfGhVuUQucN45Taphszoc00qH1lJ1hQGlaaZbmxgecLpW3nHwLNpkY6zxk
	fZOkF9RY6UHChgJDbXmlIJtrl4RbI/RE3R6QlApeqmAUsPPRmAcGqjidi6LqT9CCSiYajEFtZpXe0
	CQnStYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pACft-00EQeG-NO; Tue, 27 Dec 2022 16:19:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pACfj-00EQbE-FA; Tue, 27 Dec 2022 16:19:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GmwG34WOnnehmf+JqdIsNLaLLdUUliz/XW6HtiMKxJo=; b=EDMd5C8d64ilR8mRgojnFIayGT
	/xsKLBvNcWVQaa2PIPBac3fWVfJTgmDQBgahqMtXqrdieKOOmCPWsr5qZ5+wuoNwFadBHou8dE6iC
	dHJFtE+Ng8+PbgtAs+BsTl/yiDNfyVyYzKmiZy8YjWslRt2d3dkMlOCle5d/hSU+cvaZu03KhFVfO
	UWKoiaSaBhas9UW6zC+GEr9O+QC8vzxa++kngEni6NR+/dKhHLQ0g300EAAdxglV1wQa3TLCToGad
	yuB2eWrWrMNveEG8v+4tH57Bso/T78VlitQwP4AtSwJIj6wVsqqX9KtMg1zbF/a+HoihXZ9mfH6HR
	JgKSfeQg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pACfb-00FhbU-0t;
	Tue, 27 Dec 2022 16:19:18 +0000
X-UUID: 0f902cdb006441c48918676d8717bb3b-20221227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=GmwG34WOnnehmf+JqdIsNLaLLdUUliz/XW6HtiMKxJo=;
	b=g9ECc5etJBGDKQY8gY979h2AjelJioYQ4yZIBawjhdCZqWuaiBRbweMG9wzJALn3ljVWByuAJ2GusBT6eqy00AWPgTcorxiFJGo+EIFOJpasoIlySi8OQftPrwkD7xm22q6jAednzYggkRVi56KlC5m368xiYw73YX3+c3Si39s=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:2ae17a4b-730a-4184-bb42-17244a0f86ce,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:df778c8a-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0f902cdb006441c48918676d8717bb3b-20221227
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1914566835; Tue, 27 Dec 2022 09:18:53 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 28 Dec 2022 00:18:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 28 Dec 2022 00:18:20 +0800
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
Subject: Re: [PATCH v2 12/23] clk: mediatek: clk-mtk: Extend mtk_clk_simple_probe()
Date: Wed, 28 Dec 2022 00:18:20 +0800
Message-ID: <20221227161820.18186-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221223094259.87373-24-angelogioacchino.delregno@collabora.com>
References: <20221223094259.87373-24-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_161916_224976_3A2D1EAB 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

> As a preparation to increase probe functions commonization across
> various MediaTek SoC clock controller drivers, extend function
> mtk_clk_simple_probe() to be able to register not only gates, but
> also fixed clocks, factors, muxes and composites.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Thanks for doing this! I read the patch 23 first and I thought the
mtk_clk_simple_probe() cannot be used like that. So I got the whole series
and found this patch to extend mtk_clk_simple_probe. Cool.

Reviewed-by: Miles Chen <miles.chen@mediatek.com> 

