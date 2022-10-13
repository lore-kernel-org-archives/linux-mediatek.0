Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D3BC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 11:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xHg1H54Fp557c8dP/j/enzMQiG2x94tak33lJ6HXOWU=; b=N8AqVTCWSBRFBl0QYBYC4NWGUG
	vLyaCmRywgUEkS2S/mkudvmqH4Xmv6IAn2AltR7LlKJaO62BGaUcVxBZvKHaGjbE16PX+856T8+63
	ReaoSI46FhwjxxuE5YkL0rhB2HhoGIgfUwrV+aB7v8KwLVCAGI5QFQ1Uyk4U0pgmjpWoGkOCvnNPM
	I/wHrQc+iR8liqa+P6X1lYKln4Ox2SIT43yWiGRvX413I3Asf+pNNW1EiT1N2JM935hP15OrMN1ng
	GGxfic76EunVcEkNplE8vG6QWb5sm3/dbW0eWKcFUC7vAc1pzx+GMigmtL0zW/0HbArsEaEv6P3lu
	S3OuNCGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiwKX-00BWmx-CM; Thu, 13 Oct 2022 11:24:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiwKC-00BWh2-7Z; Thu, 13 Oct 2022 11:24:30 +0000
X-UUID: efdc464b37cc4588ab1db3ee58d28be4-20221013
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=xHg1H54Fp557c8dP/j/enzMQiG2x94tak33lJ6HXOWU=;
	b=Gd7PCQ5J4SfgjCPjqmAMCxxTyyLHYtGkikggzelr7GUcN9oR4zl5jpLV8LkPDJfEH8l4U8Mi+PdI6Qo7rADOrw5G8ixiU8i0AsU7m+PUijfPJ6pudP9kq7U4jRMwPgC0i9OGnzydjbUsR9qra+qdQoLSgxlkKjZ/3iwwwcoWtKc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:b9be71af-9804-4223-9daf-e35779d7449f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:39a5ff1,CLOUDID:999d6401-cdeb-479d-93af-53f947adce9d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: efdc464b37cc4588ab1db3ee58d28be4-20221013
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1789901285; Thu, 13 Oct 2022 04:24:15 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Thu, 13 Oct 2022 19:23:39 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Thu, 13 Oct 2022 19:23:39 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<angelogioacchino.delregno@collabora.com>, <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<kuan-hsin.lee@mediatek.com>, <yu-chang.wang@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>
Subject: [PATCH v4 0/4] Introduce MediaTek frequency hopping driver
Date: Thu, 13 Oct 2022 19:23:32 +0800
Message-ID: <20221013112336.15438-1-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_042428_298646_8CB888A0 
X-CRM114-Status: GOOD (  12.36  )
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

Changes in v4:
- Fixup iospace error in the binding.
- Use GENMASK marco and remove extra line.

Changes in v3:
- Change binding file name.
- Add some constraints for properties.
- Rename "mediatek,hopping-ssc-percents" to "mediatek,hopping-ssc-percent".
- Add new config symbol.

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

 .../arm/mediatek/mediatek,mt8186-fhctl.yaml   |  53 ++++
 drivers/clk/mediatek/Kconfig                  |   8 +
 drivers/clk/mediatek/Makefile                 |   1 +
 drivers/clk/mediatek/clk-fhctl.c              | 244 ++++++++++++++++
 drivers/clk/mediatek/clk-fhctl.h              |  26 ++
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c  |  66 ++++-
 drivers/clk/mediatek/clk-pll.c                |  84 +++---
 drivers/clk/mediatek/clk-pll.h                |  55 ++++
 drivers/clk/mediatek/clk-pllfh.c              | 268 ++++++++++++++++++
 drivers/clk/mediatek/clk-pllfh.h              |  82 ++++++
 10 files changed, 834 insertions(+), 53 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-fhctl.yaml
 create mode 100644 drivers/clk/mediatek/clk-fhctl.c
 create mode 100644 drivers/clk/mediatek/clk-fhctl.h
 create mode 100644 drivers/clk/mediatek/clk-pllfh.c
 create mode 100644 drivers/clk/mediatek/clk-pllfh.h

-- 
2.18.0


