Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A863EF53D69
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2026 15:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q11hnzTKrbJQfR59sChwy59iNTTXeocJ+Lmy3WVGuHU=; b=k89rpT68XWucU3n/QqcUi94XP0
	GQ/mBHUWlAr+ayLad6Ttz1mIhSklvp4De77CT/s1R8dTcyavcuGc966GB6hcfLrntirqYCcgiohTA
	X4wgLpcT5KL2F8VWNB134QB2z1/ohrjkBwo5sSarFcti3LIA8VGNPnd2wxPPbU2cOkVsjMqCIDjqa
	78/fsltEzMjTTzF3cekzwIQIb7HO7IiLeJ4z2f4pALQ9pwHh/o7buzD8M2CCSeRaSpz8F8oxgr5gJ
	8RWmQfBrJtb7ksML+vX+pDAf09xmEI5ErcJkYxUZWOzo1aw2uBMDWa9N5vr9EA4a2CDk8RFrGcbju
	CajJd49g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AEv-00000004NUP-3fty;
	Mon, 16 Mar 2026 15:52:21 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2AEt-00000004NTE-2MuW
	for linux-mediatek@lists.infradead.org;
	Mon, 16 Mar 2026 15:52:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2BADB302EB3;
	Mon, 16 Mar 2026 16:52:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773676334; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=Q11hnzTKrbJQfR59sChwy59iNTTXeocJ+Lmy3WVGuHU=;
	b=r8UOBjjDoVmxU+sPlo88yabF/Mg1DAzDSQHVocQGzeE1FKHIyY3uan5sdVc13u7FKMjQDO
	cisBH+YubhmFq9UHP8YNddsBPAtUicq25lCqPoqnwlQc0N83uWY87IkKFelWWyuXs6+4rV
	0HXANlpP9U1H+qEQC3cDfaSGBIp/CYHzV/Hr/rBeWdgv1NKG3J7+upIO+F3QVhw1F1ABri
	0PegtrcI62pXDFtWq0lumkKHeeW5rntXJdYW/HuC1hjDNDy/bWYVksyghcDz8li+ObOZBs
	9gXfRDUnBq9aqa19HaxYD+kI86NaLdjLal/96GzFgiSJi6LUkaEZ6r1fNwVrZg==
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
Subject: [PATCH v2 0/3] PCI: mediatek: Add support for EcoNet SoCs
Date: Mon, 16 Mar 2026 15:51:54 +0000
Message-Id: <20260316155157.679533-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_085219_823235_369BAA19 
X-CRM114-Status: UNSURE (   7.44  )
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

Changes from v1:
* mediatek-pcie.yaml slot0 needs device-type = "pci", fix dt_binding_check
Link: https://lore.kernel.org/linux-mips/177334026016.3889069.9474337544951486443.robh@kernel.org

This was split from a larger PCIe patchset which crossed multiple
subsystems. I'm not labeling this a v3 because it's a new patchset, but
I'm keeping the historical record anyway.

Changes from econet-pcie v2:
* mediatek-pcie.yaml add missing constraints to PCI node properties
* econet-pcie v2: https://lore.kernel.org/linux-mips/20260309131818.74467-1-cjd@cjdns.fr

Changes from econet-pcie v1:
* pcie-mediatek.c Exclude pcie_retrain_link() when building as a module
* econet-pcie v1: https://lore.kernel.org/linux-mips/20260303190948.694783-1-cjd@cjdns.fr/


Caleb James DeLisle (3):
  dt-bindings: PCI: mediatek: Add support for EcoNet EN7528
  PCI: mediatek: Add support for EcoNet EN7528 SoC
  PCI: Skip bridge window reads when window is not supported

 .../bindings/pci/mediatek-pcie.yaml           |  82 ++++++++++++
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-mediatek.c        | 118 ++++++++++++++++++
 drivers/pci/probe.c                           |   6 +
 4 files changed, 207 insertions(+), 1 deletion(-)


base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
-- 
2.39.5


