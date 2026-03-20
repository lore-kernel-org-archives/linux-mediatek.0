Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD91C108B8E1
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Mar 2026 09:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A/j3iAJkz4+vJeSH2EikPAPD06j5Xk+pcUsj1+dSTNw=; b=cN1OmonK1MlZ1tF1cQQOfmjf7J
	srvX+EU+XfRr8sDRGGFI6QcKyZ1JVqFT0DezOJtCSYopsATMczJ7inECPVkno/7TsFCy+HOQ3cCSq
	nAet+JI6YwlqOzXWtzx8XgX7yORXaAuX5s4/zmVrlhMrCV5Sh0G9MNMwfMFrsHCYH7yY7SgDitJRG
	0Ddh0IDJDUbFDoF18PqnxU3bXd9e7QisfFqg7AY+muiZztEx6oyqOs50kiJjYEny6XU0wHE3oDHRL
	jBCIAaHZO6ORmGdmGlLWb79eH+fMd5YBHGQOzXQ23WgKjrQ5Ou2r7pMkhP45nAzc7LtbrSiipexx/
	zuea0xXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WNE-0000000CVJT-0sdo;
	Fri, 20 Mar 2026 09:42:32 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3WNB-0000000CVHc-14BH
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Mar 2026 09:42:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2085B360308;
	Fri, 20 Mar 2026 10:42:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773999743; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=A/j3iAJkz4+vJeSH2EikPAPD06j5Xk+pcUsj1+dSTNw=;
	b=kIr8YWm4e/n+GCCbeIGTzpHtBJmn8iFZ2U3DnCwJ9+ZIEcAH3w2gMcEVQMW3wPGjtLzrC6
	FpiJuv3ReG7IMwWI+Are3ZFCThI6Fej4FjXfe7I03goggrDywINwcsn6HEA6djLDRA/+Ct
	ePOmM0lwH5VHszF7aIrZAJShhFtUlk8LGEceP3AoEBv2Nou/aeR0w6bG405vvsdEzeu4Pt
	3BZfF1+l9KKkXOculDmv6MaLCuy6MNxdZ3Xl6qFkJVhjiIPNIDmV32iE676gaIYYO+LWps
	siWhk5I3w1WsojPU9mcEDB6DgBE3dFdaD9pFHNPhEUvq+3GnXV1/nCZ3lYBBdA==
From: Caleb James DeLisle <cjd@cjdns.fr>
To: linux-pci@vger.kernel.org
Cc: linux-mips@vger.kernel.org,
	naseefkm@gmail.com,
	ryder.lee@mediatek.com,
	bhelgaas@google.com,
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
Subject: [PATCH v3 0/2] PCI: mediatek: Add support for EcoNet SoCs
Date: Fri, 20 Mar 2026 09:42:10 +0000
Message-Id: <20260320094212.696671-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_024229_488874_337F86BE 
X-CRM114-Status: UNSURE (   6.86  )
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
 drivers/pci/controller/pcie-mediatek.c        | 118 ++++++++++++++++++
 3 files changed, 145 insertions(+), 1 deletion(-)


base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
-- 
2.39.5


