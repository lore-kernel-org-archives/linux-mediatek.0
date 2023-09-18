Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6AEFCD13D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 13:20:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+lpdCK5+VQs9sNEvDPk/c3GmQ6kipvNq7frsPNfmFLM=; b=3ZV8edb9WfZ8APSZlIdT89GKUn
	lbRoBwjZsBbteeMvqNjuxOQwIvP/4nx5D98rlO5r/k+Qp6bGqMgzvS1WAn+0wjGi7Nv5X4+njhst+
	sOaDdYBDvs7r7xHG8IaCcmD6AmPT5R+xVWVtMXyRrCCvblfHxylxqwJOi7o0zycC1q2MWZI8NwpLC
	kMzrJZ//PhUmwM07Hnkca3oJoP69d/U1fjb80xnoxq7fQc7yOQaLtZw98j5o53bv8xWKdJ6uOttRF
	WL52cUdA5FPDqYoRv6hc10Y62YeoA4bataDbSNANAQG44gTLyPtX/TPmApMPYzFvoevnFAf3d0ell
	h++DjhJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAn-00FXIa-1A;
	Mon, 18 Sep 2023 13:20:21 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAk-00FXGW-0Z;
	Mon, 18 Sep 2023 13:20:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043218; x=1726579218;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uEKrgp0fS4TcV/kqj/T1ibXnz9U6nSS/hcSxBB6l/C0=;
  b=Hu2/MVYAR9cFZT28C5yCMzLPEOEG3FlmX2If6VZE8jg3MCZZ7kJ2ba0O
   g6IaneKy+LKXYu9pHTyqWZ2ORk6yCOCCYvywwOgtWWmf0CIEmq64M9QrA
   a8S2m/S4BT+Ch8bEtc/zAsTH54FDrcknytD/KZ357k8tqAF4euJmrX2Ou
   W84kNFB4lSRcHy9BmaJy4MMcN/Hq5k0AZ1V9GPgMsu/y9KLVDHvOSK2BU
   ZcP63JASCSh1fziAz+Hc4i5hd57sdPUOvC09VqllP713an04dS/Nuyi38
   y59yCNLRYF0uD1gh3k8KtWbDdWdeWYDI7GjHmP0br1voARL2P09t/nuoo
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113410"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113410"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811342150"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811342150"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:30 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>,
	Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
	Rob Herring <robh@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Lukas Wunner <lukas@wunner.de>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Emmanuel Grumbach <emmanuel.grumbach@intel.com>,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 05/13] PCI/ASPM: Add pci_enable_link_state()
Date: Mon, 18 Sep 2023 16:10:55 +0300
Message-Id: <20230918131103.24119-6-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_062018_262779_B6A082B3 
X-CRM114-Status: GOOD (  15.16  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

pci_disable_link_state() lacks a symmetric pair. Some drivers want to
disable ASPM during certain phases of their operation but then
re-enable it later on. If pci_disable_link_state() is made for the
device, there is currently no way to re-enable the states that were
disabled.

Add pci_enable_link_state() to remove ASPM states from the state
disable mask.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/aspm.c | 42 +++++++++++++++++++++++++++++++++++++++++
 include/linux/pci.h     |  2 ++
 2 files changed, 44 insertions(+)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 91dc95aca90f..f45d18d47c20 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1117,6 +1117,48 @@ int pci_disable_link_state(struct pci_dev *pdev, int state)
 }
 EXPORT_SYMBOL(pci_disable_link_state);
 
+/**
+ * pci_enable_link_state - Re-enable device's link state
+ * @pdev: PCI device
+ * @state: ASPM link states to re-enable
+ *
+ * Enable device's link state that were previously disable so the link is
+ * allowed to enter the specific states. Note that if the BIOS didn't grant
+ * ASPM control to the OS, this does nothing because we can't touch the
+ * LNKCTL register.
+ *
+ * Return: 0 or a negative errno.
+ */
+int pci_enable_link_state(struct pci_dev *pdev, int state)
+{
+	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
+
+	if (!link)
+		return -EINVAL;
+	/*
+	 * A driver requested that ASPM be enabled on this device, but
+	 * if we don't have permission to manage ASPM (e.g., on ACPI
+	 * systems we have to observe the FADT ACPI_FADT_NO_ASPM bit and
+	 * the _OSC method), we can't honor that request.
+	 */
+	if (aspm_disabled) {
+		pci_warn(pdev, "can't enable ASPM; OS doesn't have ASPM control\n");
+		return -EPERM;
+	}
+
+	mutex_lock(&aspm_lock);
+	link->aspm_disable &= ~pci_link_state_mask(state);
+	pcie_config_aspm_link(link, policy_to_aspm_state(link));
+
+	if (state & PCIE_LINK_STATE_CLKPM)
+		link->clkpm_disable = 0;
+	pcie_set_clkpm(link, policy_to_clkpm_state(link));
+	mutex_unlock(&aspm_lock);
+
+	return 0;
+}
+EXPORT_SYMBOL(pci_enable_link_state);
+
 /**
  * pci_set_default_link_state - Set the default device link state
  * @pdev: PCI device
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 3c24ca164104..844d09230264 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1776,11 +1776,13 @@ extern bool pcie_ports_native;
 int pci_disable_link_state(struct pci_dev *pdev, int state);
 int pci_disable_link_state_locked(struct pci_dev *pdev, int state);
 #ifdef CONFIG_PCIEASPM
+int pci_enable_link_state(struct pci_dev *pdev, int state);
 int pci_set_default_link_state(struct pci_dev *pdev, int state);
 void pcie_no_aspm(void);
 bool pcie_aspm_support_enabled(void);
 bool pcie_aspm_enabled(struct pci_dev *pdev);
 #else
+static inline int pci_enable_link_state(struct pci_dev *pdev, int state) { return -EOPNOTSUPP; }
 static inline int pci_set_default_link_state(struct pci_dev *pdev, int state)
 { return 0; }
 static inline void pcie_no_aspm(void) { }
-- 
2.30.2


