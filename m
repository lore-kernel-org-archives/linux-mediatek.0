Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69494606A31C
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 09:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=st+zFsK6;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=cBh9bpcG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=nqXfJixZkwzDhIMorPPJ0dQ7Iu297y2SeiumQpEkZaA=; b=st+zFsK6Y2lf/j
	/nQ/4cVdYTucZU2nWe22ZDkJTpYl3rUADec1wVx5lUsnYrpiWdc0JjpbJmvyWtAgw0myENNM1dXlT
	/OFKHoFOb3IgUmWdkFVILk/ZyTUyWH1I4kRTS+rqrwBpsTTpgrCNKDpMiXvlX7Pz7SPMppKxNhbGO
	QRA88IUdSL/J3TtHumzTqctg7vRV4+b6d43kPySDi13AeU4pLFzRnSFxPWNPyrjJIFu2+M+EJCD7n
	6ARK6u3tLtqB5AG6GRV1Pp9KePvSKoiaiNLkk/zcz5Sey/xNfTVPdy0rC+exVGJV+nOoo70Y76ZVC
	rtIXJxn1+jl6vTMdntyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzOa-0000000Fv8B-3slZ;
	Sun, 08 Nov 2026 09:41:04 +0000
Received: from m16.mail.163.com ([220.197.31.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzOY-0000000Fv7G-2nvX
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Nov 2026 09:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=nq
	XfJixZkwzDhIMorPPJ0dQ7Iu297y2SeiumQpEkZaA=; b=cBh9bpcGv0ec6LeAZy
	/wpRbvnAKKF9VHqBenBT4g0HgWXi2a8lSIXp2QWM7/PiwjfUd8mIYLNcsC/dj7hk
	7P7Trmoyge8faLqopeAMyQ3N3vt0KjBos9tAbTooX7+/PwgRM5UPqQ+zzQBf637w
	RFOV+mubefa7Q0yes8a5JhQ9o=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCXz8OTQ_BquUg4GA--.62891S3;
	Sun, 08 Nov 2026 17:40:39 +0800 (CST)
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
Subject: [PATCH v2 1/5] PCI: Use pcie_get_link_speed() in pci.c
Date: Sun,  8 Nov 2026 17:40:30 +0800
Message-ID: <20261108094034.679945-2-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108094034.679945-1-18255117159@163.com>
References: <20261108094034.679945-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXz8OTQ_BquUg4GA--.62891S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyDWF1rAryDXryftFWxtFb_yoW8Ar47pa
	y7C3W8Ar18Jr1fWF4rJan8Wr15X3Z3ZayxtrySgay8Wr17CrZxJFyFq3y3tr1SkrWDAry5
	G3ZIyrs8ua1xtF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRv385UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7BfMcGrwQ5f4cwAA3C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_014103_080169_8E6A6DB8 
X-CRM114-Status: UNSURE (   8.01  )
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
 drivers/pci/pci.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index 7c6f2aba8144..92ede1768caf 100644
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
@@ -6048,7 +6043,7 @@ int pcie_link_bandwidth_mbps(struct pci_dev *pdev)
 	if (err)
 		return pcibios_err_to_errno(err);
 
-	speed = pcie_dev_speed_mbps(to_pcie_link_speed(lnksta));
+	speed = pcie_dev_speed_mbps(pcie_get_link_speed(FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta)));
 	if (speed < 0)
 		return speed;
 
@@ -6089,7 +6084,7 @@ u32 pcie_bandwidth_available(struct pci_dev *dev, struct pci_dev **limiting_dev,
 	while (dev) {
 		pcie_capability_read_word(dev, PCI_EXP_LNKSTA, &lnksta);
 
-		next_speed = to_pcie_link_speed(lnksta);
+		next_speed = pcie_get_link_speed(FIELD_GET(PCI_EXP_LNKSTA_CLS, lnksta));
 		next_width = FIELD_GET(PCI_EXP_LNKSTA_NLW, lnksta);
 
 		next_bw = next_width * PCIE_SPEED2MBS_ENC(next_speed);
-- 
2.43.0


