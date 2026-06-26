Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C1A3CDE008
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2026 09:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=; b=0upIW2o/7nDTNVADS3JZ8rwvWO
	k9EgbWdFZ8n+/7o0vUU8S3bxULFUHIPMbIMzChjQ6KnbuDlP8VvU9eef9QEI79Q4QhyYSBbm2H9Ib
	m1XLuwaFqPZsS/4zUOWs4nlnQIv7HWiIfIal4fbW3mcIUOm3E8RXHBatOPZGyiH1OkyIRne4YRETm
	Khc3AYos/jmCe/OerV5zRxlohqeHCQCG1j4om0L7btuUecqy1d5vMmDTAFaF8Bz/2JkD+KEk0ffYj
	Q5G7D1aLTS52o2D1CzSGGyleL0MAeoi3EurD633H1eG3NdgM8Ay5QUvIiQ1tvV2Da8WdmnZ/sBvvm
	UEVsVnIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2k1-0000000Axkh-06bL;
	Fri, 26 Jun 2026 09:20:53 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd2jv-0000000AxfL-3v9O
	for linux-mediatek@lists.infradead.org;
	Fri, 26 Jun 2026 09:20:49 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-45fd464d51fso358869f8f.3
        for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2026 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782465646; x=1783070446; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=S7PSJKfSInAHkjt+1w0zz0a6wOwoUT8uuC1a85Iryx50+IU3Nx5z4v+YRaZIvO2J16
         jjnRViNgDtP9dqLLnzNego0iTfrCocuIEUvMYxRXvTWwCBaDAsjsB/xlk2iyWdbdYpbD
         nAeOwDehbFzb2RDvzDQVcjtkJMLKRT9Bi9CepAe0Cbc0jEQQbKjWz1yFDRNcmTOVDVR5
         9BI9jlMj0/E3O56pO6ecM+8vK5atPnvQphOMlmcnNVlM7DSyIVxyEIejcWmqC0PfYGlv
         NZhZ4ldPwKH/1aAkw8GmOWpSGxKpPLTCiCPCAQwendveA9z1MLdpKoqNzaPj2Pxl8InJ
         Zz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782465646; x=1783070446;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=dPK8sO0bbdKB39CKUF9JUiYPvT4OeYilLH9qo94TcQTErGOA8Y0t0YRYXpmt5LhF1a
         qwY2jwhBpdMBQQsvMWKNnfJ9wYBCiQCxbrOabnJTXAOGOcj5ZGvmPVtJjZkrHOKW/j9b
         tu4PVJeuPTAJGrULTGw8onYTUu2yylEeu3w1YOw4cBFmOL1V2PsTHY9E93tKSqJUBNwa
         Yqaa36SB8cqQMgziNh7lRLo+qbMqnYHbOIMz8cZdhKqo2peiPXlJlZpSq766t5BSTbTi
         wYDAE75kZ9ymsfesMcpEIE+ABv/RW4MDG2UYq3bL4a0feK6wfqp8x2u5pNZAJ39GH52J
         uXvQ==
X-Forwarded-Encrypted: i=1; AHgh+RrEGffYGZsTO0EKr/AnhxTXgHaMYkZ+ftgjQEKAl13HXHbw6e33aFeplWy+aMaip97l2LkJ1n25R6XidmTgDQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzHwRlEEKrW8L0o5MpTKQwh9re32H3IrP0cjEwhz8cvVeZpYGwj
	RiICFayQxKV+qsTq0PHa8BXLCzjSCPu6mz3dvFF9JmrK4VNPiu91iSxW
X-Gm-Gg: AfdE7cnh2maGpUNqlIkGUwMX9F14/LdDBj50rvo39q7+ivWb2WwD1K2qIeUPRA786jb
	U2r1FeAPuSgkLDZ/G4NrhL3Eb42y6W1Pa3U79MQ2kgNilxbdnD0gsEyBf4vlOZGJvtNrAH5xj9R
	AZ1ml2p0wHoEagwxSKIcT8BApJR/PEudbcS/3wbHqiDGBWDH3wslcmKhWAnZja9IeoI3XrO5r8Q
	6AWqQrvuuIQ6quR7t/8uKL4uV4npegNHRT0YMTTYo8H/9lX/1DwgpDJpD41hz2e0Zyqv3Z8gK4J
	8/VymBVe/nmbSqvmE0BmdSHrhJRJE6mDNFwXaunenePBl0cVLwv/8N1/tCmenORjpTXxmYC4meL
	OoBqqzrY92aUWloZfm34fSVYtUKl/NvXm9Xuiq5tdE/Ob+WPRX+ZZzmMVQdfP7iUxaUxOEg2het
	TGb7pbGYjYOnKc47IpbbgPvvU6AlbIPHtGQcqrww1e2wc2veBikzWN6S8WVABJtuUuE6mcwRePL
	/xhiNJGF+1X
X-Received: by 2002:a05:6000:1447:b0:464:8d68:616f with SMTP id ffacd0b85a97d-46dc2b0b64bmr10020789f8f.31.1782465645828;
        Fri, 26 Jun 2026 02:20:45 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-46e6167c05fsm9094388f8f.25.2026.06.26.02.20.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 02:20:45 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 2/4] clk: en7523: add support for dedicated PCIe PERSTOUT reset
