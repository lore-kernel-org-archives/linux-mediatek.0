Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3606BF357DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 07:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjmmZwc6KWVq4M0dNXYbWQ21OGo4O/i55CZpo06FEF0=; b=cRdD3Y63liHidu+RVU2NxJZaX5
	BqqrZxzvN2v+Woy8uMKBLGHPCoTpZacONyyl12IEE89etIJAXJ/EMkF2AhgDhqN2XrAxyLRTXUi7u
	VoX4pLc5umdstjnTzD6NrM/KLQKO54Kh3+OwB80KALilcCIkwDspPpCjihlfSNV47yTXyJ6UENjRD
	apGAw+j7KXaDn1BfeJWx6ksgc++CXQ7BR1qt3g1sjvEx6lIEmR5j2qOpzuFBv05a6F9kIq+btld7X
	eFmMXjQWjMhtISb4fs2M+lhLtCGt3CB9wLhd0/8zCA6b0g2kWdVw0hit7dqbgBrP/Q9JpbcN+eyW9
	I/5Qua/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9Eb-00000003PQR-0cYQ;
	Wed, 25 Feb 2026 07:23:01 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9EY-00000003PNV-3CEz
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 07:22:59 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2ad9a9be502so11218645ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Feb 2026 23:22:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772004178; x=1772608978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KjmmZwc6KWVq4M0dNXYbWQ21OGo4O/i55CZpo06FEF0=;
        b=J5K+l26L54eKlyGfZtuJrtqQNAWbyfgWdQG2xZ9xDnDzUWqyCxeYjONDiKNDCjaU2U
         guoymunHqVolcv4hBiizTtJWlb0VsK34E1o3/PJgXiMkEmDeqABduNMXXPFM4weNH3O3
         nhi5WDCZgrfRo/IWVTEZxNcCOQF8CTPGJENmc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004178; x=1772608978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KjmmZwc6KWVq4M0dNXYbWQ21OGo4O/i55CZpo06FEF0=;
        b=lQMIaROWcUktgVeklT25z3zAxA5/zXPxOaANWGL3ma06uFz+OnMgEBOsQQKA6+PfFs
         Se+fPvk+ufLSvTpr3lBktj0sky+eFF6ZTaInurJKMiWNuEzXIkC+Ufy+gLfcEr9YNhFn
         xa0UsE6CYr5ToHyR9FT0vnYcZwSGJUfPke+YzvLls1QavYQ86/IM77IYnjyJYrVLn66p
         fpABokqHyrTUuOC2HuPkswufaaFOL9tl5cicmAF/OsKB0TwYmC67ddXUDfdWtD84YaVR
         p+5I2xeY+GuGU3s/hHDkxlG1HmY72TqhYkTN58l84anseROujhnopOFtVjxEcDsIsy/X
         EkWA==
X-Forwarded-Encrypted: i=1; AJvYcCVUKl54sudnNb+Uw7YHNEfhTQvGzhHH8KNZ2p/ztf+QMWo6wm2KKWpvO9P/XY2/A1F5ta8FGjGaxkt7hKeoYQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxcCWHSdT+lw8cen4SW6TrUCbn4Po0y+CVSoFJuE9eoWPlpNiE2
	cXo4/pVM2xEgtDV/dRM9IDqOL0dp+HjCmDPyCImo9Tcdp2wcYkt5LI1ksDQNxok9qw==
X-Gm-Gg: ATEYQzwMeKEjTKu1knGVZfsfcHfYkeJnd8zAN18sz97Yd72DVBncnuRlWgZyQZbniDc
	s5WY9USoYUJhEOjQ/Xo9jBJEme3nQ1mWxzpIM1TaHnM8nKB1AXJRRv5xQItd/VsChpXdwvjvdrL
	whuFG8DvkpKWx/IXGOdqS5jUf3bqm+2DfIRgvcnrkBe3+tfDBg5T7vUO14+VLEnkxM2FIvHucJx
	NPyJ5pNIKXqiA6d7MQ0o3PmH7dQRrWkKkcvDQmiaiZYIiIcq7mBVlNkmGTwdniO3q0907psa5jQ
	x8OWLyMrICwCY7Fgm5k6hhNH1KxXeuzYPSUGMHOb3jGE04TOE8q20y4qUhcS/T+5FPOKcMVQ1Nf
	eHQw8J1NIhgTVg5OJDdKdqPS9E6bDeP3scTHc0IfRxYCKTlR0n7kWF9FdImhmoTWWNLFPuQYso2
	Q056x1dce0sHQ4oWGhatnvPxAHMaLDOTpAKUshJrPnYzqpZrzskWIc4jBL0BWBgc8w0UCHOK134
	8mj7g==
