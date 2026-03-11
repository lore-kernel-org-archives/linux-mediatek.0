Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EA86FD064D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 07:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkopRVj6tuJbWd5GjoKb9TnBTEgj+l2ZbxAGzKv8UNM=; b=mgBXn97TOWFdEz4fX6U9OOhdCF
	ER4t5wicl9TOvXklP7AaWpQfYsnYcN3Sb85R82bsY2BlQpMSvNO2YgvQPjYx5fsAlpOkxiRxf0/9r
	eoMfKqIy/f68AAzWF+Oa/L3Pd11uxpyEOYsWqj4vQguDbAXTIV4T4tD0J1UEivI5s8OhxvM+uD+PT
	pA7VVGtZ8zpYGi0rSJGWuS3CZjai2XRxRBwUV1kjTdlEIeInNGSF9XCEU+6TH3TRNX/54JRaTQ4oa
	zJawlL/ycDjXBLZ5EL1Fj3QRYy+NJUj/OvjwpkEQ5ZwCuc8zmpeI5VQzQkQyVbRtHbMqqQBOGnHQE
	rYnctonQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ENC-0000000B5Oa-2N1y;
	Wed, 11 Mar 2026 07:52:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ENB-0000000B5O4-2rvE
	for linux-mediatek@bombadil.infradead.org;
	Wed, 11 Mar 2026 07:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VkopRVj6tuJbWd5GjoKb9TnBTEgj+l2ZbxAGzKv8UNM=; b=VdSZviaxT87bnP0wJ9oLTNk5DA
	MipM4lg0nfUdv8CAWTsQnh4oyn+2byTlIz+05s4ORKWv/tUGDxUE4nexhdCpNzr4Zyf+nyhr2EsIG
	Ytx4SRr46j8mCib3jNFgYmjnBvvvcEulWB8NZVsTkoN56fmXLR++XBkWjQABkRFqkYEbZ2vMFax3S
	O2tHi2H9mI5ukO6Xd/U8gmA6hK1DI0/+gOVDxrE5qtC+k1MGAYzJccdoYzzc03uHeke8LtddwQdKA
	2TopendS9WphQ1bkIxUMpX4/iI09/TPivVYYtX/5Oe5hN/rWtxTmj+V/Sa0qBKsiCyaQF2I80QFjY
	THq+nfxQ==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EN8-0000000GJ0K-1RCF
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 07:52:52 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-35691a231a7so8646049a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 00:52:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773215568; x=1773820368; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkopRVj6tuJbWd5GjoKb9TnBTEgj+l2ZbxAGzKv8UNM=;
        b=krXktN5pvWtL6jy7/XD1s2AVq/ZAgVlDHuHqw3fPUuC8kTj9kdFAEXm/5IQjh746CE
         Osg/CxmFJnjKRHfLADDAWLttwldaemlFcSLO4bDqw/SDoH/J7nk69YwjWWY522+ToGA2
         wd7w45vujzrt7lej8AR3BQHpUy1YTfD8D9BYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215568; x=1773820368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VkopRVj6tuJbWd5GjoKb9TnBTEgj+l2ZbxAGzKv8UNM=;
        b=h1Oy8RadgF6+LVvYISMC8vNvno++1SmIn1kknS7kH/7x7UVGnl2f2iYGzsMeYAWDAa
         YGtMZvztd1aZwR1APH2cNEfvf+Tyt8c6k9Z2iQohMBuMq6jCUNsjo0aF49R87mCQCUGy
         8VZ4zBNNiMy5IkjvsscaApUTn/kqaED2eU7rkg8kAWOqZKo+7Vxn2T+UpSh9irNacYR/
         PdB/stLhBpSQa4hrEmFGuHlDpanJL+HoSQHQhHryMtvpCXy5BmJlmaW1GxvcU6goXRsA
         8VHsSNcrDLFhgd7b8TkyizbY4YWrn996DUlwWtQavvLeaPC18r7izriM81UgpQbFknWh
         zHTA==
X-Forwarded-Encrypted: i=1; AJvYcCUz+He6nFG2DJwUC6xMmwTML3iYUhN+kSrQjD0zM6iaFR28eMXeung8h0LAWhgFey3/OoIXHsSYnSKmjRzaww==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3Q21nwDQVPlA+3LC2Sl1DABHSmw8v1SHURS0hT8/WPExPF1VF
	Ks9liTwlcWT+fzpoa7hWrZF59jXu65uajQthj2imjEy8dDGUh/tCViEer4X3qDRRbg==
