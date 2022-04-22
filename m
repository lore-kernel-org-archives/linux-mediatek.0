Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 539E1C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 07:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5rFs9OXRx+fBDVmQIVDSUW2CPjN1hXKM127VHT0q9/c=; b=PmglcV6TOkPRr3
	aYzrG+qR0sxgJSCh+4/b8EqcVglIIuAAcRG2FMeW8ReuPdB8JSXi5LQWmKYQkP70saW7wOnZbWwdU
	LgCd3kslrnkW5fujis9OwHPcXI4h9bZJhNXDJuwkkO9JQnCQSF8gn9I906VyKOlhdBLixIb5Vyhk4
	7gA5CManxO+k9TlN65QdlcMERmh/cZrAF0tS9DZSvZUFhBc1AE5W52vgFoeJbzXZH8CldOpJwFP7e
	4KFwwqdYIXDtYHa5po04yEYEjoELxrA08GHcFUQx7kXMuCSW7mxOuC5b5KQnt9tVBtizEyLqpi7kr
	Cp5mkz3wmuciNhlByfmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhnQB-00GizX-KW; Fri, 22 Apr 2022 07:09:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhnPz-00Giwk-Vw; Fri, 22 Apr 2022 07:09:29 +0000
X-UUID: f00e3900bf9649eda80d0d33c570286c-20220422
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:08e93615-b1a9-4723-8a17-d76cfe6862ec, OB:0,
 LO
 B:0,IP:0,URL:8,TC:0,Content:-20,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:-12
X-CID-META: VersionHash:faefae9, CLOUDID:1bb3bfef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: f00e3900bf9649eda80d0d33c570286c-20220422
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1798930383; Fri, 22 Apr 2022 00:09:22 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 22 Apr 2022 00:09:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 15:09:12 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 15:09:10 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, Rob Herring
 <robh@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang
 <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 <linux-pci@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2] PCI: mediatek-gen3: Update entries to distinguish MediaTek
 PCIe controller
Date: Fri, 22 Apr 2022 15:09:08 +0800
Message-ID: <20220422070908.14043-1-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_000928_058805_FB7F2636 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Update driver entries in pcie-mediatek-gen3.c to distinguish the
MediaTek PCIe controllers.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
Changes in v2:
Remove the changes in Kconfig description and update the commit message.
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 7705d61fba4c..6745076a02b9 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1011,21 +1011,21 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
 				      mtk_pcie_resume_noirq)
 };
 
-static const struct of_device_id mtk_pcie_of_match[] = {
+static const struct of_device_id mtk_pcie_gen3_of_match[] = {
 	{ .compatible = "mediatek,mt8192-pcie" },
 	{},
 };
-MODULE_DEVICE_TABLE(of, mtk_pcie_of_match);
+MODULE_DEVICE_TABLE(of, mtk_pcie_gen3_of_match);
 
-static struct platform_driver mtk_pcie_driver = {
+static struct platform_driver mtk_pcie_driver_gen3 = {
 	.probe = mtk_pcie_probe,
 	.remove = mtk_pcie_remove,
 	.driver = {
-		.name = "mtk-pcie",
-		.of_match_table = mtk_pcie_of_match,
+		.name = "mtk-pcie-gen3",
+		.of_match_table = mtk_pcie_gen3_of_match,
 		.pm = &mtk_pcie_pm_ops,
 	},
 };
 
-module_platform_driver(mtk_pcie_driver);
+module_platform_driver(mtk_pcie_driver_gen3);
 MODULE_LICENSE("GPL v2");
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
