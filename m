Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E86F532D8
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 05:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d+G5opAB+jyNCsDIm/30vZQM14H1ghGVf70HXUwqlUM=; b=fEnyjuqkNE+IiW276Z2V9QQyJH
	gLgtjW1G2vFpeCTjvpPS0QbECkkGrYojXfx5Z9cJ1OmDTfwOn8ayKhRLNzYNxbwlyvL98trdhmjMl
	Gg3V37HQRyVnyHVzKszfn8lcRHDgMZo6t5x4JRjFAM34UEnxfTJ/v8oSMTntT4B14auzvXoQAtgO3
	yKNGzjjsw4PMkRLWBayvzQO6hqHAx+2HYXQOYiFq0fEVOF1mxY/JrqCkHtCoTQyUJChg9sUf6IywL
	Dq/hgVTWIur6n5wVH4hjC0MR3rF2MbQBsEIs9NJmm7wINglEhyCy7S50WKOSoz4gNRvCSXhqdrwYu
	oFcQYptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBe-00000000Zsp-0CfE;
	Tue, 24 Mar 2026 05:20:18 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBb-00000000Zrh-3FAs
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 05:20:16 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-35bb9070644so2149362a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 22:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774329615; x=1774934415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d+G5opAB+jyNCsDIm/30vZQM14H1ghGVf70HXUwqlUM=;
        b=Nz/CQVsW5wsk9+6VHF8GVvHxX9ixIAAP4i7RjhdcqS4QRHZpJSRCXkZKhe0z3Kn+MJ
         hRpAwn39LI6+VDg6NRSOkX/qOiake55VlwsUVxEJAnfH52aEXXNoY3YQbbkzclcmZ5iS
         vHE7bbJwC/HsAjcrazHuU7LlwJ4MXH/vRHGSM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774329615; x=1774934415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d+G5opAB+jyNCsDIm/30vZQM14H1ghGVf70HXUwqlUM=;
        b=J6DK1h7qOr/bBMQlqpbjJnAjZ52btBkPJs0dKMVdr3pTt/R39YSjN7F4hCUuT7EA4J
         j2h1y4s6UAe0/A0ZeFfESOO4L5ptiv7KBPxlw7XQwDxqEicOBThEzWDsLursJvObO3UF
         TfNLANnlRiUY+1tkQx674kao+YMghKIj6UTE6zWUEPbGMyPJtrZZsth7JlQcEnIS4tmN
         vHBClq/tsGGjzO0SbZ8hkffCI0VbyhswAQov/Cp7W1Q67IKL2+aQJ9nhD0W79klDHrtB
         SzC42QB95Xejkj+a26vvVx9ypeR3/BefvWuc3iXvDYyYMbKKZ7NERsDKLMUUqgQaMoE/
         XhSA==
X-Forwarded-Encrypted: i=1; AJvYcCWZM6skBTPVXtodK4oGtCjX4D0zRyptwOlRncJB6JhFrLY1GYS6sRThmkI68ZUMZvIGQLB3cJRhP4jOLTufaA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzz5N+41TjBUE23PRLKoXfa94H3N6rfd3CcpDqmXphhVy0zX5ac
	gPTqhKrHyIjNBBQAmAEbtF+QQfd0AZU9txiJpDTbVghvvkcb8L0apBidsdHhX/uXew==
X-Gm-Gg: ATEYQzyr4eiYEW7Rz5/FiA+q6os32iPwvmYqn0yiNGbIJsaGcHYES0/piFX+/Niqw69
	6EHbM1msWQiblnGmL8liGuvzHYVHPj5n3PoxE9C3i9RmafnY9PF2MXplBT+Jct4DmjJz+0l/2HB
	Y2zk7Hc23krT9SO08rRRPrKApwuXQhoTRQ9KbUGGqSbK9BNNWlnfCC4jZJKKoQpLEaDyLZtfs9w
	cshMI1pmsAwQxDTYodjHzBUW/WawTrSJSAiJhvgq3t4Pwe1v886xUmdQQQdRongbOM9JsMddYlf
	Yxncw8jWVIVKwR5IQfS54NGIo9NxtVNp6A+bZg1VuZd+20IhqDXDP4xJV/e42uba38QE2XoLvee
	kupSpA3xrv2DfFM98fI4t9upnPgR9l2GD82Kk/9Y2CIGZoG6hAyMv0x1qpZj/ZmQf7DG3xxHKhA
	So1fmJCbDprbAEMbl35nc+j0L2Pne6s9tIslvVBOMDIH0Ze22sac0vOZs67vH01GUbKCH7fNafA
	2kDXqD6
X-Received: by 2002:a17:90a:ec84:b0:35b:e56e:b5a6 with SMTP id 98e67ed59e1d1-35be56eb622mr6319388a91.1.1774329614922;
        Mon, 23 Mar 2026 22:20:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03124a87sm1068647a91.3.2026.03.23.22.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:20:14 -0700 (PDT)
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
Subject: [PATCH v6 1/7] PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with dev_err_probe()
Date: Tue, 24 Mar 2026 13:19:53 +0800
Message-ID: <20260324052002.4072430-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
In-Reply-To: <20260324052002.4072430-1-wenst@chromium.org>
References: <20260324052002.4072430-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_222015_839894_55F413B7 
X-CRM114-Status: GOOD (  12.04  )
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
2.53.0.983.g0bb29b3bc5-goog


