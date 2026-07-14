Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CFBC44507
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Jul 2026 11:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=; b=34upkn0WQqwQ/QKBlEdNKuC3pi
	Yavjsyvns/b/qL77cLhtD9jd0VxS90eGCl4P7AnXRYQ5eeOj+KeDhbK5+AIlXJjoQLverT3YuQM2N
	Sa1PmUBA6D3Sq6BRs+xYpWyIrnzHAxLBv7nLSEWiT+QmjWuHdBorzcPwhZbl2kXKuBAYh1mAX2I2e
	rvLhx3R060srLuD85heo7ezJOmQX9DBgp1YNIR3RJ1JczdFJm2o5CjM5djbjn39BPHdxPpg/sIbl8
	/0ASPgwvtM6CnbOHjRDftSe0G+2PA7zjyDRr+PNG74CkdoqYufhbd8Z6YHpLX/aW3559B4XXeGHsx
	qWVLsA0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbn3-0000000Bp14-2uIj;
	Tue, 14 Jul 2026 11:59:09 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjbmv-0000000Bosy-2mGk
	for linux-mediatek@lists.infradead.org;
	Tue, 14 Jul 2026 11:59:03 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-493ece78b0cso30776125e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 14 Jul 2026 04:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784030340; x=1784635140; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=OvsJeGfSW9zZBZG4Wls4I/RBVzXgWz6I8xqknLz7X4sqK38PTmVccTkhZ3W9GlFJ9m
         zGCAgeWfGW+9U8Njm2kCYDJho7TqFXfZjLwd734FvwUmWl9ovl89nhueFSEos+1Og+79
         7lxiLmJKWMCelHH2l2uWqjy8VZfEIMsEJorzQjHozpX6rxlditFazein6dgL/TibH7D9
         PB4OvgAsmosxvzbDiObDCI06dc2Eo+4YJrSa4OuUwmo9DJLX+JJbCMmb362d7LgA4CmH
         ysPIbA07FuZg9c/rqbzQnvqQPFLlsHGGA3YsEhDf05GR7ofh8g9tNVSpdptSg+yWcvth
         D02g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784030340; x=1784635140;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Oqp269fPqkkP0y4F1qhxEIUZdEYzw+E7N13spqrG24g=;
        b=YSAGyA15xD7Q9RJkkyvcpW336qWCRR+etuNuYHdV1P4tU+CQ+S+TyF5ZPHzSHvzstK
         ICvOPStTwqpzP+GcG4yU/vzA1igOqTcC3Bpv+SKfsOGMz+hG6rSHpjgjOjy2N/26ypPp
         nJW3UWXEdIUO2BcEVnxw3HUcOCPb+4nfpm1Oc2oK/NuoNSLw8psoRi4CwbfpiW+nza60
         pfZZuw/LH4YAhySzPzBVH0n+oDXM3Eyhe8h0Hb7J2wKk/Erxcf+0FO4Ac4tRFuBMq3Ve
         bWaWVRFx4G49WVPA0hlwJHxdT8tjpIQVDUn8Iive4n0sYjz0619ll/pK6t1GrbZP4rHG
         nuqw==
X-Forwarded-Encrypted: i=1; AHgh+RpE2IePUg/cwXyfEeDVleO/DK45o9kpqZxGwBNtjO5x+iXsUASyceCtyDHm0aoKFwjMC67ceYXknhl2tvyh/A==@lists.infradead.org
X-Gm-Message-State: AOJu0YxH/ip9AlmZO0p04JAriyYqDE1Q/fLr3OzZaQMZKok822tEJV87
	8Qo4ZHpcMM1FVOZmXGc2SDyeY4QwkfVa2dLr79HJBJhqrMXNnHonLS3o
X-Gm-Gg: AfdE7ckiecVlWUe/58NGe/nFXFYb7ECfyTzSi6jP2w4Wf8np+rLHeJKNt1BX1+BoY2+
	k91rnwJHrHYpRfcsstUW5Phd9EneHNTxF573az2uf0OAlca4//wtRHZ/yGRMiDoBwO0PAG/URZo
	o6p6uXq06b/5ZXFvC1ZDoTbPjN861FvHAK2WoHn8J6uVMc8RsMDuHsDbjffVmM5Qz52imqOtqMi
	fSS9RRKjchZKmB3mxwTFnY1dgSX1Gr05CIkEC+Rzo1aL0XB8oUx+/YR4mJ/GmOVQ7O3dX92Muz2
	pVHDVzWdOU/355Ta+Qk8hi5dax8DG8TGlOvsKwkI2gjscuPQtfEOWe6BYGBWkl9HbWGde3rjRsX
	1f0kd8/9SAn4e5WYRGElfNbWGImCS1GGP/BNILeX94AjpMWIUNGv1bOnCRnq+C3Mr+tEitYdEsi
	lq/8xoIZ0ahEI+nix2YCPq4pq9EfdLIAwlmj4LTsVtM6bq7GwTIyEU9ZbO7LeSval2fTZ5Rj+P8
	glbGZ3o
X-Received: by 2002:a05:600c:19d0:b0:492:6efc:7c60 with SMTP id 5b1f17b1804b1-49518308220mr36197365e9.28.1784030339968;
        Tue, 14 Jul 2026 04:58:59 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-95-248-227-210.retail.telecomitalia.it. [95.248.227.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-493fd3ccfd4sm180531655e9.2.2026.07.14.04.58.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 04:58:59 -0700 (PDT)
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
Subject: [PATCH v4 2/4] clk: en7523: add support for dedicated PCIe PERSTOUT reset
Date: Tue, 14 Jul 2026 13:58:44 +0200
Message-ID: <20260714115848.8537-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260714115848.8537-1-ansuelsmth@gmail.com>
References: <20260714115848.8537-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_045901_728488_CC16F9F2 
X-CRM114-Status: GOOD (  15.53  )
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


