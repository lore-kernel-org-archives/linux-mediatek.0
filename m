Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A739606A31C
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Nov 2026 09:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DWOYQFSL;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=gIbOUUd9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ets5AMQcRfl5b/NAbc3/Lx4RxTaTcnOjaKk4QHCRuPI=; b=DWOYQFSL3z/bGp
	ozVhwY7u6fA2vPcafr8Zw4qxxKY6dzLrq9jmcoqhUPAeAWJNXYkV6e1V98dgZO2Y189u1XU2c+/QF
	HGjPn72tXgxJlGXvAnHU9Geuf/SDNfYQeSpdLciapLUWsOdMfx1WofroxOFexwbju2wt9kMYA3Scn
	0QC6IglW+Uv2NHqeHP+1+ByI3o5/pqTE6NKh6F3NCByh6DifSKkMShMPoCbA2AA/5WG5WerpDorLT
	DDNEv7JSjf9YVUkwWSH72KpKzgcWw/alphAbR3uDAOw1BNUGs+yR9O/tR2UbPo5Mf9YM75X9xH+cB
	jZsSUPPrN0QUKxGEm79w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzOe-0000000FvBb-13Ts;
	Sun, 08 Nov 2026 09:41:08 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPzOa-0000000Fv7I-2bAC
	for linux-mediatek@lists.infradead.org;
	Sun, 08 Nov 2026 09:41:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Et
	s5AMQcRfl5b/NAbc3/Lx4RxTaTcnOjaKk4QHCRuPI=; b=gIbOUUd9hm04HxVRnd
	H/X5FB4oznXuyaddcmMwPlyrNEmhg4+lEE78b/SeJlhhkzwK9Lj2VspFw344mEiQ
	vnr0CkiO9OdWf1PSXmfawCi6c4zEuZmt6HdgHQsha0kJMcMJYGlLDLpo7uxLRmJG
	wOsmLzf2Ic0bN3GChXneEYlVA=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wCXz8OTQ_BquUg4GA--.62891S4;
	Sun, 08 Nov 2026 17:40:40 +0800 (CST)
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
Subject: [PATCH v2 2/5] PCI: Convert remaining core pcie_link_speed[] users
Date: Sun,  8 Nov 2026 17:40:31 +0800
Message-ID: <20261108094034.679945-3-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261108094034.679945-1-18255117159@163.com>
References: <20261108094034.679945-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wCXz8OTQ_BquUg4GA--.62891S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF47ZFW8Xw1xuF47ury8Xwb_yoW8urW8pa
	y3Cr4Fyr18Jry3Wrs5Z3WDWFyYq3ZIvrWjkrWkWas3XF17ArZxXFyay3yftryFvrZrCry3
	AF1ayrW5Aa17JF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zZg4U5UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xjNcWrwQ5jwHwAA3h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_014105_064471_872162DB 
X-CRM114-Status: UNSURE (   9.54  )
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

Convert the remaining direct pcie_link_speed[] accesses in pci-sysfs.c,
the __pcie_update_link_speed() inline helper, and pci_set_bus_speed() in
probe.c to pcie_get_link_speed().  This includes the max_bus_speed
lookup that was missed in v1.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/pci-sysfs.c | 2 +-
 drivers/pci/pci.h       | 2 +-
 drivers/pci/probe.c     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/pci-sysfs.c b/drivers/pci/pci-sysfs.c
index 6669e9ad5bd3..30db3349a44c 100644
--- a/drivers/pci/pci-sysfs.c
+++ b/drivers/pci/pci-sysfs.c
@@ -234,7 +234,7 @@ static ssize_t current_link_speed_show(struct device *dev,
 	if (err)
 		return -EINVAL;
 
-	speed = pcie_link_speed[linkstat & PCI_EXP_LNKSTA_CLS];
+	speed = pcie_get_link_speed(FIELD_GET(PCI_EXP_LNKSTA_CLS, linkstat));
 
 	return sysfs_emit(buf, "%s\n", pci_speed_string(speed));
 }
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index 77efa4c5c960..5441741bc330 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -692,7 +692,7 @@ static inline void __pcie_update_link_speed(struct pci_bus *bus,
 					    enum pcie_link_change_reason reason,
 					    u16 linksta, u16 linksta2)
 {
-	bus->cur_bus_speed = pcie_link_speed[linksta & PCI_EXP_LNKSTA_CLS];
+	bus->cur_bus_speed = pcie_get_link_speed(FIELD_GET(PCI_EXP_LNKSTA_CLS, linksta));
 	bus->flit_mode = (linksta2 & PCI_EXP_LNKSTA2_FLIT) ? 1 : 0;
 
 	trace_pcie_link_event(bus,
diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
index 9a178e0e5f7f..d0283a8158f2 100644
--- a/drivers/pci/probe.c
+++ b/drivers/pci/probe.c
@@ -924,7 +924,7 @@ static void pci_set_bus_speed(struct pci_bus *bus)
 		u32 linkcap;
 
 		pcie_capability_read_dword(bridge, PCI_EXP_LNKCAP, &linkcap);
-		bus->max_bus_speed = pcie_link_speed[linkcap & PCI_EXP_LNKCAP_SLS];
+		bus->max_bus_speed = pcie_get_link_speed(FIELD_GET(PCI_EXP_LNKCAP_SLS, linkcap));
 
 		pcie_update_link_speed(bus, PCIE_ADD_BUS);
 	}
-- 
2.43.0


