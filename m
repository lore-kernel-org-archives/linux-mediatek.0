Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55A9F3C27D
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 09:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwT2Q2k4ZVZq63ntd2xl/RXmkonC2qNh8yVsjLAAWlg=; b=NpbSHqbzdF7UIllNdeeHDb8G6O
	Rv0/3HC0+tHa51oHn8zMZjkycuruvEr/iF8dUwVRFYtT1t90Qah9V6fcHkv6KAL33sjU6yVzjxGxF
	7WppuyO64lqUAJ3fHGAhf5bSIqpBcToJBv7ecGXFzuF58fQP2fpfuvLCZrAI8t1sDgU8BwbTcpeiL
	ZjZXXkeFAT5WdF+cCBwJoGYbVICnMg1dLrkAVDJ5TsTh7ZeEzJrou9QvK6PKxcocmlcO4io12KGJE
	WZSRT0NWkCIDpBisARpJQkFqTRtcZIyQjJkojIRQJk9viwqAVPrdxVtDASEOF/YwIudtOKnXO+bjx
	d9isn5HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztFy-000000094NY-3m3g;
	Tue, 10 Mar 2026 09:20:02 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztFw-000000094M7-0QSZ
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 09:20:01 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-829759ca646so3156632b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 02:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773134399; x=1773739199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwT2Q2k4ZVZq63ntd2xl/RXmkonC2qNh8yVsjLAAWlg=;
        b=oOsyXal4NvG1T+X8ZC3IrW0JIlDgRphy02u2f/alCdf1SetJLIU6sZZmlY/G8KXlLp
         f6f/2kDKZCFq5h8ZAMGUikWISNaMXPuz9LNx7nw3IasSB5zWYJG2AfAQdZrUJrOLlmR9
         njutbJA6ZaMjXTzCLIeTs+Ib9Q1zahdC1B2jY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134399; x=1773739199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QwT2Q2k4ZVZq63ntd2xl/RXmkonC2qNh8yVsjLAAWlg=;
        b=uxiDEhftOxoLHXQTUL0DY31evZV8HE7vLodXqTNq5oDAq3i8WsUgYi3zotaTHSubUt
         U1wtEpScqIojkoLsSH6ieCubeHvwpGToIfeiDzBeIjSR2gG/kimf2DPemOVNypagLEIo
         Rn0FHcSO57FE7eYw8TWGAIl1b8DFjQOVleXyWhc3apRDYHU5hVbckztMRmxyjnPl5Ua2
         2wN9TgXbdcs8oLD1IE6t8Vw33HlpDgw2xRTkuZ8eEfkgjWXQxpTuVQWANhl+gTvXVhcv
         OXvJnnjrDexcZttbiZghdnlq6kWQTTJ1jyHePehr+JmM+U71qzRgaff0u45v2VHBS2IB
         94cA==
X-Forwarded-Encrypted: i=1; AJvYcCVska535WhCcjhFpgY0WAgOIE/z6NyP+sNSHawbr6438er0mRiV2BblrVWY+IWq4PR2TO/wD7G5fVyjIztDvw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLbU78kJldZOES/4k5rQl/rCvKDY5DwzPy4tevE9Z5CB4/MM4i
	eeyH1OaEI9fS/hPo26ySvCi5UL+DvP95C/JCYI+/vuQgGVVZ+OpWbgS4iRDKeF9RxA==
X-Gm-Gg: ATEYQzzj0PxlqPruB6u1HkkWIRgTRzh1tYZ8Ddx4LR9LmPO7Afq3b+qfnSoZVUYeM7p
	vkn8yiSrkbnjQxtKFwBhvri+kXj6fVq+Tj1sKuby37PfnbU0JDd4oChqMqN5XynOa15xuJCM19q
	sYYbav7oRyz4cHB5S77yONTl2jS0JPHcFFGb+KljYhVjaZycgpjhdnkipO0oUAOYgekQSzh5DBt
	9JvVmFKTNiVBwst6cmD9s6ugzFqdYQ32oytyywRI4+WIsnUtBjzzA1F+bU/2v8HxTisWbyCL8YF
	HM4PtiOooeL9K3naoWjTgWaimh1AAT1BjDgOiclAl/+P4MfkpIlrhi7gX9+pM4w/XIJonzfdxsi
	17vIahtTJCQklrXA6NF/OsXYQI1JlxyaI75Vdy+YC53HbBGMhxOOZ86EJyK4cuqGdkYoBYlxbGU
	9rax7wCCsxnhxbm32s/jZ/BHas28O2abSJwlUNIDf+cUNbtApMG0oBA5Do+b6BRfnB+F1f4wiz2
	EjyYBMP
