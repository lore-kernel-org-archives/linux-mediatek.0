Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54E9CD13D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 13:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zpo5FuQxOugQWaoY9+OBNmDAsg+rqZ8zbp7l7RnXoOw=; b=dDCS3623pcd0MxOSZOdmxeKg3u
	JBslIXMcma62TVnxEm8LzdXt3X4K1UGlQQeZSfPiPUlz7CJHAr9zGzzpnc4EuWSl7ddDewF8eYQqf
	WHYLoKOGETsaz/XsNxFLYTzJ7339Um7Ttcl29BIsDSrqquocjDcuvZ+gYP++PaE433IArfiz7/JvL
	mroS62tRgI3ShP5bSaPIU48S7Dyg/34SJioW/kPW5oARQWGAwKcPBcfgyJGLv5zOnpDMe/7eTiOte
	UI0I10OGVRs1qXvvRsMVsz4h5EBUu+b7HIedlXfJf/n47Q2x2XWiDwmkhWfLuT7KaHtLfyiSOwh53
	Vpq4HMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEBG-00FXlz-35;
	Mon, 18 Sep 2023 13:20:51 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiEAt-00FXKv-1b;
	Mon, 18 Sep 2023 13:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043227; x=1726579227;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TVpIxZltjnz+Zaq4u2l7j7EaR5dq+4x3KCuX5f2+zQ8=;
  b=ZL/mznTdcRVd3FUsv1YuHn9uT8KxjxFzPaK9Khv9HC8GzabU+q9GPD68
   jUcN5bpi0ju4a42prMvjP4tdRVoaEXJwzdwcJkxI5v5vWP5E2usqieY7t
   3S1DhZDsrAbUSP8lVxm5xpPCDZbBJS0n7Rs1r6pkDI6am8wFanUg2otgr
   oy7JhCqPvazjM0BOYjUgjlJFnadcxFYSbebfPgJISlFHBmgMLqeuhH9YG
   dIGsmz3g3NhBEllDWR1xVTD9vlRwVSkScuAE8eacDRMGJWOMMnrAi5cWv
   IYwG/RtmFZ9ecq/vk26ujkd+A4eZN1Q3L+2u0UuJQumQCMpmfPzS18LPr
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446113533"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446113533"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811342781"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811342781"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:13:17 -0700
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
	ath11k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org,
	ath12k@lists.infradead.org,
	intel-wired-lan@lists.osuosl.org,
	linux-arm-kernel@lists.infradead.org,
	linux-bluetooth@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-rdma@vger.kernel.org,
	netdev@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 10/13] wifi: ath11k: Use pci_disable/enable_link_state()
Date: Mon, 18 Sep 2023 16:11:00 +0300
Message-Id: <20230918131103.24119-11-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_062027_594548_F388AA1F 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

ath11k driver adjusts ASPM state itself which leaves ASPM service
driver in PCI core unaware of the link state changes the driver
implemented.

Call pci_disable_link_state() and pci_enable_link_state() instead of
adjusting ASPMC field in LNKCTL directly in the driver and let PCI core
handle the ASPM state management.

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/net/wireless/ath/ath11k/pci.c | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/pci.c b/drivers/net/wireless/ath/ath11k/pci.c
index a5aa1857ec14..764cdf74b0e9 100644
--- a/drivers/net/wireless/ath/ath11k/pci.c
+++ b/drivers/net/wireless/ath/ath11k/pci.c
@@ -582,19 +582,15 @@ static void ath11k_pci_aspm_disable(struct ath11k_pci *ab_pci)
 		   u16_get_bits(ab_pci->link_ctl, PCI_EXP_LNKCTL_ASPM_L1));
 
 	/* disable L0s and L1 */
-	pcie_capability_clear_word(ab_pci->pdev, PCI_EXP_LNKCTL,
-				   PCI_EXP_LNKCTL_ASPMC);
-
+	pci_disable_link_state(ab_pci->pdev, PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1);
 	set_bit(ATH11K_PCI_ASPM_RESTORE, &ab_pci->flags);
 }
 
 static void ath11k_pci_aspm_restore(struct ath11k_pci *ab_pci)
 {
 	if (test_and_clear_bit(ATH11K_PCI_ASPM_RESTORE, &ab_pci->flags))
-		pcie_capability_clear_and_set_word(ab_pci->pdev, PCI_EXP_LNKCTL,
-						   PCI_EXP_LNKCTL_ASPMC,
-						   ab_pci->link_ctl &
-						   PCI_EXP_LNKCTL_ASPMC);
+		pci_enable_link_state(ab_pci->pdev, ab_pci->link_ctl &
+				      (PCIE_LINK_STATE_L0S | PCIE_LINK_STATE_L1));
 }
 
 static int ath11k_pci_power_up(struct ath11k_base *ab)
-- 
2.30.2


