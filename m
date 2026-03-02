Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B813D58E5F
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Mar 2026 05:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QwT2Q2k4ZVZq63ntd2xl/RXmkonC2qNh8yVsjLAAWlg=; b=PiOcq+gEObIThnWLvG0egzy6ex
	Gu1OWnX0h4GrjwYATh0L/uZcCWZ9ZoBZ0o0yXtfCswvSmZ+/a1Z66lwAT7e52MWj2V0RdeRMH4kci
	63GZ4D4GkBNXinOub23OM8gFMK6L4Lcp8cvZaJgDjy6W4SnDgVkorkkXmjjYf/yzhYRG11n66T2l+
	cTTu3IY7sIXpizi7bLvxK3cEuimv31EFErwaKrCHqnHVR7ZERjJki7bFiziGUpr55lq6rhE4qetIT
	IWe1PhzMgrU8FjAgb92zpPxAldP1GLwbnjqIPiZgUEbiucNhN+klw67F3ZlMBe1HiNM23XPGTHwSm
	xgAKFLcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsJ-0000000CIf8-11tj;
	Mon, 02 Mar 2026 05:31:23 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vwvsH-0000000CIeW-1Lzp
	for linux-mediatek@lists.infradead.org;
	Mon, 02 Mar 2026 05:31:22 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2ae4e538abdso6036725ad.3
        for <linux-mediatek@lists.infradead.org>; Sun, 01 Mar 2026 21:31:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772429480; x=1773034280; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwT2Q2k4ZVZq63ntd2xl/RXmkonC2qNh8yVsjLAAWlg=;
        b=JXH8IlZ+PYBcGvegZspXKRn3wZMUdAZZd628J2GqmAbfZ5NO7VhAmK2C+Ybii26Xf7
         QFnpm1P1noaPbvcg83VQCVBs7jPd6ew0TR+NsXqxYnlw3lnGqScqz9bxH9nTB8e+IstN
         ZLoufAl94nNr4ub4job8ySuL2NpJQrVtmsSvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772429480; x=1773034280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QwT2Q2k4ZVZq63ntd2xl/RXmkonC2qNh8yVsjLAAWlg=;
        b=i3yB0g6pn1owVgaMjY9xc0EffMJU6R2D2zBNSr4Nqss5TKpstUXCpXdlF0vTfhUHcx
         EKF0WchfVuWL13Pmd9S1i+v8GiPc0BqLYo4uI79ob2F3SvYwkXJAmJyu2uY6FJHcDImx
         Q7AkPPzFvVJyVzvbxF/D2k6fUzAr9Oewq2ngGT6iIy9/s5/OfKcFjg4PqzjCZy+L3UOz
         c16sVvOOXSHjhfe2FDNo583FJ4C4PpK1L05KOB6PX3aFRyLR0TmFpePmnYXGtjhhmzXb
         XPdxmegPlLcgr+zrvY8uc5EvtSQLgPJUBBl/WU4DMP4VRkZPqkhl0ArB3GuFnFXHdUO4
         MO/A==
X-Forwarded-Encrypted: i=1; AJvYcCU3Q6xEM/qPBX8YnnxSXUJzAGV5q9Af0Bm+FDqy4aAMN40rU+hZ3CR3GpE+9b3L6kjl1o1q/d4Obu3w8ay5VA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeQutHUOE89T2rfB1U+fgt9HDqc5Mutstsm/CA8nFfWf6hBuA1
	KWhpYMzb791W3lhifvwJqL3SwtAIvXuR1fDpj7DmtYbxaes85Na648zudeM8/ZcQmQ==
X-Gm-Gg: ATEYQzwtxQKSl+4HTKHJd4LtcVdnBHSqIrSnTBe2hCNfcvQ/4/65Hzu/OewKz/nGeTv
	uKYVWEJ4JJvjdwt5tejFg+jyzJved6dvHoOJX/Yw/1PLHpNv32xLnZoalZrd5fROz3cMaX215KL
	NsAfIdas3qRd2IAfein6jz3OhqTbsD1n0Er3Vk/c7KaIwaZREfSjD1lxGYXxmvtFa6E8U1xxLF/
	RBrcUmPNBMFoA1o5EaaIV4xJkuGpur/kQbVy+o8ZWheMtFGSGci+nGOYX6vK4x2xM0XE8UjFMR3
	NTCvS2vx2/1bw/8ey+Zdpb3LEruhqUMvcUyNzD/cZD6Y2jT2wUrmo7kGcL2OUoY0hMne+KHk7gA
	cdR5GDUUPw5cC/yBxOZZcvpX3Hr+pXJMH2erFvMcsv3OdFD8JNP+OiF7lh6DX1TIblIaL7nfjwP
	Orl0x5HvBpvrTRifF0Kgzvtu38YXB3OwoGHZCHL9uTqYQQpQ8HCfhtn2XGCSY7IHv77HMve5agv
	mUKHXtg
X-Received: by 2002:a17:902:ce0b:b0:2ae:5223:59ac with SMTP id d9443c01a7336-2ae52236614mr14979575ad.13.1772429480332;
        Sun, 01 Mar 2026 21:31:20 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b9b7:93f7:8c3c:59d8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae5229cda1sm15196435ad.23.2026.03.01.21.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 21:31:19 -0800 (PST)
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
Subject: [PATCH v3 1/7] PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with dev_err_probe()
Date: Mon,  2 Mar 2026 13:31:01 +0800
Message-ID: <20260302053109.1117091-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260302053109.1117091-1-wenst@chromium.org>
References: <20260302053109.1117091-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260301_213121_410590_EE4FCF56 
X-CRM114-Status: GOOD (  12.24  )
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