X-Received: by 2002:a05:6a00:aa03:b0:824:b181:f492 with SMTP id d2e1a72fcca58-829a2f9ba69mr13107253b3a.45.1773134399292;
        Tue, 10 Mar 2026 02:19:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48a3b74sm16965190b3a.45.2026.03.10.02.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:19:58 -0700 (PDT)
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
Subject: [PATCH v4 1/7] PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with dev_err_probe()
Date: Tue, 10 Mar 2026 17:19:40 +0800
Message-ID: <20260310091947.2742004-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310091947.2742004-1-wenst@chromium.org>
References: <20260310091947.2742004-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_022000_161550_45BF776F 
X-CRM114-Status: GOOD (  12.22  )
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

mtk_pcie_parse_port() in the pcie-mediatek-gen driver has a bunch of

    if (err) {
    	dev_err(dev, "error message\n");
	return err; # or goto
    }

patterns.

Simplify these with dev_err_probe(). The system also gains proper
deferred probe messages that can be seen in

    /sys/kernel/debug/devices_deferred

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 36 ++++++---------------
 1 file changed, 10 insertions(+), 26 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 75ddb8bee168..1939cac995b5 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -876,10 +876,8 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 	if (!regs)
 		return -EINVAL;
 	pcie->base = devm_ioremap_resource(dev, regs);
-	if (IS_ERR(pcie->base)) {
-		dev_err(dev, "failed to map register base\n");
-		return PTR_ERR(pcie->base);
-	}
+	if (IS_ERR(pcie->base))
+		return dev_err_probe(dev, PTR_ERR(pcie->base), "failed to map register base\n");
 
 	pcie->reg_base = regs->start;
 
@@ -888,34 +886,20 @@ static int mtk_pcie_parse_port(struct mtk_gen3_pcie *pcie)
 
 	ret = devm_reset_control_bulk_get_optional_shared(dev, num_resets,
 							  pcie->phy_resets);
-	if (ret) {
-		dev_err(dev, "failed to get PHY bulk reset\n");
-		return ret;
-	}
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to get PHY bulk reset\n");
 
 	pcie->mac_reset = devm_reset_control_get_optional_exclusive(dev, "mac");
-	if (IS_ERR(pcie->mac_reset)) {
-		ret = PTR_ERR(pcie->mac_reset);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get MAC reset\n");
-
-		return ret;
-	}
+	if (IS_ERR(pcie->mac_reset))
+		return dev_err_probe(dev, PTR_ERR(pcie->mac_reset), "failed to get MAC reset\n");
 
 	pcie->phy = devm_phy_optional_get(dev, "pcie-phy");
-	if (IS_ERR(pcie->phy)) {
-		ret = PTR_ERR(pcie->phy);
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "failed to get PHY\n");
-
-		return ret;
-	}
+	if (IS_ERR(pcie->phy))
+		return dev_err_probe(dev, PTR_ERR(pcie->phy), "failed to get PHY\n");
 
 	pcie->num_clks = devm_clk_bulk_get_all(dev, &pcie->clks);
-	if (pcie->num_clks < 0) {
-		dev_err(dev, "failed to get clocks\n");
-		return pcie->num_clks;
-	}
+	if (pcie->num_clks < 0)
+		return dev_err_probe(dev, pcie->num_clks, "failed to get clocks\n");
 
 	ret = of_property_read_u32(dev->of_node, "num-lanes", &num_lanes);
 	if (ret == 0) {
-- 
2.53.0.473.g4a7958ca14-goog


