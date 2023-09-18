Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F335CD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 13:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2zhdSzCh63cqyYevgFdjNtRFf3fnzFQ0lY4h4VWy3zs=; b=An9Nd7PHNDxZ10ZjDLHFUWAw6e
	xLJ4DyURjvw9cXVhHpI/aaKCUfKPwJkm0gz4GvSGv2eMQEluRsFX46spYhMTVvkTYAKWaWGFcUFzM
	Dtxzfk9OAQfFb/rtqNWOR6mR2Mu1nj1FCB14y3zP1xQMTXq3nZvy21kZn9D6mvbrGvWEoM5jp9DBZ
	ZLg/pjS0FRoj2Jt0NrefmfHqo6XfAkrL7homCn8bQ1WIhtq9NYe07VlpoTC1xajJG+iqlLJ6t3S1P
	o8/GxC9NWQGNsCU0THMGZvwqf2rE1vpdmsEISGW8CRkoovYXqYunuI7B7kaLJY8BXn+aPDuu0ifvO
	W+AWrm5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEBF-00FXkU-15;
	Mon, 18 Sep 2023 13:20:49 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAt-00FXGW-0a;
	Mon, 18 Sep 2023 13:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043227; x=1726579227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1z4zU2kddqvhSnJhYzQ+kzmt/kJVDZXOqL2l9VfDNaA=;
  b=XNh5/HiSwyY0Q9XLS4f0+8qqLKhdTr52XorXeLcCpSK/0zsphLfEBqs9
   k4XkuG6hvKIs3d5SsSg7iLlBUXAwEtUx96JmWGSNCkeUltYTs/HL8ECNI
   lVuWPubxKAwtyhMZC11jHE56GGW7mHgIdbSYKwG7gjBXYuunmnmCeQVfJ
   FFcbQLhzSbD/ZscIxZTRSSO1Bvh/OVNayzKfWjE5vWx4nTvxA7uCma0Q+
   Sam2ZqHhEzDSvdWZZzWw+ngyjnh2FkQ6kb1rnD65BGhLm8fyaVfCEe9P4
   EZyom4IKQ9CVw+3tfKNZ3xvlYtO3Mj9b3EqSQXXdnbdyzOQou7zWp4W+o
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113506"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113506"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811342626"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811342626"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:01 -0700
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
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 09/13] wifi: ath10k: Use pci_disable/enable_link_state()
Date: Mon, 18 Sep 2023 16:10:59 +0300
Message-Id: <20230918131103.24119-10-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_062027_415375_FA00640D 
X-CRM114-Status: GOOD (  10.45  )
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

ath10k driver adjusts ASPM state itself which leaves ASPM service
driver in PCI core unaware of the link state changes the driver
implemented.

Call pci_disable_link_state() and pci_enable_link_state() instead of
adjusting ASPMC field in LNKCTL directly in the driver and let PCI core
handle the ASPM state management.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/net/wireless/ath/ath10k/pci.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 23f366221939..64f7133ce122 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1963,9 +1963,8 @@ static int ath10k_pci_hif_start(struct ath10k *ar)
 	ath10k_pci_irq_enable(ar);
 	ath10k_pci_rx_post(ar);
 
-	pcie_capability_clear_and_set_word(ar_pci->pdev, PCI_EXP_LNKCTL,
-					   PCI_EXP_LNKCTL_ASPMC,
-					   ar_pci->link_ctl & PCI_EXP_LNKCTL_ASPMC);
+	pci_enable_link_state(ar_pci->pdev, ar_pci->link_ctl &
+			      (PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1));
 
 	return 0;
 }
@@ -2822,8 +2821,7 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar,
 
 	pcie_capability_read_word(ar_pci->pdev, PCI_EXP_LNKCTL,
 				  &ar_pci->link_ctl);
-	pcie_capability_clear_word(ar_pci->pdev, PCI_EXP_LNKCTL,
-				   PCI_EXP_LNKCTL_ASPMC);
+	pci_disable_link_state(ar_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 
 	/*
 	 * Bring the target up cleanly.
-- 
2.30.2