X-Gm-Gg: ATEYQzzukTnb0mTsaPazyL5V9fRlA5Y9eLiclLkC8ZSKezAYLWpEHPVA1YmpCbfN1V0
	t17nG5hTxXWXzoQdTT63QiqaK64ysrMIiJkmCBVlFf4C2wqIfRyWl2xasUjHvISVUqbxOVqOVHn
	xegMxUSfN2xB3AAiIrwqZp/A50Es3JaFlOHvhoQWj4UpGQws6ZR1Yizq55uNNafRgWdnToUjvBv
	DUa5LhyM+xn3aMVINwwKaTajv3/XSlWZR2qmYA7Q9ZbB+7/5cL/Dq4g3pueFdXs5jyBvQx8No0t
	z28gQ4G/toGH938uosFwXMZN6ytQWTXcMBkUrdgvrHQKoEf3ptdLL5+Oot+JXqwtFbOdfm8mYfM
	NftHapFVrM/ViUljb1zp93p7BkZqKp+I+YKAyQZaU1S482Sx7oSzKuiHW+/G8r2yXb+rI/RTUOq
	cUiTN3cuD694ALH9Ipiq39PFvDn4aOBeVc/fgfdbFP69/x/c4zo0iRTRMkZhzqkOhDD01pIxada
	oS0ACdI
X-Received: by 2002:a17:90b:3fc4:b0:358:db7b:f686 with SMTP id 98e67ed59e1d1-35a019daca0mr1399518a91.26.1773215568393;
        Wed, 11 Mar 2026 00:52:48 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a0236f79asm727816a91.6.2026.03.11.00.52.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:52:47 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v5 3/7] PCI: mediatek-gen3: Move controller setup steps before PERST# control
Date: Wed, 11 Mar 2026 15:52:18 +0800
Message-ID: <20260311075223.3303497-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260311075223.3303497-1-wenst@chromium.org>
References: <20260311075223.3303497-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_075250_606971_5BEAF722 
X-CRM114-Status: GOOD (  14.75  )
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

Setting up the translation windows and enabling MSI involve only
configuring the controller, not the device. These can be done before the
device is enabled.

Move these steps before the existing PERST# control. This provides a
cleaner separation of controller vs device setup. This also allows the
later patches that split out PERST# control and add device power
control to have cleaner teardown.

This change only moves code. No functional change is expected.

Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Link: https://lore.kernel.org/all/20260309215056.GA603013@bhelgaas/
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- New patch
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 50 ++++++++++-----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 04ae195d36c2..1b6290f2c360 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -464,6 +464,31 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
 	writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
 
+	mtk_pcie_enable_msi(pcie);
+
+	/* Set PCIe translation windows */
+	resource_list_for_each_entry(entry, &host->windows) {
+		struct resource *res = entry->res;
+		unsigned long type = resource_type(res);
+		resource_size_t cpu_addr;
+		resource_size_t pci_addr;
+		resource_size_t size;
+
+		if (type == IORESOURCE_IO)
+			cpu_addr = pci_pio_to_address(res->start);
+		else if (type == IORESOURCE_MEM)
+			cpu_addr = res->start;
+		else
+			continue;
+
+		pci_addr = res->start - entry->offset;
+		size = resource_size(res);
+		err = mtk_pcie_set_trans_table(pcie, cpu_addr, pci_addr, size,
+					       type, &table_index);
+		if (err)
+			return err;
+	}
+
 	/*
 	 * Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
 	 * causing occasional PCIe link down. In order to overcome the issue,
@@ -510,31 +535,6 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		return err;
 	}
 
-	mtk_pcie_enable_msi(pcie);
-
-	/* Set PCIe translation windows */
-	resource_list_for_each_entry(entry, &host->windows) {
-		struct resource *res = entry->res;
-		unsigned long type = resource_type(res);
-		resource_size_t cpu_addr;
-		resource_size_t pci_addr;
-		resource_size_t size;
-
-		if (type == IORESOURCE_IO)
-			cpu_addr = pci_pio_to_address(res->start);
-		else if (type == IORESOURCE_MEM)
-			cpu_addr = res->start;
-		else
-			continue;
-
-		pci_addr = res->start - entry->offset;
-		size = resource_size(res);
-		err = mtk_pcie_set_trans_table(pcie, cpu_addr, pci_addr, size,
-					       type, &table_index);
-		if (err)
-			return err;
-	}
-
 	return 0;
 }
 
-- 
2.53.0.473.g4a7958ca14-goog


