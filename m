Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D43FD106ACD0
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Mar 2026 16:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wefQB/YrEwzehXLAtsdppMxnT8At0wKkKraQvz4IB4w=; b=FYDM8d1OVVBB8h7wCrlmBrlZ9k
	gDILqG6R3GcWGo2F4njbRoDadtoG+w51v0kyTNSd8Q8UaI+G0bF/V/heOggoqCjA3rBQ9lHLjxoCW
	xtAT/dy2i5Pj4JkpmKciGsIZvp2vqJIr3+EwTaffOf1GumZyTrUWzLwB02Xrc6fk9K5M8xO7D46ay
	1DEPxdRKV8I7ONxVSRdFPKmbIiiBMF1tu5fvEikY+/tDKxNcXD5Uy4hOBrE3h5bhr3dlIZjrrTPJT
	12Csc1Q/Hv4+i4PKZNeP0kGsRoHhbc33L+oFbld2QzlIWE4Es+uLFsvpLt1YTQaeJi5h+yeDSocvY
	T2h8b6iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0jIA-0000000EdL6-02SM;
	Thu, 12 Mar 2026 16:53:46 +0000
Received: from mail.cjdns.fr ([5.135.140.105])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0jI7-0000000EdK7-2cDz
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Mar 2026 16:53:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 168E92C68F2;
	Thu, 12 Mar 2026 17:53:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cjdns.fr; s=dkim;
	t=1773334420; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=wefQB/YrEwzehXLAtsdppMxnT8At0wKkKraQvz4IB4w=;
	b=n9Kc2AfTjy4sFM893g5O1EOtNM0/YhkY/UpTLFpSmSMh9oHm1+X2eb/7bRA0NjEC4M9PNT
	0iRteEAt8IBJGrJLgizBhs8ZKKoHUx1LrrgsYJQcMxtcyc8lcG1COELuN3gq6SWHKBC3z9
	sDA4J+fn5EQjakPVmoVjMtnxCjZgk9pBK4sDM0jttTqk6J39LL1GBD/Mf1BR/fFuphlFn5
	qW2gePI7QzcQqUa2WeNc9Q7Y8gMuHTTrfwTJg0205vmhFuegLW84cY520kd/Im48MJsyau
	twdExVe7TJZ2Eatj9hCxXPZfh3m/pQXnsdN4Zh5I3BvCDbOgsn6I5Z8FPQMJ5Q==
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
Subject: [PATCH 0/3] PCI: mediatek: Add support for EcoNet SoCs
Date: Thu, 12 Mar 2026 16:53:29 +0000
Message-Id: <20260312165332.569772-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_095343_861457_B0D1CF7D 
X-CRM114-Status: UNSURE (   7.45  )
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

This is split from a larger PCIe patchset which crossed multiple
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

 .../bindings/pci/mediatek-pcie.yaml           |  81 ++++++++++++
 drivers/pci/controller/Kconfig                |   2 +-
 drivers/pci/controller/pcie-mediatek.c        | 118 ++++++++++++++++++
 drivers/pci/probe.c                           |   6 +
 4 files changed, 206 insertions(+), 1 deletion(-)


base-commit: 3fa5e5702a82d259897bd7e209469bc06368bf31
-- 
2.39.5


