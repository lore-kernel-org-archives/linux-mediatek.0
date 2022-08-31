Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 180F2ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Aug 2022 13:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QHetHRfxF8Jq9zo5zXOQv02C9vAsgfmub91Rvhqsok0=; b=Gyh7JXPmjeVIxFX2y7dm5k55uN
	0CqC173ExgOcUCjRpNTDUVkxIzCjiLmAi0foOBAMDC3dAQ5jV64xyQ25GDYB8ilo+g+LJwiMFQ3Zz
	C2pphfzOi5zbbYXPcYSwSHq+sE6cruq/5ncP0VYfhK4EecPtqWBNdKoV3q1M7VQpgZovSfGhf9bGZ
	NG9IkoJmXHOtvYNSxcRXXCC8viqFo9uMfyaEhWtNKI0G6xi16nyefKPbbwxHPXmqHvC0UKQbehcBq
	Xe4N/AS4J3QnTutDe+TO/Y2oqVtafzt6sGDTNfxv/bt8FFtPZpNEGz4l6PIy6W5bK6QNGYPYXxOpH
	pbihrD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTNTM-006GRT-9g; Wed, 31 Aug 2022 13:09:36 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTNTJ-006GQD-ME; Wed, 31 Aug 2022 13:09:34 +0000
X-UUID: 9a7cf5d7c4a34f02b3658c46f25b5e87-20220831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=QHetHRfxF8Jq9zo5zXOQv02C9vAsgfmub91Rvhqsok0=;
	b=Drpit1r3f27Bat0TEnketX90HMZR3YjfOc0vkSNcAHnkVf1fNZE1zyhqC6OQM66MSBQPTATTfxf2vVbm/7Sucs9WduhUY80yrGDEv4GbBx2xsIzwSQza5WqX2seZsjERP732YmWEYdJpLJVNwSWJm82wwCQ/bXgt1SQaMvbbCRk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:45fbc0d9-795f-4d93-a704-7ea80eef3eb3,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
	_Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18,CLOUDID:d4bd32d0-20bd-4e5e-ace8-00692b7ab380,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 9a7cf5d7c4a34f02b3658c46f25b5e87-20220831
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <johnson.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 205494566; Wed, 31 Aug 2022 06:09:28 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 31 Aug 2022 20:48:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 31 Aug 2022 20:48:51 +0800
From: Johnson Wang <johnson.wang@mediatek.com>
To: <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<angelogioacchino.delregno@collabora.com>, <sboyd@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Johnson Wang
	<johnson.wang@mediatek.com>
Subject: [PATCH 0/4] Introduce MediaTek frequency hopping driver
Date: Wed, 31 Aug 2022 20:48:46 +0800
Message-ID: <20220831124850.7748-1-johnson.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220831_060933_743891_E9CEC400 
X-CRM114-Status: GOOD (  11.25  )
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

Introduce MediaTek frequency hopping and spread spectrum clocking control
for MT8186.

Johnson Wang (4):
  clk: mediatek: Export PLL operations symbols
  dt-bindings: arm: mediatek: Add new bindings of MediaTek frequency
    hopping
  clk: mediatek: Add new clock driver to handle FHCTL hardware
  clk: mediatek: Change PLL register API for MT8186

 .../bindings/arm/mediatek/mediatek,fhctl.yaml |  49 ++++
 drivers/clk/mediatek/Makefile                 |   2 +-
 drivers/clk/mediatek/clk-fhctl.c              | 258 +++++++++++++++++
 drivers/clk/mediatek/clk-fhctl.h              |  27 ++
 drivers/clk/mediatek/clk-mt8186-apmixedsys.c  |  65 ++++-
 drivers/clk/mediatek/clk-pll.c                |  84 +++---
 drivers/clk/mediatek/clk-pll.h                |  56 ++++
 drivers/clk/mediatek/clk-pllfh.c              | 271 ++++++++++++++++++
 drivers/clk/mediatek/clk-pllfh.h              |  81 ++++++
 9 files changed, 839 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,fhctl.yaml
 create mode 100644 drivers/clk/mediatek/clk-fhctl.c
 create mode 100644 drivers/clk/mediatek/clk-fhctl.h
 create mode 100644 drivers/clk/mediatek/clk-pllfh.c
 create mode 100644 drivers/clk/mediatek/clk-pllfh.h

-- 
2.18.0


