Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3637BC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 Oct 2022 16:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2CjtYpLAgvV5iuDbNdLfUn1AAQ8FbgDIHOMDDF1b7zE=; b=TKJqi7YvwZSFbi
	ZgIiB/EQ0sO+6Daqhep+fMAnNZ8w3UVNbH3xfXUTF101/+UVWji28lOP4DOeBubOXq88NcsGtFJV1
	UOXxKGj+NHSF8ysLST9ZehZqPhGXgbqCfoop1KFOd7CZh1Zh4AFIO335lzpkBUEI+PTEp/k0QRjWd
	fUnrQxK7448+2zk1GA61boEkyXXgDuywQV1e0ty/B3eC22oQ5y2HGmrsreISkrk/wPGDTaHqeHKNj
	zhDIg6dsZ3l4D7WBxbbRfbjkP2ywLyl3V14n6trPZ1NJzWSEPNhExLBqZvvNBogBrfEpHY6CRPOdp
	8b1NWt2vIx27q6zMHDUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohCuN-00DkO1-6L; Sat, 08 Oct 2022 16:42:39 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohCuC-00DkKg-5Z; Sat, 08 Oct 2022 16:42:29 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout4.routing.net (Postfix) with ESMTP id 993EF100797;
	Sat,  8 Oct 2022 16:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1665247337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=2CjtYpLAgvV5iuDbNdLfUn1AAQ8FbgDIHOMDDF1b7zE=;
	b=mWuFCw00ayffrf1hbea3CVx35NNRaREswXMrhnbPSUxzlOYtzYvwQZNvNnlRim+wAGk1bt
	3qssCMDMIYCgTt8SDuL/1DnKdJb5If6UFY4ETLUCDHvGK2uC00qs3pWfOhpYs2SS8+6wza
	nFm+mtkL7IfgkZJhxnDuCWmvJ/CY/HY=
Received: from frank-G5.. (fttx-pool-217.61.149.60.bambit.de [217.61.149.60])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id 9C70B8037B;
	Sat,  8 Oct 2022 16:42:16 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] PCI: mediatek-gen3: change driver name to mtk-pcie-gen3
Date: Sat,  8 Oct 2022 18:42:11 +0200
Message-Id: <20221008164211.112944-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: ca58d61e-466f-4b8b-ab13-12b2dbd24a29
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221008_094228_820208_2914B036 
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
Cc: Rob Herring <robh@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Felix Fietkau <nbd@nbd.name>

This allows it to coexist with the other mtk pcie driver in the same
kernel.

Signed-off-by: Felix Fietkau <nbd@nbd.name>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 11cdb9b6f109..b8612ce5f4d0 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1071,7 +1071,7 @@ static struct platform_driver mtk_pcie_driver = {
 	.probe = mtk_pcie_probe,
 	.remove = mtk_pcie_remove,
 	.driver = {
-		.name = "mtk-pcie",
+		.name = "mtk-pcie-gen3",
 		.of_match_table = mtk_pcie_of_match,
 		.pm = &mtk_pcie_pm_ops,
 	},
-- 
2.34.1


