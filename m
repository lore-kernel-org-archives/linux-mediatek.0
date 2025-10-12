Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9851ACCD187
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Oct 2025 20:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yet0G9q2Nul7wE7O4WOA4//yyR5OUJOrXfjDFK6H1h8=; b=H/XsBZVrTYK3w75Mor0vTRUF2F
	K/qf9jLHWoC4N91KY8JPtYhkd8wD2nnt4gMjcGjY2RB1vyw9jnuXhUsPydsBhy50QB6+/XpAZoiCu
	vMpLE/n3C8b+7b1kfhIP9/XNY7wTfqf6g0JczOF3oGcLSsws68zb+YzRsYE70xQ+IMQvBKy+fwGu9
	+Gi/M2A2z7YuEewYn/wlAbjQRmSg/nb0fS6ju1IB/JMK9a7sjEYfrYFgtq+uw1wUIeSmqMAJ+iv8L
	nGKZ6X8f6cA/W3JvjQ2tzLk8qF3anLXKtkMveOOS+Z108yReyoyYzZc/DcUGuipXXckhbrf/AjQNI
	Qd3k4SGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v839r-0000000BlRR-3n2O;
	Sun, 12 Oct 2025 20:59:11 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v839p-0000000BlQ8-1isp
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Oct 2025 20:59:10 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3ee1381b835so1928672f8f.1
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Oct 2025 13:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760302747; x=1760907547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=yet0G9q2Nul7wE7O4WOA4//yyR5OUJOrXfjDFK6H1h8=;
        b=S9kk6USIWpMnwawfEywkQhG8dYwFmqkpBINkqXdZFwF+iy83kUuqvOtvYRilouyXk9
         I88ummRzroVwDK8jS1HkjUkOcajihBAOcjRBIUf+kwDD+yP0OfSHKuekx1q3euqeEmcJ
         5mebhqMfcWdwCLv67TFLzUmbIskP0afEi45jvBu3v2JWBP14mkPFVFdN1z0OemVjE+2q
         xjN/TlPqIKXXb3rQSefosDFs5JccXxApdRQadfigVuFDBqYVH9moU9PO+BaUTbQe/5B8
         9fIGPrxivG23hD+a/N6xXrD3ZX0jug23bxxxjS4d94Te+xCv5ScK1gIRBHvtItmqv9Wa
         /l1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760302747; x=1760907547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yet0G9q2Nul7wE7O4WOA4//yyR5OUJOrXfjDFK6H1h8=;
        b=NyxL7IHoW85GSDk+YuoEScGBe7vrc3Z/yu8dg7rJWOpDhwtIWg1aa8HNvOvaNlG7jy
         Na39DWWXTX28SHiwzrPU17uxkhbU4ymivpkdlENiGhxk21nIrPHwur4TfpNk76DztiM+
         do4x6ohEOeqNKz20yUMN4tICMxE6jGhhwQRKvb+Pb0bcjlbH7IYbVNLG7GvmWv5YDXqm
         7adBI9WDCL7OwJ1FtHXRYFbmN7tDQ0ZfxTlDoCa4i0ogZA77TTO1N0pz6OxfJqszOKXO
         yeqq3OkVbPmOaOQMQkq3vZyOIwRXF+og1okW48ijqHEw3Dnn+EqUQUVI0ig07LIN2s1I
         HzUw==
X-Forwarded-Encrypted: i=1; AJvYcCXW70XYPriGYHfVOSGq7lIdQypeuBIMvTNJBkHZQTjHgve9W5miJ28ROQHwDlPrpSaovv6kG3qHsPn9ElFi8w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyr1QgbLuzrS9ineSfRzHPGkJX90sWlOrSG+1iqkNTxgey4wgfN
	+oz6S8HMVP0DGeLNKO8q1HujshwjLd69OuaXnOOmgBvJOBpGg+UdAyyV
X-Gm-Gg: ASbGnctWSg23xjP0rE7aFeMnwqNilRDhv+rvUNTwdrpUnd2R1byAIpqINpQWRNsTJx+
	yMYPRbThqLrlgTthnMiFAfa7W0Jdq5cNn9jSMpZni2BxC6fLRwReDFvubHY9cl0moa6B2chah39
	hHMhVI5CHu4NcdTrc7H/1QxJinX7aLOnXQHgjcD+UjFKidZzi+WmUV3A7HugLsQEIRRQnW33JCb
	g3G9uf3HZggAzTi3KSZrgepu2SojQUV4sGZ1e6jYYXa5h+iGF2pjuRwYT05OoP67WCsQhfcgdtb
	K2PAcEe5baQyuThciXpy7ZOIwLpVRO9kvPc7SGdudfkX6O2UtV97vw2Bt95KjzbaB3M6tX7qh7G
	CFdj1xuL0Uy+PabUgWp2kR+31M3Durn6JUX35YUAWd5CHVlE5koqwelmTQG9OrOgKh9BqSivAPw
	==
X-Google-Smtp-Source: AGHT+IHM3xVI82jB6xdjQEkijldoJ7njelHhMDYQ3r3ZtWre4CsPi70ME2++am1YX6QlYz5/89FVBg==
X-Received: by 2002:a05:6000:2505:b0:3ee:1279:6e68 with SMTP id ffacd0b85a97d-42672425b82mr11691189f8f.47.1760302746815;
        Sun, 12 Oct 2025 13:59:06 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46fb489197dsm156506505e9.10.2025.10.12.13.59.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 13:59:06 -0700 (PDT)
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
	linux-arm-kernel@lists.infradead.org,
	upstream@airoha.com
Subject: [PATCH v5 0/5] PCI: mediatek: add support AN7583 + YAML rework
Date: Sun, 12 Oct 2025 22:56:54 +0200
Message-ID: <20251012205900.5948-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_135909_454096_1B84CFD7 
X-CRM114-Status: GOOD (  10.66  )
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

Changes v5:
- Drop redudant entry from AN7583 patch
- Fix YAML error for AN7583 patch (sorry)
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
 .../bindings/pci/mediatek-pcie.yaml           | 438 ++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt2701.dtsi        |   2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi        |   3 +-
 drivers/pci/controller/pcie-mediatek.c        | 120 +++--
 6 files changed, 690 insertions(+), 326 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml

-- 
2.51.0


