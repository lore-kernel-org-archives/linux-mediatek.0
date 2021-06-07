Return-Path: <SRS0=qtn6=LB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80FC6C47082
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 04:00:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1060C611CE
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jun 2021 04:00:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1060C611CE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oa3pjKgyo2LS7X3n2BIHOlqe8ND5Z+vQo3a/YQW+nbA=; b=XWT1iLD/XtATwu
	CJkD5Tl2DTgT2jjmxhyfTx+mRH1RnbMf6uMsJzf9PHOwutc32Ys6KI3fpyfbKfKLuWZqBR6FeXrLN
	Ff9ZBRAcN0eeVKGFItsgRzuxG7j/0N6JdH90oECUA6YslEwZdRGTI2qYTNyShzW++E2nS4Y5/AqKh
	A/w9ZtULUlcNGBnzICZDMtEAgu4opw4P+37bSUUxhax7rdZHepmWzZSGWOJ+rmtXC1Q/b6aUgbrf4
	mBL4WHJdCJ6qN+y3X7R1MSZKJzmycJG4XOQ8gYUcDT1Cq0wqTGNfW4c9RJLKuD4WHMqZVmmO9aLJ2
	PEzYdHI1WU4dBXxt/Pmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lq6Qu-001R6E-2v; Mon, 07 Jun 2021 04:00:12 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lq6Qe-001R4V-Lq; Mon, 07 Jun 2021 04:00:00 +0000
X-UUID: 8468e1df7b844908b323adc648cb5f65-20210606
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=lPrzzAQVWP7bhg3XxaBGpGqrmwS/DgcIj00ycf00QZ4=; 
 b=bIW8HninbjPuGZ4l0POJHHknEQhercK83mlWx4L5oyTT/GD+a5lQ6jex9m1izNRcErD2LV6zaKXTaw0EUFXpsJ0F8+eX2moVtl8RuIq3gJbplCZg98LUIhV7Rt1M0ofd9CJfJMZzJ1pJza8OMXn9hid8rYm9GMrvVxFP/nmC01A=;
X-UUID: 8468e1df7b844908b323adc648cb5f65-20210606
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <mark-pk.tsai@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1212824213; Sun, 06 Jun 2021 20:59:54 -0700
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 6 Jun 2021 20:59:53 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 7 Jun 2021 11:59:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 7 Jun 2021 11:59:51 +0800
From: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
To: Marc Zyngier <maz@kernel.org>
CC: Thomas Gleixner <tglx@linutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <mark-pk.tsai@mediatek.com>, <yj.chiang@mediatek.com>
Subject: [PATCH] irqchip/irq-mst: Use ARCH_MSTARV7 as default value for MST_IRQ
Date: Mon, 7 Jun 2021 11:59:43 +0800
Message-ID: <20210607035943.30292-1-mark-pk.tsai@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210606_205956_741620_83D51C01 
X-CRM114-Status: GOOD (  10.67  )
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

Only TV SoCs of Mediatek products have this controller
which inherit from MStar TV SoCs.
Don't enable it by default if ARCH_MEDIATEK is selected.
Instead, use ARCH_MSTARV7 as default value.

Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
---
 drivers/irqchip/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 62543a4eccc0..30f578e18a11 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -576,7 +576,7 @@ config LOONGSON_PCH_MSI
 config MST_IRQ
 	bool "MStar Interrupt Controller"
 	depends on ARCH_MEDIATEK || ARCH_MSTARV7 || COMPILE_TEST
-	default ARCH_MEDIATEK
+	default ARCH_MSTARV7
 	select IRQ_DOMAIN
 	select IRQ_DOMAIN_HIERARCHY
 	help
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
