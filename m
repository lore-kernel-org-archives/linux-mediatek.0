Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77036606A31C
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 09:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cVRu87pL;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Mr2fniX/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/KxXKEws25lbYq+kwCpBubXmc4sMnnIfEYvw+09RsbI=; b=cVRu87pLu/sMDK
	9a7bcsc+gyR+musei9PwPxmg0tnQyw3Ijwjioxhi7F0mCyWdJ8MwqD0ZlStm73rWaNwThSzQWqfA6
	eAHjV1ZRXmfJMBDw7aU09o0ceAjeHLtqYZXeElXWaIBwu+CWwTwZhrB8w94rdxqX7roxmuV44WLae
	KBioeWmMIpC+kZABMeP7AS/7dpWG09HGTLAqlWO6TgRAXTB4iuNHJF2mEXEy4RepmLExzNEXN6ZAF
	wE+s4ce5cODuS2Rw1ne4FdEdkk+hmUbEudsPaPEC+aRpVBRuUAVevN0z3xJRaMjWZlQAnXFXpR5pc
	jrFrQFAbiEk0ldD/NaVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzOc-0000000Fv9O-0n2h;
	Sun, 08 Nov 2026 09:41:06 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzOY-0000000Fv7J-3xZX
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Nov 2026 09:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=/K
	xXKEws25lbYq+kwCpBubXmc4sMnnIfEYvw+09RsbI=; b=Mr2fniX/r6LBlZr5HY
	087fmzP0ypN5YWE2gUcQ5nOvDf4uJaZUQ62wmKF4rQux9/IApDbzuDvndQC6yeMX
	pfM3MASHzrVScxyjqs4l8A4m9uXGUe7yGfm2DDm7U6d6KHnlc5rDT8yUP3rngsNk
	z9mX6/O8shmMQyB6AbVgHadmg=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCXz8OTQ_BquUg4GA--.62891S7;
	Sun, 08 Nov 2026 17:40:42 +0800 (CST)
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
Subject: [PATCH v2 5/5] PCI: Make pcie_link_speed[] private to probe.c
Date: Sun,  8 Nov 2026 17:40:34 +0800
Message-ID: <20261108094034.679945-6-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108094034.679945-1-18255117159@163.com>
References: <20261108094034.679945-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXz8OTQ_BquUg4GA--.62891S7
X-Coremail-Antispam: 1Uf129KBjvJXoW7ArWkur17JrWfuw4DGF43trb_yoW8XFyxpF
	ZxJr40yr10q3W5WrZ8Xay8uFy5J3ZxCFW2krW2g393ZFy3Jr9xXrWa93yfJr9Ivrs29rW3
	XFnxJr1jya17twUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRBMKZUUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xrNcWrwQ5rwXAAA3i
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_014103_354280_5C9BA8A6 
X-CRM114-Status: GOOD (  10.04  )
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
 drivers/pci/probe.c | 3 +--
 2 files changed, 1 insertion(+), 3 deletions(-)

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
index d0283a8158f2..f79b048f45a4 100644
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
@@ -774,7 +774,6 @@ const unsigned char pcie_link_speed[] = {
 	PCI_SPEED_UNKNOWN,		/* E */
 	PCI_SPEED_UNKNOWN		/* F */
 };
-EXPORT_SYMBOL_GPL(pcie_link_speed);
 
 /**
  * pcie_get_link_speed - Get speed value from PCIe generation number
-- 
2.43.0


