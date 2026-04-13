Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 465F8F34C54
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Apr 2026 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NXhe77XOmmJnTE3Wdolatqa0XdI56uh6Wqn3CSDWXH0=; b=CbEY8b2GPkn9kulWbmNr1nv1Y1
	xk5y6TiUcHp6KJkmvubTlc7wzk8NgbsrAlsILt3cH4+S3UYUtTSIccC09TwRPm13wPtm/t1OXJa+c
	6GW3g+2iNxAo1TdDsyA0DTDtkubyzficaBlp7+ifl1lsyr3zOZZTw5eeAl7Y50lzp/S4pVPCvGf0j
	sR0RFD2YN5hxubXeY1PCCQJsaU2+MmjV7eGB/0QXJfK43r47XVJKWhpaM+L7wstSJR0r6zFSbuIQ0
	Em1KcD8EFpHZ8KQQpMQX2lB4YrtL2+El4T00Y/tJjW5FNk0fuQJxepU9cl6lKGjmzQM0mJt4r8Fdf
	QB4+9lAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHtO-0000000FpYW-0Gcn;
	Mon, 13 Apr 2026 14:03:58 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCHtM-0000000FpXg-1FJd
	for linux-mediatek@lists.infradead.org;
	Mon, 13 Apr 2026 14:03:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9EF6B99E29;
	Mon, 13 Apr 2026 16:03:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1776089029; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=NXhe77XOmmJnTE3Wdolatqa0XdI56uh6Wqn3CSDWXH0=;
	b=o+vsWT8cWCB/LhTJv8AIarKVQzefHCK6loYoM0HwAPLTQ0NVDtUnDeeCB/CiwP/iouYgMO
	Jmk/8H+qv6cF+2RunlaKVhbsREgT/4MpgBxKP86ibiu8D2m6NEd8F+XCaetQfdueKA4wJO
	RXQ2IfOkmzwLapIxdrG1IyzfwL6NaUdoLDvhah+vmy3nkKXN4zGmf+Kwo1VjNnVBDG0EzO
	GeVR6+BrQ++MG15q5LZ5UQjwWzKU6Jq6P+Qb0c4VeNjuIRWsA7aBsa8Cj0v2TAfrE1eWKb
	POb7IorwHYhoekaFYxZlCGr5micQ3NMp1O9GnIPiomKdvp+oNB9zcHv7bx9Bvg==
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
Subject: [PATCH v5 0/2] PCI: mediatek: Add support for EcoNet SoCs
Date: Mon, 13 Apr 2026 14:03:37 +0000
Message-Id: <20260413140339.16238-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_070356_578930_CFF2B805 
X-CRM114-Status: UNSURE (   6.43  )
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

Add EcoNet EN7528 (and EN751221) PCIe support.

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

 .../bindings/pci/mediatek-pcie.yaml           |  26 ++++
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-mediatek.c        | 133 ++++++++++++++++++
 3 files changed, 160 insertions(+), 1 deletion(-)


base-commit: 66672af7a095d89f082c5327f3b15bc2f93d558e
-- 
2.39.5


