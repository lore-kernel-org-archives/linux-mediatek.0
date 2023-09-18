Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07F6BCD13D8
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 13:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UCfLuylS5mlTJri5OrkWw39dG1L9JsgH5woxfhcXej4=; b=hq8az4r7GbGCuZjM2XmOrVOAkx
	oMixVSpFqd4UcrTOIcS8UTxZa+WK2kRlAvdOH7c2vZncFTsutZS78p2i1+aTv5hihbo39yIs2FkNB
	10OpgFodVTvlCZlyR1/NREaRo5CMvL2t30zwyemro32vvLq93OkVUtpY5ytHc7yG0E19Vua/93Pmo
	iEeiGaBfAAxDb+ujGwUIByAKCUYIZtZ0gkHbttgObubU3kqQpBadhLG9rlEd8VDu/vn38ZBygcvhy
	HCDjZNc+/vJv5JEbWkufXGqxPr9Fy3V3OECTAkewCmoaXVQarzV4qwssLIKZXlq8/v26c/hxjPqiW
	DZXBtwyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEBu-00FYMj-1o;
	Mon, 18 Sep 2023 13:21:30 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEBV-00FXun-17;
	Mon, 18 Sep 2023 13:21:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043265; x=1726579265;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/jlflr+zDO/ybJEIj9ZeNbSBAg1LjrmA0JjnTT6qqL0=;
  b=JiwmXCqEQKdRA7Wz6HgGe3pNrxIADPe4FBx5dhiDbhqLquwu6TGs7Buu
   G177jpP9tybJlO7jGwf8RXsGQmbq6QSBXJHNulidr4DzZGq+ilQFQf8Yn
   QO6Zz9qZ1LtK6u8vnu4tXWgdJm2TmBDVIoSXB9tryQu3MZ5r5YIJauyx6
   ZC7Wg+fdzhq3I1GK3yYk5oNFF1l7Qk51/GlBDYPTne2uSJIxxN3w0S36+
   LKtIK+5Hvn/csxfAfObFayq6mi05PjoNnRbjy9sp89r9+ZBhUY1HXy1Pl
   IZk53AJhM7XttkZKIRFMKK47BaXtWjn0nu5sd6BqP2AfHLKQ94Y6ZGfNc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113648"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113648"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:14:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811343218"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811343218"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:54 -0700
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
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
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
Subject: [PATCH v2 13/13] misc: rtsx: Use pci_disable/enable_link_state()
Date: Mon, 18 Sep 2023 16:11:03 +0300
Message-Id: <20230918131103.24119-14-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_062105_449323_98E2F257 
X-CRM114-Status: GOOD (  10.98  )
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

rtsx driver adjusts ASPM state itself which leaves ASPM service
driver in PCI core unaware of the link state changes the driver
implemented.

Call pci_disable_link_state() and pci_enable_link_state() instead of
adjusting ASPMC field in LNKCTL directly in the driver and let PCI core
handle the ASPM state management.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/misc/cardreader/rts5228.c  | 6 ++----
 drivers/misc/cardreader/rts5261.c  | 6 ++----
 drivers/misc/cardreader/rtsx_pcr.c | 8 +++++---
 3 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/cardreader/rts5228.c b/drivers/misc/cardreader/rts5228.c
index f4ab09439da7..8d3216c64ad1 100644
--- a/drivers/misc/cardreader/rts5228.c
+++ b/drivers/misc/cardreader/rts5228.c
@@ -497,8 +497,7 @@ static void rts5228_enable_aspm(struct rtsx_pcr *pcr, bool enable)
 	val = FORCE_ASPM_CTL0 | FORCE_ASPM_CTL1;
 	val |= (pcr->aspm_en & 0x02);
 	rtsx_pci_write_register(pcr, ASPM_FORCE_CTL, mask, val);
