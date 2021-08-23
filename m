Return-Path: <SRS0=it3p=NO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39185C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 03:29:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 06D136135D
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Aug 2021 03:29:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 06D136135D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pVSTIjBjjcOyBPSoY8Ls/+RlHG0ALwONQ2kGNgutTxg=; b=Sq0cPmjTvrbOn+
	op3riRpPErSpWNoLy0tbHpkinQSKMrMoaEdyNo0+dwU+XPqKTXWrzOkYwopghz8sa8eLxG+/fVNQI
	8gMGmNY1qoXmuMltdVLlRnKUDk5ttXqpBChFsjpoOWJst3tpgvc0FoFs3rtzAkFIYmM9VkFwJjsVl
	w7cxjpg4QqQ4QVBc7n8tkXRQL2nEd1SKJ494xhQwhS+7IyYHgqwjjv/g8nq9XE51G12ej1rZwEk/F
	nddKb1QNcrORwNH1Wb6OLQEaUNngDV2REAeSQ521P9nL+TMrfOm21SljFj4aZTU+h2xdu3wx9SfOE
	uv0VW78b2h9bUo3A+8Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mI0dz-00FIHt-5L; Mon, 23 Aug 2021 03:29:03 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mI0dj-00FIB1-5j; Mon, 23 Aug 2021 03:28:50 +0000
X-UUID: cb87234e40e245d6a57609a16e1b4560-20210822
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=oyE+hTN7cE8CkN1WIouuznRUtuG/vUaYC9+refbxTjk=; 
 b=KZTiIJZhTtVRqkn62bBuuKwA7XO5Fn0p09/HLOon4O5ybgePrjBJhA8r11gldvdFewctuLRACQ7DCBj0cFNmy3cYZ8zWcT9sxIyxOyK6m97CxbxLwYkSan0or6SQRGFIlI3Uwoh64o3+H78wCOw7kbwuYX8+p8e/9ytL+YDHQuw=;
X-UUID: cb87234e40e245d6a57609a16e1b4560-20210822
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2125348780; Sun, 22 Aug 2021 20:28:45 -0700
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 22 Aug 2021 20:28:44 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 23 Aug 2021 11:28:43 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 23 Aug 2021 11:28:41 +0800
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: <robh+dt@kernel.org>, <bhelgaas@google.com>, <matthias.bgg@gmail.com>,
 <lorenzo.pieralisi@arm.com>
CC: <ryder.lee@mediatek.com>, <jianjun.wang@mediatek.com>,
 <yong.wu@mediatek.com>, <chuanjia.liu@mediatek.com>,
 <linux-pci@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH v12 3/6] PCI: mediatek: Add new method to get irq number
Date: Mon, 23 Aug 2021 11:27:57 +0800
Message-ID: <20210823032800.1660-4-chuanjia.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210823032800.1660-1-chuanjia.liu@mediatek.com>
References: <20210823032800.1660-1-chuanjia.liu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210822_202847_279449_78653DFE 
X-CRM114-Status: GOOD (  10.99  )
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

Use platform_get_irq_byname() to get the irq number
if the property of "interrupt-names" is defined.

Signed-off-by: Chuanjia Liu <chuanjia.liu@mediatek.com>
Acked-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 4296d9e04240..19e35ac62d43 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -654,7 +654,11 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
 		return err;
 	}
 
-	port->irq = platform_get_irq(pdev, port->slot);
+	if (of_find_property(dev->of_node, "interrupt-names", NULL))
+		port->irq = platform_get_irq_byname(pdev, "pcie_irq");
+	else
+		port->irq = platform_get_irq(pdev, port->slot);
+
 	if (port->irq < 0)
 		return port->irq;
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
