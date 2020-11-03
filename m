Return-Path: <SRS0=lxeM=EJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6625C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 23:17:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 35AF9223BD
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2020 23:17:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="unDp30ud";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="j9D8usM8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 35AF9223BD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yyiYZ6VMoyN7odk6cs0ftvcEdg/+FOP+yITx784ChOw=; b=unDp30udJyu9nE/SkjCRpdVu9x
	g8oy3H8AyUC3Au1gzXskcT60RB84HR3Q6mqVplOfvJu92b2Xl+dz+DJkNa2PPS8h2YnBc9fx6TxNF
	Fe7GzZPEd9TdBU+1FzvZQaeM8/Hj1UiczktI1XcKVG36V8ctR/rFBsMkMMXu+J+HGeD+pAqFpWbsj
	pQljhyj9hSCxS49o1I1uRchTGTyXmKQ6lIasjnQWDge0YRIvYMoZCkPy2vXNe58nDmXgvUNFVga7G
	xkynAJu4d59wrdAlgGaBa7WrQkfD/Vx1eHC/F4eAao/f6pmHJXOAzwTe68zkfsGwPFMqfS+gPdaQ6
	UK4PIFxw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ka5Yb-0001Jv-8u; Tue, 03 Nov 2020 23:17:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ka5YX-0001J8-My
 for linux-mediatek@lists.infradead.org; Tue, 03 Nov 2020 23:17:40 +0000
X-UUID: d17ce57181ca40a194b803572371e9d9-20201103
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=YSxMnqGbz4l5hYXgU6bg34RyZNddCK+MyndOJMEH3FI=; 
 b=j9D8usM87MVv74adC6bRfRi2fiCfc99qbRiF9vI3AB2KHv88RRWZsWaj6nHykOMv9YymU5C+/vUKebd8jpTDKScWT9mesGOXhaBiTDWOud1sWlnRbiJUNsA9XnxGVqlVExwYJkbifY8cRkO6hVJ1UxgTcXk1ogb9LE96G1jq2zQ=;
X-UUID: d17ce57181ca40a194b803572371e9d9-20201103
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1300421536; Tue, 03 Nov 2020 15:17:28 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 3 Nov 2020 15:10:27 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Nov 2020 07:10:13 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 4 Nov 2020 07:10:13 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v2] PCI: mediatek: Fix wrong operator used
Date: Wed, 4 Nov 2020 07:10:11 +0800
Message-ID: <21f722bb80c440b69dd350b48f86cd7d076a8adf.1604443256.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201103_181738_526338_AE620B9B 
X-CRM114-Status: GOOD (  12.30  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-pci@vger.kernel.org, Ryder
 Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SoCs like MT2701 and MT7623 use mtk_pcie_startup_port() to compute "func",
but from the code, the result we get is incorrect.

	#define PCI_FUNC(devfn)         ((devfn) & 0x07)

	func = PCI_FUNC(port->slot << 3)

The "func" is always 0, which results in other functions may not have been
configured correctly. (i.e. FC credits and FTS)

Addresses-Coverity-ID: 1437218 ("Wrong operator used")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
V2 - revise commit log
---
 drivers/pci/controller/pcie-mediatek.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index cf4c18f0c25a..1980b01cee35 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -760,7 +760,7 @@ static struct pci_ops mtk_pcie_ops = {
 static int mtk_pcie_startup_port(struct mtk_pcie_port *port)
 {
 	struct mtk_pcie *pcie = port->pcie;
-	u32 func = PCI_FUNC(port->slot << 3);
+	u32 func = PCI_FUNC(port->slot);
 	u32 slot = PCI_SLOT(port->slot << 3);
 	u32 val;
 	int err;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
