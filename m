Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DA5C46CA1
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 13:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DtUvR2ykzGk+Iwv9BjnZvZG1qw5+70af/yHXrvzYB3o=; b=XFhYkm2HGgO393IWXXMFTmJ1IL
	ZAK0Ev9NuPcp/6eCZM/lZq561o/sRVXphOWcoMMS+A6rXQw8JXVK0aX9q86jgIYZjZkIG9ZxZu18X
	MTPulA3mC/mdV5QMXjfViYCwXYXVC0RTkLlHZAUQINuVezA4I1D0eKTlRplG9zIOFOTS237ydFO7E
	NyB5RPtAGylHbZBxifXF1m2ut2/Q0y54JcVcxiUHZA6tU3GGJWaGaZyMojGyAfKPgwu9iK4IVgfLh
	ndyUgzPHOaulsJ1m1gEeKYMEAes4HrGgDCr/LM7zJ5sjBgeBYyeyiudK1yk4R21SD8yw0numF2GVC
	Q+SaH+3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEB2-00FXXW-1z;
	Mon, 18 Sep 2023 13:20:36 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAq-00FXKv-2d;
	Mon, 18 Sep 2023 13:20:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043224; x=1726579224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=zTpTCMfWjtWGKDy0jqcFW3mar26wQ+s3+v+7yTP0erY=;
  b=Lr7+IRXtRL71oZL8ScPvO+zvaDQmjt6H6c+VuTMBWqrXX31ys+Vq8/SN
   dSnzCu4GZLJ/lU9142Uq9AwW/rE0k2X13YE7qyKdGwpMyi8g4JTGwFWcT
   XYVZxEn5JgbMqC6V06AvBkM29wLQ8FBmvmouOJAHl6KFr98q8LWws/89/
   k6m3v4lAE/7zIO1bwfPu64IJf8bWNpV056yxZrwKiheMS38ghtQ/ppWz0
   Jrr6FVRdIBs/1LPgMO/x3Hl9PsfHChugJT5YKn2T7QgLFPxC7rXWQJpAX
   E68TKiUaiZWN4nKGcr+hWofkxv6D7dimpJIbI1+qUZKcf0KoDtUIGmmqi
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113489"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113489"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811342491"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811342491"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:54 -0700
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
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	intel-wired-lan@lists.osuosl.org,
	netdev@vger.kernel.org
Cc: ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 08/13] e1000e: Remove unreliable pci_disable_link_state{,_locked}() workaround
Date: Mon, 18 Sep 2023 16:10:58 +0300
Message-Id: <20230918131103.24119-9-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_062024_945779_2977DB50 
X-CRM114-Status: GOOD (  14.11  )
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

pci_disable_link_state() and pci_disable_link_state_locked() were made
reliable regardless of ASPM CONFIG and OS being disallowed to change
ASPM states to allow drivers to rely on them working.

Remove driver working around unreliable
pci_disable_link_state{,_locked}() from e1000e driver and just call the
functions directly.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/net/ethernet/intel/e1000e/netdev.c | 77 +---------------------
 1 file changed, 2 insertions(+), 75 deletions(-)

diff --git a/drivers/net/ethernet/intel/e1000e/netdev.c b/drivers/net/ethernet/intel/e1000e/netdev.c
index f536c856727c..fbe468061591 100644
--- a/drivers/net/ethernet/intel/e1000e/netdev.c
+++ b/drivers/net/ethernet/intel/e1000e/netdev.c
@@ -6765,79 +6765,6 @@ static int __e1000_shutdown(struct pci_dev *pdev, bool runtime)
 	return 0;
 }
 
-/**
- * __e1000e_disable_aspm - Disable ASPM states
- * @pdev: pointer to PCI device struct
- * @state: bit-mask of ASPM states to disable
- * @locked: indication if this context holds pci_bus_sem locked.
- *
- * Some devices *must* have certain ASPM states disabled per hardware errata.
- **/
-static void __e1000e_disable_aspm(struct pci_dev *pdev, u16 state, int locked)
-{
-	struct pci_dev *parent = pdev->bus->self;
-	u16 aspm_dis_mask = 0;
-	u16 pdev_aspmc, parent_aspmc;
-
-	switch (state) {
-	case PCIE_LINK_STATE_L0S:
-	case PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1:
-		aspm_dis_mask |= PCI_EXP_LNKCTL_ASPM_L0S;
-		fallthrough; /* can't have L1 without L0s */
-	case PCIE_LINK_STATE_L1:
-		aspm_dis_mask |= PCI_EXP_LNKCTL_ASPM_L1;
-		break;
-	default:
-		return;
-	}
-
-	pcie_capability_read_word(pdev, PCI_EXP_LNKCTL, &pdev_aspmc);
-	pdev_aspmc &= PCI_EXP_LNKCTL_ASPMC;
-
-	if (parent) {
-		pcie_capability_read_word(parent, PCI_EXP_LNKCTL,
-					  &parent_aspmc);
-		parent_aspmc &= PCI_EXP_LNKCTL_ASPMC;
-	}
-
-	/* Nothing to do if the ASPM states to be disabled already are */
-	if (!(pdev_aspmc & aspm_dis_mask) &&
-	    (!parent || !(parent_aspmc & aspm_dis_mask)))
-		return;
-
-	dev_info(&pdev->dev, "Disabling ASPM %s %s\n",
-		 (aspm_dis_mask & pdev_aspmc & PCI_EXP_LNKCTL_ASPM_L0S) ?
-		 "L0s" : "",
-		 (aspm_dis_mask & pdev_aspmc & PCI_EXP_LNKCTL_ASPM_L1) ?
-		 "L1" : "");
-
-#ifdef CONFIG_PCIEASPM
-	if (locked)
-		pci_disable_link_state_locked(pdev, state);
-	else
-		pci_disable_link_state(pdev, state);
-
-	/* Double-check ASPM control.  If not disabled by the above, the
-	 * BIOS is preventing that from happening (or CONFIG_PCIEASPM is
-	 * not enabled); override by writing PCI config space directly.
-	 */
-	pcie_capability_read_word(pdev, PCI_EXP_LNKCTL, &pdev_aspmc);
-	pdev_aspmc &= PCI_EXP_LNKCTL_ASPMC;
-
-	if (!(aspm_dis_mask & pdev_aspmc))
-		return;
-#endif
-
-	/* Both device and parent should have the same ASPM setting.
-	 * Disable ASPM in downstream component first and then upstream.
-	 */
-	pcie_capability_clear_word(pdev, PCI_EXP_LNKCTL, aspm_dis_mask);
-
-	if (parent)
-		pcie_capability_clear_word(parent, PCI_EXP_LNKCTL,
-					   aspm_dis_mask);
-}
-
 /**
  * e1000e_disable_aspm - Disable ASPM states.
  * @pdev: pointer to PCI device struct
@@ -6848,7 +6775,7 @@ static void __e1000e_disable_aspm(struct pci_dev *pdev, u16 state, int locked)
  **/
 static void e1000e_disable_aspm(struct pci_dev *pdev, u16 state)
 {
-	__e1000e_disable_aspm(pdev, state, 0);
+	pci_disable_link_state(pdev, state);
 }
 
 /**
@@ -6861,7 +6788,7 @@ static void e1000e_disable_aspm(struct pci_dev *pdev, u16 state)
  **/
 static void e1000e_disable_aspm_locked(struct pci_dev *pdev, u16 state)
 {
-	__e1000e_disable_aspm(pdev, state, 1);
+	pci_disable_link_state_locked(pdev, state);
 }
 
 static int e1000e_pm_thaw(struct device *dev)
-- 
2.30.2


