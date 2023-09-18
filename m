Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95155CD13D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 13:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sYXkEBQuP4/oDlPbUhFIQI4g7N/jmvM0L8IIetaJY2I=; b=ifu/AedH+fdAdD+1G06vrSdLIW
	aihB4AqGw2LEdFhQ+6gzApdy687hCyOVl9GQR4TEaUw9XRJYv8PtQHg7wjKzuAUBPix1g13TfPTDB
	sNf2FBwoLop/GQk7pM3we9iX7+r+9pByasrb9xd6DQGdVuotDK1PBjWS3OV/9r/5vdcAOUKQbzAFt
	P7fY0G6ZdzKri/U77IOdsNvRK2hMyM+PNPyiwfFHNWyX5azyXfYwChztzeyoPAEzWbOygJJr1gFC7
	exvMIWoNDx77mjRVfQOZ0QdBeuTwft5kjh11qq7pFCUffNFbuQEPdj6nPc1H1KG1mutCBvso0PI2e
	9D9N1Dqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE9C-00FWTy-1E;
	Mon, 18 Sep 2023 13:18:42 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE99-00FWSg-20;
	Mon, 18 Sep 2023 13:18:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043119; x=1726579119;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4RLnw7kq3hIGZLooWQrGpuOQSJqB/nglTVJsokARwac=;
  b=GFOZca9Sc6hPw2G2U9fs2KifAJIHsESsuBktPK5wtPGCkrewLNnG8pO/
   0hO2sh60S0ptL0tn8YCYA5xuD62akjRq/+D/p1bTjk4KgyEOuTfdjWKXd
   kcR3MVWLsoosy3C1jPpTHkh+1Apgk99mYB2oRdHvUbLgeTAdI5B2co2L6
   2mcP1aGDzF0HH/t79mIDWQNFKmKLlwtozEymOxNw/dJ5jtKw1WkGpc5I5
   A4SukmRCjzAYB7+uyYefah+VZQC2sYuByXODWTavyL/JD+FYudxwJqwit
   WbJ3VaR4hja5Pl0LEFYd+2TQqxiYiLXtKCM/kZUwUCv8yQHeZm/AhTR84
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446112695"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446112695"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:11:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811341426"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811341426"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:11:30 -0700
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
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
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
Subject: [PATCH v2 01/13] PCI/ASPM: Rename pci_enable_link_state() to pci_set_default_link_state()
Date: Mon, 18 Sep 2023 16:10:51 +0300
Message-Id: <20230918131103.24119-2-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_061839_711342_B02196BA 
X-CRM114-Status: GOOD (  16.12  )
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

pci_enable_link_state() and pci_disable_link_state() are not paired
symmetrically despite their names suggesting otherwise.
pci_enable_link_state() tweaks link state when the "default" policy is
in use rather than exactly "enabling" some link states. Obviously, when
the default policy is in use and the default link state is changed,
some link states may get enabled but that is a secondary effect.

Thus, rename pci_enable_link_state() to pci_set_default_link_state() to
better match what it does. The rename also frees
pci_enable_link_state() name so that a function that pairs
symmetrically with pci_disable_link_state() can be added later.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/controller/vmd.c | 2 +-
 drivers/pci/pcie/aspm.c      | 8 ++++----
 include/linux/pci.h          | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/pci/controller/vmd.c b/drivers/pci/controller/vmd.c
index ad56df98b8e6..e424ce897d23 100644
--- a/drivers/pci/controller/vmd.c
+++ b/drivers/pci/controller/vmd.c
@@ -752,7 +752,7 @@ static int vmd_pm_enable_quirk(struct pci_dev *pdev, void *userdata)
 	if (!(features & VMD_FEAT_BIOS_PM_QUIRK))
 		return 0;
 
-	pci_enable_link_state(pdev, PCIE_LINK_STATE_ALL);
+	pci_set_default_link_state(pdev, PCIE_LINK_STATE_ALL);
 
 	pos = pci_find_ext_capability(pdev, PCI_EXT_CAP_ID_LTR);
 	if (!pos)
diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index 1bf630059264..fc909e20365f 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1102,8 +1102,8 @@ int pci_disable_link_state(struct pci_dev *pdev, int state)
 EXPORT_SYMBOL(pci_disable_link_state);
 
 /**
- * pci_enable_link_state - Clear and set the default device link state so that
- * the link may be allowed to enter the specified states. Note that if the
+ * pci_set_default_link_state - Clear and set the default device link state so
+ * that the link may be allowed to enter the specified states. Note that if the
  * BIOS didn't grant ASPM control to the OS, this does nothing because we can't
  * touch the LNKCTL register. Also note that this does not enable states
  * disabled by pci_disable_link_state(). Return 0 or a negative errno.
@@ -1111,7 +1111,7 @@ EXPORT_SYMBOL(pci_disable_link_state);
  * @pdev: PCI device
  * @state: Mask of ASPM link states to enable
  */
-int pci_enable_link_state(struct pci_dev *pdev, int state)
+int pci_set_default_link_state(struct pci_dev *pdev, int state)
 {
 	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
 
@@ -1153,7 +1153,7 @@ int pci_enable_link_state(struct pci_dev *pdev, int state)
 
 	return 0;
 }
-EXPORT_SYMBOL(pci_enable_link_state);
+EXPORT_SYMBOL(pci_set_default_link_state);
 
 static int pcie_aspm_set_policy(const char *val,
 				const struct kernel_param *kp)
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 8c7c2c3c6c65..7df56988ff48 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1776,7 +1776,7 @@ extern bool pcie_ports_native;
 #ifdef CONFIG_PCIEASPM
 int pci_disable_link_state(struct pci_dev *pdev, int state);
 int pci_disable_link_state_locked(struct pci_dev *pdev, int state);
-int pci_enable_link_state(struct pci_dev *pdev, int state);
+int pci_set_default_link_state(struct pci_dev *pdev, int state);
 void pcie_no_aspm(void);
 bool pcie_aspm_support_enabled(void);
 bool pcie_aspm_enabled(struct pci_dev *pdev);
@@ -1785,7 +1785,7 @@ static inline int pci_disable_link_state(struct pci_dev *pdev, int state)
 { return 0; }
 static inline int pci_disable_link_state_locked(struct pci_dev *pdev, int state)
 { return 0; }
-static inline int pci_enable_link_state(struct pci_dev *pdev, int state)
+static inline int pci_set_default_link_state(struct pci_dev *pdev, int state)
 { return 0; }
 static inline void pcie_no_aspm(void) { }
 static inline bool pcie_aspm_support_enabled(void) { return false; }
-- 
2.30.2


