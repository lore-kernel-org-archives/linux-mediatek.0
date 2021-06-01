Return-Path: <SRS0=auVy=K3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D936C47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 02:54:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8BB960FF0
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 02:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8BB960FF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BmqzdJlHahY17hlL1A4q/zNfj9eh6Mu6O/GVgQWHfUQ=; b=FPOf2uV3rrlmxC
	CyypEklUz+hOjZTqKzCNrRl8bEupicQKSv7J6ifrBrloVeiNi6NKs9wfpfg91vemrXmNasQb45re5
	mpP8pWxEYzJZP8eTWdUpuvHzeuSUA5DGrTCJl5cHuk6JjYXy5yZP9xpW2sNaP9jCNgIRsBbjr9/8d
	ICnvFl9sQ6rLWNIuXHesBsVtiN/mj2J4TmfAZvqroUMYvm5FunJrJzO/8SfPm+hMA64dzbh8Iu2LB
	Yp9/TEADTsjxexpNAY8G4zUaL8i7tG86OD8x2QIj07gYT6cVASbNh2zhn1cA8AuRwo4U6gpKo8JJt
	BqlwwZVQOiOYanxpn1CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnuYJ-00EKKo-RZ; Tue, 01 Jun 2021 02:54:47 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnuXu-00EKG8-HG; Tue, 01 Jun 2021 02:54:23 +0000
X-UUID: 2ae3d4ee359d429b8d1650affe8fd6b1-20210531
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ayXGvOYGeP2nQSDZBW7aM7JHp/ZcmLc2UasUkkoWRh4=; 
 b=mUpOAzDao3gOM1Jv6IS+tkOUcRcxnnknTL7Sh4sBHWXICpYJtZ1LKdElTK86hlAwOsTPf1LOBy3aRb7JJBhFnGBdVY0tlqFIfiMcUA49JxVtuuY24BA0FgR5CCnhnoxsxUIfLqU7FkCDJABVCYOF6eXz8dpkXoAiQa9ZSQWbQdg=;
X-UUID: 2ae3d4ee359d429b8d1650affe8fd6b1-20210531
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2121236088; Mon, 31 May 2021 19:54:19 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 31 May 2021 19:44:16 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 1 Jun 2021 10:44:15 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Jun 2021 10:44:14 +0800
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>
CC: Matthias Brugger <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Randy Wu <Randy.Wu@mediatek.com>,
 <youlin.pei@mediatek.com>
Subject: [PATCH 2/2] PCI: mediatek-gen3: Add controller support for MT8195
Date: Tue, 1 Jun 2021 10:44:08 +0800
Message-ID: <20210601024408.24485-3-jianjun.wang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210601024408.24485-1-jianjun.wang@mediatek.com>
References: <20210601024408.24485-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_195422_595462_C9EFDF6E 
X-CRM114-Status: GOOD (  11.52  )
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

MT8195 is an ARM platform SoC which has the same PCIe IP with MT8192.

Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 3c5b97716d40..c12e2450d0e1 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1010,6 +1010,7 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
 
 static const struct of_device_id mtk_pcie_of_match[] = {
 	{ .compatible = "mediatek,mt8192-pcie" },
+	{ .compatible = "mediatek,mt8195-pcie" },
 	{},
 };
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
