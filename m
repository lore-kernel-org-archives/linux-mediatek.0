Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6722CD37AC
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 May 2026 19:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t+hA9k+ktRJ0aukF5hp1hKdiqKCa091x1jCP/SKfXF8=; b=wQSiIvG11qqMjfxsw2MkVY8LoZ
	8+Qd2eExIaGiM3id/LXa4UzVmfaXE3LAs4ywJtztcCB6AUfgQ9YvWqTOPBH9VEwbi6wGtvROp5yzx
	nwCkvfZpuhMxWn5ztC+LNaDXxXcuIy8TFvM/e5kcQMPHZ8eaCLbnNPHJw0air0F2KkjF/lO2W9eiz
	PFCresQMXvlRsASJ1KH7fhsIkfVrsRQDKaPHkI2r2M59U8UL+krc9NOPOl+IuAV99LP4fa3SOOhCp
	WxuYFADn7Dn935jSVnopaiVlBf3kAC9gJOy+CSRInMmsDam/O1N7SV3AkdvKNBQny93muxlQ9qRE3
	bEBLHJbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNF4w-00000003YP4-2sKc;
	Wed, 13 May 2026 19:17:10 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNF4t-00000003YNo-3RGE
	for linux-mediatek@lists.infradead.org;
	Wed, 13 May 2026 19:17:09 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BEA863C5B23;
	Wed, 13 May 2026 21:17:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1778699824; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=t+hA9k+ktRJ0aukF5hp1hKdiqKCa091x1jCP/SKfXF8=;
	b=j+DVAufeDZjhm7TVd0m6Vhn8/jd/o6UvgXoKucLvwZtovmZDE9DoKj/+D2jKipDrOLHA6r
	esKS6GH6jWTWG0fhTafcmUiufkHR7QoMUal241QSxD017W2bkgWbON87SBcYgb0baexLu4
	Yi9BiBCaSztuzR6enPJSwpxVik9KyJ/wyOMrQo9LCFlXigeo7WK4eW2vR22KnBCI6BD2x+
	yjNsF4auaQ1mcZSwLtZtb7WVaNk9g2nsaCF1UNXciAMpC+IABB1c5LrhNOvxDYtG5K3BR2
	fc4sL3xV9IZxunsIppR9rueicaV5C+Y5urGGv8Rj+XxEkxYjsi2qFsBOhB1hbg==
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
Subject: [PATCH v6 0/2] Add EcoNet EN7528 (and EN751221) PCIe support.
Date: Wed, 13 May 2026 19:16:50 +0000
Message-Id: <20260513191652.3200607-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_121708_323573_63086FBC 
X-CRM114-Status: UNSURE (   6.93  )
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

Changes from v5:
* s/errno-base.h/errno.h/
* Breakout mtk_pcie_retrain() into a function
* Use for_each_pci_bridge() to find root bridge
* v5: https://lore.kernel.org/linux-mips/20260413140339.16238-1-cjd@cjdns.fr/

Changes from v4:
* Fixed missing Acked-by
* Rebased to 66672af7a095d89f082c5327f3b15bc2f93d558e
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

 .../bindings/pci/mediatek-pcie.yaml           |  26 +++
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-mediatek.c        | 150 ++++++++++++++++++
 3 files changed, 177 insertions(+), 1 deletion(-)


base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
-- 
2.39.5