X-Received: by 2002:a17:903:46c6:b0:2a0:e5cd:80a1 with SMTP id d9443c01a7336-2add141780dmr17635675ad.41.1772004178049;
        Tue, 24 Feb 2026 23:22:58 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9d6:2e6a:941b:690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fdc9sm130814435ad.80.2026.02.24.23.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:22:57 -0800 (PST)
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
Subject: [PATCH 3/7] PCI: mediatek-gen3: Split out device power helpers
Date: Wed, 25 Feb 2026 15:22:20 +0800
Message-ID: <20260225072225.3345307-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260225072225.3345307-1-wenst@chromium.org>
References: <20260225072225.3345307-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_232258_810843_67F9B6AD 
X-CRM114-Status: GOOD (  17.36  )
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

Split out existing code that deals with device power sequencing into
into helpers to allow cleaning up the error paths and integrating the
new PCI pwrctrl API,

This change is purely code movement.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 87 ++++++++++++---------
 1 file changed, 52 insertions(+), 35 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index f2bf4afbdc2f..870d3b3db11d 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -403,6 +403,54 @@ static void mtk_pcie_enable_msi(struct mtk_gen3_pcie *pcie)
 	writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
 }
 
+static int mtk_pcie_device_power_up(struct mtk_gen3_pcie *pcie)
+{
+	int err;
+	u32 val;
+
+	/*
+	 * Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
+	 * causing occasional PCIe link down. In order to overcome the issue,
+	 * PCIE_RSTB signals are not asserted/released at this stage and the
+	 * PCIe block is reset using en7523_reset_assert() and
+	 * en7581_pci_enable().
+	 */
+	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
+		/* Assert all reset signals */
+		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
+		val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
+		       PCIE_PE_RSTB;
+		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+
+		/*
+		 * Described in PCIe CEM specification revision 6.0.
+		 *
+		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
+		 * for the power and clock to become stable.
+		 */
+		msleep(PCIE_T_PVPERL_MS);
+
+		/* De-assert reset signals */
+		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
+			 PCIE_PE_RSTB);
+		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	}
+
+	return 0;
+}
+
+static void mtk_pcie_device_power_down(struct mtk_gen3_pcie *pcie)
+{
+	u32 val;
+
+	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
+		/* Assert the PERST# pin */
+		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
+		val |= PCIE_PE_RSTB;
+		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
+	}
+}
+
 static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 {
 	struct resource_entry *entry;
@@ -464,33 +512,9 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
 	writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
 
-	/*
-	 * Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
-	 * causing occasional PCIe link down. In order to overcome the issue,
-	 * PCIE_RSTB signals are not asserted/released at this stage and the
-	 * PCIe block is reset using en7523_reset_assert() and
-	 * en7581_pci_enable().
-	 */
-	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
-		/* Assert all reset signals */
-		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
-		val |= PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
-		       PCIE_PE_RSTB;
-		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
-
-		/*
-		 * Described in PCIe CEM specification revision 6.0.
-		 *
-		 * The deassertion of PERST# should be delayed 100ms (TPVPERL)
-		 * for the power and clock to become stable.
-		 */
-		msleep(PCIE_T_PVPERL_MS);
-
-		/* De-assert reset signals */
-		val &= ~(PCIE_MAC_RSTB | PCIE_PHY_RSTB | PCIE_BRG_RSTB |
-			 PCIE_PE_RSTB);
-		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
-	}
+	err = mtk_pcie_device_power_up(pcie);
+	if (err)
+		return err;
 
 	/* Check if the link is up or not */
 	err = readl_poll_timeout(pcie->base + PCIE_LINK_STATUS_REG, val,
@@ -1269,7 +1293,6 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
 {
 	struct mtk_gen3_pcie *pcie = dev_get_drvdata(dev);
 	int err;
-	u32 val;
 
 	/* Trigger link to L2 state */
 	err = mtk_pcie_turn_off_link(pcie);
@@ -1278,13 +1301,7 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
 		return err;
 	}
 
-	if (!(pcie->soc->flags & SKIP_PCIE_RSTB)) {
-		/* Assert the PERST# pin */
-		val = readl_relaxed(pcie->base + PCIE_RST_CTRL_REG);
-		val |= PCIE_PE_RSTB;
-		writel_relaxed(val, pcie->base + PCIE_RST_CTRL_REG);
-	}
-
+	mtk_pcie_device_power_down(pcie);
 	dev_dbg(pcie->dev, "entered L2 states successfully");
 
 	mtk_pcie_irq_save(pcie);
-- 
2.53.0.414.gf7e9f6c205-goog


