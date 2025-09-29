Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C746CCA468
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Sep 2025 11:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LU04oH6Jeu7LPnO6lTLYJu+6qHSNvnAGZMQiBqSTLE=; b=4EHf00TkL7XZzLjlnd5hZmaIrs
	S9/MWVMYS8aDbH7hba6Btzh5RlgnQ5Ty9ZVNsllQbKs60RaazAEIZaB/aQMcCcRreN6WiHMpVQJJD
	zxFmf2ySM+Ii6khWf6E5DnUwWW73MbRGwVSrrxgJKkh5W8P5/HNAZai7CdWKgAfaeo5OR9d0M84+E
	Tl8pBndZ9QlZ7KUBDCLlSl2coSajRFDD6kWcGq42JIrbtP1wec6Xz8pQilSlIoOfe9tQ1EyPiQJAM
	TMcBfn19DW4Q+4cnWoxs5twHU9G8Ij7U1zXKegbLDWxSV0ROeInJPRHtRVZ/EOw10032CiIVthM/o
	R7yXlI6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CD6-00000002MUB-2jRr;
	Mon, 29 Sep 2025 11:38:28 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3CD0-00000002MMU-3nzN
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Sep 2025 11:38:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-46e52279279so6864135e9.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Sep 2025 04:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759145901; x=1759750701; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3LU04oH6Jeu7LPnO6lTLYJu+6qHSNvnAGZMQiBqSTLE=;
        b=gyR3Ldwjx2WC6XGzx9ZXYl0I7hl/iJb85Yp040kDubTcbWhbHMdfmER8fRDxAsO/+A
         6x4X7RMAjNoEguda08eZHqKvMr2OCDksGxDsFqGq64ET//GTbeIWRHB8RYyNCD0SpKi3
         /oXzhx1v70Uhbtbdks9NB3nfXghPy+HyeB4Z1KD5YU8OWK9VeH5YXHnW2t+0mCe5Uq27
         eaJFMRYDy3KD1jS0sAexaMS5vRRnD5XaALe4aSK7j3Hilut73sbOaXqGEzJt8xFlRNHX
         V0BWZPDqtAYssN7tu4ehPUTsJ1T4VjisD6qKqBLK5tsXgAi/uK7CgqazJ4H5kXPMNmLy
         acvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759145901; x=1759750701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LU04oH6Jeu7LPnO6lTLYJu+6qHSNvnAGZMQiBqSTLE=;
        b=HTBhh2EL4neDWhXgITScR1IHBWKZ5BrBXxWUXPqIfoEGRkPIC7j4eKhvM9AGyo8tLW
         Uhm6Yma2GPCkDLxUukH70aAPrHblnVrounLysQw54HmvFjbH1koux29Z8OCzWTsQlKMY
         rRwXcexK3dJ/4CjugC9df3TfLNWgKG9cHe0gKYJvMhOYUjYZJknjva3FwIYIoHXeaNS4
         NkkyR8+OqrDIeB/TCEU5tAdxx3SZaVpCABC7gA9VZMgqBuLzfN6P2yGUars4gRqk8Thg
         qco7ZTH6yX7JSTPAlz+SaqdLPbLQzkhMDSgSg1qWEq7DxaEURJvmtEZgL48rrWJyqoWB
         fQEA==
X-Forwarded-Encrypted: i=1; AJvYcCX+AXBn0ZMp7OelNLUvTtLKPbiz69XWTPioneWL9rG7NcqQGBl3WTK0E5I8yjDP9MvhXi81ku7xAehBhTjrvg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzs0dCPMctgdgwaoTR1yKGBPO58tyUaW2ePL3SY4VvpgGMj2ArI
	mh3+SandhN57jD6pQ/TpWiNzBYaBgjjaEc2XqIyCtmFbt+ZHQBAL3kQb
X-Gm-Gg: ASbGncur/cYCE3Rq28gp6wMajr49e/mqITPFzER8nBJAswljjRIXBka8tVzqT+HT4bQ
	Wo277T2xWJ3PltSbxPQ9VhHDv/ObWTnIPiadqtKVF+0f5gV26xjzNmw+XHNBHxovGYAiyT1JlEO
	QI2A2XVY6pK1EhYb00M9vOMicEgCQQYw4nXcH4RyCM1pHwUjOYVAPETSZNdb+qwMEv8pj4hpGim
	bJQFTS45gPa9nSpVfueiBEFDvDD2w5yQbrF3Y7rNxbv1+ql22N+eFPt1+0SgeC6/dGOZEBnTMau
	rRbJBH9acEh8sC5mtWxAMp5j1AX81SkFg+jdshnCm9ELAIeBSQqZvnec/wyAxD3BWfUyFmsTlT6
	h/qXXgjZr23y6uEm522AuZ4JtfjiX/a0rKdnhnYd9S6DRHpmZVePLcp42YGG1hFOo7vwEyfk=
X-Google-Smtp-Source: AGHT+IGwis8GqJEF1Qzf9bSzV6u14blzsX+OeBzCW6GOkWLJgWkwGAve2YAB0K6RDda7Irm9+euaNA==
X-Received: by 2002:a05:600c:1e23:b0:46e:39e1:fc3c with SMTP id 5b1f17b1804b1-46e3a4e1b6amr123957035e9.5.1759145901122;
        Mon, 29 Sep 2025 04:38:21 -0700 (PDT)
