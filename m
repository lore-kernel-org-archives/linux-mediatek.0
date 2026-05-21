Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C94CD5BAF
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 May 2026 17:20:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JVuwPZqwH+POZcdbj/NmNEAj+bCTq3Cg4BUiBPTfuww=; b=vY8aoTrookEcAdwfq2m/cfCNYu
	hV9csgt2yVKw2ZRZYHBoFxKN7lr9ENkN2fS5IhKi6UOx/1Apb6swHJJLwDp2GGh8YYqJH8TpeQHue
	PiSRHb7iEFIojDkK2fUA8q0P3UBHcZtwDFFlclKhbKGz3lOlT2L8KI6bk3TYcDWUXvEfeR5GSGi5p
	k2UzkG3KpOf7eUyU/F0bK2Gitc2amiN0kjTE/elBgaxBAJfPdSOxLmz/PumNRdeJoQuGCxNvaVBda
	fSpJLoulajm3wKPuRQcECCgk/YQPjfDTnH5OPxe5sH8kspBgUVVcAeTRz/5m8oGEMyHMj+32newLt
	VQOIks1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ745-00000008cJ8-0GT2;
	Thu, 21 May 2026 17:20:09 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ741-00000008cHo-2VZ2
	for linux-mediatek@lists.infradead.org;
	Thu, 21 May 2026 17:20:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6CBB645B033;
	Thu, 21 May 2026 19:19:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1779384001; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=JVuwPZqwH+POZcdbj/NmNEAj+bCTq3Cg4BUiBPTfuww=;
	b=sC3HuWKZZ6nY3DoYPYuOojJGJxpn23UUeOt5OAgQRScLqVb7SExyjjYhn5rd+tc6Uq+oA0
	P0/f0SnnsHv/8Y2KKJ3lMJ/vpOf5Ryjar/3tt7wg3QWfCvlXJZJnMob5ORcUPLbbNCB6tM
	AlS5H4lOGkaC1isy0WLYl50l6UtNpp8yseXm5+08oOMIE9n/oktPAQbFXFgHErPrymeaZ3
	ocdNRKsjwj2oWR+YfVI5cYZILpBixYiGeD54fmqBeT91VTbCrj3pPY2lfsfnl1hgvRDUe5
	gg3L2anvowVOvMU8EniHQjGaA9XvqOZawoQexFZZKVr6o2q25uH07mHymzY6OA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-pci@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	naseefkm@gmail.com,
	ryder.lee@mediatek.com,
	helgaas@kernel.org,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	ansuelsmth@gmail.com,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Caleb James DeLisle <cjd@cjdns.fr>
Subject: [PATCH v9 0/3] Add EcoNet EN7528 (and EN751221) PCIe support.
Date: Thu, 21 May 2026 17:19:48 +0000
Message-Id: <20260521171951.1495781-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_102006_051762_4814DCA6 
X-CRM114-Status: UNSURE (   7.15  )
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

Tested on TpLink Archer VR1200V-V2 (EN751221 with Gen2 device)

Changes since v8:
* guard(rwsem_read)(&pci_bus_sem); in mtk_pcie_retrain
* v8: https://lore.kernel.org/linux-mips/20260520183827.908243-1-cjd@cjdns.fr

Changes from v7:
* mtk_pcie_retrain retrain all root ports not just first
* Include fix from Manivannan Sadhasivam, wrong usage of virt_to_phys()
* v7: https://lore.kernel.org/linux-mips/20260514151318.3444959-1-cjd@cjdns.fr

Changes from v6:
* s/reset/resets/ in .yaml
* s/re-train/retrain/g
* s/Root bridge/Root port/
* If module not builtin, log at mtk_pcie_startup_port_en7528()
* Do not fail if error in mtk_pcie_retrain()
* v6: https://lore.kernel.org/linux-mips/20260513191652.3200607-1-cjd@cjdns.fr

Changes from v5:
* s/errno-base.h/errno.h/
* Breakout mtk_pcie_retrain() into a function
* Use for_each_pci_bridge() to find root bridge
* v5: https://lore.kernel.org/linux-mips/20260413140339.16238-1-cjd@cjdns.fr/

Changes from v4:
* Fixed missing Acked-by
* Rebased to commit 66672af7a095 ("Add linux-next specific files for 20260410")
* v4: https://lore.kernel.org/linux-mips/20260404182854.2183651-1-cjd@cjdns.fr/

Changes from v3:
* s/initiallized/initialized/
* Use PCIE_T_PVPERL_MS for sleep time
* Use PCI_PM_D3COLD_WAIT for startup wait time
* Clarify comment "Activate INTx interrupts"
* Add MTK_PCIE_RETRAIN quirk for devices which require link re-train
* Do not retrain *all* bridges, only root bridge
* Better comments and logging in retraining logic
* v3: https://lore.kernel.org/linux-mips/20260320094212.696671-1-cjd@cjdns.fr/

Changes from v2:
* mediatek-pcie.yaml -> s/power-domain/power-domains/ and drop example
* Patch 3 dropped as it has been applied (Thanks!)
* v2: https://lore.kernel.org/linux-mips/20260316155157.679533-1-cjd@cjdns.fr/

Changes from v1:
* mediatek-pcie.yaml slot0 needs device-type = "pci", fix dt_binding_check
Link: https://lore.kernel.org/linux-mips/177334026016.3889069.9474337544951486443.robh@kernel.org
* v1: https://lore.kernel.org/linux-mips/20260312165332.569772-1-cjd@cjdns.fr/

This was split from a larger PCIe patchset which crossed multiple
subsystems. I'm not labeling this a v3 because it's a new patchset, but
I'm keeping the historical record anyway.

Changes from econet-pcie v2:
* mediatek-pcie.yaml add missing constraints to PCI node properties
* econet-pcie v2: https://lore.kernel.org/linux-mips/20260309131818.74467-1-cjd@cjdns.fr

Changes from econet-pcie v1:
* pcie-mediatek.c Exclude pcie_retrain_link() when building as a module
* econet-pcie v1: https://lore.kernel.org/linux-mips/20260303190948.694783-1-cjd@cjdns.fr/


Caleb James DeLisle (2):
  dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
  PCI: mediatek: Add support for EcoNet EN7528 SoC

Manivannan Sadhasivam (1):
  PCI: mediatek: Use actual physical address instead of virt_to_phys()

 .../bindings/pci/mediatek-pcie.yaml           |  26 +++
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-mediatek.c        | 170 +++++++++++++++++-
 3 files changed, 194 insertions(+), 4 deletions(-)


base-commit: 687da68900cd1a46549f7d9430c7d40346cb86a0
-- 
2.39.5


