Return-Path: <SRS0=U17p=77=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 255F3C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 12:33:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAEEC20707
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jun 2020 12:33:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GwgaQO09";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BHnl+ojv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAEEC20707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xPYQeg6hfqr72Up4EFXSC1wbDsj3yk01LR50KaeyldI=; b=GwgaQO09Mnxyc0
	p5ergtqdBRJuXK/l7lcWOYHVf+QuaRtKvAhpjWmak8oZ270HqtP5NS0jzeltw2vegywZ+0Q2a6j2I
	nChYc0cZh5Ozngoh6lq3vPXhof1aP08ME6nIB4DCMtTcefrZVVihTyqcU1dWsBNjjbycUQnHH+VNG
	pTcVsZgwYaWgPCCFf3axAX4ohYp5MhFrIeXx14ZqQFCRpOLOQjqlLRCCzyZErAMQSoPPmXQLMe80P
	pJQ4OOIfBu4pDdwO12JO7xlZalRrn3+X0Y98vctJNR7Efi7bExC772YA0cgsX+7BZqserrmoI/WP9
	vSCjh9oH4pPeKuIqiMjA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jltjA-0004EH-AD; Thu, 18 Jun 2020 12:33:08 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlthf-000382-FH; Thu, 18 Jun 2020 12:31:37 +0000
X-UUID: 3d76f7ef654a40bea90ca393e95844de-20200618
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=IdkUN6cylx03pQG/oDT7DQeFHBUy2IznlAtWG2KPrdE=; 
 b=BHnl+ojvldDF7DGK/g7xfJrozNynqfFSSJ7gwzB6D9OiIdOB8ONbXH6fMWzJ3avt+xTvNbqf4P3r1ujlpJKXXgRjMny0HLPv0peOYq76IsmoRrcKA39dAUJqzal2ws/zU0S0tHOMRtDWsoO5pgeHON2HiJPDL7z7gddj4ZZqMxI=;
X-UUID: 3d76f7ef654a40bea90ca393e95844de-20200618
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1929656420; Thu, 18 Jun 2020 04:31:27 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 05:31:29 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 18 Jun 2020 20:31:28 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 18 Jun 2020 20:31:27 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Thomas Gleixner <tglx@linutronix.de>, Jason Cooper <jason@lakedaemon.net>, 
 Marc Zyngier <maz@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 1/1] irqchip: Add config MTK_SYSIRQ and MTK_CIRQ
Date: Thu, 18 Jun 2020 20:31:11 +0800
Message-ID: <1592483471-14806-1-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-TM-SNTS-SMTP: 1395E1B7B1501B6DCA231C05D5DB73483CF77046C33F0D234CB5FF87FD79AA9B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200618_053135_702894_21218A1E 
X-CRM114-Status: GOOD (  10.36  )
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
Cc: CC Hwang <cc.hwang@mediatek.com>, wsd_upstream@mediatek.com,
 Hanks Chen <hanks.chen@mediatek.com>, Loda Chou <loda.chou@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Mediatek sysirq and cirq drivers as-is were bound together to the config
of ARCH_MEDIATEK.  These two drivers should be able to be configured
separately.  For example, on new Mediatek mobile chips such as Dimensity
820, the sysirq driver is not used since the hardware module is removed.

Add two new configs to sysirq and cirq drivers.
- config MTK_SYSIRQ for the interrupt polarity controller driver: sysirq
- config MTK_CIRQ for the low-power interrupt driver: cirq

Signed-off-by: cc.hwang <cc.hwang@mediatek.com>
Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
---
 drivers/irqchip/Kconfig  |   12 ++++++++++++
 drivers/irqchip/Makefile |    3 ++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index 29fead2..cc9aa18 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -572,4 +572,16 @@ config LOONGSON_PCH_MSI
 	help
 	  Support for the Loongson PCH MSI Controller.
 
+config MTK_SYSIRQ
+	tristate "Mediatek interrupt polarity controller"
+	help
+	  Interrupt polarity controller driver to swap polarity for
+	  interrupts for Mediatek mobile chips.
+
+config MTK_CIRQ
+	bool "Mediatek low-power interrupt controller"
+	help
+	  Low-power interrupt controller driver to monitor IRQS
+	  in the sleep mode for Mediatek mobile chips.
+
 endmenu
diff --git a/drivers/irqchip/Makefile b/drivers/irqchip/Makefile
index 133f9c4..30421d2 100644
--- a/drivers/irqchip/Makefile
+++ b/drivers/irqchip/Makefile
@@ -69,7 +69,8 @@ obj-$(CONFIG_BCM7120_L2_IRQ)		+= irq-bcm7120-l2.o
 obj-$(CONFIG_BRCMSTB_L2_IRQ)		+= irq-brcmstb-l2.o
 obj-$(CONFIG_KEYSTONE_IRQ)		+= irq-keystone.o
 obj-$(CONFIG_MIPS_GIC)			+= irq-mips-gic.o
-obj-$(CONFIG_ARCH_MEDIATEK)		+= irq-mtk-sysirq.o irq-mtk-cirq.o
+obj-$(CONFIG_MTK_SYSIRQ)		+= irq-mtk-sysirq.o
+obj-$(CONFIG_MTK_CIRQ)			+= irq-mtk-cirq.o
 obj-$(CONFIG_ARCH_DIGICOLOR)		+= irq-digicolor.o
 obj-$(CONFIG_RENESAS_H8300H_INTC)	+= irq-renesas-h8300h.o
 obj-$(CONFIG_RENESAS_H8S_INTC)		+= irq-renesas-h8s.o
-- 
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
