Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AF6DCAC5B1
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Sep 2025 16:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MTyvmotOb0/PgMOHsXh4gvDuOiENNfX5B0XL/LoNWUk=; b=CjjuMYwXcMH8SPte1uOw1Y+qGH
	IFd8gr9SyldQVW4wgjtfrGVdJTJdPngXfw7pnTgw/7JQJFAGbku1j0MVLzZtuwavLItDOrqgCz6Ln
	PAXrmdnIMO6HXDMNQu1XQ6NI8Dx5HdLMDXBMXimWxa7/L1/5f+TVU32CLLG4wbTKw68QC4fKPskki
	Cpt3x+H1IzajrdmJ8e4q95bax59zDXo2QH0v6z4Y8B+q0JFL0YhJKXowLU+onTivySoOl93aGaz+i
	9N2ZAaWMqkHHauF/npD/1yWRVLLYxPq5VtaR+CfJQApzGQSEx7Kn0NSkcjG/QZj9LZOsIg4jxHzWn
	OdeVgTdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ol3-0000000B4tR-0dw1;
	Thu, 25 Sep 2025 16:23:49 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1ol0-0000000B4qo-3uUq
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Sep 2025 16:23:48 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3f0ae439bc3so475901f8f.1
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Sep 2025 09:23:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758817425; x=1759422225; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MTyvmotOb0/PgMOHsXh4gvDuOiENNfX5B0XL/LoNWUk=;
        b=HZVgG5ddq9HyWqzw0bSq3WUihWkthVB9m/uaw5IjApFWMSLKBgLOeDO0CY3e+Sh0vh
         U6a59nThuTxmuNBf6hp0Fyx2sKDnmsPQFFD4wcl52a1aaJ7qxP8Mzdo4Ta9uPzeitk2B
         CGkq2cWxtUAME3RQiSZdw4rsnTON4UYaR3BHIO8C5txrsq5fKfrPJiD7ftHTGqI53y3+
         I7ZiWBCXONBcQjlQ1P4DjPOQyTSCdz61vadIvB8S8VkLTnUwxmqibExxFqDjN0W25IuW
         A2M5kjRCUTKlOvKokkIp2yZUk1cg4Hnw6CnIBJlLiivCJMmO8ua0Tcd5qWEG07pAWMLk
         Htqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758817425; x=1759422225;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MTyvmotOb0/PgMOHsXh4gvDuOiENNfX5B0XL/LoNWUk=;
        b=GvyzGNyRkWEhBATNjo5mUj1Yx/xCiBIPS241bekyyoFpSd1E1Ut8CB1w+S2d33FU7V
         Nj2Wiwd5zJu14nNjx0KZJ3YiN+zCloB2l4YcW5yXrzrrtjUo2lq6uJc8E64n/CMHccUB
         FGVcNNKqME0pCqCbT24MkibvPb6C9vbNfJ0dDqeO6D9nRMQO2Zq10ze02gbkkCTYN3gv
         E25YYb3y4uljHQeTuOx2ZqU/NTu8b35hMQu4oExOX9z+pxqQXuUDPmTmzfgmxh5Jvxic
         AUaGzIvieeBaQ7DxgxRe9kk+eAwv01QuiZUrn+xiT8lOaivp2dKytM/DCnYDQVLtqm8N
         KplQ==
X-Forwarded-Encrypted: i=1; AJvYcCUL2bnyYvBNqZWS3XDZdrbA2gBz3PRuvX2n++ppI758ZQ9lQQb8vO0rcqQI+GwB594iMyVZUNWGny8AUdC7xQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjI0mRFvK2sh+6DNw0YQuUxb0HLPjhg7Udg1sin3h/2p5rnNMD
	y9pxc1VpzD5qDkRRMtYBfUiRBk6WzJ8QLxrm5SnPFvSSdU8BVG81diIn
X-Gm-Gg: ASbGnct3kVVsC6Fz4kQ+T4BcSyRH/FtMNqiiAby4LW0/8jVpuOK4aNgli9OixM7v6ny
	ZdxjxLU46COgYK2K/pT6vVZwtH2NTOOMOxGVa4IAWGo8nfEWzAvN6mFWpnI5X3RejQvgTW0XehS
	CRnxifDkFAIEpr6gpaSeZ2PHQJF3K98TyLKHMUKVdLHnCa1Ci00z6/mZzFhQwUnP55Q36wEBlqM
	/hq1edpt26uEHH5p5Z6kjw0nDnE2EBVUH5U9INNC2Nhr33At31Ji5ZU8rmopDB79AZOmgcXiLfo
	ur+eoSPFBrvcyb5Dnvc1ATPfNapnzSvgY3Sds7dT1ABrIhVM7Y/M9k8oUtDISTtJQ7Juo0/mhvm
	MqkT3pDOJOrGUd2MXJ6HXtjQRMuANqosEVrGHrGrxlbWT/exJSSZy/eE+aXExEwla4U2suR4=
X-Google-Smtp-Source: AGHT+IG8wt7D2RVybhrtsXF08OvAI7r2C+qCPryu+R0Ya0aCRRAJKGzbWS2JdRSo8S3uobYjXYxcdw==
X-Received: by 2002:a05:6000:655:b0:40f:288e:996f with SMTP id ffacd0b85a97d-40f288e9f05mr2728379f8f.63.1758817425041;
        Thu, 25 Sep 2025 09:23:45 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-40fb985e080sm3534819f8f.24.2025.09.25.09.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Sep 2025 09:23:44 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: [PATCH v3 0/4] PCI: mediatek: add support AN7583 + YAML rework
Date: Thu, 25 Sep 2025 18:23:14 +0200
Message-ID: <20250925162332.9794-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_092346_983222_94565D82 
X-CRM114-Status: GOOD (  10.42  )
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

Changes v3:
- Rework patch 1 to drop syscon compatible
Changes v2:
- Add cover letter
- Describe skip_pcie_rstb variable
- Fix hifsys schema (missing syscon)
- Address comments on the YAML schema for PCIe GEN2
- Keep alphabetical order for AN7583

Christian Marangi (4):
  ARM: dts: mediatek: drop wrong syscon hifsys compatible for
    MT2701/7623
  dt-bindings: PCI: mediatek: Convert to YAML schema
  dt-bindings: PCI: mediatek: Add support for Airoha AN7583
  PCI: mediatek: add support for Airoha AN7583 SoC

 .../bindings/pci/mediatek-pcie-mt7623.yaml    | 173 ++++++
 .../devicetree/bindings/pci/mediatek-pcie.txt | 289 ----------
 .../bindings/pci/mediatek-pcie.yaml           | 514 ++++++++++++++++++
 arch/arm/boot/dts/mediatek/mt2701.dtsi        |   2 +-
 arch/arm/boot/dts/mediatek/mt7623.dtsi        |   3 +-
 drivers/pci/controller/pcie-mediatek.c        |  85 ++-
 6 files changed, 752 insertions(+), 314 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml

-- 
2.51.0


