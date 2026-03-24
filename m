Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D2EF532D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 05:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tBBocE8wHIzrURZ8u70flcyVVr5FTdBTVpVQUI9JEgQ=; b=SHmbw3KZ7TATcRwa3RBTJsjY1D
	047KvV0XjMTVBGn1/SlW4Rhduw0NycoNfmPFyHJIYHYgHtvQ5504fPmWoLGAxmU5V6Y9T2OfOuoj7
	JUc8KUzY2TKLebtZRSzhXmfliW0cKMqf4nUSaTYAiSBFVxg5fHD73kPxx7coz4S8PGFKrVTKi+YWQ
	VDEz8beshPJf0GM9OBhoMHwj+o6iarxXQ/vJqD4Y5Y3HJQYCA/uo2legNi5a+jqqlVLqDy6WfTpxd
	r7sjEFP0MpIj0X5lqnVskRgqBadclHxM9FB9W393lGv8NjzKBtWE7xNN77MEWaXsATin0VWx6QJJm
	7wND3SvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBs-00000000Zys-1WQv;
	Tue, 24 Mar 2026 05:20:32 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBp-00000000ZxW-2q58
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 05:20:30 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-359fea895b5so585783a91.0
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 22:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774329629; x=1774934429; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tBBocE8wHIzrURZ8u70flcyVVr5FTdBTVpVQUI9JEgQ=;
        b=bMYZSuI2Zr3Q9fR8M5VChEtXjMbH5/AMxDavaFddKvHN7/rRo65boLGZ6GTYpRbC+n
         cxrPleElCGtJgoyKrwIY2SPTIjuzG3eznss6xEA3peT6+dk/GmoBhnXBzQXpUUmjkYWt
         L3jES5bVAtDL/FytrEQ3y5cbDz9zLOypQRyFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774329629; x=1774934429;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tBBocE8wHIzrURZ8u70flcyVVr5FTdBTVpVQUI9JEgQ=;
        b=VpC08nxbj/28wTRK/fOJPDnWtSbGQ2UzhDXqup+X9yv6H/GTUjDwiuSiJAGvEfOi92
         ZdlleUfSNxJ4Z71A1qNaV01Dxct0HY8XHuANsx4HfUAFFLngI3KSGSLz8gT0xdovBPcW
         mdYZQqE3aBpjAo04Ai6XsiNyjShcMe3yVi324QzSZqY8DngvNBMTz7I07wIkWPuzq9+i
         avLemIHk0niIUnY9lEtQGUUqKn+DgLvtl25o7NspzzJktXLyQapE21xQBU5dHVF2qJ7g
         1l31VblY4h6sp+2I8VN+M5f4pXVVk31qT8A5hC3LmC6JqBo7xFiT2auvYxmhN1itAJt4
         Sjrw==
X-Forwarded-Encrypted: i=1; AJvYcCVabwIOZD2x7u9swI34T8pmXIkX5xluMHwS+kzBjB6HJ9NGSPXsj4IU2kNkUFJbGWAppYXcHOKwWUruhv9v7Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YwuNz/tqrWYOEfRaev8s/WAQy97M7TWslEyvklAAoaBf6kyfOpA
	2BsNTeZhdCE+XgyURT0PMlBzGOdSQdkr/uIhiO9ZP7c1AbY8PNOdZLfbSrPTXt68kw==
X-Gm-Gg: ATEYQzxkfnXywcz4uuTET2uNz/CuyZIBZl7ZVDu4F/oJ8N0KjRzfqHDWAUWDkK7GptQ
	YoKE+FkhfU8nijr16z/cuXY+rNuBYYXs9t4u9MWT6eRBndjcvXPe35OKyBK+rgqxxpIhNE08Dg9
	5p8gT9m/OH14PTDQQ3BRvRpXOO7ECtRK9GeVqCvJGf7p1PU/5gKmianKi5yrYivbozi1oSVb/bP
	UcNWxrw1CgZ3hnRoJ3sgNFZRsI91aTBqKQ4ApH3dOwv6VlnqZftu4IwOuo0dwwrhAl6Es7nml0T
	kH7CqOVmljn37gg1H9hcd16VCiRwb2U6Aeh37SWl6455a5vicvHAuOhyW0MlT9WbHlhMWtqXHX/
	3bm6gylfzchryJV1xrvL2ugbXhx5+XvcwAQ446m8IF1K58UGuN/gqOIRXePQaFjZxUdvovUhlEw
	2sFryMYDYFPmZSSxhUQpwBwWw8fPXHBJXYLh4rsdjMjMznzM71Vbn9zcRhokGeRWQmsm8+WB/jR
	C9DQj+x4xD6VfSWgoc=
X-Received: by 2002:a17:90b:510a:b0:359:3426:c60a with SMTP id 98e67ed59e1d1-35bd2bd6af9mr13589107a91.4.1774329628786;
        Mon, 23 Mar 2026 22:20:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03124a87sm1068647a91.3.2026.03.23.22.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:20:28 -0700 (PDT)
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
Subject: [PATCH v6 5/7] PCI: mediatek-gen3: Split out device power helpers
Date: Tue, 24 Mar 2026 13:19:57 +0800
Message-ID: <20260324052002.4072430-6-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
In-Reply-To: <20260324052002.4072430-1-wenst@chromium.org>
References: <20260324052002.4072430-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_222029_739025_82DC356D 
X-CRM114-Status: GOOD (  17.78  )
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
2.53.0.983.g0bb29b3bc5-goog


