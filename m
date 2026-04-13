Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E91FEBFD08
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2026 07:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfFRo0UHQusuMDmGKevH0yFYeubiKUgkDDCMUWqjD1Y=; b=EJx7QLHfVQK9gJ3zKg2TH1l5Zw
	oH9emv/2VY7Wj0paOGWQE12GUsiGbczad9sbdr/P1/O5uOb5gANL7a7wz9fNRQUK0IGNn/4PFmXzM
	IcXXx+8/ECWS0E6e8le3uCoLwXs8P/U3WT2urwqoiZ92wFdB3jmcJlzQ/vKIFk4zvQwNASdW9ZgZF
	+FkQahGSfbX7caxyg4/Ve72UeGs9Sdv3MXy3kQa/6OkAKJfpNCfJMXpI8rTMoTfoWi27EHjHD4hdf
	GxqKFV8dUThQS6YVpZjsIa+lDH0NyZ05XaSUekt5ISvQq8YWWR8aICkKkydUHWAUDkZwsMqk2W/H6
	rxUAxywg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBV7-0000000F7R7-2BKS;
	Mon, 13 Apr 2026 07:14:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBUx-0000000F7OL-02db
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Apr 2026 07:14:27 +0000
X-UUID: 6003bd16370811f1a6de359d7043e138-20260413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xfFRo0UHQusuMDmGKevH0yFYeubiKUgkDDCMUWqjD1Y=;
	b=bINiSEyWMudMogYpEeJHY9RajiFIFstwyJMpLFkiDDBafhPJ8jpXAjnTr6MMicU/oXl3yAnkLmtRmmV8DCwLVyqIiJzCSL9ZnQ/ny7wu5yycwMaybldajO0j8sGWeUb68vlT+GNiCZ1PnzEFOhuwT9HJnPVzCksf1P8r3khA7+o=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:b41f1963-fafe-4b28-9d95-de0e9ba9ab60,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:e7bac3a,CLOUDID:91d5cb24-cb5c-4236-a89a-9a7fb20c9bc4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|836|865|888|898,TC:-5,Cont
	ent:0|15|50,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0
	,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6003bd16370811f1a6de359d7043e138-20260413
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <jian.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2054130728; Mon, 13 Apr 2026 00:14:13 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 13 Apr 2026 15:14:10 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 13 Apr 2026 15:14:10 +0800
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
Subject: [PATCH 2/2] PCI: mediatek-gen3: Add a shutdown callback to cotnrol PERST# signal
Date: Mon, 13 Apr 2026 15:13:56 +0800
Message-ID: <20260413071401.1151-3-jian.yang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20260413071401.1151-1-jian.yang@mediatek.com>
References: <20260413071401.1151-1-jian.yang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_001421_201847_92B67B57 
X-CRM114-Status: GOOD (  11.56  )
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

Add a shutdown callback to control the timing of PERST# and power
during system shutdown, ensuring that the PERST#, as required by the
PCIe CEM specification, is active before the power on connector is
removed.

Signed-off-by: Jian Yang <jian.yang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 58ba1aa35a22..4915979968b9 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1285,6 +1285,14 @@ static void mtk_pcie_remove(struct platform_device *pdev)
 	mtk_pcie_irq_teardown(pcie);
 }
 
+static void mtk_pcie_shutdown(struct platform_device *pdev)
+{
+	struct mtk_gen3_pcie *pcie = platform_get_drvdata(pdev);
+
+	mtk_pcie_devices_power_down(pcie);
+	mtk_pcie_power_down(pcie);
+}
+
 static void mtk_pcie_irq_save(struct mtk_gen3_pcie *pcie)
 {
 	int i;
@@ -1423,6 +1431,7 @@ MODULE_DEVICE_TABLE(of, mtk_pcie_of_match);
 static struct platform_driver mtk_pcie_driver = {
 	.probe = mtk_pcie_probe,
 	.remove = mtk_pcie_remove,
+	.shutdown = mtk_pcie_shutdown,
 	.driver = {
 		.name = "mtk-pcie-gen3",
 		.of_match_table = mtk_pcie_of_match,
-- 
2.45.2


