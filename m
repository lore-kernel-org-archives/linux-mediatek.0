Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1084FFD0648
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 07:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N6fVptWLhJR70eZVTOtUJtoUJ1orUez68YYQc4veVMA=; b=FypTzhMWWl7YUsIFWZjfso49tI
	jdEliL/v9JlIw6EbKtD1yzmGxHLFBOLfW0UwPFLPoEDuRXEfqIst9v88TjPimQfhVLpVGACylIP7M
	hTLoweBqr+0h6bls03drjbCmlE/IKPGVK4weRg7L7bO5nmQCU4PkUH3wwmqr31pojTYQh9NF8nTx9
	abVgplEFWmjmUU7gTEV84YeSxTKLhOgdaY3k360g8+h/5Khnux46pD9Xy+7uCWOLSx482UGR8nvA7
	RY3yZXlCEC4DYLUVWTdHE7Tw0GJ5E+i+36TGxrf/+g04dJVtkctXIml+jkDsIoLIWBolOIMuGZSGq
	s7oY/SLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ENJ-0000000B5Rd-1I70;
	Wed, 11 Mar 2026 07:53:01 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ENH-0000000B5Qp-27Vv
	for linux-mediatek@bombadil.infradead.org;
	Wed, 11 Mar 2026 07:52:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=N6fVptWLhJR70eZVTOtUJtoUJ1orUez68YYQc4veVMA=; b=g6CtZFZPwqH/cNE1NW3nkjJNUJ
	/SojPJ06oSK3h1CPKOPDxk4lnGPnBxpFv2uBxtZ3yzFGl8zqdLrTotyfKJMlhWn5EGStM0oXrKIMo
	6oecgSiJ0hApw+jbnx+YToOA9BGm9uIIXCFIQl2d98tEwleaMMt4HEWEPkn24oxZ7Tnv0My5A4Qzb
	o3WbErweTYeCFV5MPlABKH7XxWVNtqbEI6nxWr4c5rccJRUlFqTiPz6kYJXrThnDg2A1iYU44cXia
	ZlxD+BSbcsLZTZNEGp9ZeV59F+VSghcBK8qJ6ym68DjMT5k9gb7mJoSgYHzz1pGZ8ytxb30SUzs1l
	MIxSFC+w==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ENE-0000000GJ2O-3TR2
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 07:52:58 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-35a02f3b8feso209879a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 00:52:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773215575; x=1773820375; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N6fVptWLhJR70eZVTOtUJtoUJ1orUez68YYQc4veVMA=;
        b=SFk8031B2yQOIM5ZuU0iLH8WDJ07gZQiuAsIa1+KMu8ko36KJzd/cFmEmVZLKCs/qo
         cxKFVVo3L9CBft4tFKMyQq4HfCcs/43GxbarjgaC3rDpc9WFozjWZgTjZ/Vvplcbrc+f
         Nq/rrujPiW6df5NHgc9/vDLj6rwZefpcvtNn8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215575; x=1773820375;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N6fVptWLhJR70eZVTOtUJtoUJ1orUez68YYQc4veVMA=;
        b=SO+YV39jT3YllFzEMK7HKrkqu1r6ZjTKV6uJydsOsrLWFzQtw73m+zPgtsUCsC9aCl
         7fO7mj8FivB2jzRtwaB6paLRX7Cn4cP7Gedu0DQyZUqwrWbHdrGCWsDZujH6Rrxd079q
         c2faoBA+OYTbh0GWpfIAQLFMG9KbCAMB4bT50rNjqzQm0oZPZII2ezBukBH15ji/MJXW
         B7o2VBOodI6Nds1+txO45DsPaOrosHe4mOtrxFjHBrYk2uALEsSrfboo6GcemreF+CT8
         pM4qOmxC5ALc6T0WfDSPC5TmrxRkgvj5i2IlTv611yl0xgkb2G9DXxlbCqyi8HdxWZil
         5EgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxVHCKAT4faZpZXsNOWtDk2xWgkqmPpCJT4cg2/WquX2bEwD8eU2dW0oH0FbFtDqOcb5zlf987M71vKdySNg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyW08zmPqBu/SoxT9TbpV4/IXiZ6G469c+lZBtTybG+HSezNs4V
	fvWzYHrHdQtXmQFHbgEOKodZ+x/Q/b+z1OyxSoZPYKjmcNFddtG/s4qM5kyQRHoKZw==
X-Gm-Gg: ATEYQzwpTl2Mka5SudDLIQY8rLRj0kbbU2/GtnEuVbgsH8Gi4SOGJf+E9wTBjHAYdEF
	JPgBndgt+1hwEtMFIZkCSIncpJlNee9gJxSM74jLgFbBV/gEAsVtmqHyZuxmmz+uUgo5dHVNZk3
	BPHLuEsFMwlM4DehtRqubHkWd16Cgr1zKfnMR18431tWNRGmGUX8vVruqUnOgzYqqrdQV5ACWOt
	g0eWpV145N+cKOTBt9TljgAzRKAD2VZZpZGVTUOTe9TpiNrxm39vrCVsRaeJSbkP5RB6Tsh3XT3
	S5TB/w3/2aZLwv+GV3PrM/tt5w5FLEPxfFv45x2oeIC6HgxWoS7ZXYYm38USDSjx2u5xgmq5Dzn
	qnvo65jgF92/izFKufDMpCDHFzy6SqgIyOR083Ejl+ngmYKxpsGQmxIfdaS+Fa4EiPenvaEY8Nf
	xmJGTRB7q09w3q2TYmXq/JF0SItaUzSTC492X6Dr5nsHYVkXNr85z7Eun3GOPtEFnt4pNckFaMF
	Id1mRIv8/z7bGkI03E=
X-Received: by 2002:a17:90b:1e46:b0:359:8f7e:d34a with SMTP id 98e67ed59e1d1-35a011d2c77mr1684100a91.9.1773215574812;
        Wed, 11 Mar 2026 00:52:54 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a0236f79asm727816a91.6.2026.03.11.00.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:52:54 -0700 (PDT)
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
Subject: [PATCH v5 5/7] PCI: mediatek-gen3: Split out device power helpers
Date: Wed, 11 Mar 2026 15:52:20 +0800
Message-ID: <20260311075223.3303497-6-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260311075223.3303497-1-wenst@chromium.org>
References: <20260311075223.3303497-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_075256_975632_814741FB 
X-CRM114-Status: GOOD (  17.92  )
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
Changes since v4:
- s/mtk_pcie_device_power_(up|down)/mtk_pcie_devices_power_(up|down)/
  (Bjorn)
Changes since v3:
- Adapted to movement of existing setup code
Changes since v1:
- Updated commit message
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 87 ++++++++++++---------
 1 file changed, 52 insertions(+), 35 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 22a16e4ebc76..526db8815401 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -403,6 +403,54 @@ static void mtk_pcie_enable_msi(struct mtk_gen3_pcie *pcie)
 	writel_relaxed(val, pcie->base + PCIE_INT_ENABLE_REG);
 }
 
+static int mtk_pcie_devices_power_up(struct mtk_gen3_pcie *pcie)
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
+static void mtk_pcie_devices_power_down(struct mtk_gen3_pcie *pcie)
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
+	err = mtk_pcie_devices_power_up(pcie);
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
+	mtk_pcie_devices_power_down(pcie);
 	dev_dbg(pcie->dev, "entered L2 states successfully");
 
 	mtk_pcie_irq_save(pcie);
-- 
2.53.0.473.g4a7958ca14-goog


