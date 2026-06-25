Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A34B7CDE012
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jun 2026 21:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uZznG8nXpNdUsgio0AWCkV/jSav7ySTRqhFzl8X19lM=; b=2i7wj8vZbNT5VBKqwfJ2adLQZN
	FCXlfBAK1+oivIV4vAVzDAgdTTAY8K+KtjSwt00ssKX+aCFVxGeMga223b25PxPyr5HzitEZgneC3
	7oN/+75Ei1GhDdvfukWQV0n02j3QPMxEKBB0hiv+mJf8+E12PNE1WsJ6wORZ+X5tO5c7sRxXRLae4
	cXEOXJ7UvlAXGTV9GKqY2ij4JqAK2L8DpmnzEPT44lskO8XDb0x6KtwrDmadS16CTE46dH1Py5roJ
	VoXZj3AaEDJuwvHqlUe3zDz4nipMjYCZQWYVeAaA7CZmhvZ1XfwgX3f4K5auagOukxAsNadpE8Iu6
	qRC9OjTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5H-00000009tiC-1sxj;
	Thu, 25 Jun 2026 21:58:07 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcs5C-00000009tdV-1Hlk
	for linux-mediatek@lists.infradead.org;
	Thu, 25 Jun 2026 21:58:03 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-490b3637b90so2093815e9.3
        for <linux-mediatek@lists.infradead.org>; Thu, 25 Jun 2026 14:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782424680; x=1783029480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uZznG8nXpNdUsgio0AWCkV/jSav7ySTRqhFzl8X19lM=;
        b=cIftPd3dFcMTyfCQg5UgZyG1ucjv8UhBZlYJeRqiwrWn+l9R75dFEWQXK4gy3eOiHU
         9CynWW8xrfHxfih3N4aAYhwF70k0NhCMcPE1z25UlVLRY1bNFR2iqa0gjG6p+lWlZFLG
         jbS/qJ4jVFANLXe7lFPEs8p1yl24OGar6j07bChMSBctYkOh7I6BN6UgGKUmKg2tirie
         FCmDDr+yA5lrSlGzcsILZFIJf5yX+qRrOM/RWjo4k1peqUFWQ/mb1yM4NweOpk7evtAo
         D+MuNCj12vu8iII6xaXUx4Q1c5c27XaAUJ15oGZ7gk0hIRCnL8Wgl3VSzmyVJ8CCSb7q
         Auxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782424680; x=1783029480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uZznG8nXpNdUsgio0AWCkV/jSav7ySTRqhFzl8X19lM=;
        b=P2GMpVJjffXh9JVp0ywyTdI+L0LLz96h5OSFIW9rr/Pb/BwiBrok0peCxagLz912rf
         a4Zr7MnurwnhvWirXaj1QGJ5hZ/eOIHtMNc+vp4RKo49+LTb5ZsO3D0HcVZuZtS+6E0k
         cATmrCfJCLZ/0wI7QowEMSdJvHRFvAY8YHjN2+2JA+u2iLGG0AVpbH4fxxlHQzYwNqX0
         71/UTJO0VbItP7Wi7aP6vrv2+n4qjaNdUFt6lj/uW5CZkEAp8iNoCSI6JQ9hmY9j2u+O
         yII+94qTbB7ZSB8RCgN1bvwXeNPXnrortwZeCRe9KysqkDGmAditb9t99ix/KSm/rVUf
         LmDQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ucVABhHWeGDQLA2MkpxX9Pnaz30sQ1t4KEmsKSVaU6oBxUZTPiaUkyNgqx8EtnKwt+1JHLHISqNDtZ0yDaw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzldnML7nwnki1weqq0tT4gzKvyDdrfISaxBB4vwAdpcjeMPeuf
	j5kEdlQPw3CFBZULq547p8UEnE806rv3/jHfppoA4qLflxIyVhPokrFm
X-Gm-Gg: AfdE7clQbCiJG+XXz1w7OiXHGsinc9j+NX5IM9JxT11y9wL2VKdiHP921XK3UPsOrib
	zzGdjjecPU8jjU+soNdiMPLvw4wqzWygtcve9h2WkAvKQE/hoD2akGOuJBgLZ8hqzYVgEyr0nmJ
	an9XjHLVHnUjhiYYEtwtlbQEKIOZcTEb0k903kV9YKT+46QG00RuZc+pMwp9+eXPo+LRVjia2en
	tlaVfSwduNZfujedoct6Z1nKJVqkl7LmLswjbSp5psDAN46lrEcI63Zf4RHjlCtJypBH5xvIa1a
	UqlEM6noRSOfnmjLAIhrlcEyGmLbUU2ebv8X9H7ucavJDP7FZ50F14Ug+rh+8aNg02f51NBOkE7
	a5o4w4ZABSjbkZGLj+6wXYB5Zq5z8PjdHwR1/j+rPcNY7LqvIvMJA63jIwPyCfGstbIyCCC3vMF
	CKecNu4U9QdipyssHGIyjeSmonkQjeLa6uYQbOuMYbshK9vsGqLBXkWv+pJY8xckErbDNs+maap
	iHTQfSuLoFo
X-Received: by 2002:a05:600d:8444:20b0:492:1e7f:d41e with SMTP id 5b1f17b1804b1-4926685aa04mr49083755e9.10.1782424680236;
        Thu, 25 Jun 2026 14:58:00 -0700 (PDT)
Received: from Ansuel-XPS24.localdomain (host-80-183-219-152.pool80183.interbusiness.it. [80.183.219.152])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-492690988e0sm27339185e9.14.2026.06.25.14.57.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 14:57:59 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
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
Subject: [PATCH 2/4] clk: en7523: add support for dedicated PCIe PERSTOUT reset
Date: Thu, 25 Jun 2026 23:57:35 +0200
Message-ID: <20260625215741.3253212-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260625215741.3253212-1-ansuelsmth@gmail.com>
References: <20260625215741.3253212-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_145802_371027_3BB5F486 
X-CRM114-Status: GOOD (  14.73  )
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
 drivers/clk/clk-en7523.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
index 1ab0e2eca5d3..a33cf2e1b76f 100644
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
-- 
2.53.0


