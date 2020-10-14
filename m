Return-Path: <SRS0=JxBa=DV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF2CEC433E7
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 13:17:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5D2F32173E
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Oct 2020 13:17:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hP2FNPcH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5D2F32173E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GnD9xzyz4oH+rJv4N6e9Hq2KVu2Y/jwc8+QXFI3gQwc=; b=hP2FNPcHAKW+7OOFgHCr0Xry2A
	PAZGMV99CkA9bYbdp3YJuI8jrZ+Aln4H42qni6P4hVunRbBJtwg9DKh8vvltCa1qL75WCK9Kv7FZd
	oKSPG/t7DdSuiRr8GMfkCfWS1xnO+UpDP4NEqnYKHvPdQUOvsI8eHgUD6x8ForvXu3IhiG/SlXz6U
	vjo5jlsIEyHFP1YJbDiFXlS/UdT+vmaiCrJehfQ0ocRFO7Q7dvtOIOAhysoqeOCTG5TkYAZMOzWa4
	rGL5C0zhbMCbsrrE+7eMfUMrgsfv+/Z7VYalRzzdYlBBMyvRQ332646JEK7HxamKOTIhTArhetwyl
	b4tSl75Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSgea-0001eb-E6; Wed, 14 Oct 2020 13:17:16 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSgeV-0001d6-28
 for linux-mediatek@lists.infradead.org; Wed, 14 Oct 2020 13:17:12 +0000
Received: from ramsan ([84.195.186.194]) by albert.telenet-ops.be with bizsmtp
 id fpH42300F4C55Sk06pH4Al; Wed, 14 Oct 2020 15:17:05 +0200
Received: from rox.of.borg ([192.168.97.57]) by ramsan with esmtp (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1kSgeO-0007y9-83; Wed, 14 Oct 2020 15:17:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.90_1)
 (envelope-from <geert@linux-m68k.org>)
 id 1kSgeO-0004ke-6Q; Wed, 14 Oct 2020 15:17:04 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <maz@kernel.org>, Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
 Daniel Palmer <daniel@thingy.jp>
Subject: [PATCH] irqchip: MST_IRQ should depend on ARCH_MEDIATEK or
 ARCH_MSTARV7
Date: Wed, 14 Oct 2020 15:17:03 +0200
Message-Id: <20201014131703.18021-1-geert+renesas@glider.be>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201014_091711_202607_5D0C59C5 
X-CRM114-Status: GOOD (  10.16  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The MStar interrupt controller is only found on MStar, SigmaStar, and
Mediatek SoCs.  Hence add dependencies on ARCH_MEDIATEK and
ARCH_MSTARV7, to prevent asking the user about the MStar interrupt
controller driver when configuring a kernel without support for MStar,
SigmaStar, and Mediatek SoCs.

Fixes: ad4c938c92af9130 ("irqchip/irq-mst: Add MStar interrupt controller support")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index c6098eee0c7cf217..500b16648e5183c4 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -591,6 +591,7 @@ config LOONGSON_PCH_MSI
 
 config MST_IRQ
 	bool "MStar Interrupt Controller"
+	depends on ARCH_MEDIATEK || ARCH_MSTARV7 || COMPILE_TEST
 	default ARCH_MEDIATEK
 	select IRQ_DOMAIN
 	select IRQ_DOMAIN_HIERARCHY
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