Date: Fri, 26 Jun 2026 11:20:26 +0200
Message-ID: <20260626092029.3525264-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260626092029.3525264-1-ansuelsmth@gmail.com>
References: <20260626092029.3525264-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260626_022048_020389_E94A4B85 
X-CRM114-Status: GOOD (  15.05  )
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

Add support for resetting the PCIe lines with the PERSTOUT reset. These
special reset are controlled by the PCIC register and are specific to each
of the 3 PCIe lines.

Notice that reset logic is inverted for these bit where 0 is assert and 1
deassert. This is intenrally handled in the reset function.

PCI enable/disable are updated to drop PERSTOUT bits in favor dedicated
reset handling.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk-en7523.c | 39 ++++++++++++++++++++++++++++-----------
 1 file changed, 28 insertions(+), 11 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 1ab0e2eca5d3..c9b21d9bf2f3 100644
--- a/drivers/clk/clk-en7523.c
+++ b/drivers/clk/clk-en7523.c
@@ -338,6 +338,7 @@ static const struct en_clk_desc en7581_base_clks[] = {
 static const u16 en7581_rst_ofs[] = {
 	REG_RST_CTRL2,
 	REG_RST_CTRL1,
+	REG_NP_SCU_PCIC,
 };
 
 static const u16 en751221_rst_ofs[] = {
@@ -450,6 +451,11 @@ static const u16 en7581_rst_map[] = {
 	[EN7581_CPU_TIMER_RST]		= RST_NR_PER_BANK + 28,
 	[EN7581_PCIE_HB_RST]		= RST_NR_PER_BANK + 29,
 	[EN7581_XPON_MAC_RST]		= RST_NR_PER_BANK + 31,
+
+	/* RST_PCIC */
+	[EN7581_PCIC_PERSTOUT0_RST]	= 2 * RST_NR_PER_BANK + 29,
+	[EN7581_PCIC_PERSTOUT1_RST]	= 2 * RST_NR_PER_BANK + 26,
+	[EN7581_PCIC_PERSTOUT2_RST]	= 2 * RST_NR_PER_BANK + 16,
 };
 
 static const u16 en751221_rst_map[] = {
@@ -635,9 +641,7 @@ static int en7581_pci_enable(struct clk_hw *hw)
 	void __iomem *np_base = cg->base;
 	u32 val, mask;
 
-	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
-	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
-	       REG_PCI_CONTROL_PERSTOUT;
+	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val | mask, np_base + REG_PCI_CONTROL);
 
@@ -650,9 +654,7 @@ static void en7581_pci_disable(struct clk_hw *hw)
 	void __iomem *np_base = cg->base;
 	u32 val, mask;
 
-	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1 |
-	       REG_PCI_CONTROL_PERSTOUT1 | REG_PCI_CONTROL_PERSTOUT2 |
-	       REG_PCI_CONTROL_PERSTOUT;
+	mask = REG_PCI_CONTROL_REFCLK_EN0 | REG_PCI_CONTROL_REFCLK_EN1;
 	val = readl(np_base + REG_PCI_CONTROL);
 	writel(val & ~mask, np_base + REG_PCI_CONTROL);
 	usleep_range(1000, 2000);
@@ -754,14 +756,21 @@ static int en7523_reset_update(struct reset_controller_dev *rcdev,
 			       unsigned long id, bool assert)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
-	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	void __iomem *addr = rst_data->base + offset;
+	bool inverted = false;
 	u32 val;
 
+	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/
+	if (offset == REG_NP_SCU_PCIC)
+		inverted = true;
+
 	val = readl(addr);
+	val &= ~BIT(id % RST_NR_PER_BANK);
 	if (assert)
-		val |= BIT(id % RST_NR_PER_BANK);
+		val |= inverted ? 0 : BIT(id % RST_NR_PER_BANK);
 	else
-		val &= ~BIT(id % RST_NR_PER_BANK);
+		val |= inverted ? BIT(id % RST_NR_PER_BANK) : 0;
 	writel(val, addr);
 
 	return 0;
@@ -783,9 +792,17 @@ static int en7523_reset_status(struct reset_controller_dev *rcdev,
 			       unsigned long id)
 {
 	struct en_rst_data *rst_data = container_of(rcdev, struct en_rst_data, rcdev);
-	void __iomem *addr = rst_data->base + rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	u32 offset = rst_data->bank_ofs[id / RST_NR_PER_BANK];
+	void __iomem *addr = rst_data->base + offset;
+	bool inverted = false;
+	u32 val;
+
+	/* For PCIC reset logic is inverted, 0:assert 1:deassert*/
+	if (offset == REG_NP_SCU_PCIC)
+		inverted = true;
 
-	return !!(readl(addr) & BIT(id % RST_NR_PER_BANK));
+	val = readl(addr) & BIT(id % RST_NR_PER_BANK);
+	return inverted ? !val : !!val;
 }
 
 static int en7523_reset_xlate(struct reset_controller_dev *rcdev,
-- 
2.53.0


