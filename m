Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A0EF357DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 07:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUo4vtr12HAXaUXM31/ATv4Xjd7UfeFJnf/tlsKW30E=; b=Kb+HrQRrEy1CjCN072cyUQNFuN
	b5CfiGDP1P0QLY64yLkJHRLtz7i8w5ObR79xPlQ9SkGe0MSSW9c2uOZfwKaBNdnhvdGmSco2gTOor
	pR2Mf2NHT6r3xAoxZ65dAQkhSOeXdvs38IS2q+JN+H+QnwxALI+Z1pqPckExNSXaumIC2eGdjmG7z
	LdxPZsNEgKFwkTvhd43uz1YT8SZFDc/xO0bkcuB2ycSW75yBiN5sLJicHGZK5ivFYqfv2qc3CP7Mr
	rQNvW6Dvx2F82M3JtwSd4qcrGIGDLmmEBIJQX/EqbVvIa6GdCGZw3fJXtqEt1k1zurTAIHV/EXPgm
	jXfjBoOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9Ej-00000003PZu-17dz;
	Wed, 25 Feb 2026 07:23:09 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9Ef-00000003PUj-0273
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 07:23:06 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2ab46931cf1so3799415ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Feb 2026 23:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772004184; x=1772608984; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oUo4vtr12HAXaUXM31/ATv4Xjd7UfeFJnf/tlsKW30E=;
        b=lDhKP6sSEcJ5TihNZe6YZjrFwy+Phto+2suN7hJotoRZoJ0ei78JMD5NQnGCp2OA2S
         weaLbnAXcmUsHfvKhI5minVjjqUf2oMh8SycPYTVUMt+vkMrUu6cu/ftgo6f3TV2zNCL
         AAlYLhoZDUe72JXgg1p/0LsH6T0oloFaw7fcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004184; x=1772608984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oUo4vtr12HAXaUXM31/ATv4Xjd7UfeFJnf/tlsKW30E=;
        b=KnEj6qBVrRyFzuZROwB9MFpeBzutJTS9AXcph7tTQQ4A0o5YdELjrkw4j85Lv08kg5
         XWLHbpCOTAnrjEVDloP/6FGO+Jhu6ViZeBW8V6zAGl+quKIZFRS/2jKOHrP/llt0rkLH
         CGKzI/mnujn5fUEirlsH/UJ4SLyeWDjzsDHehac0ZAvLZTQZBaRUwDHunh41NVNi4LWh
         ijpOVtrhSBG2+ndF0ZRySICn1pybdp26vHAFv6Bp6jsO+EDtFXd0xdYKG07pR5slczYu
         O5bm9uAK9IWfu3tvQHTfrqIntXeghgNeggoIdIF1gpGhoxco2tHwwyiYjF0o71MSpRuK
         rA6w==
X-Forwarded-Encrypted: i=1; AJvYcCW12fw5o3x6TlFG04O8isK0CIEwGuLzfk3xSLFnS2IZ/Mn7j8Bad9roLmC4/5rgeyUf/VYbkB4/h9Iv063Phw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwRjQEW3+w2N3MTw/gebyTg8xIvvMOIRG7qgDEw2g8ZD/Lddrf7
	Jr/X++lSqz/lG9+4hyLVrxl9odnwa4AQVNV7xw0Ad4o1abtC8IjEijlcSG1ab4WrMQ==
X-Gm-Gg: ATEYQzxCp933w/KQtdO6XNAQksSZfdQbEWNbZYDIPlYeLktywm+nbyhi/CsTdpLFVsb
	894jU6KXbhUi/Yc137r+iUKxPZCuSnlSih2HYKUoqoTCNzDvscC+0Reiz3l2EEXbXjiuhFdvxSD
	DpdW3cYBHe7vuMxy0al3pxUMktGQHN28F1UT7qcHP1VF7Rnu928V9+r8PXnhiY7BS9RZT0B+Ls3
	bzGFKnOjDknSH2S1aff5zsGbuUaDandN2iucaMldCCAzRgBGrD/3EvouB3LvE6j4GUlap5bQQVe
	m+dtt+3I+7abHb9cna9mYvvEGKBgNz/QzDwoYXUynghpPMuc9PJbfQI1dk2e4YAw09zsAsYjYLy
	Ho6syP1Mp5znoeC+jg2nYsBQNwuEg2nwPraQ4VzpJyWhWUq72VnubsKoGzr6inbbHsyddeBDpV8
	hdKb+DnMKkq1Ng5Kf+6McFjjOkTXMyNFa3E7TdKJHHg+2e6jUT15S1UucqxPZT12wtrl4lfhjK0
	0aWiQ==
