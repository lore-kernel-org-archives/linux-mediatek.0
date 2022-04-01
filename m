Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04F75C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 07:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oukGP3zdFPkoTd0orEhY8x2BTwfPls2Mvo6ngLYDNd8=; b=IX2S0PDUkxRhQN
	lsGKDI8Vo5QnRuw3l+w2eTIkmcfp/kEhdk87RetEnXUvBoYuQDmQOMzaj9OFu26h7OPApX72Z/ORa
	wRdFGoAKE2571FeIVvAsZdtM+TNHKbVQjXA01NU7XA61zf1ljofOMB2CG68Pgq/sgmKnCJ7yy4MFF
	RFsO0ZIs6Fxs4otXqucA5+wo6PkyeBTTzlh3TSHRF5CxWISEBk0AON5aexzXl5gzdvn84F6yfJfrt
	WUtDLWrZxVtHHzfJrphcORxFrs4153L/4y6XRrGr94VGvgJrmwcWgxDHbfgUb32hKcyhu357XUHFV
	TA97SK1S6h66ny7lmuGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naBWe-004kaJ-5e; Fri, 01 Apr 2022 07:16:52 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naBWS-004kVA-NU; Fri, 01 Apr 2022 07:16:41 +0000
X-UUID: ab9b7f02cd5f42da8bfc9a23702fd8e3-20220401
X-UUID: ab9b7f02cd5f42da8bfc9a23702fd8e3-20220401
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 784003661; Fri, 01 Apr 2022 00:16:30 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 1 Apr 2022 00:16:28 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 1 Apr 2022 15:16:21 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 1 Apr 2022 15:16:20 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH V7 0/3] spi: mediatek: add single/quad mode support 
Date: Fri, 1 Apr 2022 15:16:13 +0800
Message-ID: <20220401071616.8874-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220401_001640_794125_6EF30A15 
X-CRM114-Status: UNSURE (   8.42  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This series of patches are based on spi for-next, and provide 3 patches to support MT7986.

V7:
1. add Reviewed-by: Rob Herring

V6:
 1. remove SPI_CFG3_IPM_PIN_MODE_OFFSET.
 2. add Reviewed-by: AngeloGioacchino Del Regno

V5:
 1. remove 3 patches that already applied.
 2. use devm_clk_get_optional.
 3. remove of_mtk_spi_parse_dt()

v4:
 1. fix Rob comment in v3;
 2. use "mediatek,mt7986-spi-ipm","mediatek,spi-ipm"

v3:
 1. add Rob Acked-by in "dt-bindings: spi: Add compatible for MT7986 with single mode";
 2. add a fix patch "spi: mediatek: support tick_delay without enhance_timing";
 3. fix Angelogioacchino comments;
 4. use mt7986 instead of ipm in dt-binding.

v2:
 1. rebase this series on spi for-next.
 2. fix Rob and Krzysztof comments in v1.

Leilk Liu (3):
  spi: mediatek: add spi memory support for ipm design
  dt-bindings: spi: support hclk
  spi: mediatek: support hclk

 .../bindings/spi/mediatek,spi-mt65xx.yaml     |   4 +
 drivers/spi/spi-mt65xx.c                      | 386 +++++++++++++++++-
 2 files changed, 373 insertions(+), 17 deletions(-)

--
2.25.1



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
