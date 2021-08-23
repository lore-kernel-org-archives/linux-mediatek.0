Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FBFEC4320E
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 03:29:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24C556135D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 03:29:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24C556135D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WrzfSvXJr6Fd/2ZFdwf+ezBgM1kfwvJtyXczNO0wxpg=; b=adZStObECVIjxV
	0arHBigvvLwda9uAFx4NvORyWpwz++vMGj2JqVFap1tkufLujVlFoGrpPQ//EWdz6+1RBWt3Hu/rR
	xx6OZFMubtS6xe+xbtFOQsZ0zEmjpoAUQTE9h7VbXR8JxaDyYia21I1GbbRIEqQFrjje7wDNboc25
	+i9/Dxf4mkANHu6RBFxrh/RIt13q9KeuVNV5xf123068v2G3fV+kCjRKiX++EkUNvALmsGK6gVaii
	Sw5yCLiucs5V6h0ppcomKLsW8xTs92teTUD/oXBWJ4dn1Hu0P2D4PcCqMhQTkkbN7cb4Ez3uWVJtd
	qH1gdol3cflpdJDR/Uzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI0eG-00FIR1-DX; Mon, 23 Aug 2021 03:29:20 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI0e5-00FIL0-6f; Mon, 23 Aug 2021 03:29:13 +0000
X-UUID: 53225777be0d4952a7ed31926e44a46a-20210822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=hdIYNrF4E6oXz1YttdswZbrFM509Y6B0Orpv/IkT+gg=; 
 b=Ga1kWjcyJ6UgshysKjJgHwMaj4VnColrWHuQkc2AXK1Kl33Oy1rRrjqT8QLSsHj+DciJWVrX+IUSlFB3rJljpoHZ+EwMwGjhKmfyGoCNI/8MfAgP8snrjP06p8Ja/HE9EICfxG2OasG54Y1lkygoLMvZ+OFbWzqVmytCV4T3t8E=;
X-UUID: 53225777be0d4952a7ed31926e44a46a-20210822
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 442125678; Sun, 22 Aug 2021 20:29:06 -0700
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 Aug 2021 20:29:04 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 11:28:56 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Aug 2021 11:28:55 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <robh+dt@kernel.org>, <bhelgaas@google.com>, <matthias.bgg@gmail.com>,
 <lorenzo.pieralisi@arm.com>
CC: <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <yong.wu@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 4/6] PCI: mediatek: Get pci domain and decide how to parse
 node
Date: Mon, 23 Aug 2021 11:27:58 +0800
Message-ID: <20210823032800.1660-5-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210823032800.1660-1-chuanjia.liu@mediatek.com>
References: <20210823032800.1660-1-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_202909_283681_14608CF7 
X-CRM114-Status: GOOD (  13.87  )
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

Use of_get_pci_domain_nr() to get the pci domain.
If the property of "linux,pci-domain" is defined in node,
we assume that the PCIe bridge is an individual bridge,
hence that we only need to parse one port.

Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek.c | 29 +++++++++++++++-----------
 1 file changed, 17 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 19e35ac62d43..928e0983a900 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -1048,22 +1048,27 @@ static int mtk_pcie_setup(struct mtk_pcie *pcie)
 	struct device *dev = pcie->dev;
 	struct device_node *node = dev->of_node, *child;
 	struct mtk_pcie_port *port, *tmp;
-	int err;
+	int err, slot;
+
+	slot = of_get_pci_domain_nr(dev->of_node);
+	if (slot < 0) {
+		for_each_available_child_of_node(node, child) {
+			err = of_pci_get_devfn(child);
+			if (err < 0) {
+				dev_err(dev, "failed to get devfn: %d\n", err);
+				goto error_put_node;
+			}
 
-	for_each_available_child_of_node(node, child) {
-		int slot;
+			slot = PCI_SLOT(err);
 
-		err = of_pci_get_devfn(child);
-		if (err < 0) {
-			dev_err(dev, "failed to parse devfn: %d\n", err);
-			goto error_put_node;
+			err = mtk_pcie_parse_port(pcie, child, slot);
+			if (err)
+				goto error_put_node;
 		}
-
-		slot = PCI_SLOT(err);
-
-		err = mtk_pcie_parse_port(pcie, child, slot);
+	} else {
+		err = mtk_pcie_parse_port(pcie, node, slot);
 		if (err)
-			goto error_put_node;
+			return err;
 	}
 
 	err = mtk_pcie_subsys_powerup(pcie);
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
