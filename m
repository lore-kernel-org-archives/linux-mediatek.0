Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23FF1C43458
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2026 11:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jU6f3XE2G/RBii05RKcLkrGv0zTxeh52OJEdZ0UzbF4=; b=lKJO2rkAjJhgDOFWotPytYaj0W
	pMpDRsC6EsihvtsGoajc0USBfaaFSItvPlE8dfVLhgO388O003g9PL3SxKXArJl2p3JCYiLlxMX+G
	+k11Uos6/9jDaFp+GH0zLx6kNLXUSX82DNq+NcLtpLRQUeAbuTEWtM0tBmAeLt9YAdNwE9vh3In86
	7Lnap+vnZadUAORT2q2Jx3PPLBrUUchiqixn1Xh+hH9MIaHjChRET7F65scAufYQeQZ5mRtR+79/O
	fWc3SeY/uSMhGLjdwnHrSh3UJxeEzLX8KiB3NNNSduhypZKKLKFi8modEnbLTYqbIPhVMnuHkUmuP
	l59IvBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbmw-0000000Bou4-1Sxj;
	Tue, 14 Jul 2026 11:59:02 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbms-0000000Boqq-0ht9
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jul 2026 11:59:00 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493ce08a75bso16540915e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Jul 2026 04:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030336; x=1784635136; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jU6f3XE2G/RBii05RKcLkrGv0zTxeh52OJEdZ0UzbF4=;
        b=DUWqqF42NpOyanCF/1b1UTB1W2EqOdIp3UCDap/G9qJcfHa/acmCNyjw/6O2oVvUNx
         T/+fsG2K7QqA+6xjWGRXQxLB/SfAZmmW+8R5t8F4TTwVrHzX2GTq5lpiR9Fagsmo7gXx
         lhNvdtGjZhaoQ4pEm+lWBMzPFK0I+EvL2vW2337tEKnFSWIxRdCiyoVQOXfoIjr92pQY
         9gMryof5ycQOqJ6KD0+GSos9UYP4ZQJXknB5WzBZEC7E2bp37Sy+opyiO6PEtgzcG99u
         2F3N1zyH1KKuN8ZVHvMqBAx412WMN85bUAxyT6C8BgdjLDXiCmb7mqVNBP+R3ZminwNy
         9U1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030336; x=1784635136;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jU6f3XE2G/RBii05RKcLkrGv0zTxeh52OJEdZ0UzbF4=;
        b=NMdECZNpOLs4OM0clVSS14rbELnNhY2q3B82HqgPG+Zcdc8QnBj8WSr3YWDpJ+rqkH
         qRw3qi12O7ZkZCA853O1PG4n15GLGDj6qOzDkz+R9Uv8NIafN7wZjFXCSHz+K3J3N+iN
         jGh4CO0vRQs8GsQm5jSQoX2lexJ1NzWS4eq00KIY27FX40eY9L5gMMDhQLnwHUY1jKLN
         M2wiY1cBc/PwSSKcYm4boGkJ+CxzXg1uu3PeGhaNep7WSKS27KXp6aU8LMkx5l//xSGq
         +MrmPadaUGCkz8AM0OGuHuLTL7td4UIUT28w5haVnxMktRiM13Rymkqx96KgkEbQx1BY
         t/9A==
X-Forwarded-Encrypted: i=1; AHgh+RrVwUsST+6KwdFGFmVXLo0iavKQaC+OZ5bJiGeLgUI7YrkTrBB2ZgDZTZ3xsVgSxH7P5P83vHCaE0o0tZuPVg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz+1GMtL+p8glbEf91c7fktz5aVEcyEQqQdAoD+4QmsWQ1sNjA
	B4VGZ3v/GIgE7riNbV9kfJ46GjnfosHAF+A+omIkl67tC5QLvspk44Rw