-	pcie_capability_clear_and_set_word(pcr->pci, PCI_EXP_LNKCTL,
-					   PCI_EXP_LNKCTL_ASPMC, pcr->aspm_en);
+	pci_enable_link_state(pcr->pci, pcr->aspm_en);
 	pcr->aspm_enabled = enable;
 }
 
@@ -509,8 +508,7 @@ static void rts5228_disable_aspm(struct rtsx_pcr *pcr, bool enable)
 	if (pcr->aspm_enabled == enable)
 		return;
 
-	pcie_capability_clear_and_set_word(pcr->pci, PCI_EXP_LNKCTL,
-					   PCI_EXP_LNKCTL_ASPMC, 0);
+	pci_disable_link_state(pcr->pci, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 	mask = FORCE_ASPM_VAL_MASK | FORCE_ASPM_CTL0 | FORCE_ASPM_CTL1;
 	val = FORCE_ASPM_CTL0 | FORCE_ASPM_CTL1;
 	rtsx_pci_write_register(pcr, ASPM_FORCE_CTL, mask, val);
diff --git a/drivers/misc/cardreader/rts5261.c b/drivers/misc/cardreader/rts5261.c
index 94af6bf8a25a..f1ef15683a2f 100644
--- a/drivers/misc/cardreader/rts5261.c
+++ b/drivers/misc/cardreader/rts5261.c
@@ -578,8 +578,7 @@ static void rts5261_enable_aspm(struct rtsx_pcr *pcr, bool enable)
 
 	val |= (pcr->aspm_en & 0x02);
 	rtsx_pci_write_register(pcr, ASPM_FORCE_CTL, mask, val);
-	pcie_capability_clear_and_set_word(pcr->pci, PCI_EXP_LNKCTL,
-					   PCI_EXP_LNKCTL_ASPMC, pcr->aspm_en);
+	pci_enable_link_state(pcr->pci, pcr->aspm_en);
 	pcr->aspm_enabled = enable;
 }
 
@@ -591,8 +590,7 @@ static void rts5261_disable_aspm(struct rtsx_pcr *pcr, bool enable)
 	if (pcr->aspm_enabled == enable)
 		return;
 
-	pcie_capability_clear_and_set_word(pcr->pci, PCI_EXP_LNKCTL,
-					   PCI_EXP_LNKCTL_ASPMC, 0);
+	pci_disable_link_state(pcr->pci, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 	rtsx_pci_write_register(pcr, ASPM_FORCE_CTL, mask, val);
 	rtsx_pci_write_register(pcr, SD_CFG1, SD_ASYNC_FIFO_NOT_RST, 0);
 	udelay(10);
diff --git a/drivers/misc/cardreader/rtsx_pcr.c b/drivers/misc/cardreader/rtsx_pcr.c
index a3f4b52bb159..6efb792152f2 100644
--- a/drivers/misc/cardreader/rtsx_pcr.c
+++ b/drivers/misc/cardreader/rtsx_pcr.c
@@ -86,9 +86,11 @@ static void rtsx_comm_set_aspm(struct rtsx_pcr *pcr, bool enable)
 		return;
 
 	if (pcr->aspm_mode == ASPM_MODE_CFG) {
-		pcie_capability_clear_and_set_word(pcr->pci, PCI_EXP_LNKCTL,
-						PCI_EXP_LNKCTL_ASPMC,
-						enable ? pcr->aspm_en : 0);
+		if (enable)
+			pci_enable_link_state(pcr->pci, pcr->aspm_en);
+		else
+			pci_disable_link_state(pcr->pci, PCIE_LINK_STATE_L0S |
+							 PCIE_LINK_STATE_L1);
 	} else if (pcr->aspm_mode == ASPM_MODE_REG) {
 		if (pcr->aspm_en & 0x02)
 			rtsx_pci_write_register(pcr, ASPM_FORCE_CTL, FORCE_ASPM_CTL0 |
-- 
2.30.2


