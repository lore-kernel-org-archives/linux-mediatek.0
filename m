Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA114CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 13:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/TC1u7gT8HKB4gXUtL/XOeGJcNwejVQ8csHh1ehEss=; b=FDMxDTFFU3zazeErlWnE0e/d2Q
	9dg0lBuoPxZpL3jtdaxUxA+pc6A2YzVkO0Y68OrzE8EEstNEWi5XdJTvNh0s4tSbJa8XvvwjEMBKX
	+veG7RI/0k32J3s7PKqsqNbbU5iYIH9R5+1rluHYowRvzwPV4Tx2TLtNBLX8rETBDuBhXW91mdR+U
	2or8Beo46fY3lXdljUl3S4YXfhp20QF09U2tN8f6PcAhPBTR8wcSuOa3lFnFmyvDAtKRt3U+Mdfsn
	Z/xvjvhTYCFqIC0BCqlXTMVw4VCjpwtqTIpZ+fyIqhsrj9wn0YgSR9u7v9h9LrupJlhX92EL4z3i3
	Kd+zDn9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAr-00FXM1-1u;
	Mon, 18 Sep 2023 13:20:25 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAl-00FXGW-31;
	Mon, 18 Sep 2023 13:20:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043219; x=1726579219;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=fG2lEBkT7mIaWcABDtYlaKTuVQodmkE/Rpx2qX2kUFA=;
  b=aK86d0A3YnVdChzVFZOg08jb7R0DQrmixnYJymxjWfTiOUovbeLVZtyj
   vyekFHUzwltYI5uHOAD1g+GgysBGDddnJ3kyAqGEDGbYUKN97rwuJkOgi
   g98S1PvsTFrbaF1MDjRULwLoVgiOfsGfqNdha3idymU5O3rVI3AgQ0Kel
   yUQPOaVcFrNTpop1uv359pjyAfY9yMcJGdO5ZbDdzct9FE2eCZUDinFJN
   q2bZWWzFlcYpCmjXFtnNLhAeq16sJpd1PwRoQv+Qi1Gf94kf9iFgc8Rqa
   xbCB0nke3qoWkZU1wThhJ3QYVHLFERSHeMF6DpHZuVLHbImGa0SK0NcAg
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113440"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113440"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811342282"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811342282"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:38 -0700
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
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Marcel Holtmann <marcel@holtmann.org>,
	Johan Hedberg <johan.hedberg@gmail.com>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org
Cc: ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 06/13] Bluetooth: hci_bcm4377: Convert aspm disable to quirk
Date: Mon, 18 Sep 2023 16:10:56 +0300
Message-Id: <20230918131103.24119-7-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_062020_021040_F5C7A4B4 
X-CRM114-Status: GOOD (  14.76  )
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

pci_disable_link_state() was made reliable regardless of ASPM CONFIG
and OS being disallowed to change ASPM states to allow drivers to rely
on pci_disable_link_state() working.

Remove driver working around unreliable pci_disable_link_state() from
hci_bcm4377 driver and add a PCI quirk to disable ASPM.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/bluetooth/hci_bcm4377.c | 20 --------------------
 drivers/pci/quirks.c            |  3 +++
 2 files changed, 3 insertions(+), 20 deletions(-)

diff --git a/drivers/bluetooth/hci_bcm4377.c b/drivers/bluetooth/hci_bcm4377.c
index 19ad0e788646..2348ee2380db 100644
--- a/drivers/bluetooth/hci_bcm4377.c
+++ b/drivers/bluetooth/hci_bcm4377.c
@@ -490,7 +490,6 @@ struct bcm4377_data;
  * clear_pciecfg_subsystem_ctrl_bit19: Set to true if bit 19 in the
  *                                     vendor-specific subsystem control
  *                                     register has to be cleared
- * disable_aspm: Set to true if ASPM must be disabled due to hardware errata
  * broken_ext_scan: Set to true if the chip erroneously claims to support
  *                  extended scanning
  * broken_mws_transport_config: Set to true if the chip erroneously claims to
@@ -509,7 +508,6 @@ struct bcm4377_hw {
 
 	unsigned long has_bar0_core2_window2 : 1;
 	unsigned long clear_pciecfg_subsystem_ctrl_bit19 : 1;
-	unsigned long disable_aspm : 1;
 	unsigned long broken_ext_scan : 1;
 	unsigned long broken_mws_transport_config : 1;
 
@@ -2222,20 +2220,6 @@ static int bcm4377_probe_of(struct bcm4377_data *bcm4377)
 	return 0;
 }
 
-static void bcm4377_disable_aspm(struct bcm4377_data *bcm4377)
-{
-	pci_disable_link_state(bcm4377->pdev,
-			       PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
-
-	/*
-	 * pci_disable_link_state can fail if either CONFIG_PCIEASPM is disabled
-	 * or if the BIOS hasn't handed over control to us. We must *always*
-	 * disable ASPM for this device due to hardware errata though.
-	 */
-	pcie_capability_clear_word(bcm4377->pdev, PCI_EXP_LNKCTL,
-				   PCI_EXP_LNKCTL_ASPMC);
-}
-
 static void bcm4377_pci_free_irq_vectors(void *data)
 {
 	pci_free_irq_vectors(data);
@@ -2288,9 +2272,6 @@ static int bcm4377_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 		return -ENODEV;
 	}
 
-	if (bcm4377->hw->disable_aspm)
-		bcm4377_disable_aspm(bcm4377);
-
 	ret = pci_reset_function_locked(pdev);
 	if (ret)
 		dev_warn(
@@ -2448,7 +2429,6 @@ static const struct bcm4377_hw bcm4377_hw_variants[] = {
 		.otp_offset = 0x4120,
 		.bar0_window1 = 0x1800b000,
 		.bar0_window2 = 0x1810c000,
-		.disable_aspm = true,
 		.broken_ext_scan = true,
 		.send_ptb = bcm4377_send_ptb,
 	},
diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index eeec1d6f9023..d6ab0e98013f 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -2502,6 +2502,9 @@ static void quirk_disable_aspm_l0s_l1(struct pci_dev *dev)
  */
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_ASMEDIA, 0x1080, quirk_disable_aspm_l0s_l1);
 
+/* BCM4377 must always disable ASPM due to hardware errata. */
+DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_BROADCOM, 0x5fa0, quirk_disable_aspm_l0s_l1);
+
 /*
  * Some Pericom PCIe-to-PCI bridges in reverse mode need the PCIe Retrain
  * Link bit cleared after starting the link retrain process to allow this
-- 
2.30.2


