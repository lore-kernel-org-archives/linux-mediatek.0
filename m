Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6FAFC5903
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Feb 2026 07:47:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NJjBmosUgxEe4nJy82YG84Wt5BRGXOtIFhYYPVIxdgY=; b=zgPYkbvNvN27nacQdao73u96pb
	DzyEFsaQNm9wk8Rn5df6RMWld76yxxRLBGxXcJpEv8uJ8I+XNivKie0B4F4v9dRV5YszKF8F/yjrt
	s6bWOkdYbedUNMnJgYQR2ktAAy6zBYa0eV8SzOwWUwvbv0MsZxjIoxevl05257KooQec+mm+LgrvZ
	kHAIp2HAq3dOuhUsdzVXmLS4FL+usFuPk5zDLfqy4Il6uqDLsmf8qrc/xCwMkcG0jKqLwJGEDefwn
	MaLECg485/PuYmyD9uY94PzhAFmJatZiEUFNHSej8Cb1FpRJFMPD72eojTcGQOrbsEjvGFcRKp7vH
	3Lajt4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5P-00000005b6F-3bN1;
	Thu, 26 Feb 2026 07:47:03 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5M-00000005b43-2eEW
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Feb 2026 07:47:01 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2aad1bb5058so5373775ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 23:47:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772092020; x=1772696820; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NJjBmosUgxEe4nJy82YG84Wt5BRGXOtIFhYYPVIxdgY=;
        b=WH4TQQmlF6tzNeBPE5U6U0STUUTgxp7UASw3tnFcXLqZ1JanUS5RaCuLo4jSYi+TuV
         7oAscnQEtXfVOiVnoxY7NLxe+WYuEqLc6IBJtt7aVDY68kCmrmsViJ1YT4o/njvBzSfC
         PcxnZ/hjSkutYkrmDPmTmtteFWKfZMK4KwpIg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092020; x=1772696820;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NJjBmosUgxEe4nJy82YG84Wt5BRGXOtIFhYYPVIxdgY=;
        b=qEwHar9l3jdReyR78rz0mcnO7kuQrXSdTSf+NhtI8DxfU3XQyvtLG66oycUUObRcUW
         MGsCvges6C4Pa+D6EeYaxFwwrqLbUddeJLE1tb4JTPtP3f6Ce6xJec9fDUbZhsUkUFNn
         NLTQQhfObda4RUJBGjRFxHYDaN/spLUkbfwXXtgVecb1Sb76UsYEjpSC3eNKXhWLo2v+
         FxW8mj2M9Q7TAcfwWh+z08QB4tA1uleaDUzWhhTAjj4Dkx1F6UMnRRcFOBDPChEotHts
         J+6vvPBiAg7weoFgM458mp5uYeCULiFEOEVfEE3sjZpWxV4kyHCsLr540gKv2NGCCpM1
         49bQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNypciOrPPH9pYknmEw3J/ywjgDdCFTCGQMhVHkYhj0lWsk8KoNmizLuMH2CuV1jgMtFPP7b/zLXEhcjILzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaPlj3KhZs0eKuso8ZhCzbCqvxeSqrUhOwVy5vuyIOSMmjPHYV
	sHEVSu6z7FoeLMooO+lEq1qAG9CanjZRP2bk3ARGRlba2i0gCgnEvqiAsWMDP6CCmQ==
X-Gm-Gg: ATEYQzx/buHBlNLbzbSHWnfOPaU/eipRujBkURiB3Zu5BkWXM7Bn65dn1/6ijXPdQGT
	jUW5Oe0WcRQyvPJY3MSufn5tkGhz8h533JL9dz1g76V0+1wrdVbMepIOLflFQbhrYyl9v82RLGk
	LblhZSnPbXtVswZjE7cJqwbx88gbeB3X1x04zlq5w3Lb32XJYqfnLjYLOaBr4WhGdihknykAp1y
	HT5sIrXsjFJpRxCRBTZTCkS+1VQpzbtB5dU7Ojttp5qjQMxbLxQxNNhBqK/MjdSxfkBZsWKQKY7
	aVKTeZSjjbxwg53aq311rUCtyX2bUu4ua7XhVyRr94cbQzEgxtaSsm91wynAKT7lEjVgfedpkjf
	eAfmoBSgI5w4uxQTV1IO/FbzXGp+Mm1smT9ytN1B2XpJl2tsBYgdQcBbZAlloPZr8RCi7IpCek5
	Tc4ar5+WD08ywmR3TeHmd5gOQG5QGQiRlLLEzZiXIEMsy8Blqewjf2XRaihrpVEj5LPW9MvtOpm
	yDSKn4K
X-Received: by 2002:a17:902:e543:b0:2ad:b687:831b with SMTP id d9443c01a7336-2ae029805damr18837855ad.15.1772092019763;
        Wed, 25 Feb 2026 23:46:59 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bf01:7f64:477a:2f97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b22f3sm15238245ad.12.2026.02.25.23.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:46:59 -0800 (PST)
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
Subject: [PATCH v2 3/7] PCI: mediatek-gen3: Split out device power helpers
Date: Thu, 26 Feb 2026 15:45:19 +0800
Message-ID: <20260226074524.3808081-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260226074524.3808081-1-wenst@chromium.org>
References: <20260226074524.3808081-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_234700_675563_7672D109 
X-CRM114-Status: GOOD (  17.98  )
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
2.53.0.414.gf7e9f6c205-goog


