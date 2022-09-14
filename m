Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FFE7ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 12:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aUZWTs4n4ys6gRZNfBS5r6NVuRwpcI3HfWmJC/NvUBs=; b=zefMLqDAEvK4aSI3qaVgAfcykZ
	R899FcCV6MpkXQbYvySsF240nWPi+HxNkXmWHxE4cBBqBVtp83vtRgJbUDveFmk68BEdfwtUMyDx3
	R1/GGRN8dBjSJqEuO4UI0KGauD2wIL4TE6Lz2zQtvwipeaFGbK2GATt5QKwhjUnBX7IbzDeDCaQ59
	BwNSwAd25dReRPi14nlmH+RMsAWYLiV2GIh+k0iC1r0IJEnimD0hTtsdY232I2KpxfHcX8jTHZgK/
	QS6xNkhaY76T6kuVoYfF0ZwwCNDaRMT1ibK5zIVlzA4M7LrbnayKC2GwrMacRV0xAloThuEFcVeTW
	3Su7y0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRms-0004ql-9H; Wed, 14 Sep 2022 12:46:42 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYRmq-0004n3-Gg; Wed, 14 Sep 2022 12:46:41 +0000
X-UUID: 32fdf983fba84cf98149a892572a69c2-20220914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=aUZWTs4n4ys6gRZNfBS5r6NVuRwpcI3HfWmJC/NvUBs=;
	b=m8EfpTAsxrRVLL8uPyxx8xS1Ks2ReKLVrAWpZ2Aw+Br4/djN5tdnOFf0RlFLqWlV5m6RMQjhUdgNZnOg/FO1htDwK15spgEyGt24DAsnwZqqAmFnqeQ+d+Ftz/SwzkQJ/ES3SbedJPStH0GFFcQmX3stbhyUOhftTSO9xzyY0F8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:f2a17305-cc2d-446d-890c-9fa6f9ddd716,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:9cb06bec-2856-4fce-b125-09d4c7ebe045,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 32fdf983fba84cf98149a892572a69c2-20220914
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1315583267; Wed, 14 Sep 2022 05:46:26 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 14 Sep 2022 20:45:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 14 Sep 2022 20:45:53 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<angelogioacchino.delregno@collabora.com>, <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>
Subject: [PATCH v2 0/4] Introduce MediaTek frequency hopping driver
Date: Wed, 14 Sep 2022 20:45:48 +0800
Message-ID: <20220914124552.16964-1-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_054640_582045_7D7D32DA 
X-CRM114-Status: GOOD (  12.48  )
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

The purpose of this serie is to enhance frequency hopping and spread spectrum
clocking feature for MT8186.
We introduce new PLL register APIs and some helpers for FHCTL hardware control.
For MT8186 PLL driver, we replace mtk_clk_register_plls() with newly added API
to support frequency hopping and SSC function for specific PLLs.

Changes in v2:
- Use SoC-specific compatible instead of generic one.
- Use standard clocks property and vendor-specific property in dt-binding.
- Remove some unused arguments and fix some coding style.

Johnson Wang (4):
  clk: mediatek: Export PLL operations symbols
  dt-bindings: arm: mediatek: Add new bindings of MediaTek frequency
    hopping
  clk: mediatek: Add new clock driver to handle FHCTL hardware
  clk: mediatek: Change PLL register API for MT8186

 .../bindings/arm/mediatek/mediatek,fhctl.yaml |  47 +++
 drivers/clk/mediatek/Makefile                 |   2 +-
 drivers/clk/mediatek/clk-fhctl.c              | 244 ++++++++++++++++
 drivers/clk/mediatek/clk-fhctl.h              |  26 ++
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c  |  66 ++++-
 drivers/clk/mediatek/clk-pll.c                |  84 +++---
 drivers/clk/mediatek/clk-pll.h                |  56 ++++
 drivers/clk/mediatek/clk-pllfh.c              | 268 ++++++++++++++++++
 drivers/clk/mediatek/clk-pllfh.h              |  82 ++++++
 9 files changed, 821 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
 create mode 100644 drivers/clk/mediatek/clk-fhctl.c
 create mode 100644 drivers/clk/mediatek/clk-fhctl.h
 create mode 100644 drivers/clk/mediatek/clk-pllfh.c
 create mode 100644 drivers/clk/mediatek/clk-pllfh.h

-- 
2.18.0


