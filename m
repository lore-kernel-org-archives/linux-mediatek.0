Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D248C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 15:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgFZdWp0HjpM6kmh4oouGFcOaLlU8Wb4jf2gGoleN/o=; b=EZb/o5jLHMJ+Jj
	k4aX+2dqVtZIDT6SH/k627od2q18dDAfuzjXCK8TEqsEcB5H7Qg8i2i4eRk5/O/EWF3SAX/MoLO5Y
	eA/4Hqh20fhqaltpk6cgK3jJE9O5iAeM0P1JX9lW5EJN5Zt+UcEXSX/IbXsgj4VvakDje/W+mvNBK
	u8iqcHe1QF+8rlxMHZ0xDW78f90VK+HRZIRMg9CeB0R7C0/WCYwGizddAN+4KIwKDB0V4qjAa/lEp
	MJow1FDUEMVxsnS6fBgaf0g6jA4JJEkgWahnUNvQAmSNbrMosAGJlbD/1cu/DUJGtmtkZJaLXVzYn
	zBDIbHb//1HRl69ok3+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrihy-001HUC-Ul; Mon, 29 Nov 2021 15:36:46 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrif7-001G6l-8x; Mon, 29 Nov 2021 15:33:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/k6j6wHaioGkrZLjGu4ey+Q0rMQZQIVRikhhuIY/xoM=; b=nQcX1IPYhxYVuYI9j5GXH3q6No
 S10obuLHJLyDDR0brN9H4F1g2D7OEn3vlN9kLfEJJHkjL2v8VqpvkpgIS0OmItDHXIhFilkXAlLiX
 OMs83gt4vndRv7f8hgCb8Rt1ppMHjRz3fkUTcKzOnaQhtEUGW/iN1hUzYQycIY+8L9wQ=;
Received: from p54ae943f.dip0.t-ipconnect.de ([84.174.148.63]
 helo=localhost.localdomain)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mriez-0000mo-FJ; Mon, 29 Nov 2021 16:33:41 +0100
From: Felix Fietkau <nbd@nbd.name>
To: linux-arm-kernel@lists.infradead.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Rob Herring <robh@kernel.org>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: john@phrozen.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v5 09/13] PCI: mediatek: allow selecting controller driver for
 airoha arch
Date: Mon, 29 Nov 2021 16:33:25 +0100
Message-Id: <20211129153330.37719-10-nbd@nbd.name>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20211129153330.37719-1-nbd@nbd.name>
References: <20211129153330.37719-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_073349_498662_C10D96C7 
X-CRM114-Status: GOOD (  11.12  )
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

The EN7523 SoC uses the same controller as MT7622

Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 drivers/pci/controller/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/Kconfig b/drivers/pci/controller/Kconfig
index 93b141110537..f1342059c2a3 100644
--- a/drivers/pci/controller/Kconfig
+++ b/drivers/pci/controller/Kconfig
@@ -233,7 +233,7 @@ config PCIE_ROCKCHIP_EP
 
 config PCIE_MEDIATEK
 	tristate "MediaTek PCIe controller"
-	depends on ARCH_MEDIATEK || COMPILE_TEST
+	depends on ARCH_AIROHA || ARCH_MEDIATEK || COMPILE_TEST
 	depends on OF
 	depends on PCI_MSI_IRQ_DOMAIN
 	help
-- 
2.30.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
