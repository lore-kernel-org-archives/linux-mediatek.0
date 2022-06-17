Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87245C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Jun 2022 07:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7UqeuRMIDlgV3IxfWy/ZcjY+qmR31vuY35lqraUJhuY=; b=NdehcYMADZ4nQPrxAeiuYUTLlu
	CvQOmtwRzOku7P69uQUgOqPZZxKFTqJsvZ+nl+ItH+SN3MOOk9EuPE16zEHVmSKQ4eGDstZLjqNJR
	Mpg8bOqFz1DDVzm7xkkTQGYO+C8M/DoWsA84O50qGML08U2iEouejR5+dZLGRo2wz/IQ1JHNQEpIO
	3GaqeKc9vYiVZv3f4FDeG9zVFSLliIU42bvtTxzXjphbPgNY43h0EKg9funnr2Bz5RWwq0WXOVsj3
	fUxUSL6d2yuGUwwpqiZob0XZon1cF20bLzSlWsAxuIb2Rg/LiMjxHd3gyi2Ww/WrCHOuvrmmRNv6o
	As/DqQoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2632-005pqe-Px; Fri, 17 Jun 2022 07:05:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o262p-005pni-Dz; Fri, 17 Jun 2022 07:05:30 +0000
X-UUID: a0625164a2de4f88b4ae183f3ffb9930-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6,REQID:50a2c8e1-fc99-4b97-8142-b4c0a6cc8392,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
	ION:release,TS:-5
X-CID-META: VersionHash:b14ad71,CLOUDID:5a969bf6-e099-41ba-a32c-13b8bfe63214,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: a0625164a2de4f88b4ae183f3ffb9930-20220617
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
	(envelope-from <jianjun.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 1880842832; Fri, 17 Jun 2022 00:05:17 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 17 Jun 2022 00:02:50 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 15:02:48 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Fri, 17 Jun 2022 15:02:47 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Kishon Vijay Abraham I
	<kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chen-Yu Tsai
	<wenst@chromium.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
CC: Wei-Shun Chang <weishunc@google.com>, Jianjun Wang
	<jianjun.wang@mediatek.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<rex-bc.chen@mediatek.com>, <randy.wu@mediatek.com>,
	<jieyy.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
	<qizhong.cheng@mediatek.com>, <jian.yang@mediatek.com>
Subject: [PATCH v10 0/2] phy: mediatek: Add PCIe PHY driver
Date: Fri, 17 Jun 2022 15:02:44 +0800
Message-ID: <20220617070246.20142-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_000527_514732_49A52851 
X-CRM114-Status: GOOD (  12.39  )
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

These series patches add support for PCIe PHY driver on MediaTek chipsets.

Changes in v10:
1. Sort the order in Kconfig and Makefile.

Changes in v9:
1. Check if the return value is -ENOMEM when reading efuse data fails.

Changes in v8:
1. Use "device_property_present()" to increase human readability;
2. Use "GPL" as recommended in commit bf7fbeeae6db ("module: Cure
   the MODULE_LICENSE "GPL" vs. "GPL v2" bogosity").

Changes in v7:
1. Add bitfield.h header to fix the build error on non-arm64 platforms.

Changes in v6:
1. Remove unnecessary header files;
2. Use FILELD_PREP in bitfield.h to set value.

Changes in v5:
1. Fix typo in kerneldoc: "eFues" => "eFuse".

Changes in v4:
1. Fix no return when calling dev_err_probe.

Changes in v3:
1. Add introductions for structure members;
2. Add SoC dependent data;
3. Dynamically allocate efuse data;
4. Check return value if it's an -EPROBE_DEFER.

Changes in v2:
1. Add specific compatible name;
2. Read NVMEM data at probe time;
3. Fix typos.

Jianjun Wang (2):
  dt-bindings: phy: mediatek: Add YAML schema for PCIe PHY
  phy: mediatek: Add PCIe PHY driver

 .../bindings/phy/mediatek,pcie-phy.yaml       |  75 +++++
 drivers/phy/mediatek/Kconfig                  |  11 +
 drivers/phy/mediatek/Makefile                 |   1 +
 drivers/phy/mediatek/phy-mtk-pcie.c           | 267 ++++++++++++++++++
 4 files changed, 354 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/mediatek,pcie-phy.yaml
 create mode 100644 drivers/phy/mediatek/phy-mtk-pcie.c

-- 
2.18.0


