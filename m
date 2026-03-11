Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01010FD0648
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 07:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+k9XHKdzt+xrme3N3sFqf/9kOYEeHBPbN54N+TXv9c=; b=X3zuWk6kkJQz5BzScdmFcUZwFp
	7antV9t3uN/SKqhODFNkSDpizll6H5YL9b67jpMyIubipc7WngyUZpnrlYZvWolw7pQjBbP1TGsHo
	Ef+zPSaieISZzCnEKb3tOeF6yweTDv3Y7WFPxK8qA1M9MakyCoYoZNWxzohc9sEOG/Yn8tKBjmvTo
	X15SUFz6R2faUjgprgXisPbe+aBG7M/sdxd4ihOBFrvAD59kakkzFncLjqw/WB6EYp6xRxUvrYvHm
	6p8MghcgKLcyXxLwZGTJEBDNf4srMWO2SCPqtylGricPr7QDFHArUKouVIMAT7nk9kaqEjhqOn8e8
	+ieQ3/TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EN2-0000000B5Ki-2Nln;
	Wed, 11 Mar 2026 07:52:44 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EN0-0000000B5K0-16IN
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 07:52:43 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-358d80f60ccso7615544a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 00:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773215561; x=1773820361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+k9XHKdzt+xrme3N3sFqf/9kOYEeHBPbN54N+TXv9c=;
        b=C7l5zeq1vANq81EuPQ6yFa5JUgncstrE8bKdiB3TThZU/HQWODO+BRaG/Y+2WUtlvx
         bu4QnC2tXm829y1DB2eji+5MuQ9SriCx3vgFLxoqjdlOHN265Ms/vTLYLqXYWpKm1F9Y
         +pgTEeXs6HFvSyJivFyR748n+yT/4eU/sGJWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215561; x=1773820361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=J+k9XHKdzt+xrme3N3sFqf/9kOYEeHBPbN54N+TXv9c=;
        b=DWl/xbZ0frjJ8dfMZyVKGC2o+t/3aR4xopBW3hhMc57IDx57jren66ugdawcX7eWKH
         GXGrHPMB4+xVjtM+1aB+IzH6nGr8KWCWrJPihd13kAOuLSrsMZyfEZoJjq8zZt+ur72r
         0t575BlMW0DpXVKdmT3s20eMz2QKqEJR5R7I9y2BDhrT/N2szAsYigcOOZV64lBg5lVF
         qB4leQO7KKQjCI/vcJWQ4TyqJ6ugtdPKOGn5OQQ7ROHcBAgByDMjEv1XsnJ73qZ9y2wG
         20SWj+zfprhB9AxDLx3LBh0U6hpjfeq34iT7mPAXm6F9b3eexNJ2HypvshOUu6rteUF5
         00cw==
X-Forwarded-Encrypted: i=1; AJvYcCWGEimbRiIE8Ih21dSbj9fttbqEVG0EBR/RwNS/MsUJpp6+pKyEiMtNbhlYPWCC31BM0epYo6d4unbr1dqg3w==@lists.infradead.org
X-Gm-Message-State: AOJu0YwpRX+dOt9/SBmZkP6SVtqtv/IBunKJVLsR/wam/bVsTDrfHTVk
	pPyun9d/15AG+RF3TJ89hRxhcKugz/vFyVvbxPduX2NkX+xZxKceQLX5AmgB8SP+Qg==
X-Gm-Gg: ATEYQzwoAvhlK03XUdoCE9N7gWl3ph1Lj5MSDM0SyoNhyeWJca/9UYSnYSOQE+UiDH0
	GNykwSwju6JfC7FV7V4KLepzafLVPvZLBUwWNIpQ3DPNgRxs6B+VLAdnmzMD9Bc6Xqo0jM6UzPg
	LKssMBBbq8ncvEEWFWJZn+7hrtWzdLYD3x2j8V7ZKxYgr6S4DUL5hTeATD3zJAaTHMhop3iwTjh
	qH0hv9fj+tB6f2xBPTwyuRbOclPw6+p3Hu0GDzL3O5XvS43yTcfnaCUw8ADI1LdcY8qlpe4g9hR
	f4g2X1QIf2dlFV65XON+i1wBl0PxtbtbDubBN1/NJLaVJqYKyJTMpusoKZM43Ll7+fYUe32fsYF
	X404iRc7sYE6r7rn/FjDB/JPfvANn7C7EU0HO2+zYl1WKKVZQJ1jZaNlC4fAKe4YaXq16k4DEGF
	ayBQobVxITeolNpbpaRFulrx7JT+8x3XdWnd0QE3eP1U7Mx7ttmh/506xKMf+qfoXBr4oqxUakn
	9jTcHhE
X-Received: by 2002:a17:90b:3d01:b0:340:66f9:381 with SMTP id 98e67ed59e1d1-35a0121613emr1654777a91.10.1773215561374;
        Wed, 11 Mar 2026 00:52:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a0236f79asm727816a91.6.2026.03.11.00.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:52:40 -0700 (PDT)
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
Subject: [PATCH v5 1/7] PCI: mediatek-gen3: Clean up mtk_pcie_parse_port() with dev_err_probe()
Date: Wed, 11 Mar 2026 15:52:16 +0800
Message-ID: <20260311075223.3303497-2-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260311075223.3303497-1-wenst@chromium.org>
References: <20260311075223.3303497-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_005242_371572_1A97CB95 
X-CRM114-Status: GOOD (  12.37  )
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
Changes in v5:
- expanded tabs in commit message into spaces for better formatting in
  git log view (Bjorn)
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


