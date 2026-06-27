Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD85C43458
	for <linux-mediatek@archiver.kernel.org>; Sat, 27 Jun 2026 12:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=; b=ivf0QcPNgIU0HdhgyoIdmtUfl8
	SO1tcjhVUGNwAymNK19NlOUjGCPPjE4CEYXNRWapYz514Dr9ehNiD4xogN+74btaVCrp3yvtO3EkF
	s9Onp8z8LpKrn4TSWe27jyDFaLJU1TZxVaEhBq5Tfk2NskImSlcy87PZnMJ80aYJGpw4VD35L45yu
	GoniYESNvn361JCr1zgC2CK83jJ9pwUGAM9NZfe2QQok23vhMfaFWoogN+XMjFqm+fRQY6bV98ufl
	6Z5W8k4mcKw2MwD8vX+k/uL87dBntUA6hWnyPwBBwut8L/JnKHwhMYzyrpXnJx8BhupdT29sqpRK7
	Iy2cBDDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRwF-0000000CRQp-1sTc;
	Sat, 27 Jun 2026 12:15:11 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wdRw9-0000000CRLb-0e7N
	for linux-mediatek@lists.infradead.org;
	Sat, 27 Jun 2026 12:15:06 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so13284675e9.1
        for <linux-mediatek@lists.infradead.org>; Sat, 27 Jun 2026 05:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782562503; x=1783167303; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=QNm7YWMC1DWOL+Oz4pBDGeuzZjSTeiqd+Mr+r2elHYH+6M4EeMt6vO5uonmEtQLg58
         sEuHREX+LomUSz9jiCvVgEKRvt2/c3JeG1NTEDwRqwIUxcaSr8aKl2rIIhQ4f9ZvzeRU
         viNIxzPhjKlX0VIKepuX0Gv/LVu7lcHs8edqWwONLopIZUALY4fU+x8aKRqIlpRX+0a3
         JFNgPD3BwVOA6e00ku1LRt9v2bJ6Ye7HGQTdfVvMsz7bjwkqswWKMHw0oYE/lf7fk845
         ZGZW6AKi1JUjrGBmXmWS8qo55dK36G1nNwFuyYY4YTRXuB1gdZ5kOjmtxWFjHQcWIoXI
         v2LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782562503; x=1783167303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=amS9OF26hRJ/r6PemQIr3DSxDfC3DxBXn23jv04go+jeKNTO9PBOlPW2/oEgHgEgGi
         /jk/HpDZRBGx1upaMvIxLBDd40QhQ1+luOMW4veaT6z6TXx61la5vYJHc2TXa4el3Gyr
         UUfVqanCGW1Y3FbEp6mb8ROu6XzfwQH3JF1EwLnHAs0usTWhY4zkeVWH2jZmORPQk2H7
         +XiKyCza09Ke0wD5yn/tVLbO3Yz85hWJ+H8CKL8EK/VuJx/AwIABWRiHLisWg7B0Rh6n
         K/r0pwGq9bh4iDK5CgbvPTzPHyF6yUKWC9XulSBURP8TCDAa6Z6XzAZlpqJOL7h0WjZs
         Y09Q==
X-Forwarded-Encrypted: i=1; AFNElJ8oa0U6tuvb0C/nX05E70l6c+mlBqIysixl2HN5sC5/kiVKKUeKCAgAY8RnaSlyHmXauBOmyGI8iYEeIohwoA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsKw+2TKFngA8MzFbnl2upiB3vdM113nsQ7Sk+GIk4ouNaZScL
	8emEzCvPQvKwW9JtVkJ5Csr3WLOYQfhXG37eZl1hwP5CgYFC9cS71aw8
X-Gm-Gg: AfdE7cmkr7axOMLwK2VddWyu+D+ZmUR1M1deeGbVXwxEvZuoaP7HnRzSGspq11grK4S
	Sk0p0MeZyHPkOO410Vi7AHlkk0Gw/qAA1VWwO8o1ZMET8M3pF7++2mlhBbfVVw0Erd8ZyK1kosJ
	ul54YGcgcQnHmICvbBiiq+3Gbj62HFuVC9zI9O2RhBlwfBwxpQPIGXhI6PuFo2FmnwCUixoO0u3
	vPK7R3Fc/5BCuTXrceA2rOTyDFMVRoSNEE3rKaobnsAMOr7y9iVXIM5xb2AxS0pLpHxcFjeEdOV
	druPZVU+0r5YrXlPQ5soGpgrNPJ+xQESmDtEPq+I+T/25JJkt5mqYM0u+AaKNxE5bxpYzKbTj8G
	Lm9Nx7zeIfZ5lUXNw9m3QOX1ciVXBf/0Kv5ab+u2FSUG9O0ZXABG3KIYrf8gE0ap8q7DaANe6rd
	gCbLAokXHyhRyQuxGMtMWaAwbcHD9xZVbo+/lQdW9q5sxAe7c8/jqbMA1wkjwIKQ==
X-Received: by 2002:a05:600c:4fd6:b0:490:be14:bfda with SMTP id 5b1f17b1804b1-4926684a3cbmr149652815e9.6.1782562502910;
        Sat, 27 Jun 2026 05:15:02 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (93-34-89-195.ip49.fastwebnet.it. [93.34.89.195])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49269002511sm149028265e9.8.2026.06.27.05.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 05:15:02 -0700 (PDT)
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
Subject: [PATCH v3 2/4] clk: en7523: add support for dedicated PCIe PERSTOUT reset
Date: Sat, 27 Jun 2026 14:14:43 +0200
Message-ID: <20260627121450.3529133-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260627121450.3529133-1-ansuelsmth@gmail.com>
References: <20260627121450.3529133-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260627_051505_232851_7B36E480 
X-CRM114-Status: GOOD (  15.07  )
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


