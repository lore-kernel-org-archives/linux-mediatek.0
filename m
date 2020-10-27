Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53F11C55178
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 16:59:31 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C55D5218AC
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 16:59:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="EoshUazH";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="Ek2xQfyI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C55D5218AC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TkK0fSYshwwQ3jOs65kR3HjYHyxNh/485579kGpitHE=; b=EoshUazHaJYK3kSmnnuYsnLgyF
	xedoMQ7Hlwy1T2S3TFyABcQrzGkit9ligBG+zRz2rAtiGuhSY5wjQ9Cr5g/Uh1l25fzSfLTRMYksy
	65ieHHZdJuxVWY/Ncga3GfRwBbQi9x+BsP+R+6LOm+DJVQF671bynbheCMZ19F91l6mWEc1H2VswK
	Il7+EyIpHJY+Qq+ZhcycdlcwyMEjHel5tbqNxMX33GkkWE7mApjOSFkDjhhNonJvpOjkeTlD6wZIq
	oTZVHVENbAVCtgO+Sk940dY5T3+CHaS6Xsbp2rg8t3I0BHUTAGEk1+mC6sBxjSjRy0psuKEpypliX
	oZt4YP+g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXSJf-0007W5-Ff; Tue, 27 Oct 2020 16:59:23 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXSJc-0007Ul-Po
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 16:59:21 +0000
X-UUID: 9e34d77255154d4cb66476097963c152-20201027
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=U7XynagizbrPxo62KttFyy3xZCzKkCXP4tL+OC/Qsws=; 
 b=Ek2xQfyIvToGseY3hpGI/8KnHgft/TNuH6igIHjlW/fvQWUKjFiKmdMuuDlynRVfYjuPbV2wZG0CtgyLi3Zwm8aiQG1ht2WaG9KLV82tBqFByaKLwjdjl/cyYPN7S2gAFCdtgtZi+chSmdKH/ljYBNDReqPMh6+8OUv2JDUxSgE=;
X-UUID: 9e34d77255154d4cb66476097963c152-20201027
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1703851362; Tue, 27 Oct 2020 08:52:06 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 27 Oct 2020 09:52:05 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 28 Oct 2020 00:51:49 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 28 Oct 2020 00:51:49 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH] pci: mediatek: fix wrong operator used
Date: Wed, 28 Oct 2020 00:51:48 +0800
Message-ID: <2418edb8c8c81bc646ce9c508939dc27e848dcd7.1603817008.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: BA7EE0B2AC46DCA966E61E9FE1D7ED14540C86DBFE74E0B1D2CF6F77BF31C2952000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_125921_067202_79FF2E5D 
X-CRM114-Status: GOOD (  12.39  )
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

Fix the issue reported by Coverity:
Wrong operator used (CONSTANT_EXPRESSION_RESULT) operator_confusion:
(port->slot << 3) & 7 is always 0 regardless of the values of its operands.
This occurs as an initializer.

Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
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
