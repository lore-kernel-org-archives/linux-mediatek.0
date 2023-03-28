Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59B3C761A6
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 02:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wa16E7v4/oxQJBuGCKVIakPyTMFOlhEx6cQrvF1xl1I=; b=yZrEqpwZEVsdmGEk9Zrdn+6CtZ
	mRO+JxksCf6NMkIw+KK0icaS9QDveVfHxpt3+KbHO8lolRT35PaC74CE83+hHyyffqo1aEpgpZkjd
	SAYiyR2m6X43j58RCudKUGrCvyhSlIaX7DntYioax3unsHC1GJ9njvW1f0lhOOLV4zgFSVFtms0ET
	ESz2G9BcAAxjocmw9p2G0NgGiFJQjYfKT7ktXpaJdB6ju9ewxT0i9QBUs707hgr09LbtQUE+VC4uA
	yD2tlsMJFsBN4WM5AdDYQEg6WX2vXwh6urAJnKnnNL1LYZOfkgw4hSLPIVqkepbXI274HbfHCqTRZ
	OHTBOKhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgz4D-00Ct65-1Z;
	Tue, 28 Mar 2023 02:28:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgz4A-00Ct4s-1c;
	Tue, 28 Mar 2023 02:28:07 +0000
X-UUID: 27efb80ecd1011ed8687db9d93187ff1-20230327
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Wa16E7v4/oxQJBuGCKVIakPyTMFOlhEx6cQrvF1xl1I=;
	b=i/6QvYGJ/nwbtf7tAIyDKkKd03T34WtGDZAp45cBrDgzzKAxoLF4T7cLajz13aq8uD+Sux39f+lhJzQtyqZFoem9gXP6qZsPBhDtI/+6N0aBjzEHuK08VRt0c5VlTZqyzxaWVnw4My0RIJu3YzGsEcm4Nq9IYfhTXfhV4zQP+VQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22,REQID:3a814a39-0bc5-4c9f-bc9d-ee4b5f82f7b0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:120426c,CLOUDID:339b1bf7-ddba-41c3-91d9-10eeade8eac7,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 27efb80ecd1011ed8687db9d93187ff1-20230327
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <tinghan.shen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1687486028; Mon, 27 Mar 2023 19:27:59 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.25; Tue, 28 Mar 2023 10:27:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.25 via Frontend Transport; Tue, 28 Mar 2023 10:27:56 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Bjorn Andersson <andersson@kernel.org>, Mathieu Poirier
	<mathieu.poirier@linaro.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Tinghan Shen
	<tinghan.shen@mediatek.com>
CC: <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v9 08/11] remoteproc: mediatek: Setup MT8195 SCP core 1 SRAM offset
Date: Tue, 28 Mar 2023 10:27:30 +0800
Message-ID: <20230328022733.29910-9-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230328022733.29910-1-tinghan.shen@mediatek.com>
References: <20230328022733.29910-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_192806_542077_1E86FD18 
X-CRM114-Status: GOOD (  17.45  )
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

Because MT8195 SCP core 0 and core 1 both boot from head of SRAM and
have the same viewpoint of SRAM, SCP has a "core 1 SRAM offset"
configuration to control the access destination of SCP core 1 to boot
core 1 from different SRAM location.

The "core 1 SRAM offset" configuration is composed by a range
and an offset. It works like a simple memory mapped mechanism.
When SCP core 1 accesses a SRAM address located in the range,
the SCP bus adds the configured offset to the address to
shift the physical destination address on SCP SRAM. This shifting is
transparent to the software running on SCP core 1.

Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/remoteproc/mtk_common.h |  7 +++++++
 drivers/remoteproc/mtk_scp.c    | 27 +++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/drivers/remoteproc/mtk_common.h b/drivers/remoteproc/mtk_common.h
index f1a021ad7f66..6861543a0825 100644
--- a/drivers/remoteproc/mtk_common.h
+++ b/drivers/remoteproc/mtk_common.h
@@ -65,6 +65,13 @@
 #define MT8195_CORE1_MEM_ATT_PREDEF		0x20008
 #define MT8195_CORE1_WDT_CFG			0x20034
 
+#define MT8195_SEC_CTRL				0x85000
+#define MT8195_CORE_OFFSET_ENABLE_D		BIT(13)
+#define MT8195_CORE_OFFSET_ENABLE_I		BIT(12)
+#define MT8195_L2TCM_OFFSET_RANGE_0_LOW		0x850b0
+#define MT8195_L2TCM_OFFSET_RANGE_0_HIGH	0x850b4
+#define MT8195_L2TCM_OFFSET			0x850d0
+
 #define SCP_FW_VER_LEN			32
 #define SCP_SHARE_BUFFER_SIZE		288
 
diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index ba931d550c1e..f74ee80838e9 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -486,6 +486,9 @@ static int mt8195_scp_before_load(struct mtk_scp *scp)
 
 static int mt8195_scp_c1_before_load(struct mtk_scp *scp)
 {
+	u32 sec_ctrl;
+	struct mtk_scp *scp_c0;
+
 	scp_sram_power_on(scp->reg_base + MT8195_CPU1_SRAM_PD, 0);
 
 	/* hold SCP in reset while loading FW. */
@@ -494,6 +497,30 @@ static int mt8195_scp_c1_before_load(struct mtk_scp *scp)
 	/* enable MPU for all memory regions */
 	writel(0xff, scp->reg_base + MT8195_CORE1_MEM_ATT_PREDEF);
 
+	/*
+	 * The L2TCM_OFFSET_RANGE and L2TCM_OFFSET shift the destination address
+	 * on SRAM when SCP core 1 accesses SRAM.
+	 *
+	 * This configuration solves booting the SCP core 0 and core 1 from
+	 * different SRAM address because core 0 and core 1 both boot from
+	 * the head of SRAM by default. this must be configured before boot SCP core 1.
+	 *
+	 * The value of L2TCM_OFFSET_RANGE is from the viewpoint of SCP core 1.
+	 * When SCP core 1 issues address within the range (L2TCM_OFFSET_RANGE),
+	 * the address will be added with a fixed offset (L2TCM_OFFSET) on the bus.
+	 * The shift action is tranparent to software.
+	 */
+	writel(0, scp->reg_base + MT8195_L2TCM_OFFSET_RANGE_0_LOW);
+	writel(scp->sram_size, scp->reg_base + MT8195_L2TCM_OFFSET_RANGE_0_HIGH);
+
+	scp_c0 = list_first_entry(scp->cluster, struct mtk_scp, elem);
+	writel(scp->sram_phys - scp_c0->sram_phys, scp->reg_base + MT8195_L2TCM_OFFSET);
+
+	/* enable SRAM offset when fetching instruction and data */
+	sec_ctrl = readl(scp->reg_base + MT8195_SEC_CTRL);
+	sec_ctrl |= MT8195_CORE_OFFSET_ENABLE_I | MT8195_CORE_OFFSET_ENABLE_D;
+	writel(sec_ctrl, scp->reg_base + MT8195_SEC_CTRL);
+
 	return 0;
 }
 
-- 
2.18.0


