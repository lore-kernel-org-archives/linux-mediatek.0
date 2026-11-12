Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57626606A321
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 02:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=gytGLwq8;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=YYYeLTj8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AuNCvErELAsRD2TsvI0NIr6pNW90+88TXZ8jEukwm1A=; b=gytGLwq8yg+yrB
	VMQbFD9yaYWrPwPqS2QaRmVWyDXOSaZa6ZtzSzwbyWfQXflibWv8daVHXLHgjriAUIt5PvjTys94m
	KsqYN8vAn4SofCwVuudG0PNDSE0kUH4hd2Oh2cZ8Um45Etaqe1FdLJ/3+MvHq7pb/2KQkze8D2fP1
	OJGDZMdpogS26S8lP95uwpmrrUpzV9Ac67x041TRwr0UKcFXDtvUhECdxDAB/28mRviKU6gXaFRGY
	dlpAlt1XW9cyJekBwRM4XZMK3y/JRR+NqNr1fwCVyvQ769Q9LEBaYhf8p5M4FxH33bKX8e4ynpX81
	H4QamfsvU8j4krbgHz0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKUL-00000008VUt-02Ot;
	Thu, 12 Nov 2026 02:24:33 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKUG-00000008VRn-3Psu
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 02:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Au
	NCvErELAsRD2TsvI0NIr6pNW90+88TXZ8jEukwm1A=; b=YYYeLTj8/FC0dvGkDs
	HEHmbKgjHoUiyN8PV3Q+sx/GTYAOxtNQXixXb3+qJtM3p8y29MJab61g8Uq68yI+
	fyBf3BYunpyKzYxdCQTyyeh7D2rga3qLICnDHL8QhbciNoTrEuQg92KA8s+15eCT
	4/esAIWQfju51Q77jVCGAwq8E=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDXj+5GI_VqPgXEGg--.53291S7;
	Thu, 12 Nov 2026 10:24:14 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	mani@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	thierry.reding@kernel.org,
	ryder.lee@mediatek.com,
	jonathanh@nvidia.com
Cc: robh@kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v3 5/5] PCI: Make pcie_link_speed[] private to probe.c
Date: Thu, 12 Nov 2026 10:24:05 +0800
Message-ID: <20261112022405.1230200-6-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112022405.1230200-1-18255117159@163.com>
References: <20261112022405.1230200-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXj+5GI_VqPgXEGg--.53291S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArWkur17Jr1kAF1DCw4rKrg_yoW8Wr48pa
	9xJr40yr10q3W5WrZ8XayUuFy5J3ZxCay2k3y2g393ZFy3JrZxXrya9ayfXrZIyrs29ry3
	XFnxJr1jya17twUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRBMKZUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7A7zl2r1I04k6gAA36
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_182429_219697_26748625 
X-CRM114-Status: UNSURE (   9.72  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

pcie_get_link_speed() is now the only accessor for pcie_link_speed[].
Make the array static and remove its extern declaration and export so no
other code can index it directly.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/pci.h   | 1 -
 drivers/pci/probe.c | 4 +---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 5441741bc330..04bdf3b86a56 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -118,7 +118,6 @@ struct pcie_tlp_log;
 #define PCI_EXP_AER_FLAGS	(PCI_EXP_DEVCTL_CERE | PCI_EXP_DEVCTL_NFERE | \
 				 PCI_EXP_DEVCTL_FERE | PCI_EXP_DEVCTL_URRE)
 
-extern const unsigned char pcie_link_speed[];
 unsigned char pcie_get_link_speed(unsigned int speed);
 
 extern bool pci_early_dump;
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index d0283a8158f2..b2d69de00041 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -756,7 +756,7 @@ static const unsigned char pcix_bus_speed[] = {
 };
 
 /* Indexed by PCI_EXP_LNKCAP_SLS, PCI_EXP_LNKSTA_CLS */
-const unsigned char pcie_link_speed[] = {
+static const unsigned char pcie_link_speed[] = {
 	PCI_SPEED_UNKNOWN,		/* 0 */
 	PCIE_SPEED_2_5GT,		/* 1 */
 	PCIE_SPEED_5_0GT,		/* 2 */
@@ -774,8 +774,6 @@ const unsigned char pcie_link_speed[] = {
 	PCI_SPEED_UNKNOWN,		/* E */
 	PCI_SPEED_UNKNOWN		/* F */
 };
-EXPORT_SYMBOL_GPL(pcie_link_speed);
-
 /**
  * pcie_get_link_speed - Get speed value from PCIe generation number
  * @speed: PCIe speed (1-based: 1 = 2.5GT, 2 = 5GT, ...)
-- 
2.43.0


