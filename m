Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E86A4FCC9DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 09:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rM88DzClemQjIwSD9XmXpaA4dBGL6dPMUDYPBc87GuI=; b=N0majg6ydc5di9aGek5yoYTcMG
	YYnPdHQSVmBt1mejygF6EiOUcsH8sOKhtJQWTF6uvb7pHddjJLMQOZS+MJ/a1qFe0+E7XXwQdQA8f
	uBIvM43uE06uwMplyEliuA73X3Q7pWAKrIF+eLO2dPqeqqG5M33NBeG23bF6lsyX4fUIP5b0KRCaf
	Ce6z5RqdytlEOAtdBbUYCN2YM3QCVRV54DvMfliEiHBSdeC9leJDEBk//S4+sgo6l1IcVVSAwHGIj
	fGPxqoYbn3UxIAyzgsCH7SG3peAp5kUTVwlk7trzdM4zgELUx5q1o35wuLQjuTWjDAtFN1qnQpkDH
	YVenln+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztG9-000000094UY-0o7x;
	Tue, 10 Mar 2026 09:20:13 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztG7-000000094TY-1trp
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 09:20:12 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d2e1a72fcca58-829a9d08644so2244963b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 02:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773134411; x=1773739211; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rM88DzClemQjIwSD9XmXpaA4dBGL6dPMUDYPBc87GuI=;
        b=MHte4GicwY88mddMpGegy6zUoesKBE92EYyPtKc2/SU9rHC6I/rGi6VRziAmU1PTh1
         N3OmNHKePAMH+F+oI7VRREEkCATFrXg9lRu2L0aKrzoIozdG6PB9lBSETS2YnbYwOd/7
         /Obsk2IHjf3j84kDCqFZ5wxiKjf5dRGc0hCEQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134411; x=1773739211;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rM88DzClemQjIwSD9XmXpaA4dBGL6dPMUDYPBc87GuI=;
        b=mUItZYMzB21rSFls1SOn2D8B1rUWF/11nYm3fMq/jVadOYq2u6UYky57MjeTzwGBgf
         6liTDP5bAg7bTY+Ce124sUc8D0X4s0sWjcp6xs0U+htGItWUq1FEvoTwfYn717UX9BOR
         HBL64eXwuGTmhVu5RwLPeKptg/SmQMs2I+jZDitq/RNwnHue/vMsPwi+PRoNFS7OLhzo
         3s+ZLvkUT0dnb/qj1OuqJvA9WjOhSLQBdc/pM5/DkTbmzN0e2O8dA/yi8gaMl8XGJs2B
         LZTTELv5tmtueCsmhppq/P2JiN7gKpVJZz8w+0efqywRLDCmu6lk3elHcup1ThsfNxLj
         614g==
X-Forwarded-Encrypted: i=1; AJvYcCVkNDtkv9KtcyPC2qcnHFzIspHmLoRTsrjp4G38Vk0fp31Etg1I5b7cBZSdg7WWUljM5DW6n1ZzjYNFP2pt7w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxVxY/AkgwiK0Ymi38QWbyEEv70bSd2XmdEsK+BPC5aT5O+2qQT
	zBaRiJ3CGHcYyU3HK1+5xv0TZ9Dt3fimVszGI49X//JCyFeGBOLRYTI5KxiHe0DwGoJWOk6Qwhr
	6SPs=
X-Gm-Gg: ATEYQzzfjeRgmJFKA6FRmnzR4gfATdwDIffY8f54762tw8nKGcN51yTHX1ms0snyygh
	OKiuvAM+zKn5Y3z68ucvFDWUhZDD9Gffzwkt9n7aBR/C/iwAgvFCP0dzRiNl7CLVVrEWgM0z59N
	r37b2em/zD/5Wo4D/XEdkOWtQlM8Si2kJ7+HzlYdnBnT+PpJxSK8U2ap8UYta8O9LbS7KTZEDCN
	L2ElLccefLDbBntFlFrFvnv6Jp9kPDNCAMpUWpomtUEHy5/1f1tEJRC7Bvlbn0ETlBXgp0jBcuD
	XorP8WzkX2KCOmjZeqolNlf5YEQXjsGsXig0AVa3tw9gipDpuYBfMFzV6vT4RshNhYTq6Jzq/pM
	CR50+oWla6x4P0TPV0s1b9ja8x+J87FNdYpn2N6BFiSBZIEUNP820KZ+9DMxl/DgSe1RF82pAz2
	vMtwK1L0+xKjIxwmWBNOAJDyjq4W66o9S1lC1i/UAcS90BuXP4A9EojdPoSdiz0Vm6bByeHw9Sz
	BdkRZp2
X-Received: by 2002:a05:6a00:882:b0:829:7187:1a80 with SMTP id d2e1a72fcca58-829a2f80e50mr13446197b3a.45.1773134410893;
        Tue, 10 Mar 2026 02:20:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48a3b74sm16965190b3a.45.2026.03.10.02.20.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:20:10 -0700 (PDT)
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
Subject: [PATCH v4 5/7] PCI: mediatek-gen3: Split out device power helpers
Date: Tue, 10 Mar 2026 17:19:44 +0800
Message-ID: <20260310091947.2742004-6-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310091947.2742004-1-wenst@chromium.org>
References: <20260310091947.2742004-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_022011_504464_DCB7652B 
X-CRM114-Status: GOOD (  18.28  )
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
Changes since v3:
- Adapted to movement of existing setup code
Changes since v1:
- Updated commit message
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 87 ++++++++++++---------
 1 file changed, 52 insertions(+), 35 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 22a16e4ebc76..3e5386c4cb35 100644
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
@@ -489,33 +537,9 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 			return err;
 	}
 
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
@@ -1270,7 +1294,6 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
 {
 	struct mtk_gen3_pcie *pcie = dev_get_drvdata(dev);
 	int err;
-	u32 val;
 
 	/* Trigger link to L2 state */
 	err = mtk_pcie_turn_off_link(pcie);
@@ -1279,13 +1302,7 @@ static int mtk_pcie_suspend_noirq(struct device *dev)
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