Received: from Ansuel-XPS24 (host-95-249-236-54.retail.telecomitalia.it. [95.249.236.54])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46e56f53596sm9502465e9.7.2025.09.29.04.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 04:38:20 -0700 (PDT)
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
Subject: [PATCH v4 4/5] PCI: mediatek: convert bool to single flags entry and bitmap
Date: Mon, 29 Sep 2025 13:38:03 +0200
Message-ID: <20250929113806.2484-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250929113806.2484-1-ansuelsmth@gmail.com>
References: <20250929113806.2484-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250929_043823_057266_D4077C36 
X-CRM114-Status: GOOD (  19.15  )
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

To clean Mediatek SoC PCIe struct, convert all the bool to a bitmap and
use a single flags to reference all the values. This permits cleaner
addition of new flag without having to define a new bool in the struct.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/pci/controller/pcie-mediatek.c | 28 +++++++++++++++-----------
 1 file changed, 16 insertions(+), 12 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index 24cc30a2ab6c..1678461e56d3 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -142,24 +142,29 @@
 
 struct mtk_pcie_port;
 
+enum mtk_pcie_flags {
+	NEED_FIX_CLASS_ID = BIT(0), /* host's class ID needed to be fixed */
+	NEED_FIX_DEVICE_ID = BIT(1), /* host's device ID needed to be fixed */
+	NO_MSI = BIT(2), /* Bridge has no MSI support, and relies on an
+			  * external block
+			  */
+};
+
 /**
  * struct mtk_pcie_soc - differentiate between host generations
- * @need_fix_class_id: whether this host's class ID needed to be fixed or not
- * @need_fix_device_id: whether this host's device ID needed to be fixed or not
  * @no_msi: Bridge has no MSI support, and relies on an external block
  * @device_id: device ID which this host need to be fixed
  * @ops: pointer to configuration access functions
  * @startup: pointer to controller setting functions
  * @setup_irq: pointer to initialize IRQ functions
+ * @flags: pcie device flags.
  */
 struct mtk_pcie_soc {
-	bool need_fix_class_id;
-	bool need_fix_device_id;
-	bool no_msi;
 	unsigned int device_id;
 	struct pci_ops *ops;
 	int (*startup)(struct mtk_pcie_port *port);
 	int (*setup_irq)(struct mtk_pcie_port *port, struct device_node *node);
+	u32 flags;
 };
 
 /**
@@ -703,7 +708,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 	writel(val, port->base + PCIE_RST_CTRL);
 
 	/* Set up vendor ID and class code */
-	if (soc->need_fix_class_id) {
+	if (soc->flags & NEED_FIX_CLASS_ID) {
 		val = PCI_VENDOR_ID_MEDIATEK;
 		writew(val, port->base + PCIE_CONF_VEND_ID);
 
@@ -711,7 +716,7 @@ static int mtk_pcie_startup_port_v2(struct mtk_pcie_port *port)
 		writew(val, port->base + PCIE_CONF_CLASS_ID);
 	}
 
-	if (soc->need_fix_device_id)
+	if (soc->flags & NEED_FIX_DEVICE_ID)
 		writew(soc->device_id, port->base + PCIE_CONF_DEVICE_ID);
 
 	/* 100ms timeout value should be enough for Gen1/2 training */
@@ -1099,7 +1104,7 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 
 	host->ops = pcie->soc->ops;
 	host->sysdata = pcie;
-	host->msi_domain = pcie->soc->no_msi;
+	host->msi_domain = !!(pcie->soc->flags & NO_MSI);
 
 	err = pci_host_probe(host);
 	if (err)
@@ -1187,9 +1192,9 @@ static const struct dev_pm_ops mtk_pcie_pm_ops = {
 };
 
 static const struct mtk_pcie_soc mtk_pcie_soc_v1 = {
-	.no_msi = true,
 	.ops = &mtk_pcie_ops,
 	.startup = mtk_pcie_startup_port,
+	.flags = NO_MSI,
 };
 
 static const struct mtk_pcie_soc mtk_pcie_soc_mt2712 = {
@@ -1199,19 +1204,18 @@ static const struct mtk_pcie_soc mtk_pcie_soc_mt2712 = {
 };
 
 static const struct mtk_pcie_soc mtk_pcie_soc_mt7622 = {
-	.need_fix_class_id = true,
 	.ops = &mtk_pcie_ops_v2,
 	.startup = mtk_pcie_startup_port_v2,
 	.setup_irq = mtk_pcie_setup_irq,
+	.flags = NEED_FIX_CLASS_ID,
 };
 
 static const struct mtk_pcie_soc mtk_pcie_soc_mt7629 = {
-	.need_fix_class_id = true,
-	.need_fix_device_id = true,
 	.device_id = PCI_DEVICE_ID_MEDIATEK_7629,
 	.ops = &mtk_pcie_ops_v2,
 	.startup = mtk_pcie_startup_port_v2,
 	.setup_irq = mtk_pcie_setup_irq,
+	.flags = NEED_FIX_CLASS_ID | NEED_FIX_DEVICE_ID,
 };
 
 static const struct of_device_id mtk_pcie_ids[] = {
-- 
2.51.0


