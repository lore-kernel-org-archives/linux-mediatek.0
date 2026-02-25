Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB9EF357DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 07:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QS0Ykx5d3ml8rzk8tsHJLTUHxdInYPjDBS3HSjaXmrs=; b=oTx2qih9j4zh78iCy34jzEZqcr
	WyjUyxL+fP2XyWTH5NaqPiElsPtM/FSSFsjHDpVvjLy2kVflUX+LQxrvthros1w2Nr29pPrIx5jUm
	VQ7J9JHOLvN6us+UQG+If3SlF2PL0tb3vczcI6qYKcy/iYIUhPHOUpA4E5pmWRZFFX+gaF/yTBXfu
	gvwLiPozaEJsRlsm5zbaq/2L48oVV3P+bzbZj4TlWaI1Ua+2ryPvpZV64du40dlyTNdoUfCyfrGeG
	lqSgbIe3tBYeF4FNwjwd+fYId6PqyqzBLzPYJPV6U/SmmjmEInP/Wrw6TLc5yJGLBtcPhq1r0o9kb
	Fn6opsbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9EX-00000003PMx-3VXb;
	Wed, 25 Feb 2026 07:22:57 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vv9ES-00000003PIN-2uzs
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Feb 2026 07:22:54 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2a871daa98fso45855655ad.1
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Feb 2026 23:22:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1772004172; x=1772608972; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QS0Ykx5d3ml8rzk8tsHJLTUHxdInYPjDBS3HSjaXmrs=;
        b=ER1V7ojlqYee2D7FS1SZRwfQMzwOJEJ87Z93vPhLVwlshj99OaxbQ1pyeJK6+ba96d
         rwqWAaziNQjpCOzDaJwwHTWIvt6u6Aofa/DSCYP6tn7AM0cb0L+28tdxW9RcbHb3+CrN
         o7EcMgYCYUKqf4eBNqeMVMQIztYnwmXkuH6P8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772004172; x=1772608972;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QS0Ykx5d3ml8rzk8tsHJLTUHxdInYPjDBS3HSjaXmrs=;
        b=rh0bdmqGmrxjEP+CFz+2CirI1CN+OEMulZ70B+pgCUEDDIWGYek4DMF72gkPFDOA1o
         NEmvOVeNDJOrMZPslPlGhS/FEY0dv5aumh4smR2At8zX+iXg1CVgntLleq5MauGx145C
         2RmdC3nvfpTMYJOzabmQzyzaXl8Gfn5YkIaMXVTdFMrtNNKPfs7yd48iOfNxt4no4DRR
         gZg4qJTH7vbnmbKR/uRQBYbw5BjVUbHGYd6VolofS2FkIcRnIuzxg/Fe5r8EHmkMbKfE
         cuPtZZVmPIkqwejuNB1bQ0AslKET0DHbtzRlaY+jOc2Sn2k44EKxAhdJOIEQqG9BgoLF
         wbyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUsWukHZ47a+aBg0IRWq0rObxefznsUUy227PkMfRN2jnir9TFNvTEmf9BpddC38utCF+0aW65nVvKDhPtbIA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh96vIhzKgj7XsTQd0T9jvkrUMhh3AL3lb54dWZyin4L56CtPA
	LUt6wu7BEWVTxiKp9J90MJLwFPRddYxXADRBoMBXUCG0GQQnCh7swCNy5CfX8rxOHA==
X-Gm-Gg: ATEYQzx7A18a3jJ/5+VDyA2OKh0oXsGIlSRN/p1A3de+/I0eb5MRtbtpzVczAsHJOkb
	PAxJIwRJFKDJB0ZDDGf4WxZVpBR16nmtdPXCIsfbZGtX3ZFO5RVfkvH/DExHbdclOu+JJ0ZBkYl
	h7jeaHHGMVsLJ3OpiaYGpsmdPcZB67Y252zrv2COPv/yK5yEK6UhyRsT4maNJRwS765SP07voBj
	mb2q2SMnPeEwCpGDT/Y5tUkdFYuUJbsjY89fiR+q5jIygY/+2Uy8I2D+wB81mShpL52w6rb6Gbe
	6WElfCGlC/4mXX6C+lNG9SveaBfzlM2sTF3Nz0vXI2IjI8ECNXTiR2lf03/dxWgWE8J5227PMfs
	lidwZrroWd32pxDBvmqE4I6ku4eZr34GMsCbrBqTD9csKwLqXx6Ost95exboQsusct0iY6F2Isw
	IIqKcEW9uDe//nb240+vNvt9oQ50Nm6l72DZWRcnwZByiOgGA2fogB/mjL4qopdh2VZkIWaBagP
	KVr22h7Ac8VWW3H
X-Received: by 2002:a17:902:d4c6:b0:2aa:d7fe:8611 with SMTP id d9443c01a7336-2add13fda8cmr13861915ad.27.1772004171868;
        Tue, 24 Feb 2026 23:22:51 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:9d6:2e6a:941b:690])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad7503fdc9sm130814435ad.80.2026.02.24.23.22.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 23:22:51 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/7] PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with dev_err_probe()
Date: Wed, 25 Feb 2026 15:22:18 +0800
Message-ID: <20260225072225.3345307-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.414.gf7e9f6c205-goog
In-Reply-To: <20260225072225.3345307-1-wenst@chromium.org>
References: <20260225072225.3345307-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_232252_756503_B92C462E 
X-CRM114-Status: GOOD (  12.46  )
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


