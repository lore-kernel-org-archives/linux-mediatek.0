Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D6AC38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 09:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IXF0ACPPnKhALSd4YQ0Rv9YFYrs3+IG8kYT+fpkzNZE=; b=jfyylfMWsGXixcZVRDJQGK4QjN
	Q+S1kIGu5ZFeFP5hVkC35T7lc/7NRYetjLBXbg2cnFFp8hSICGdNMgYO6H/ZLup7uA5xyNJxdApsb
	hZY4pn0skECBj/IYFBq7+5PBAGIeZR75liQonTNsT8V0P0zrguIaBMkmdZ7gLoQuWgF7qPyw2wSqq
	00wfMNPTk+JyxE7iX8P6WY4DqI7gCA/4PEOooy4he1OCKw4RF/TfQkuLOdqEHjpIn6EBnYsw3KqGs
	L1KcLVXb2KWmlDlAre10Y3LL40FUKIUI8J+AVakuE8Td9mXOk8CU+1ApOcuKhCC0p9u/uclnY8U5D
	DeljdS8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtzg-000S0l-ML; Mon, 24 Oct 2022 09:43:40 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omtza-000Rxf-O9; Mon, 24 Oct 2022 09:43:36 +0000
X-UUID: 197e8da8f3bb4902af5e9f415e336a30-20221024
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=IXF0ACPPnKhALSd4YQ0Rv9YFYrs3+IG8kYT+fpkzNZE=;
	b=O2wkkE9JyZSkiaOtMGuylzMw1NWzCt+YEPplTmwqjno93h01GB2uirrzE1V8xYqn82E+wk7n2wjcG/Eg9RwaA6H6UYdp9Ooiccg/+IvmL5V9VEZ56As/wHG/zdfgteWvj01V5LNPOWavkeu5iGpWHfQ5pfTNpDi0JAVivZyGn7A=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.12,REQID:8dcd5863-6897-431c-88e2-dc0cff37622c,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:62cd327,CLOUDID:66767be4-e572-4957-be22-d8f73f3158f9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 197e8da8f3bb4902af5e9f415e336a30-20221024
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <garmin.chang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 244309398; Mon, 24 Oct 2022 02:43:30 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 24 Oct 2022 17:42:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 24 Oct 2022 17:42:57 +0800
From: Garmin.Chang <Garmin.Chang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Richard Cochran
	<richardcochran@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Garmin.Chang <Garmin.Chang@mediatek.com>
Subject: [PATCH v2 00/19] MediaTek MT8188 clock support
Date: Mon, 24 Oct 2022 17:42:35 +0800
Message-ID: <20221024094254.29218-1-Garmin.Chang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_024334_807087_EABA9A96 
X-CRM114-Status: UNSURE (   9.47  )
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

Base on tag: next-20221024, linux-next/master

changes since v1:
- add CLK_OPS_PARENT_ENABLE flag in clk-mt8188-imp_iic_wrap.c
- add adsp driver "clk-mt8188-adsp_audio26m"
- align as the same indention in mediatek,mt8188-clk.h
- modify yaml file

Garmin.Chang (19):
  dt-bindings: ARM: MediaTek: Add new document bindings of MT8188 clock
  clk: mediatek: Add MT8188 apmixedsys clock support
  clk: mediatek: Add MT8188 topckgen clock support
  clk: mediatek: Add MT8188 peripheral clock support
  clk: mediatek: Add MT8188 infrastructure clock support
  clk: mediatek: Add MT8188 camsys clock support
  clk: mediatek: Add MT8188 ccusys clock support
  clk: mediatek: Add MT8188 imgsys clock support
  clk: mediatek: Add MT8188 ipesys clock support
  clk: mediatek: Add MT8188 mfgcfg clock support
  clk: mediatek: Add MT8188 vdecsys clock support
  clk: mediatek: Add MT8188 vdosys0 clock support
  clk: mediatek: Add MT8188 vdosys1 clock support
  clk: mediatek: Add MT8188 vencsys clock support
  clk: mediatek: Add MT8188 vppsys0 clock support
  clk: mediatek: Add MT8188 vppsys1 clock support
  clk: mediatek: Add MT8188 wpesys clock support
  clk: mediatek: Add MT8188 imp i2c wrapper clock support
  clk: mediatek: Add MT8188 adsp clock support

 .../arm/mediatek/mediatek,mt8188-clock.yaml   |   70 +
 .../mediatek/mediatek,mt8188-sys-clock.yaml   |   55 +
 drivers/clk/mediatek/Kconfig                  |   11 +
 drivers/clk/mediatek/Makefile                 |    7 +
 .../clk/mediatek/clk-mt8188-adsp_audio26m.c   |   49 +
 drivers/clk/mediatek/clk-mt8188-apmixedsys.c  |  153 ++
 drivers/clk/mediatek/clk-mt8188-cam.c         |  130 ++
 drivers/clk/mediatek/clk-mt8188-ccu.c         |   52 +
 drivers/clk/mediatek/clk-mt8188-img.c         |  124 ++
 .../clk/mediatek/clk-mt8188-imp_iic_wrap.c    |   86 ++
 drivers/clk/mediatek/clk-mt8188-infra_ao.c    |  194 +++
 drivers/clk/mediatek/clk-mt8188-ipe.c         |   54 +
 drivers/clk/mediatek/clk-mt8188-mfg.c         |   50 +
 drivers/clk/mediatek/clk-mt8188-peri_ao.c     |   60 +
 drivers/clk/mediatek/clk-mt8188-topckgen.c    | 1337 +++++++++++++++++
 drivers/clk/mediatek/clk-mt8188-vdec.c        |   96 ++
 drivers/clk/mediatek/clk-mt8188-vdo0.c        |  129 ++
 drivers/clk/mediatek/clk-mt8188-vdo1.c        |  177 +++
 drivers/clk/mediatek/clk-mt8188-venc.c        |   56 +
 drivers/clk/mediatek/clk-mt8188-vpp0.c        |  143 ++
 drivers/clk/mediatek/clk-mt8188-vpp1.c        |  138 ++
 drivers/clk/mediatek/clk-mt8188-wpe.c         |  107 ++
 .../dt-bindings/clock/mediatek,mt8188-clk.h   |  733 +++++++++
 23 files changed, 4011 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-clock.yaml
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8188-sys-clock.yaml
 create mode 100644 drivers/clk/mediatek/clk-mt8188-adsp_audio26m.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-apmixedsys.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-cam.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-ccu.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-img.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-imp_iic_wrap.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-infra_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-ipe.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-mfg.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-peri_ao.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-topckgen.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vdec.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vdo0.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vdo1.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-venc.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vpp0.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-vpp1.c
 create mode 100644 drivers/clk/mediatek/clk-mt8188-wpe.c
 create mode 100644 include/dt-bindings/clock/mediatek,mt8188-clk.h

-- 
2.18.0


