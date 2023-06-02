Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BADC77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jun 2023 09:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tkXvsKWiCiKvGwn/DYFIYckSfCXc3Ts7n72TyGWrQmc=; b=odQ2VR2zXPuwVF4WRTj/FQHZDB
	UocMqdIjxN+rk2EAlKdUKVUEFhguVU+zYWGFPXpb4rWRJ3BwYZYQyrGVit7tSrnpMoO4a4/8webKq
	YzTlcuoYYGQxpfBnfEFg2WL9NUkUX1f8omPiOXkuft/iXJ33GZhfA54RsAEuOixL3fL+X2k39UW+F
	v+allYHxKWsbF3VoBP95tT/ME/9egpDiKLV9fcz6LgxXfTsDPowFZhIoJIo1Ay3q+DoxvNohCjw1M
	VS/Ivdy+75be8pvy7dihoCHGC933j2oBA2XuPczqGIBM4iLCTrQDpLv8sjCU/1tYs7AdQ1QidKdwA
	TDJh9JZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q50gJ-006HjB-2a;
	Fri, 02 Jun 2023 09:02:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q50gG-006Hfs-17;
	Fri, 02 Jun 2023 09:02:46 +0000
X-UUID: 36780b5e012411ee83ed1395ce914268-20230602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=tkXvsKWiCiKvGwn/DYFIYckSfCXc3Ts7n72TyGWrQmc=;
	b=FPa4fei4T/U5nTPHvMgqemEhIBYngoZHYXOhI0j9rFBOBsSz+DT/Agz5odsETxpgpCuHF5k0FzJcwagJJpDda4hUjDWeeknEtUyiUCX+vex0gyDIqKaa8G2rt8/weZxRGuE7l3SM2Rw4NAKj7eAdX9LC7V3pTBV1in65y9frUY0=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:044a88ab-6128-4860-a5fd-3d0b2fb36a8f,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:d5b0ae3,CLOUDID:feb9d36d-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 36780b5e012411ee83ed1395ce914268-20230602
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <yong.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1977733645; Fri, 02 Jun 2023 02:02:33 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 2 Jun 2023 17:02:31 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 2 Jun 2023 17:02:30 +0800
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
	<chengci.xu@mediatek.com>
Subject: [PATCH v12 0/7] MT8188 IOMMU SUPPORT
Date: Fri, 2 Jun 2023 17:02:20 +0800
Message-ID: <20230602090227.7264-1-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230602_020244_392392_82DE79A2 
X-CRM114-Status: GOOD (  18.59  )
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
enable INFRA IOMMU in ATF considering security concerns.

We also adjust the flow of mtk_iommu_config to reduce indention.

Change in v12:
  - Change nothing. Just rebase on v6.4-rc4 and collect AngeloGioacchino's R-b.

change in v11:
  https://lore.kernel.org/linux-iommu/20230418083514.4379-1-yong.wu@mediatek.com/
  - Just add a new entry in MAINTAINERS from AngeloGioacchino.

change in v10:
  https://lore.kernel.org/linux-mediatek/20230417073606.25729-1-yong.wu@mediatek.com/
  - Add a Fixes tag for [2/7].
  - Rebase on mtk-iommu-dma-range-v7:
    https://lore.kernel.org/linux-mediatek/20230411093144.2690-1-yong.wu@mediatek.com/

change since v9:
  https://lore.kernel.org/linux-mediatek/20230317085541.20447-1-yong.wu@mediatek.com/
  - Move the patch about setting set_dma_mask out from this patchset.
  - Add a MAINTAINER patch since the header file was added a prefix "mediatek,"

change since v8:
    https://lore.kernel.org/linux-mediatek/20230307080555.14399-1-yong.wu@mediatek.com/
  - Base on v6.3-rc1 and mtk-iommu-dma-range-v5:
    https://lore.kernel.org/linux-mediatek/20230307023507.13306-1-yong.wu@mediatek.com/
  - Add a new patch set_dma_mask about since mt8188 support the PA of pgtable 35bits.

changes since v7:
    https://lore.kernel.org/linux-mediatek/20230216053322.11596-1-yong.wu@mediatek.com/
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
  iommu/mediatek: Add enable IOMMU SMC command for INFRA masters
  iommu/mediatek: Add MT8188 IOMMU Support

Yong Wu (2):
  iommu/mediatek: mt8188: Add iova_region_larb_msk
  MAINTAINERS: iommu/mediatek: Update the header file name

 .../bindings/iommu/mediatek,iommu.yaml        |  12 +-
 MAINTAINERS                                   |   1 +
 drivers/iommu/mtk_iommu.c                     | 151 ++++--
 .../memory/mediatek,mt8188-memory-port.h      | 489 ++++++++++++++++++
 include/soc/mediatek/smi.h                    |   1 +
 5 files changed, 622 insertions(+), 32 deletions(-)
 create mode 100644 include/dt-bindings/memory/mediatek,mt8188-memory-port.h

-- 
2.18.0



