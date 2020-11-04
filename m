Return-Path: <SRS0=qi5H=EL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89560C00A89
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 03:40:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F2B6A2072E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Nov 2020 03:40:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="uzYMeyy5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="auybq3Gn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="tQblVnWx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F2B6A2072E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=in5W5uRsiLfKtCeLHlUABNan7nLi34yUvEbbgDqQbgw=; b=uzYMeyy5W4Erk58KnO2Xec2s+W
	AYbF5nlGNptkzwzLNZo4HCPcFaH54m0ProB4juI1qzjbodjMt6NmXyWevzco1+VTV9TE5Dg3oEeLV
	/hvgETpQPjCidg+q43NEfWq5kDH9QYUm8X+b8gOWVNXiPvi6SO9xg+uQk2GhYemnMzr0sZFRQDyXJ
	MFScH297URNY6l7RvWR8VdnET6ds+c/VuFRZahOWBY8/amuWS65LfDpLM+EUYYTlv/LvRok5Nff2A
	BkDbeX3gSYpzOTk9VxcyHZXXWYl8fISAZ/m+MATzIzH1jMIcYRZtTjR4/OU/UJwrZUfns7u8WlDyz
	NGLa8npA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaW8V-0002fr-6J; Thu, 05 Nov 2020 03:40:31 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaW8R-0002bw-R5
 for linux-mediatek@merlin.infradead.org; Thu, 05 Nov 2020 03:40:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
 MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=wUuoNNfKE+1eTR8n4GLbokBW3m4NSs3Rt+4Y39MdhxM=; b=auybq3Gn6GC/JqrEvzgivQcC3O
 D+S7qE54QZr9M0ZruSeuXBaF2XuVALdmbfdj5BhWPqe0+FUx91Mj9AlkZZPobOXtTM6KOF9FYD5Nb
 Omq8C4VRdVa2g7tEW461EPcVVvzBnW9Cr9fMNWxAa4KjKiQDBh7Q/AB5TN+tf+8fvWAtu5d9szTNc
 6dLl8Xb5Xd8hqKoLvn4gsxtXEvgkyY3esw/sl1iBieXL8AcDsRNThyCvO5wz4cGOkhHzJnIKxJjDJ
 PeEfK9EekHx78xuLTypSDrYVQp0nSmbLm8NIJWbWFEes/jrrSALOlk4dRdNUkAv4B+WuEckmzG3Zu
 AUDFHSKQ==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaPs1-0007dV-DJ
 for linux-mediatek@lists.infradead.org; Wed, 04 Nov 2020 20:59:09 +0000
X-UUID: df780a7234c34a7d90bb69ccd9ed3ea6-20201104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=wUuoNNfKE+1eTR8n4GLbokBW3m4NSs3Rt+4Y39MdhxM=; 
 b=tQblVnWx1Ht4vT4hd4tF1VTSqGQHoK3MiQZPcGbuMzscSv5BUnwHOqgvju8hsV5oSVI092r/fs4WrrlZxfD8uKZdpkl6/2dym0Bb6d/n2HaOcPR+78Qh3Qd0ToGH3VKzRZpjdkRrjOR5NlAalexsQSZPzNJl8TwbcShcBs7dJ5Y=;
X-UUID: df780a7234c34a7d90bb69ccd9ed3ea6-20201104
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 952617824; Wed, 04 Nov 2020 12:58:49 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 4 Nov 2020 12:58:47 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 5 Nov 2020 04:58:33 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 5 Nov 2020 04:58:33 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH v3] PCI: mediatek: Configure FC and FTS for functions other
 than 0
Date: Thu, 5 Nov 2020 04:58:33 +0800
Message-ID: <c529dbfc066f4bda9b87edbdbf771f207e69b84e.1604510053.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_205906_142240_82F2B09D 
X-CRM114-Status: GOOD (  11.24  )
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

PCI_FUNC(port->slot << 3)" is always 0, so previously
mtk_pcie_startup_port() only configured FC credits and FTs for
function 0.

Compute "func" correctly so we also configure functions other than
0. This affects MT2701 and MT7623.

Addresses-Coverity-ID: 1437218 ("Wrong operator used")
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
v2 & v3 - update commit log
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