X-Gm-Gg: AfdE7cmLmrZ2lPPSwLUa3NPw2IST5ptQNy9yGZUkWJym6UFylr6buEe4arfLOoIG736
	rJmJO6X1cK3C4j9gMELLmmb7jSHdwX/+40L+iJ1vmlxhqOMYL1iCOuUtmDSi7dF8SG/5u5lFhLg
	yXMRqI66+AmsNH0rw2hNRw1cxnGCDF081K+k8okg6T6eEcF5wUf+Phu1tQnp8PDJrtfvwB+VXEf
	ti2yW1pZebY2tqioOlbgVmylIMfI89Cik3ATViigEQLpueDsK06uCIX0yIZsxuAKcxdBd5HTeON
	s6ohB+eeuHouuKcqTWDwxS0L/tXheBGHXagVgyG/x5GIlEnf9v8w/42uPtFPcB984vW7piME2GC
	xwtV61BqcRvXzWDFI+QwF2SCamE2soC9vXB+PQH/w+rQVahf0+nEPHVvb1gZIqrTfoDATXcYdFq
	y4aPzWlzmibWvMINkLaGwLXjuaWkUcJJh1lSiji1vcxR8mkHPe2lkRD3qt3zcDpaO6C/lbVPWvM
	Uha5O70
X-Received: by 2002:a05:600c:8705:b0:493:b61c:72c3 with SMTP id 5b1f17b1804b1-49518312cd6mr37467935e9.32.1784030335841;
        Tue, 14 Jul 2026 04:58:55 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493fd3ccfd4sm180531655e9.2.2026.07.14.04.58.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:58:55 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/4] PCI: mediatek-gen3: Add 2-lanes mode support + clock
Date: Tue, 14 Jul 2026 13:58:42 +0200
Message-ID: <20260714115848.8537-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_045858_247177_5A425220 
X-CRM114-Status: GOOD (  15.53  )
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

This small series introduce support for 2-lanes mode for Airoha AN7581
SoC. This is needed for correctly functionality of Eagle WiFi Card
normally attached to this SoC that require a 2-line PCIe card to
correctly work (and give the proper performance)

The first 2 patch address a limitation of the PCIe implementation
where the PERSTOUT reset were indirectly asserted and deasserted
all at the same time (for all the 3 PCIe card) with PCIe
enable and disable.
The 2 patch address this and introduce correct reset to control
reset line for the relevant PCIe line.

The last 2 patch add additional logic and support to assert
and deassert the PERSTOUT and also apply the required configuration
for 2-lanes mode.

2-lanes mode is implemented in DT by adding the required property
and by defining the "num-lanes" to 2.

Changes v4:
- Improve DT split patch (drop unneeded property)
- Handle power_down PERSTOUT
Changes v3:
- Add Ack from Krzysztof
- Improve commit description of PCIe patch
- Use pcie->num_lanes instead of possible uninit variable num_lanes
Changes v2:
- Address typo regs -> reg in Documentation
- Address typo lan -> lane in Documentation
- Apply a suggested fix from Airoha for PCIe MUX configuration
  before PHY init
- Parse secondary reg in probe
- Add missing reset_status handling for inverted bits
- Move SCU to local handling in power_up
- Add check for max num-lanes for EN7581

Christian Marangi (4):
  dt-bindings: clock: airoha: Add additional reset for PCIe PERSTOUT
  clk: en7523: add support for dedicated PCIe PERSTOUT reset
  dt-bindings: PCI: mediatek-gen3: Split Airoha schema and document
    2-lanes
  PCI: mediatek-gen3: Add 2-lanes mode support for Airoha AN7581

 .../bindings/pci/airoha,en7581-pcie.yaml      | 244 ++++++++++++++++++
 .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
 drivers/clk/clk-en7523.c                      |  39 ++-
 drivers/pci/controller/pcie-mediatek-gen3.c   | 106 ++++++--
 .../dt-bindings/reset/airoha,en7581-reset.h   |   4 +
 5 files changed, 370 insertions(+), 100 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml

-- 
2.53.0


