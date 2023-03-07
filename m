Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 139BDC678D4
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 08:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SD4RysfS3my2k8WKOKVTGakT3VkMLfxdyZq5BsEIZUU=; b=V917U3g8qm4KtIm1Fluabus0+i
	UgkK6IpuzmxG9f6huFZGwm213UKkDpXqtREsdl0zorU4zq9Qlhfhdn2dh4GUpTc+xFc2z2s0EbuYe
	QdxZ3/Z5VKmAJqVrPhsZdJR01lPT9ymgadbM12nA6LtnOh4fTInOH66BnBizShDy7F2fSd8AtR5FN
	zW75yg8dIFKCPl/L2+a0xa2symPiSQnYa1/HtksgI1qv+Bjr7DdnQw1n+1UZLsnTBYYfFCSsdV8GV
	nlz3JqT/gJTTEm6Ce7/JbkSGKlmL48QTYKO3BzT12kBFnKMdfePJ5iFSQRZAEy/IUafSHItE1ZMOm
	hzpzIxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZSeD-00GhxK-Od; Tue, 07 Mar 2023 08:26:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZSe9-00Ghvu-2w; Tue, 07 Mar 2023 08:26:11 +0000
X-UUID: b39efd92bcc111eda08d4d6090ec5a5c-20230307
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=SD4RysfS3my2k8WKOKVTGakT3VkMLfxdyZq5BsEIZUU=;
	b=uFONQGB6ZhjeSTgML8pG+NzIBJ0GyTuqg6nRQYfnd66zU9nE6oH51tcopT6JQt1C8WRt4e4hlSeBN3RLwM7Lsd8gwMKf1403T5q8xxKdTCGac3KSWLvwxSN6Z0/PTn/0pYUEu264Ju7HAEZ4j4WpZp70HS1fsgBSB7l9ZuZGA+k=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.20,REQID:8f9e9baf-3806-4c0b-9d28-1428a1490965,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:25b5999,CLOUDID:fae602f5-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-UUID: b39efd92bcc111eda08d4d6090ec5a5c-20230307
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1097878890; Tue, 07 Mar 2023 01:26:04 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 7 Mar 2023 16:06:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 7 Mar 2023 16:06:00 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
CC: Robin Murphy <robin.murphy@arm.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Yong Wu <yong.wu@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	<iommu@lists.linux.dev>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <mingyuan.ma@mediatek.com>,
	<yf.wang@mediatek.com>, <jianjiao.zeng@mediatek.com>,
	<chengci.xu@mediatek.com>, <youlin.pei@mediatek.com>
Subject: [PATCH v8 0/7] MT8188 IOMMU SUPPORT
Date: Tue, 7 Mar 2023 16:05:48 +0800
Message-ID: <20230307080555.14399-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_002609_153302_F68D7ECF 
X-CRM114-Status: GOOD (  16.92  )
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

change since v8:
  - Base on v6.3-rc1 and mtk-iommu-dma-range-v5:
    https://lore.kernel.org/linux-mediatek/20230307023507.13306-1-yong.wu@mediatek.com/
  - Add a new patch set_dma_mask since mt8188 support the PA of pgtable 35bits.

changes since v7:
  - Base on mtk-iommu-dma-range-v4:
    https://lore.kernel.org/linux-mediatek/20230215062544.8677-1-yong.wu@mediatek.com/
  - Add a new patch for two IOMMU share pagetable issue.
  - Add a new patch for adding iova_region_larb_msk for mt8188.
  - Add the comment in the dt-binding header file about larb index.
    This is for readable when updating the iova_region_larb_msk.
    
    Since there is something wrong for chengci's mail account when sending
    to devicetree mail list, we don't know why. I help send this patchset.
    https://lore.kernel.org/linux-mediatek/5a916595-12ee-92e6-d380-84146dd75218@linaro.org/

changes since v6:
    https://lore.kernel.org/linux-mediatek/20221223101439.494-1-chengci.xu@mediatek.com/
  - base on tag: next-20221220.
  - update commit message of patch[2/4].

changes since v5:
  - base on tag: next-20221205.
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

Chengci.Xu (5):
  dt-bindings: mediatek: mt8188: Add binding for MM & INFRA IOMMU
  iommu/mediatek: Fix two IOMMU share pagetable issue
  iommu/mediatek: Adjust mtk_iommu_config flow
  iommu/mediatek: Add enable IOMMU SMC command for INFRA master
  iommu/mediatek: Add MT8188 IOMMU Support

Yong Wu (2):
  iommu/mediatek: Set dma_mask for PGTABLE_PA_35_EN
  iommu/mediatek: mt8188: Add iova_region_larb_msk

 .../bindings/iommu/mediatek,iommu.yaml        |  12 +-
 drivers/iommu/mtk_iommu.c                     | 159 ++++--
 .../memory/mediatek,mt8188-memory-port.h      | 489 ++++++++++++++++++
 include/soc/mediatek/smi.h                    |   1 +
 4 files changed, 629 insertions(+), 32 deletions(-)
 create mode 100644 include/dt-bindings/memory/mediatek,mt8188-memory-port.h

-- 
2.18.0



