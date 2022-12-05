Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27740C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 10:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kTJMxExPsJ4uFzNi9My9H5x7NfzxY6cGVhswaoYNhhU=; b=r+vlja7obAFkykgOk+Y7yreUAz
	vcUIODeTO0rjWkaQKlaVHXSvj89DARWkZN/RdkRbjR0eD3Q/+l3ZAAbg+kB7MgSn4bBK8hPsiNujf
	Uq6bTXrcLzuqsyUA3ztzps23mit3qd3yuWojQAMJ/+RjfLAT4+rU20uqXCaaPulX2MHQ01mV8gX0w
	x16g33QFxSfXx05a5KZOBUxvgy3lJhv8O70y8fQy/daFQsiHTQARY6NQumAYypi/4Rl5d+FkEmXpX
	Fjwr7Rh2h8ZAyEjb9nmRihvfRu2PdhgUbUMf2YMci6EI3kBVOpB6EfrSN7y9tdZjQENd4Wp23Km37
	sdZDhpkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p28uM-000ysu-25; Mon, 05 Dec 2022 10:41:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p28u9-000ySK-Kh; Mon, 05 Dec 2022 10:40:59 +0000
X-UUID: a99c2abfa3184b21bcf299d5938ad51d-20221205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=kTJMxExPsJ4uFzNi9My9H5x7NfzxY6cGVhswaoYNhhU=;
	b=q1ENYF15cljAf+pksSq25XHReKrlpvrdlka5b9jXhZTkwnnCniFM4GB0pqTJIv4SPmvvPB7r+XXkG9ABkSvq/S9D7Um7XSYU9IaPoFf+pW00GWjtBPHlPT1VuyPZ0+HM1666tdsRgGgMs0i/XJJgohcpnOTxDN+1SfbCEBhNDgA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:fc864569-f7e7-458c-bbf4-da31725fb19f,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:780aaed1-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: a99c2abfa3184b21bcf299d5938ad51d-20221205
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1142810557; Mon, 05 Dec 2022 03:40:51 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 5 Dec 2022 17:50:12 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 5 Dec 2022 17:50:12 +0800
From: Chengci.Xu <chengci.xu@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>, "Will
 Deacon" <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: <iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Chengci.Xu
	<chengci.xu@mediatek.com>
Subject: [PATCH v5 0/4] MT8188 IOMMU SUPPORT
Date: Mon, 5 Dec 2022 17:49:57 +0800
Message-ID: <20221205095001.31918-1-chengci.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_024057_719195_85F447A3 
X-CRM114-Status: GOOD (  11.89  )
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

Adds MT8188 IOMMU support.

MT8188 have 3 IOMMU HWs. 2 IOMMU HW is for multimedia, and 1 IOMMU HW
is for infra-master, like PCIe.

About the 2 MM IOMMU HW, the connection could be something like this:

        IOMMU(VDO)          IOMMU(VPP)
           |                   |
      SMI_COMMON(VDO)      SMI_COMMON(VPP)
      ---------------     ----------------
      |      |   ...      |      |     ...
    larb0 larb2  ...    larb1 larb3    ...

INFRA IOMMU does not have SMI, the master connects to IOMMU directly.

Although multiple banks supported in MT8188, we only use one of them,
which means PCIe is put in bank0 of INFRA IOMMU.

So we have two pgtable for MT8188, specifically, these two MM IOMMU HW
share a pgtable while INFRA IOMMU HW use a independent pgtable.

Another change is that we add some SMC command for INFRA master to 
enable/disable INFRA IOMMU in ATF considering security concerns.

We also adjust the flow of mtk_iommu_config to reduce indention.

changes since v5:
  - base on tag: next-20221205
  - add flag PGTABLE_PA_35_EN for all IOMMU in MT8188.
  - modify the type of "portid_msk" from "u32" to "unsigned long".

changes since v4:
  - base on tag: next-20221018.
  - add patch[2/4] to reduce indention by adjust mtk_iommu_config flow.

changes since v3:
  - base on tag: next-20220916.
  - use license "GPL-2.0-only OR BSD-2-Clause" in bingings head file.
  - drop redundant "portid" assignment when configure infra master.
  - reduce indentation by using "else if" when config infra master.
  - update probe flow about "pericfg" for CFG_IFA_MASTER_IN_ATF.
  - drop unused "pericfg_comp_str" in mt8188_data_infra.
  - drop words like "This commit/patch".

changes since v2:
  - base on tag: next-20220831.
  - rename "mt8188-memory-port.h" to "mediatek,mt8188-memory-port.h".
  - use dual-license in "mediatek,mt8188-memory-port.h"
  - remove unnecessary "()" when define SMI_LARB_ID

changes since v1:
  - base on tag: next-20220803.
  - adds MT8188 IOMMU support.

Chengci.Xu (4):
  dt-bindings: mediatek: mt8188: Add binding for MM & INFRA IOMMU
  iommu/mediatek: Adjust mtk_iommu_config flow
  iommu/mediatek: Add enable IOMMU SMC command for INFRA master
  iommu/mediatek: Add MT8188 IOMMU Support

 .../bindings/iommu/mediatek,iommu.yaml        |  12 +-
 drivers/iommu/mtk_iommu.c                     | 113 +++-
 .../memory/mediatek,mt8188-memory-port.h      | 482 ++++++++++++++++++
 include/soc/mediatek/smi.h                    |   1 +
 4 files changed, 584 insertions(+), 24 deletions(-)
 create mode 100644 include/dt-bindings/memory/mediatek,mt8188-memory-port.h

-- 
2.25.1


