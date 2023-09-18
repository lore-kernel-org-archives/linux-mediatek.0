Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97969CD13D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 13:18:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srslaMf53cmqJmB/WU04epzua9/FTF59REZaS2Rz7b4=; b=rz55mNY6javXBg37kcXoDkbG/p
	ju1asS7hdc6B69PPrjEd+8FdApc9MiTQJDo9b1oQXo+J+GF058rhTHmWrtIgEXfYz7WdAAnEsZ4ul
	QmooHY0RuCrUeCgTZeYJs38j8McXBi0cuTee4k3EviBKeX5l5tbbqd4mNNtaAkS4zn+A1ziPBIHFu
	6GMzVnVQJzHyYWoBIGKRGTEWPYjYLxtXCo6ZTsCbG3wJLAUzdHN/lWVOeWkCEBJhvf9d6poYCXdEg
	pLo0yiGx7ll7ZgYt/79/f8loyV8E4ybHvKJsP88bjZY55maTiWdSAs4B0Uk5i6oHm40Tg5ObB1W1v
	fDazPIGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE9O-00FWa1-1P;
	Mon, 18 Sep 2023 13:18:54 +0000
Received: from mgamail.intel.com ([134.134.136.100])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE9K-00FWXt-2T;
	Mon, 18 Sep 2023 13:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695043130; x=1726579130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=GntG1C/Of1kw8Cak4jvrKOjbZB9Dh17vQJmAQuf8VNA=;
  b=eL7u45zipEtku7/bGnBSatSBQ5a8u5ddZm98SipC4RNsAzG1FoH/oy/b
   xxjmVRgdiegzUv3BtAxZ0Vl6PHUFiy8A5ptOuUzUHgy0suKVB1sdLD7It
   rpWxL9sGPkyZ9ZA6WASs+9mPddL3bMkml6Fer2aMU45bJpQ8L0S4Qj3oQ
   AGAPwX/2F0bocIFZh6DIIePdSFCQKKlV85U3vrRFgUm93O6jDErwvy/W7
   2ocB03i6vuKsTuyXDEsgB6dIDt1ctY5flYRyFDFYHVAQG6EVe7uOrTewF
   MjHQjLjWapm0oUkUX6zJrhVtxGL8JLMFqsVMWn3NCWWGCFnB0Kpgan/If
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446112782"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="446112782"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:11:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="811341486"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; 
   d="scan'208";a="811341486"
Received: from nprotaso-mobl1.ccr.corp.intel.com (HELO ijarvine-mobl2.ger.corp.intel.com) ([10.252.49.156])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2023 06:11:37 -0700
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
Subject: [PATCH v2 02/13] PCI/ASPM: Improve pci_set_default_link_state() kerneldoc
Date: Mon, 18 Sep 2023 16:10:52 +0300
Message-Id: <20230918131103.24119-3-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
References: <20230918131103.24119-1-ilpo.jarvinen@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_061850_844902_1E9FE9F9 
X-CRM114-Status: GOOD (  12.63  )
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

Improve pci_set_default_link_state() documentation:

- Note the link state may get changed if the default policy is in use
- Better follow kerneldoc formatting guidelines (separate description
  block and return entries)

Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/pci/pcie/aspm.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/pcie/aspm.c b/drivers/pci/pcie/aspm.c
index fc909e20365f..860bc94974ec 100644
--- a/drivers/pci/pcie/aspm.c
+++ b/drivers/pci/pcie/aspm.c
@@ -1102,14 +1102,18 @@ int pci_disable_link_state(struct pci_dev *pdev, int state)
 EXPORT_SYMBOL(pci_disable_link_state);
 
 /**
- * pci_set_default_link_state - Clear and set the default device link state so
- * that the link may be allowed to enter the specified states. Note that if the
- * BIOS didn't grant ASPM control to the OS, this does nothing because we can't
- * touch the LNKCTL register. Also note that this does not enable states
- * disabled by pci_disable_link_state(). Return 0 or a negative errno.
- *
+ * pci_set_default_link_state - Set the default device link state
  * @pdev: PCI device
  * @state: Mask of ASPM link states to enable
+ *
+ * Set the default device link state so that the link may be allowed to
+ * enter the specified states. If the default policy is in use, the link
+ * state may also be updated to reflect the new default link state. Note
+ * that if the BIOS didn't grant ASPM control to the OS, this does nothing
+ * because we can't touch the LNKCTL register. Also note that this does not
+ * enable states disabled by pci_disable_link_state().
+ *
+ * Return: 0 or a negative errno.
  */
 int pci_set_default_link_state(struct pci_dev *pdev, int state)
 {
-- 
2.30.2


