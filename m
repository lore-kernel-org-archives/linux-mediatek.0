Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 315A3C433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 17:34:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0B5B610CB
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 17:34:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C0B5B610CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cwSvehQ0XZCpuZkVs9TiS/OlaA/kaPuoV/a58qoPYPo=; b=h7KBVdHu80wron
	eYxIWJTfLtm6QWUGOkrGteWZpQff28faQWETuDGaFb2P2c1jtaaOqkRQXpBnFkdQlhWSwqlIWchjT
	MmdmTBnR6DweAjKNSBWNeN129GT/pLnTUThApAi2TJIka7S4W6E9RPuno7ofMoXDjiwJgM1BDPyJ6
	DAIxkue+tU1qY3NjV7ABybQcSLS4mMVRm51URNhlsBNmh2l1KIE8pQDWWAUtLIP2BjvdHvmzEF0eI
	ypN0YHk189ozIFWVDTMKkgVNfWU14ofbiCQHP547KviyX3VU+ol5JcMY5dXuQ0/hDOhRWHvTWtfBY
	pue9TivSCE9D8hDD7E0g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVHUb-003C4O-6B; Sat, 10 Apr 2021 17:33:57 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVHUP-003C3w-A6; Sat, 10 Apr 2021 17:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=mPRVe+dtqmO2CcciwnI9bQjdkM3bNfy3dPHUSjpkio0=; b=U0wRufceyEhTd4VE+0VWIBVYo8
 FhDlqnqiL6PlbXXNNhEI3n7B54WBc3xE9rhA1P4v0cm3Yx7ei3G8zgZUXioHTYCaOUhe6fn3EoB9r
 Q3lW5ptk6c53IlGuqfakBK713tkmUQ0e68avJdo3+LVO3bb0f892DEBTy5ikoW64PdMoiNMnbv3nX
 0HdxPbHm5DrqySRAwngjdqtRHCdPIST8ozH5HeRBh/zgpwCHe397Qvm6BqdEvUtSWNHWCEOwr25NA
 sBZdrNJqH7JGUcsEjES59Ws+6+pZ/ZpQAZwIZDrzFW6smxIuhYmT0XPTi7E5rhTJrp5deFTltr6Vc
 c29uD4Pg==;
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVHUM-005C58-Gg; Sat, 10 Apr 2021 17:33:43 +0000
Received: by mail-pl1-x631.google.com with SMTP id u7so2437295plr.6;
 Sat, 10 Apr 2021 10:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mPRVe+dtqmO2CcciwnI9bQjdkM3bNfy3dPHUSjpkio0=;
 b=Or6FpkmW6TxCMa3OmWBKZP6PbJ149nI6bqjqQtHrLPEsY1abnGi1Cxv3Nc7+KCT8nm
 39XT2KO082uMXtCnmBCTzUR8IMgPo6oxTnBpU3IrJn8mprANKiXByiX4d5KDKqcgCG6F
 MMVXUulMJCVdiSnJQi6SdLbQyJ8rIqACCnf7QNLM7glh1vQ56aqJAVNJiYVp3FcA6Cj7
 neJXQRylQ4IYwzwdaAvb3MSTDvQD6WLNdQBV+3PFdYvnPuBdWHnAkH3xpZt0u1SGCnSV
 2vEnwxQjjpQF/IOvKXylhWb3Lx40v7A29L9JkrLS5U30I/HyjPgCcaRGMYV5nLf+Uv03
 dLoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=mPRVe+dtqmO2CcciwnI9bQjdkM3bNfy3dPHUSjpkio0=;
 b=amb4Ie7wDAshghZfPrGqjEjBL1K9F9AnSKDq4aEKwJzn8SVJL1HZZYb9fA3dhFV0Oy
 A0XYRtO77QwGc8TQlXtf/+6VzSotwRq/rQMU12CLkypk44TpiEhZkXbvcX565r9M6ZE+
 7UcT9FOLgnWgWxEU5nrUJdZo/2gwIRuWD+lYuFpo1EqiNXDTXwSQyxMmtj6rnRMuPf8A
 TEWRxCI01eFaBs2IjBInwlBw94MzmZ4/0tQzpQSpBdq1rCmKy0gNrdrlw0tBBEXUo8ud
 WgGIhoPRCE/Xs4zxZg/i5By/g1roR9VQXoaVjQz5PFxObfR8dMICYdbFGY5V3RbcxVGn
 H5jg==
X-Gm-Message-State: AOAM530TNhAdeC2aoDSdJv5bXxkBUt3VAPFGlgcYaElWiGGZveMz6nsr
 BiTsZPG2SkRvxgAhg2TR15g=
X-Google-Smtp-Source: ABdhPJz5VX7Gq0ep7DhbH4m7k4xatK5kOnSk1q6Pg7RmFrFTJnl/w8yDq0OAeDCIVE10fb7zC75/zQ==
X-Received: by 2002:a17:90a:8907:: with SMTP id
 u7mr19621197pjn.114.1618076021193; 
 Sat, 10 Apr 2021 10:33:41 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id b67sm3062135pfb.37.2021.04.10.10.33.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Apr 2021 10:33:40 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Siddhant Gupta <siddhantgupta416@gmail.com>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Selvakumar Elangovan <selvakumar16197@gmail.com>,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: mt7621-pci: stop using of_pci_range_to_resource
Date: Sat, 10 Apr 2021 10:33:31 -0700
Message-Id: <20210410173331.57949-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210410_103342_681220_A18CB692 
X-CRM114-Status: GOOD (  13.15  )
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

The logic here was already overriding the erroneous IO addresses
returned from of_pci_range_to_resource, which is the bulk of the logic.

So stop using it altogether and initialize the fields explicitly, as
done in aeba3731b150 ("powerpc/pci: Fix IO space breakage after
of_pci_range_to_resource() change").

Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 drivers/staging/mt7621-pci/pci-mt7621.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/mt7621-pci/pci-mt7621.c b/drivers/staging/mt7621-pci/pci-mt7621.c
index 1781c1dcf5b4..115250115f10 100644
--- a/drivers/staging/mt7621-pci/pci-mt7621.c
+++ b/drivers/staging/mt7621-pci/pci-mt7621.c
@@ -301,18 +301,19 @@ static int mt7621_pci_parse_request_of_pci_ranges(struct pci_host_bridge *host)
 
 	/*
 	 * IO_SPACE_LIMIT for MIPS is 0xffff but this platform uses IO at
-	 * upper address 0x001e160000 so we have to get the resource from
-	 * the DT because when it has been requested it failed and has been
-	 * removed from bridge->dma_ranges and bridge->windows. So parse it
-	 * and remap it manually to make things work.
+	 * upper address 0x001e160000. of_pci_range_to_resource does not work
+	 * well for MIPS platforms that don't define PCI_IOBASE, so set the IO
+	 * resource manually instead.
 	 */
+	pcie->io.name = node->full_name;
+	pcie->io.parent = pcie->io.child = pcie->io.sibling = NULL;
 	for_each_of_pci_range(&parser, &range) {
 		switch (range.flags & IORESOURCE_TYPE_BITS) {
 		case IORESOURCE_IO:
 			pcie->io_map_base =
 				(unsigned long)ioremap(range.cpu_addr,
 						       range.size);
-			of_pci_range_to_resource(&range, node, &pcie->io);
+			pcie->io.flags = range.flags;
 			pcie->io.start = range.cpu_addr;
 			pcie->io.end = range.cpu_addr + range.size - 1;
 			set_io_port_base(pcie->io_map_base);
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
