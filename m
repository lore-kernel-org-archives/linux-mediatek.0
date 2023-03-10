Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0687DC64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Mar 2023 14:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SAwxMVgEJW/diY6+z5s1oE+bbPFu7/bM9oM0FwFsxyE=; b=nxIePsAnmOx9zkhi+v4HDMBT6t
	FqTt7yL3jwKSfhyeYZJ39rQyoiZsQzs4+4mJfJ4RUr5ycR7u4oS+4ndTRnA4eKm2BS+AkELuICFc/
	NqWE6AskOY3JDTZFZi8Kp+FiW2PhXrGzd2dy0vKxHeDaLIXUIzidiO68Kb2DXpb5vc6lyj/QxQ7MF
	yOaXc+pQajiJZqMp8pta/qVtNuZZTXQM4hM4Duwvdm2SRZh/n1ShtIJ/hmX5+wyZ40Gm9DWmCRizy
	1kBi80lpAEFtDJdzYOYoXYxenoeTt+59inVeSHH8AvmYFdn9SlzizEIgj+YOfICchL6jT7cde6v6Y
	rPE93rKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pae4m-00EoNB-Cc; Fri, 10 Mar 2023 14:50:32 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pae2m-00EnAc-Vh; Fri, 10 Mar 2023 14:48:30 +0000
Received: by mail-ot1-f53.google.com with SMTP id a4-20020a056830008400b0069432af1380so3023850oto.13;
        Fri, 10 Mar 2023 06:48:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459707;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SAwxMVgEJW/diY6+z5s1oE+bbPFu7/bM9oM0FwFsxyE=;
        b=trj9dTwn5Wij1+KdI0JUA6OHONBXs9HaqbygyYvtzyAntGmhbxbbAGgpAzTqIZRsyY
         2KaR0ocTqLfxNNK92DwglmhsGvRbLnt7467/vVPirWBwr0RpXgYnd5jM7DZvmCywBbKt
         6TRsP8YpWBfOzw90RlPhxmoFO0pmifLgQRY3PPmsJKSVYyrPgRlkaiQjvdNYiYRVunRd
         HHn0ydpVbNWZBAMWO0NOkXZs6jDx+OhbJO3fG5lnHl8C5ROC2B6algJiVJ2mjAqs18bb
         Oft1xNyEoBDREj38tXWtWCff9Vyd3s+eDrQAf9mleRnMyDQozegGYTlUZMo2iVUM8Ppk
         Z55w==
X-Gm-Message-State: AO0yUKV9nk3I1RiuRoBC/loxxqqPulWtnahyGPery9K4WDmnGGUXUtON
	k8Y6c6J/SwCcM4moeuDvow==
X-Google-Smtp-Source: AK7set96ixhp821kK8jijKchnvAgmkphcExUaHLLv7P6NqMK7LhdxgFUjRonphsIl2+XBIEkxGUmRQ==
X-Received: by 2002:a05:6830:248f:b0:68b:cb5c:8e1 with SMTP id u15-20020a056830248f00b0068bcb5c08e1mr13902010ots.13.1678459707649;
        Fri, 10 Mar 2023 06:48:27 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q19-20020a05683022d300b0068bd20cf07dsm115696otc.48.2023.03.10.06.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:48:27 -0800 (PST)
