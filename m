Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10078D58E5D
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2026 05:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WS0H4gblPcUNTBMF+emXYCfilFNXiGuML7GCXXtTZqw=; b=4ATRehkMu0YnRY4+a/PalaYdyl
	qc7FUNeRhMxQXTTRD3cZjw9v+9e5FXh7RI1D/E+bsOSdgn1U423qAr+sTaM+BOvNGH5Cx7x6oH3j4
	+Uez+7SMLHhVnXr9ynD6540hQjrTGtFYd7tTzy2YTBhvSs4tM93iqKiAlDPpq8yJc1iwPXbJKBKZY
	iMffFt2a8LOAAZO9aqHnTpDkAfMub6QJxY7SdTwMyLtVV2r4MhpCveAMWxlpwex5xGQ2qLnxvSw7f
	jR0MPFpC5Y5TeswHCwYn+uu+jDqjOuUCBGS9n9xilLD4v3OxZ5eW52lFsyPHstARz+94434Ycw4CY
	FwXioXOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsP-0000000CIip-3i48;
	Mon, 02 Mar 2026 05:31:29 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsN-0000000CIh0-0AQz
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Mar 2026 05:31:28 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2aaed195901so19208865ad.0
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Mar 2026 21:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772429486; x=1773034286; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WS0H4gblPcUNTBMF+emXYCfilFNXiGuML7GCXXtTZqw=;
        b=E/7Vk5kAzxtj7Jtoify793eAgnVOafEM2/nJ3Yt8rUVObvE0ZRibQTAIs92Vgkqh4V
         5oc4DvLsxAOMNtzTApcfdNBDsyHUz7Utvkby+bIPpx5oy+XUDGsdYqS1c5uhbBPGY7OV
         Zg/1Sj3hBJGBZOgZg6vZseHpuJg6SJKa3gi6Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772429486; x=1773034286;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WS0H4gblPcUNTBMF+emXYCfilFNXiGuML7GCXXtTZqw=;
        b=afb90nqAbGzO5Xb6stxzChL1DLHmO4lsBO1U1Q/M/XUe4Dj3HtbNA0lX9iprStGaAi
         HAaS2aTL8ZYDDtx2bCl0hK6ZfT6ARZNSnGqO8dNW7oxNFSsA3/yZF0pheReUmD35V7RX
         AWw7b0A3NfcXgPlQWYsUD648/u2EbpeB7fQ+WZ1f+ItB9qloSloEcJ2MN9WmkK5bmtKH
         CNpiMJ3gbIO6bexYfeuWRuZogWR85/OW730fM7DQky0TmNOomOKLr3KfXW+DaACAYJrh
         /FsosWmK1gxF9AE/AjNdO5cwiP2LngEhqt91HIE2hT62ixackajwzHHeMm4a+tUZXJna
         YoQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmkydax6ZVLvYUwKxdRMrjGtOyr5ywNRKIiFDtJE2t8Cm3/3LFcEChSkD20f+PGr+kKcL+Z5/yKNOUcRwWig==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxkz6ATQIvT/CKzf0jSKY8CVa0CncEarPzCjhWfITOsCY5LpU6v
	N1ZlobXGCD3pIbzK0YYbhL/2ApIMdEJpR6ChwZyh3vClm0mB4XQHxYsjxvVdI8T3cw==
X-Gm-Gg: ATEYQzyBDUlPYYSl4dqIjdN+AOUk+JSvKKY+w9udUtTO2e95P6BIWt2GUUJ1FCOwV8i
	FxxsEUdr/QW1nmZkOj4yteExm+BtVjEuChSTjAej4e/u7REU5KFmXNLtN+/0H0/0Z+nzVqjlgFj
	8DGLwK9ZL6s+P0npWv2IJId/EHyqDyGP6gg1PjVBNwRtfWz6xnwImX8lha7FwkjEWgW71W0S2f8
	ks9kwY22rUh1/d88rR8M0hz4xwW995seRoCR3zm1LD29hYzT4exEBqmBlK4kIttwS8DkwjdSVfQ
	KkXvutOM0ob/8dL8V0UzbsGr/XrjcGisbG8ukIcrMp6e3X0m0ceXVjsvDcPI46oNdcYCClSKbxO
	dtuXxWUEbQtefLoA0t7jb2Vc0RAJn2RtkUnivEbySUMsiojXwwFPeAErdpJzF7a59xzqsYldN/7
	qeEhlgQrLa7b7/OFBxP0satqj+nnLEO22Jv8zT2NrvsILbJlnmn6mS/6HIqcKSQ49WjVpZSotze
	Wk6IAHq
X-Received: by 2002:a17:903:390f:b0:2ae:478f:2ec with SMTP id d9443c01a7336-2ae478f12cfmr47093975ad.29.1772429485999;
        Sun, 01 Mar 2026 21:31:25 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b9b7:93f7:8c3c:59d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5229cda1sm15196435ad.23.2026.03.01.21.31.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 21:31:25 -0800 (PST)
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v3 3/7] PCI: mediatek-gen3: Split out device power helpers
Date: Mon,  2 Mar 2026 13:31:03 +0800
Message-ID: <20260302053109.1117091-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260302053109.1117091-1-wenst@chromium.org>
References: <20260302053109.1117091-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_213127_084625_4E495CB5 
X-CRM114-Status: GOOD (  17.99  )
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

In preparation for adding full power on/off control with the pwrctrl
API, split out the existing code that only partially deals with device
power sequencing into separate helper functions. The existing code only
handles PERST#.

This is purely moving code around, and brings no functional changes.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Updated commit message
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
2.53.0.473.g4a7958ca14-goog


