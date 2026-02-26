Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46A82FC5903
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Feb 2026 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B3twAdKSjYAUPCtN8pakztOmGIbXnsgFqASCUc/1Hg8=; b=sF8f2gtPCJ4JkgC7iOV9NgCIHF
	K+nh1nsFTV72MC8nKJtm+OUpCxHPPweK3L74twvIwlWoLg37gUMmsmuwMrvmQkwpKJJE8nRlxPGif
	q47BgXSHsPlftzdZBoHiCJIbrZ72RomFHJjJwkhhn9tQfPt9Jj6Kp2zlbPg50CqDbesiE1MtOlN+g
	5elkbStRGf2PNex1oCO0B0IgjWBlaHM7iz962J2C8OO8dRPierSIW7oIAEA44Nnmr83JTkQElUzVX
	U+cYXJix3wIoQSevVVYrnZxvdIuTcXcREnOWw03e6SxTNm9dD3w4NKzZw9VFgofASCil7YLhHIusN
	Q6gv7E6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5L-00000005b3S-1SRP;
	Thu, 26 Feb 2026 07:46:59 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvW5H-00000005b1m-0Ajy
	for linux-mediatek@lists.infradead.org;
	Thu, 26 Feb 2026 07:46:56 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2aae146b604so4076265ad.3
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Feb 2026 23:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772092014; x=1772696814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3twAdKSjYAUPCtN8pakztOmGIbXnsgFqASCUc/1Hg8=;
        b=cHNekCdO8W2/X96zoPesphbAeSf0fm6hFrkIyWElaoKqXDaQUn0j5ll7EqnofCA39Z
         4e9rgd8AoFJiMgXLxOETWBOmHKj5yJXlW0rg0NfvcunZsR/ybUyTx/DJE4vHjigJ1iWG
         nTz/+tmcHIn/gAyW2R5OeTYGwq0Eou08h+3gI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772092014; x=1772696814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B3twAdKSjYAUPCtN8pakztOmGIbXnsgFqASCUc/1Hg8=;
        b=uaDupnxsBhY2WHl3+Kt7NjvCb8jGGrRhMu/H1Ftu1zjZikgQ2D674MgAz2dZ+YNoIw
         gdZ/aiWox10lorq5adxOhrdqO6v4TXfUNfqtFmkQOH960BZE4/sWsyyMqPmVn5LlWN6O
         90pVC7xxsM2svG9cYzFCxe88JLjQrOHzGMZ5OuCw4Nznn/o4bSetEabWuEOpvapj2exX
         Jdo6ICYM86I+TBnc7MD0TUTd0oll28Czzy3LYAbzpt2zkgwHkRGfwGy8d9HGkpHJFkKH
         wMm+T+SDau85vcuwdI1j6S37Y5Me4EU0huQ7CH1R/IKtOUPtY2xzkeGsWFLHxYB6CKpC
         +DiQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnf66xfjaCvBhjlFyDDI2gu1PDQp6qeJonTkVmWaklLUUzZuEn+XulP3kWPiJLsQA8pKI7YBBS3h+feH4q7w==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywh/0Vh3poLkkkHUGsTEUO7gO6WYfa9XTcXNDZNwUq6ByxzjGk1
	aSa1hxGhHWGiZa+XZUccK3rrnfPcJW8K+jQosuUNansp3r2fvlVnEISoHiWgWjTD8A==
X-Gm-Gg: ATEYQzz1EOEcDObB1Ptq9+u4qULOtuyg9RZS4+dv/jcHEuG+QbSbYyA/6pOyCapkxFC
	7I3Uod83vKVzx2ecopDfXwvUe4mtwjS6WT94YXEsWzfVLwjegR6SS3UrSVHlQXk5YwCIIaJqhIa
	I6caWQxVMJQrY9/S4UQnYwe6V3FhKeorjX/bepE3JksHj18CE9sJ4CHVKTVloF1f8qF9QO2KtPG
	9xVSQHqMytPRqFk56eI4gczReniZM+axMJHM0+/PmHEn2pFV52MgHo/DNaxGAGzAdnulZ4qJYfS
	UaTByXxmTe4PQKTdlsg/7T9U+JrSo0FYahJ3ut76TcJaCXpFXd/STZFur+38n+DGvIJ7R6aEI9x
	9DOdDBBGqR+ch5KHs/PAiS3Y46Yedm+eKXpkLIOblpWU0KRc0bhEh+n6lD++b0+tWYaXEOc1I3X
	BnLw6dCI+Jpshk0G/yaYmXQUQGDYT0XLne3BZ+xUrs4ZPmiu5BQFf4+zLFZnUfHWpltr0ZQcgvU
	Ny597eI
X-Received: by 2002:a17:903:1cc:b0:2ad:ba80:df60 with SMTP id d9443c01a7336-2adba80e2d7mr69699565ad.32.1772092014180;
        Wed, 25 Feb 2026 23:46:54 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bf01:7f64:477a:2f97])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb5b22f3sm15238245ad.12.2026.02.25.23.46.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 23:46:53 -0800 (PST)
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
Subject: [PATCH v2 1/7] PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with dev_err_probe()
Date: Thu, 26 Feb 2026 15:45:17 +0800
Message-ID: <20260226074524.3808081-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260226074524.3808081-1-wenst@chromium.org>
References: <20260226074524.3808081-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_234655_101333_359A9746 
X-CRM114-Status: GOOD (  12.23  )
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
2.53.0.414.gf7e9f6c205-goog


