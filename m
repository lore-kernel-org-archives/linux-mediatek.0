Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC23606A31C
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 02:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UXsD17up;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=mJHS8qEp
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=AnX2im8pmpMs7qiMXvCcS0Ur29/euoW9hpHTsNFISCM=; b=UXsD17upl8dZCc
	zjxLTq6WsqKxseOwJUTf5kt11jrqqpGO5c32p2bcKUrZzeUiV2aIETMZ8TOigUAL/rIG8bTunfUUY
	taclNOhWXpRVY5T0yzz1cMHRiDeAcXfzk/zv7SkaaQ5JWmk0dcovCYF7S0dFLIyqOGGOYOPI/e7MP
	fHKGIAiOg5FFkXm+ZIJ+7gcT3MNaBVJbqh5KYj4hmC626mmjsccwFH4LMimwGXU0BBHH6x+0up7IQ
	hfUfOIEQReIGoZVIXoehqMAEj5WfkHKKbe0ZynSSg3F8hyc5MmDC7ALKh/3l8YzB3PG9PBUB9LOVt
	JPvnLldzJc5n9Z+RQEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKUK-00000008VUp-3v9v;
	Thu, 12 Nov 2026 02:24:32 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRKUG-00000008VRe-0gRE
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Nov 2026 02:24:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=An
	X2im8pmpMs7qiMXvCcS0Ur29/euoW9hpHTsNFISCM=; b=mJHS8qEpQDIZJovxAi
	Hs9jqYVqIHFCHkvYOc6LU5oqRg9T7jWioIIkOBGLE4EfSFdqmuFy6H1H4cjIJqRt
	eL5tQq/fFw6FeMOsg4DZ1V4AWjfao3FaD9LRj9U9ZXzi3DE2GgYl9VaMhuXL7VNi
	iS/2n7JZ4zEuG/Fq+kpXEnq2E=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wDXj+5GI_VqPgXEGg--.53291S3;
	Thu, 12 Nov 2026 10:24:10 +0800 (CST)
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
Subject: [PATCH v3 1/5] PCI: Use pcie_get_link_speed() in pci.c
Date: Thu, 12 Nov 2026 10:24:01 +0800
Message-ID: <20261112022405.1230200-2-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261112022405.1230200-1-18255117159@163.com>
References: <20261112022405.1230200-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXj+5GI_VqPgXEGg--.53291S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyDWF1rAryDXryftFWxtFb_yoW8tFWfpa
	y7C3WFyry8J34fWFs5Xa15ur15J3ZxZrWxJrWSka4kWr17trZxXFyFq3y3tr1SyrWDAry5
	A3ZIyrs8uFs7tF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRv385UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6wrylmr1I0ofjwAA3j
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_182428_540518_DF589CAD 
X-CRM114-Status: UNSURE (   8.69  )
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

Replace the to_pcie_link_speed() wrapper with pcie_get_link_speed() in
pcie_link_bandwidth_mbps() and pcie_bandwidth_available(), and remove
the now-unused wrapper.  pcie_get_link_speed() performs the same lookup
with bounds checking and is already exported.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/pci.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7c6f2aba8144..594ee7aa4cad 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -6025,11 +6025,6 @@ int pcie_set_mps(struct pci_dev *dev, int mps)
 }
 EXPORT_SYMBOL(pcie_set_mps);
 
-static enum pci_bus_speed to_pcie_link_speed(u16 lnksta)
-{
-	return pcie_link_speed[FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta)];
-}
-
 /**
  * pcie_link_bandwidth_mbps - get the current bandwidth of a single PCIe link
  * @pdev: PCI device to query
@@ -6041,14 +6036,15 @@ static enum pci_bus_speed to_pcie_link_speed(u16 lnksta)
  */
 int pcie_link_bandwidth_mbps(struct pci_dev *pdev)
 {
-	u16 lnksta;
+	u16 lnksta, lnksta_cls;
 	int speed, err;
 
 	err = pcie_capability_read_word(pdev, PCI_EXP_LNKSTA, &lnksta);
 	if (err)
 		return pcibios_err_to_errno(err);
 
-	speed = pcie_dev_speed_mbps(to_pcie_link_speed(lnksta));
+	lnksta_cls = FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta);
+	speed = pcie_dev_speed_mbps(pcie_get_link_speed(lnksta_cls));
 	if (speed < 0)
 		return speed;
 
@@ -6074,7 +6070,7 @@ u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev **limiting_dev,
 			     enum pci_bus_speed *speed,
 			     enum pcie_link_width *width)
 {
-	u16 lnksta;
+	u16 lnksta, lnksta_cls;
 	enum pci_bus_speed next_speed;
 	enum pcie_link_width next_width;
 	u32 bw, next_bw;
@@ -6089,7 +6085,8 @@ u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev **limiting_dev,
 	while (dev) {
 		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
 
-		next_speed = to_pcie_link_speed(lnksta);
+		lnksta_cls = FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta);
+		next_speed = pcie_get_link_speed(lnksta_cls);
 		next_width = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
 
 		next_bw = next_width * PCIE_SPEED2MBS_ENC(next_speed);
-- 
2.43.0


