Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0660AECAAD3
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Sep 2022 08:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wp5SQxfm+b3blG3OmYMtgGClRI9zJUSh+sm2WRQNPz4=; b=eeajU2xt1qR0YDgu86UJANMCo7
	6oOiOGMegkaC6Yy23eQEZeN02pnmNDBoAd05QzyqjwmazFBD0458q4cvOkl36Xe2yBiIUyNcODp9u
	7fhbMmngbCdnA5ybOEGwWKHUU5JxqJfo/UZUc0OQBBroBYWPQnUweTqceghRU8tIUqN+cXJ1YInrd
	4tgYpzc8RvJM0RKXqLjlJzPXthrsGtBIMCo+LbFwfeOo4Dre47HPlV2wm0y5YL00lZJsOSyiXhYCq
	5hkq5tITh/nj/VxrH3v0omJIuh0ukofuZlFXFQ/77RIsvKX5tsHx/LqoYudphwYyhPhX8ARH3pUZI
	+duTD9sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaC8S-00A35j-Kw; Mon, 19 Sep 2022 08:28:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaC7I-00A2Iu-9t; Mon, 19 Sep 2022 08:27:07 +0000
X-UUID: 98844a133f984baf835769a551db6710-20220919
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=wp5SQxfm+b3blG3OmYMtgGClRI9zJUSh+sm2WRQNPz4=;
	b=P2gw2Q0tDuw482Ztlo0BLKJUHE71y6Kaw7RjcsB4n2VGFOh0Xz63um5yqusOkO/GFothAdNjWD9WzBApkTqArfSRA9w54Blzh1m9xiQY5P2+6Mps4Mrd8QTdTGQcVKaA7q1gQMb3ssBDUycEO+zz4uyiVr5OO85qtVd/q81SFEo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:d398bf31-fdd8-4f4e-854c-12ca711b2f0b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:d778e0f6-6e85-48d9-afd8-0504bbfe04cb,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 98844a133f984baf835769a551db6710-20220919
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <chengci.xu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1003396608; Mon, 19 Sep 2022 01:26:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 19 Sep 2022 16:26:17 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 19 Sep 2022 16:26:16 +0800
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
Subject: [PATCH v3 0/3] MT8188 IOMMU SUPPORT
Date: Mon, 19 Sep 2022 16:26:08 +0800
Message-ID: <20220919082611.19824-1-chengci.xu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_012700_371296_A88DC0E5 
X-CRM114-Status: GOOD (  12.50  )
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

changes since v2:
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

Chengci.Xu (3):
  dt-bindings: mediatek: mt8188: Add binding for MM & INFRA IOMMU
  iommu/mediatek: Add enable IOMMU SMC command for INFRA master
  iommu/mediatek: Add MT8188 IOMMU Support

 .../bindings/iommu/mediatek,iommu.yaml        |  12 +-
 drivers/iommu/mtk_iommu.c                     |  68 ++-
 .../memory/mediatek,mt8188-memory-port.h      | 482 ++++++++++++++++++
 include/soc/mediatek/smi.h                    |   1 +
 4 files changed, 560 insertions(+), 3 deletions(-)
 create mode 100644 include/dt-bindings/memory/mediatek,mt8188-memory-port.h

-- 
2.25.1


