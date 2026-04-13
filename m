Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BDD6EBFD0A
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2026 07:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=we87XqmmyOUTzDF+stAxamWC1PGZ1tSA3Wr3kTUnazg=; b=36ss4q8chm6RLyuS7dbZBwuZFC
	f4Py+lHakAYt15QPCE7lXn7fvc/MFqMq/zxObNgYoe+8OEyXZw3ZhDUzaQ4J3xZ+pm4D52bRhSmVx
	YHdLLoJR/UsbcD9oaNQasakFCUaTyvBXslXrzIVZi+aykgy8xlUkLpde3Nhly7GQLbHGLoT3Zwtgl
	4Ou9xBr++O3YW+S8f3PQ/ibnndr9zwRgIV4QinslAUj5OvgXuCx2vkAeNyZdP4J34OtiTyieKGSH7
	PYFTtW3QnrHiWuDeLGQwLLvTa2koXwIbfpyM+CCLV+kmM5BJbTHW1hgHjA191JbVOK/cAJYB8nIQG
	DB0N0QCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBV5-0000000F7QJ-423m;
	Mon, 13 Apr 2026 07:14:28 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBUx-0000000F7ON-02jM
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Apr 2026 07:14:25 +0000
X-UUID: 5eed6bca370811f1a6de359d7043e138-20260413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=we87XqmmyOUTzDF+stAxamWC1PGZ1tSA3Wr3kTUnazg=;
	b=cx3+SzkQLq9Vcl74SFReYnSJwFdftXWqA7UCK+lRedFBROkEfCz0++R3dZDlzfODKL1XehlgOjQ4ot4aafjKVxQopE/iGdFauKLPT8vHpoPQ0QSy18TOuxLgqcUCcLWT50K/6mh9PRi+jPoS1SZ1uLP9IbEzyt2Fhbvpq/V7jqM=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:5030acdc-29ae-43a5-80eb-be4c248863d0,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:e7bac3a,CLOUDID:c6fdcad5-060f-4ecc-9ee0-121eeeb4a682,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 5eed6bca370811f1a6de359d7043e138-20260413
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jian.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1046081573; Mon, 13 Apr 2026 00:14:11 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 13 Apr 2026 15:14:09 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 13 Apr 2026 15:14:08 +0800
From: Jian Yang <jian.yang@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Ryder Lee
	<ryder.lee@mediatek.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>, Manivannan
 Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, Bjorn Helgaas
	<bhelgaas@google.com>
CC: <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<jian.yang@mediatek.com>, <chuanjia.liu@mediatek.com>,
	<yonglong.wu@mediatek.com>
Subject: [PATCH 1/2] PCI: mediatek-gen3: Fix PERST# control timing during system startup
Date: Mon, 13 Apr 2026 15:13:55 +0800
Message-ID: <20260413071401.1151-2-jian.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260413071401.1151-1-jian.yang@mediatek.com>
References: <20260413071401.1151-1-jian.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_001421_196360_31310F22 
X-CRM114-Status: GOOD (  13.13  )
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

Some of MediaTek's chip will stop generating REFCLK if the
PCIE_PHY_RSTB signal of PCIe controller is asserted.

We have to adjust the control timing as follows to ensure that PERST#
will be de-asserted after the REFCLK is stable:
Assert all reset signals -> delay 10ms -> De-assert all reset signals
except PERST# -> delay 100ms -> De-assert PERST#

Signed-off-by: Jian Yang <jian.yang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 25 ++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b0accd828589..58ba1aa35a22 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -62,6 +62,11 @@
 #define PCIE_PHY_RSTB			BIT(1)
 #define PCIE_BRG_RSTB			BIT(2)
 #define PCIE_PE_RSTB			BIT(3)
+/*
+ * Described in the datasheet of MediaTek PCIe Gen3 controller.
+ * After set PCIE_BRG_RSTB, wait 10ms before accessing PCIe internal registers.
+ */
+#define PCIE_BRG_RST_RDY_MS		10
 
 #define PCIE_LTSSM_STATUS_REG		0x150
 #define PCIE_LTSSM_STATE_MASK		GENMASK(28, 24)
@@ -430,6 +435,21 @@ static int mtk_pcie_devices_power_up(struct mtk_gen3_pcie *pcie)
 		return err;
 	}
 
+	/*
+	 * Some of MediaTek's chips won't output REFCLK when PCIE_PHY_RSTB is
+	 * asserted, we have to de-assert MAC & PHY & BRG reset signals first
+	 * to allow the REFCLK to be stable. While PCIE_BRG_RSTB is asserted,
+	 * there is a short period during which the PCIe internal register
+	 * cannot be accessed, so we need to wait 10ms here.
+	 */
+	msleep(PCIE_BRG_RST_RDY_MS);
+
+	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
+		/* De-assert MAC, PHY and BRG reset signals */
+		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB);
+		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	}
+
 	/*
 	 * Described in PCIe CEM specification revision 6.0.
 	 *
@@ -439,9 +459,8 @@ static int mtk_pcie_devices_power_up(struct mtk_gen3_pcie *pcie)
 	msleep(PCIE_T_PVPERL_MS);
 
 	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
-		/* De-assert reset signals */
-		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
-			 PCIE_PE_RSTB);
+		/* De-assert PERST# signal */
+		val &= ~PCIE_PE_RSTB;
 		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
 	}
 
-- 
2.45.2


