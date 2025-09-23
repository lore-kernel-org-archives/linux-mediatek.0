Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 507F3CAC5A5
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Sep 2025 20:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ASptksIfZB8nhWx3+GWc5qI39yAJwjp71gTOqcHHO80=; b=ANuXq+Rhszxi0++ucFRNVkBlLp
	buTZs76Za96usFNfxCHxq0gD3Qe57CHckUn17xAra6UKhEbFZESTIfIvrc/UBJIpta4FrBk9qQ7pE
	37K4E+QB4q5NQdbVC1vxSRzECGI/O4LzH0ktAwEnsO+lk1dPz3ttWRmbJYfRlMAzznF3FWXW7JMfO
	QYByr8/zdgrzqurRkIMTBdEahrcY4hbrCcIahvmj8azOTZ8Im++kYAnLQKy7BLjip2ejhh0yYKHSR
	FDEtixbHJq3ZSy9bsFrIJlymyhwuAQP8zzi4SBx9RFIVTEPyQWMIDT7ZKN5cEITSUmPiiLBn2N9Kp
	AkzEAgXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19Nf-0000000Ejqh-3u4M;
	Tue, 23 Sep 2025 20:12:55 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19Nd-0000000EjpP-1svU
	for linux-mediatek@lists.infradead.org;
	Tue, 23 Sep 2025 20:12:54 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so4425988f8f.3
        for <linux-mediatek@lists.infradead.org>; Tue, 23 Sep 2025 13:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758658372; x=1759263172; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=ASptksIfZB8nhWx3+GWc5qI39yAJwjp71gTOqcHHO80=;
        b=YLbBfrrMn9bGOdvw9rhFRrfJF58Sp3ilbgdfZqoRf/72VyudRTG/dlmygLLxq5IsVw
         lGZ00MJqXLu5DOOnCS8zlyAYHaX6Cuax4jGtYv56PgLAMnqEXdKaHsB6pQsusN3A7enn
         3XG3rjNrrTgg1aE7PnWIBWevNCVW4cyjRx1X9Jza1zg+24kJm5YS7sNnqjCoZ+s2OOQF
         zE+UBEuQy092OYhhi9gLcLO4EyWax8SMes4vM+xUFgjBuTEfAPUP/AToSyJF5ufQbUR9
         0l+njIEcqFVlR2v7J3RyYQQ/kE/TCWA+TbXMDgupsNCvQbfdrBNiyXYo57SgOTGCg19j
         Th5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758658372; x=1759263172;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASptksIfZB8nhWx3+GWc5qI39yAJwjp71gTOqcHHO80=;
        b=mo1M+sUHddrZkgytyvUFn4D9XTNPUQOg9Izvpm41biA7E8bxkQF7FCu7uFHmHZnhOI
         QKYPWY/b/b5zymjJ77ltdYtHtFpGOpO31SvUsHo/XUFYCJ6FwWv2nozCeqvVu9RO/Y6/
         oskqwFHIUV+fT7iY7tbVcsFKaRDVAxFbKRdX4giSydgCIibF43Fcf3rVSweb7CAnpzLn
         qSnzPJ+2Weih/J/MsN3YflNLg2Pp+QTNwsdMuwMLHCO24wLkgvEVWhmL6VMOQuM9/idO
         Q309jxqjOGxQjJaa7YFnQPpBe14WaRiLEN0X0vBqBdwrJfX1x5o80UWUqWJ8EkXKLM10
         ZWCg==
X-Forwarded-Encrypted: i=1; AJvYcCXeq8+FGbz01ZtJJh3PN9hsxJ2EtSoXYqDcKkOEN+AgOLLkBoF4m8g1quxBjwyiUatat/oXmUNSqr+S/zT0Vg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yywl91E5p4YDSHCikUxZII6yJF2iibOpnSEL1UGHI7Ubo/sWPzZ
	6pMeon0Pe5IdjIfVqiucrpoqvoIfVb7jyzNKBOs8MIu84JYK1Ckt5qlN
X-Gm-Gg: ASbGncu8LIO6mV3oG9oNTkPYVs1LuU/4LEUx0Ei84tz6vk21O7jCvrvDR2ED1oVTZVZ
	5vqtoxN+XtoiB0oPaR8ocDCi/GE+6F40WGxQvhOOCgVIOXWINs/w/tFGEuSZrrTcW11zuePlB9T
	Hu1WMv0WJ9CXEhMYchnImcdzQDTXWXwjmzir82xIajHU74BCKJmvkcEiFu15gWtySjh8P0rMG99
	0lpu9PA2a4ke/It9upntmWbzgdmUz43w7SeNmvWDYSPvjJVHbwoh+DX+UCpGCv/dt/tZjJTq377
	thiAKnD++SGw5PyXw2g+6Wg0BhI2/DZaNu1urymoJh1y/55CY116pfZEAjGLTMEYNfqMQLwmOKq
	3mdCHu2CE7iMsRNnVx6ZAJ+axtnFUEPCRruIiccG7aDT+xxOCDBX7uPzbIe87ZLixOaiccNM=
X-Google-Smtp-Source: AGHT+IF016uYkkKzgv+AucFeGyavBjbQS4X5yFh1cvwLL0BVsVqxRwdjObESQ21BrceSWNy2CAZxPg==
X-Received: by 2002:a05:6000:21c8:b0:3fd:bf1d:15ac with SMTP id ffacd0b85a97d-405c6d11630mr2007870f8f.20.1758658371435;
        Tue, 23 Sep 2025 13:12:51 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3ee141e9cf7sm24889690f8f.12.2025.09.23.13.12.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 13:12:51 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-pci@vger.kernel.org,
	upstream@airoha.com
Subject: [PATCH v2 0/4] PCI: mediatek: add support AN7583 + YAML rework
Date: Tue, 23 Sep 2025 22:12:28 +0200
Message-ID: <20250923201244.952-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_131253_502311_03AAE1C0 
X-CRM114-Status: GOOD (  10.41  )
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

Changes v2:
- Add cover letter
- Describe skip_pcie_rstb variable
- Fix hifsys schema (missing syscon)
- Address comments on the YAML schema for PCIe GEN2
- Keep alphabetical order for AN7583

Christian Marangi (4):
  dt-bindings: clock: mediatek: Fix wrong compatible list for hifsys
    YAML
  dt-bindings: PCI: mediatek: Convert to YAML schema
  dt-bindings: PCI: mediatek: Add support for Airoha AN7583
  PCI: mediatek: add support for Airoha AN7583 SoC

 .../clock/mediatek,mt2701-hifsys.yaml         |   8 +-
 .../bindings/pci/mediatek-pcie-mt7623.yaml    | 173 ++++++
 .../devicetree/bindings/pci/mediatek-pcie.txt | 289 ----------
 .../bindings/pci/mediatek-pcie.yaml           | 514 ++++++++++++++++++
 drivers/pci/controller/pcie-mediatek.c        |  85 ++-
 5 files changed, 755 insertions(+), 314 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie-mt7623.yaml
 delete mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.txt
 create mode 100644 Documentation/devicetree/bindings/pci/mediatek-pcie.yaml

-- 
2.51.0


