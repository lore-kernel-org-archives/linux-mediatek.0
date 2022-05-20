Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8332BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 06:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cuBB5iTK9Y09yBICAikGxBaHdoQtLscO+TKUJmYlMBc=; b=e2vYCERNrYCVVa
	8fygBmrVkLvi3c/TX9NATafx0D7UtM0np7iNaGdkGEmzRZt7pq3VKyzZtYeIRj7R2UgfuxzL/fMy5
	j+kPQSHykOJDi70NMX8bkeWu0ASAE5Vi8FjtX3KWzvG9M6FNOXX/1FMwB1hBB/JeBSM/QUSIeZYjN
	mfIzEGStUIacg/ZrHVaJLM/mTaOlINkq00IgrBv6BGhCTvYp4pk5beqLgNTzHJcGG2QWHNlvSaDAa
	p9kEuxEd244tsP4vJuPGUEvpFOHG24BlvvX/q3D/MZ/T4bBafJkSOGIjkkw3DcB+XYzw8U4KRnB3z
	zjYSb6z8bQn5ZQILhkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrwSo-00ArWt-Hb; Fri, 20 May 2022 06:50:18 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrwSI-00ArIr-4K; Fri, 20 May 2022 06:49:48 +0000
X-UUID: 338b7ad3bccf46f28b1808dbee933c0b-20220519
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:f7694b93-5dde-4a21-ae87-14ded0681441, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:2a19b09, CLOUDID:2437f979-5ef6-470b-96c9-bdb8ced32786,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: 338b7ad3bccf46f28b1808dbee933c0b-20220519
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 139095887; Thu, 19 May 2022 23:49:39 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 19 May 2022 23:49:26 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 20 May 2022 14:49:25 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 20 May 2022 14:49:22 +0800
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
Subject: [PATCH v9 0/2] phy: mediatek: Add PCIe PHY driver
Date: Fri, 20 May 2022 14:49:18 +0800
Message-ID: <20220520064920.27313-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_234946_215856_4C3CE9DC 
X-CRM114-Status: GOOD (  12.15  )
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

These series patches add support for PCIe PHY driver on MediaTek chipsets.

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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
