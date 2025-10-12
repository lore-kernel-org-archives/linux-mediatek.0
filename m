Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEFC4CCD187
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Oct 2025 20:59:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3LU04oH6Jeu7LPnO6lTLYJu+6qHSNvnAGZMQiBqSTLE=; b=jiIssmlK0XBaM1k+ozRgZaYDJY
	0I01jhS6aCes9w4JMgj4LiQJt3JxA9mZwa7AhAbhBP7qLMVD6bewYVz7HAEHvgNCWcuD11EComWZ4
	zF4IM34GKo9aXupLFN9a/KGvC28i2cmzVdiSlXX8+X0WQo8NvHRw5YkVWD+YDxvIW2B2KDRguIq6K
	17RYMjz1w1xT1udgdP72yBlVYLK7D+4wqpNG8erfZmNkpVMiOwUq6GT8PTyMKj7/kC2xOak5cXQI3
	+f9V3FVm5OP45H67UVQhJ62cEnYGPBsVugb2V6Ax7JV0/U+YaetNv2PlB3pgEsjkzehpjZQyUKQAa
	FHgkPhXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v83A2-0000000Blbv-0PqW;
	Sun, 12 Oct 2025 20:59:22 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v839v-0000000BlTM-2Bp4
	for linux-mediatek@lists.infradead.org;
	Sun, 12 Oct 2025 20:59:16 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-46e37d10ed2so32168105e9.2
        for <linux-mediatek@lists.infradead.org>; Sun, 12 Oct 2025 13:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760302754; x=1760907554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3LU04oH6Jeu7LPnO6lTLYJu+6qHSNvnAGZMQiBqSTLE=;
        b=jZNmFiYdVfityIboyMwsokmrprC4pUsqerCBQBLn6G0kiBat+T2RS9W/ffydf7fgJW
         L7JvVZ7PlrFXODa8Oaal5iTemZL6havzg4z7OOCV5+vcfN1BwA3BTs4ILmtVJbSOekRr
         5gyIvm4HG9OgNIyExmeBpYsvgXk4hpyrhYFahGwlyFSOhiz5EXePINUjgJ195TuzK5gz
         jNbGcHFWcCgbNrRYaKFO0Mc1kyv3UL8d6XFV6nOJhIkx6n3KbvmYXCulB6rcNQXideSg
         QFPsBjcWIlYYEN8axjKfKgLHJgjYkPgmdf5ilprPomjobJyslyiqQOn0A87CFVjsle0P
         G46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760302754; x=1760907554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3LU04oH6Jeu7LPnO6lTLYJu+6qHSNvnAGZMQiBqSTLE=;
        b=oZ6NFqxkZEaWtbbrQKPhPB666lBWbOUMjj/IC3Cij7L14slZT3qheCA5UsyDvcDg4L
         uqBBmNjd6m30kTeKrmDeuq9uF7ksTZblZfi2Nlt1/DlflURAlcT9dcdo6aodwlYDwag8
         ltF2gyjvdWyLR5sMsGerrweYHpRYwTPBzm8Swd4xJy6KTRvEGH6tZglmMC621LDIjTLQ
         D5c3+0e4WM4GHTtfn/MmhXaFwEzHGMfun2n1YPHfjAPvL1x/bzWNN+hIzxX5IFkPAtFh
         heJhKGHHzDe08jhkqs2JMtqhl0WNaNUfPbdTecYMEwBOJVK9FXep5mKISZtTi2eZ17RP
         AY3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVJRO7fJYEFVx7Ojnsk6Z4sZOXD8Bm3AoNGTQXoF4xv2FNuHOrqzdA6Ebbun7a9XYq/hNN0U4J1YlwKhcC8Wg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZh2kZaUXTpGIJDZJZ7DAoFaBgmuZh/eYZ25zaE1Gw5GJv6chL
	0AcbERJuID6TvYNJhP401yu5RVQK54/0nTy4WqIWnCMMSPhPgN6Iarnd
X-Gm-Gg: ASbGnctUuCNOyaAUO+Wjn/GRQmSrgs3Ea3sP7ZQzEdhosG1k3Vuyf4VQHdgGoq77+4e
	3plZD3TNTZ0KWH20FmjIqEyeqJcmkyBePvjcZ5//9JBma5hhecISEkjoRnvv/1HTEOi0jFmRWcd
	8q7BWSXZpUwZukFy6T5t9XfAwUn1xXSe7PJKUvGsxmGdN3hAFRU10BUWCrcUt5mRCh3NSqg2PLy
	AedGoNIVVaY9It1dpk97lRVtJHQh2vJRIph2MaTc5qIyhqkiBI0MByTQWMu66jiyps3n2ATfpH3
	51X0Vu1A8ZKhtuGLyhXJqdzdFyLWYYqDZGqF204XrFaMOSGojvQAL7SsPRwHuarB4DuD+g0uaEM
	5nKADOYDqkidalesxPuEAZE8CrCLdJ1ZdOJ4x/P/+r1CTk+/exrWwjBbtvR+J6c0wI2ntBXV7fg
	==
X-Google-Smtp-Source: AGHT+IFb/bAhpEKJ/FBvurZ3ngymv1jIbjyeCuWNWFx0Ku04wvextCGWwGr4AETbratHm/u6QoIvxw==
X-Received: by 2002:a05:600c:3f10:b0:46e:5cb6:b904 with SMTP id 5b1f17b1804b1-46fa9b079f7mr131209665e9.28.1760302753575;
        Sun, 12 Oct 2025 13:59:13 -0700 (PDT)
Received: from Ansuel-XPS24 (93-34-92-177.ip49.fastwebnet.it. [93.34.92.177])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-46fb489197dsm156506505e9.10.2025.10.12.13.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 13:59:12 -0700 (PDT)
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
Subject: [PATCH v5 4/5] PCI: mediatek: convert bool to single flags entry and bitmap
Date: Sun, 12 Oct 2025 22:56:58 +0200
Message-ID: <20251012205900.5948-5-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251012205900.5948-1-ansuelsmth@gmail.com>
References: <20251012205900.5948-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251012_135915_587453_5325D701 
X-CRM114-Status: GOOD (  18.29  )
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


