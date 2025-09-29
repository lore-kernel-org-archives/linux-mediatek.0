Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57829CAC5B5
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Sep 2025 11:38:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uRFGCABCLXwEyWrlsO0Qq+AzjRnRQjbLGashvrpUfXo=; b=O+kSO+TWwFP3J3wEj/mWvFrNvc
	F9wYgn1UGsb81wAZBT6jK6npR4vu+bLDmkRf8XMA4tOhJTr65RwbE/cL+nssaR29Sk4nv3FHSn1Jz
	pfOrVnrzNKvX6PeYGGglzNUhJa8WLNCBCI3hJ+pAm1zIzO9MuDENi3trU8c4V5qpK+s2LKjqlNKr3
	c11mDbPm3q1mp8NzQ/hQMGtTCrXWG5EpDo0GDMAZ4jpl6DSZsyWsBaCodjyJfZjAINevOz30ScDAQ
	Kn5864MvVTL938SmvgIAd1OQX89EJcV/9pHHMEk3PKbC3UVpnIJSAHiKh8OSG1+aAo1pGMNdhmsdC
	Mzwjf71g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CCx-00000002MKY-3fj1;
	Mon, 29 Sep 2025 11:38:19 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CCu-00000002MIH-2u9m
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Sep 2025 11:38:18 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-46e52279279so6863105e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Sep 2025 04:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759145894; x=1759750694; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=uRFGCABCLXwEyWrlsO0Qq+AzjRnRQjbLGashvrpUfXo=;
        b=R+qLQxw09ofZqWz4EctseoW0UqrQlBB7k4ez7dLrF5csjR8HDA14afva1tZC9OjvTy
         tMhulU7kAlJPOM/AC5imiGf3yiRyPEtcu8G9xenALf6umKvgybH2PeTVqkuqFwRMFZmB
         WWTfBDTzYAqhlxmR9SYoRJ+fQWeuiqgshX4JOD4fLIbIluZ81NqIVcbMfV8sAlyXb6jq
         d/7y+vh5iqYRj/Bf8oODsS/eUK800OvMciGKe3nTmyxv4LUzkdyxXnKYQwNh7qk/n8zh
         7A9cvKct/EbmF7TUmD/fkxxwhXQntLEQFfvzWDCjhmlhdyiHt2PbhMO7/bu1QE7WYT7s
         uHHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145894; x=1759750694;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uRFGCABCLXwEyWrlsO0Qq+AzjRnRQjbLGashvrpUfXo=;
        b=tv5jJW7fl1Ns+UV3SUKv6EZQayR8wYVrtzwpZV8+l5cT7pLBS8TQgSPVuNHanjvD1Y
         ID6jNDrb0SD05hNkqJwyMHThSaZg0+y6bYmZ0BCZwVEHNnlrg5NbHvzd3zu8lK/hreqy
         2U8qUCN966qa5xm0GAI5UscgL+euGwsk/ZDnGddXJU6EvxSoTFvGYULHoWQFboMsGzP3
         uIdrYY7J/z9WmdnBrX5+QKunR5FhfPbo5kCEGhqd4DRkm6eQW77eOgxj7h43wdG4XTnm
         9EeM8+UuJjY+axUu847vIUMf1moxnAGVo2Q5WNQjblX7ai973uCfZCvkgP4Bo9EikXUA
         2A8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPVpSxj2R1IsP9K9wC6aacL1hxgOcDD1Bm8MC9ILON8+bjkfyv3UNYCtSJFnZHaVMTWHPVxda+1wNFZHIDtA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3AzhA+uKlgbxd2tGrbbPFUJmsh3m5H6CbXU0T2WInixZdNEBn
	dkST7wfyL2oBV+kxxl513Yd1d6t0m8YafMCajFJhWl14vV0Kygy5s6v1
X-Gm-Gg: ASbGncuN874AOP8v6x7g0zSazfd/ZDP+xSvhJ6lFotM+kZsPYm8Am/zKzZU6mS1duwR
	Jih4WtymVwohvRWlsqrleo1Z4rFKufFGUY6grF+cf7/2Sji490Nft5oim/Prq/Q+G9/091a9B2c
	fqqnkDwN8JnOiqv0lt45MPZEVmGL/AvYR5fBFFvCl2dWUFYbo+cxa8aD8hSX6kzihbgdJI2m+eL
	6wCVzodUTg7Ymh8ZdzGGZKV84YZpIrIjGRCbsbVmNzQ0Bld/SECheZQ9EivPrKZz6/uLkZ2RE/Z
	BlF5Ox5TdPOk+WKojwyx+08l2WUEqlUS+d1hHJ8/6elT4QdqaQFESRyDi2ggj1FjtSxD1231+r2
	Ujq775BuVVB6JoWy8/GOFf2Fg4gd8ripaPjYsfhFDiDA8094RBE0mX0rt4IQ1cB1/0RzBgnwl1f
	Q1f13Foh7dGOSWAImR
X-Google-Smtp-Source: AGHT+IGWicOdrTmQIVdHUSxqrzMHPdo3nASeyojQE1e0iNlPBEVxWIA083+LVJHlm20d4gbGv51hSg==
X-Received: by 2002:a05:600c:8289:b0:46e:4a2b:d351 with SMTP id 5b1f17b1804b1-46e4a2bd52amr57340655e9.28.1759145894386;
        Mon, 29 Sep 2025 04:38:14 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f53596sm9502465e9.7.2025.09.29.04.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:38:13 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 0/5] PCI: mediatek: add support AN7583 + YAML rework
Date: Mon, 29 Sep 2025 13:37:59 +0200
Message-ID: <20250929113806.2484-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_043816_742479_0B8DF6A8 
X-CRM114-Status: GOOD (  10.88  )
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

This little series convert the PCIe GEN2 Documentation to YAML schema
and adds support for Airoha AN7583 GEN2 PCIe Controller.

Changes v4:
- Additional fix/improvement for YAML conversion
- Add review tag
- Fix wording on hifsys patch
- Rework PCI driver to flags and improve PBus logic
Changes v3:
- Rework patch 1 to drop syscon compatible
Changes v2:
- Add cover letter
- Describe skip_pcie_rstb variable
- Fix hifsys schema (missing syscon)
- Address comments on the YAML schema for PCIe GEN2
- Keep alphabetical order for AN7583

Christian Marangi (5):
  ARM: dts: mediatek: drop wrong syscon hifsys compatible for
    MT2701/7623
  dt-bindings: PCI: mediatek: Convert to YAML schema
  dt-bindings: PCI: mediatek: Add support for Airoha AN7583
  PCI: mediatek: convert bool to single flags entry and bitmap
  PCI: mediatek: add support for Airoha AN7583 SoC

 .../bindings/pci/mediatek-pcie-mt7623.yaml    | 164 +++++++
 .../devicetree/bindings/pci/mediatek-pcie.txt | 289 ------------
 .../bindings/pci/mediatek-pcie.yaml           | 428 ++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt2701.dtsi        |   2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi        |   3 +-
 drivers/pci/controller/pcie-mediatek.c        | 120 +++--
 6 files changed, 680 insertions(+), 326 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml

-- 
2.51.0