Received: (nullmailer pid 1544470 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:19 -0000
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>, Lorenzo Pieralisi <lpieralisi@kernel.org>, =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Bjorn Helgaas <bhelgaas@google.com>, Jonathan Hunter <jonathanh@nvidia.com>, Ryder Lee <ryder.lee@mediatek.com>, Jianjun Wang <jianjun.wang@mediatek.com>, Tyrel Datwyler <tyreld@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: [PATCH] PCI: Use of_property_present() for testing DT property presence
Date: Fri, 10 Mar 2023 08:47:19 -0600
Message-Id: <20230310144719.1544443-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_064829_061463_1FABA779 
X-CRM114-Status: GOOD (  15.10  )
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

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/pci/controller/pci-tegra.c     | 4 ++--
 drivers/pci/controller/pcie-mediatek.c | 2 +-
 drivers/pci/hotplug/rpaphp_core.c      | 4 ++--
 drivers/pci/of.c                       | 2 +-
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
index 74c109f14ff0..79630885b9c8 100644
--- a/drivers/pci/controller/pci-tegra.c
+++ b/drivers/pci/controller/pci-tegra.c
@@ -1375,7 +1375,7 @@ static int tegra_pcie_phys_get(struct tegra_pcie *pcie)
 	struct tegra_pcie_port *port;
 	int err;
 
-	if (!soc->has_gen2 || of_find_property(np, "phys", NULL) != NULL)
+	if (!soc->has_gen2 || of_property_present(np, "phys"))
 		return tegra_pcie_phys_get_legacy(pcie);
 
 	list_for_each_entry(port, &pcie->ports, list) {
@@ -1944,7 +1944,7 @@ static bool of_regulator_bulk_available(struct device_node *np,
 	for (i = 0; i < num_supplies; i++) {
 		snprintf(property, 32, "%s-supply", supplies[i].supply);
 
-		if (of_find_property(np, property, NULL) == NULL)
+		if (!of_property_present(np, property))
 			return false;
 	}
 
diff --git a/drivers/pci/controller/pcie-mediatek.c b/drivers/pci/controller/pcie-mediatek.c
index ae5ad05ddc1d..31de7a29192c 100644
--- a/drivers/pci/controller/pcie-mediatek.c
+++ b/drivers/pci/controller/pcie-mediatek.c
@@ -643,7 +643,7 @@ static int mtk_pcie_setup_irq(struct mtk_pcie_port *port,
 		return err;
 	}
 
-	if (of_find_property(dev->of_node, "interrupt-names", NULL))
+	if (of_property_present(dev->of_node, "interrupt-names"))
 		port->irq = platform_get_irq_byname(pdev, "pcie_irq");
 	else
 		port->irq = platform_get_irq(pdev, port->slot);
diff --git a/drivers/pci/hotplug/rpaphp_core.c b/drivers/pci/hotplug/rpaphp_core.c
index 491986197c47..2316de0fd198 100644
--- a/drivers/pci/hotplug/rpaphp_core.c
+++ b/drivers/pci/hotplug/rpaphp_core.c
@@ -278,7 +278,7 @@ int rpaphp_check_drc_props(struct device_node *dn, char *drc_name,
 		return -EINVAL;
 	}
 
-	if (of_find_property(dn->parent, "ibm,drc-info", NULL))
+	if (of_property_present(dn->parent, "ibm,drc-info"))
 		return rpaphp_check_drc_props_v2(dn, drc_name, drc_type,
 						be32_to_cpu(*my_index));
 	else
@@ -440,7 +440,7 @@ int rpaphp_add_slot(struct device_node *dn)
 	if (!of_node_name_eq(dn, "pci"))
 		return 0;
 
-	if (of_find_property(dn, "ibm,drc-info", NULL))
+	if (of_property_present(dn, "ibm,drc-info"))
 		return rpaphp_drc_info_add_slot(dn);
 	else
 		return rpaphp_drc_add_slot(dn);
diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 196834ed44fe..e085f2eca372 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -447,7 +447,7 @@ static int of_irq_parse_pci(const struct pci_dev *pdev, struct of_phandle_args *
 		return -ENODEV;
 
 	/* Local interrupt-map in the device node? Use it! */
-	if (of_get_property(dn, "interrupt-map", NULL)) {
+	if (of_property_present(dn, "interrupt-map")) {
 		pin = pci_swizzle_interrupt_pin(pdev, pin);
 		ppnode = dn;
 	}
-- 
2.39.2