X-Received: by 2002:a17:903:230f:b0:2a7:aac1:7201 with SMTP id d9443c01a7336-2adbdc0fea2mr28441365ad.3.1772004184166;
        Tue, 24 Feb 2026 23:23:04 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9d6:2e6a:941b:690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fdc9sm130814435ad.80.2026.02.24.23.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:23:03 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] PCI: mediatek-gen3: Integrate new pwrctrl API
Date: Wed, 25 Feb 2026 15:22:22 +0800
Message-ID: <20260225072225.3345307-6-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260225072225.3345307-1-wenst@chromium.org>
References: <20260225072225.3345307-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_232305_069089_85A5EA66 
X-CRM114-Status: GOOD (  17.02  )
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

With the new PCI pwrctrl API and PCI slot binding and power drivers, we
now have a way to describe and power up WiFi/BT adapters connected
through a PCIe or M.2 slot, or exploded onto the mainboard itself.

Integrate the PCI pwrctrl API into the PCIe driver, so that power is
properly enabled before PCIe link training is done, allowing the
card to successfully be detected.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 38 ++++++++++++++++-----
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 7459e1c1899d..93e591f788f7 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -22,6 +22,7 @@
 #include <linux/of_device.h>
 #include <linux/of_pci.h>
 #include <linux/pci.h>
+#include <linux/pci-pwrctrl.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -421,15 +422,23 @@ static int mtk_pcie_device_power_up(struct mtk_gen3_pcie *pcie)
 		val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
 		       PCIE_PE_RSTB;
 		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	}
+
+	err = pci_pwrctrl_power_on_devices(pcie->dev);
+	if (err) {
+		dev_err(pcie->dev, "Failed to power on devices: %pe\n", ERR_PTR(err));
+		return err;
+	}
 
-		/*
-		 * Described in PCIe CEM specification revision 6.0.
-		 *
-		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
-		 * for the power and clock to become stable.
-		 */
-		msleep(PCIE_T_PVPERL_MS);
+	/*
+	 * Described in PCIe CEM specification revision 6.0.
+	 *
+	 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
+	 * for the power and clock to become stable.
+	 */
+	msleep(PCIE_T_PVPERL_MS);
 
+	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
 		/* De-assert reset signals */
 		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
 			 PCIE_PE_RSTB);
@@ -449,6 +458,8 @@ static void mtk_pcie_device_power_down(struct mtk_gen3_pcie *pcie)
 		val |= PCIE_PE_RSTB;
 		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
 	}
+
+	pci_pwrctrl_power_off_devices(pcie->dev);
 }
 
 static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
@@ -1211,9 +1222,13 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	pcie->soc = device_get_match_data(dev);
 	platform_set_drvdata(pdev, pcie);
 
+	err = pci_pwrctrl_create_devices(pcie->dev);
+	if (err)
+		return dev_err_probe(dev, err, "failed to create pwrctrl devices\n");
+
 	err = mtk_pcie_setup(pcie);
 	if (err)
-		return err;
+		goto err_destroy_pwrctrl;
 
 	host->ops = &mtk_pcie_ops;
 	host->sysdata = pcie;
@@ -1226,7 +1241,12 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 
 err_teardown_irq_and_power_down:
 	mtk_pcie_irq_teardown(pcie);
+	mtk_pcie_device_power_down(pcie);
 	mtk_pcie_power_down(pcie);
+err_destroy_pwrctrl:
+	if (err != -EPROBE_DEFER)
+		pci_pwrctrl_destroy_devices(pcie->dev);
+
 	return err;
 }
 
@@ -1241,7 +1261,9 @@ static void mtk_pcie_remove(struct platform_device *pdev)
 	pci_unlock_rescan_remove();
 
 	mtk_pcie_irq_teardown(pcie);
+	pci_pwrctrl_power_off_devices(pcie->dev);
 	mtk_pcie_power_down(pcie);
+	pci_pwrctrl_destroy_devices(pcie->dev);
 }
 
 static void mtk_pcie_irq_save(struct mtk_gen3_pcie *pcie)
-- 
2.53.0.414.gf7e9f6c205-goog


