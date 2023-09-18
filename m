Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56842CD13D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 13:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mdb2wMHdr8CoVjkzTANz2jRL1uIvbsjlwfgTQD9IR2o=; b=0c2DzCqAVx00CmVp9tqNE6aeTq
	SnktydaPuf1uvadAKkcMuEiKJE25apKgttp6H4FKfYCYPtVbGUtKIROip/1toJLOrjGekxn/HfECV
	hW/v7mo2Uc2qNb/1gbQbUp/5Tmk9Km8GnVJu2VQz6i3Zpw6947/6SLwiqF965vJFwtbdYDYFStkxy
	xJSu/R2cOq0TbPXu0+mF15ZwjmEjlfIKg+y/rYwqT0SNnkbpxmCTSF+4ZdNR2GHIuAybEDKAwTdYC
	ff1lH6IpJBAnQrbGDoQ2FTKBnJQyb7WuVYEyG3/ATeYQVSCmkyYPI4ZH7KV34jIElj7dRazbvYgcH
	37ngsX1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEA8-00FWwj-0e;
	Mon, 18 Sep 2023 13:19:40 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEA5-00FWuq-0z;
	Mon, 18 Sep 2023 13:19:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043177; x=1726579177;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ymkN+p4ogpYhyDF99HjDp+8yFzsuK5k5J5zb7K9eDd0=;
  b=gENzDZyLcKKxWf5lOCdSrC+oU6M6ze6Tb/BqZWe5SQ5LYrC1PNXtGfEk
   gNKJ/hrGZNLuisNq0z4aNFwQXE90uU1lQo+E01d+MW1BTMKH2tfQtZOdj
   3C5beo4nyZfWELchxgtJvEZfZaCqHUsIKEkP+jFWG/PVoNldEUjuSxIVp
   2utKhCc3p+IL8ERm4XLXbCmDzw+y88GSLNPEJmfxqd0jiSxVv48kIaQtT
   8P2dPQ5kzUbiIlUKRt3PPXFNkOWKo/vAuWwFkJKhaOiTtGIynRfXgMzME
   bVJaSDugw5GyIy4QcNb1jvbt5drIEzxv88lwq++JzIOBt7wPABk/fxaJJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113125"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113125"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811341856"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811341856"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:12:02 -0700
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
Subject: [PATCH v2 04/13] PCI/ASPM: Move L0S/L1/sub states mask calculation into a helper
Date: Mon, 18 Sep 2023 16:10:54 +0300
Message-Id: <20230918131103.24119-5-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_061937_398019_50B3B6A5 
X-CRM114-Status: GOOD (  10.57  )
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

ASPM service driver does the same L0S / L1S / sub states allowed
calculation in __pci_disable_link_state() and
pci_set_default_link_state().

Create a helper to calculate the mask for the allowed states.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/aspm.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index ec6d7a092ac1..91dc95aca90f 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1034,6 +1034,26 @@ static struct pcie_link_state *pcie_aspm_get_link(struct pci_dev *pdev)
 	return bridge->link_state;
 }
 
+static u8 pci_link_state_mask(int state)
+{
+	u8 result = 0;
+
+	if (state & PCIE_LINK_STATE_L0S)
+		result |= ASPM_STATE_L0S;
+	if (state & PCIE_LINK_STATE_L1)
+		result |= ASPM_STATE_L1;
+	if (state & PCIE_LINK_STATE_L1_1)
+		result |= ASPM_STATE_L1_1;
+	if (state & PCIE_LINK_STATE_L1_2)
+		result |= ASPM_STATE_L1_2;
+	if (state & PCIE_LINK_STATE_L1_1_PCIPM)
+		result |= ASPM_STATE_L1_1_PCIPM;
+	if (state & PCIE_LINK_STATE_L1_2_PCIPM)
+		result |= ASPM_STATE_L1_2_PCIPM;
+
+	return result;
+}
+
 static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
 {
 	struct pcie_link_state *link = pcie_aspm_get_link(pdev);
@@ -1063,18 +1083,7 @@ static int __pci_disable_link_state(struct pci_dev *pdev, int state, bool sem)
 	if (sem)
 		down_read(&pci_bus_sem);
 	mutex_lock(&aspm_lock);
-	if (state & PCIE_LINK_STATE_L0S)
-		link->aspm_disable |= ASPM_STATE_L0S;
-	if (state & PCIE_LINK_STATE_L1)
-		link->aspm_disable |= ASPM_STATE_L1;
-	if (state & PCIE_LINK_STATE_L1_1)
-		link->aspm_disable |= ASPM_STATE_L1_1;
-	if (state & PCIE_LINK_STATE_L1_2)
-		link->aspm_disable |= ASPM_STATE_L1_2;
-	if (state & PCIE_LINK_STATE_L1_1_PCIPM)
-		link->aspm_disable |= ASPM_STATE_L1_1_PCIPM;
-	if (state & PCIE_LINK_STATE_L1_2_PCIPM)
-		link->aspm_disable |= ASPM_STATE_L1_2_PCIPM;
+	link->aspm_disable |= pci_link_state_mask(state);
 	pcie_config_aspm_link(link, policy_to_aspm_state(link));
 
 	if (state & PCIE_LINK_STATE_CLKPM)
-- 
2.30.2


