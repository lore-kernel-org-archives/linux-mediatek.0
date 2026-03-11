Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44471FD064D
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Mar 2026 07:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0m2X60AbRiPH6OZp8R6Aq2XdXF8mhqQvbj4ZWhmMt60=; b=IzfXbFVKk1CmWT3CBG7dV7wxAj
	cytelqM2Lp+MvvLQ0bUSthZ8RuRPSxceHwSZWgwTNjtXMQx+hSdmQhK5NkAxGhAaLTSJQ+lf5xdPx
	WDsi6dhTf/YUICb4NsHNRxbQ+tl6vDQy168IakRqBL84kGGhO5INDSvylFpXSrkV8Hvml2uN6Xn7Y
	2MfTPxKTCShqw0k4MI0nvUMHHHOHArux+J6q/uREeurlyZpci8EaqsnL2LEsYDc66gxJba+rgDZxc
	qfOMClUYpX/25599whmCTaw2IduTDrJBVv5a++B3rCqi3UpKMcQrhA2CqZtZfcln9BNkzFN0dF9dO
	oc8JnqsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EN9-0000000B5NM-1Llp;
	Wed, 11 Mar 2026 07:52:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EN8-0000000B5Mn-0BDw
	for linux-mediatek@bombadil.infradead.org;
	Wed, 11 Mar 2026 07:52:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=0m2X60AbRiPH6OZp8R6Aq2XdXF8mhqQvbj4ZWhmMt60=; b=G8OllUWveuLBH6L4m35GHWSPVi
	aDHU7CnTenE7vjV0aa9OGUKqttKev4w9pXUOwd77q0yKA8AtuJ3pjbffAo8RbFYkARoOKUJjIQtXZ
	gT7ZXiNLlX0x6zpgZSf5WrafimALG/8hTFOvQ2j0UUB3UduL7qMM0qxA8ftlKYmenUqvP0ndVNIgG
	1Jsb8gwyvljvnkAAVszq1yQKL20wkzzVwKOdWAnuUU1m4raPLw+TkXcueU73lrfYMPrwcREHsPc57
	8srt6SZh2mYDR7R+qb7jZcD880H4dLg1//kKnIedx+Sjmy6xe9pI6BMuUnvrgozEYhE3tgU1uXeGA
	DAYrweyw==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0EN4-0000000GIzi-3scb
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Mar 2026 07:52:48 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-359894e17b8so7235797a91.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Mar 2026 00:52:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773215565; x=1773820365; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0m2X60AbRiPH6OZp8R6Aq2XdXF8mhqQvbj4ZWhmMt60=;
        b=M/SpJL8qGyT+aUOKA0BQAokDx+zAiOeNEkLcVGhPbD6F74m908U5c/+Vowqtk8M1U3
         XpS7GPs474CtFcoE4iY66TWv3qwWB6JT1TGYjX51KUVKwee1qKjviHKgsdgrmr9GIqQr
         lV+HFx+6otvn71y1He8fISiQrWB18VVh/RaDI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773215565; x=1773820365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=0m2X60AbRiPH6OZp8R6Aq2XdXF8mhqQvbj4ZWhmMt60=;
        b=siiRqkSy7WRFn5pthDapAD75aW6RWu+NchioFLKtsoXCLCZW9dLAlCxuZbpZIILsxP
         2kX1f1TSlaVuN7o0gYHKxzW2K166XdwiXAJ8ADZvwK7tFA94EVBMggsO3192Pzvl1Z13
         emMtwG/OjFRteS1v/GilWcWknu27XvUFzbXPbQ3A0b7jIq469GMYx7DIoctSirCLon+/
         Wa74TTiqjf5a8sZ9vNCKrqAQAQpWhVa+fJXPW8TSXXvWC3j1cGRu9CXqlpgj5pK36KLf
         yWADONdRGPQqSfeMpuGM9jd9S2eDrZNE5EI1l9KoDzz0ujaLxdb+EFmDMikTiXm+cxFj
         WMFA==
X-Forwarded-Encrypted: i=1; AJvYcCUJX7BMeQ4IvbD0zc5ENgr7d1pt/LUjF3OpTigfCBoYCKp3tOQArbE6r1wNB74IJhjBk13XnkK7GFJUX4T/xA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwLjH+JB1TiwryhYQNjAFR7jVhBxPvqa4LnMO2hf9Ft4HCFoRNn
	u8LzwDMp+0Lvawy3U4UA9WuQHMN8ExoTsuEgW7i0t+34ZG7J0GyCy9Ymm6nwWxSlkA==
X-Gm-Gg: ATEYQzwbxwjgdFwqa8dETxCSvJzb8/f/4RprPaj1ypmW5GG5k3F8ITHnqJqJ3UEaDSq
	c/S/n+aKUTyoKpI6q//aklPaGFhPwZNJlPU3rboZKoqM2Y+uAHvTA86wrj43adSL7199n22qixY
	kuSbJOHeNnEtL3B5lMg5E2YrVboSsHr1thgMCTI3kWIS5FYISegHj0IYbD3AIauqOhicrmVN0Ak
	FxILwnN2zV4DpRPXAkbHxsMCaSuz1KMU4ZT1IS8TOQiSRnDUoDc7GgkRSjJjeEX+FFxPns38+hB
	a06k/96EQIgHkxyT39CwFHXn3trMu4RVY/RgXosqJowl/uSRDnUZInjnb7RCdLQYVKj7ulh164m
	axfsnedYgbb14qdS4ionAJbGufS+4rG+Lebfz1cieR4a6iPOYEwUtmLVLbsRkXaC3SrDWlI0hsj
	s+bV5e6MSWF4xgcIcqYdX7tUzZh74FxAYlCpBkGgX0SGF7cxmiOksUl2UZihs72m48Ho1cTtxqE
	O6sjotP
X-Received: by 2002:a17:90b:4f85:b0:356:1edc:b6e with SMTP id 98e67ed59e1d1-35a011d0c0amr1809665a91.8.1773215564991;
        Wed, 11 Mar 2026 00:52:44 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35a0236f79asm727816a91.6.2026.03.11.00.52.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 00:52:43 -0700 (PDT)
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
	Bjorn Helgaas <helgaas@kernel.org>
Subject: [PATCH v5 2/7] PCI: mediatek-gen3: Move mtk_pcie_setup_irq() out of mtk_pcie_setup()
Date: Wed, 11 Mar 2026 15:52:17 +0800
Message-ID: <20260311075223.3303497-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260311075223.3303497-1-wenst@chromium.org>
References: <20260311075223.3303497-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_075247_121247_93F624C2 
X-CRM114-Status: GOOD (  14.48  )
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

mtk_pcie_setup_irq() just sets up the IRQ domains for PCI INTx and MSI,
and chains them to the controller's interrupt. It's not really related
to the setup of the actual PCIe controller.

Move the mtk_pcie_setup_irq() call out of and before mtk_pcie_setup(),
and add a proper error message for when it fails. Reorder
mtk_pcie_irq_teardown() in the remove callback to follow. Also create
an error path in the probe function.

Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Link: https://lore.kernel.org/all/20260309215056.GA603013@bhelgaas/
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- New patch
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 25 ++++++++++++---------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 1939cac995b5..04ae195d36c2 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1152,10 +1152,6 @@ static int mtk_pcie_setup(struct mtk_gen3_pcie *pcie)
 	if (err)
 		goto err_setup;
 
-	err = mtk_pcie_setup_irq(pcie);
-	if (err)
-		goto err_setup;
-
 	return 0;
 
 err_setup:
@@ -1181,21 +1177,28 @@ static int mtk_pcie_probe(struct platform_device *pdev)
 	pcie->soc = device_get_match_data(dev);
 	platform_set_drvdata(pdev, pcie);
 
+	err = mtk_pcie_setup_irq(pcie);
+	if (err)
+		return dev_err_probe(dev, err, "Failed to setup IRQ domains\n");
+
 	err = mtk_pcie_setup(pcie);
 	if (err)
-		return err;
+		goto err_tear_down_irq;
 
 	host->ops = &mtk_pcie_ops;
 	host->sysdata = pcie;
 
 	err = pci_host_probe(host);
-	if (err) {
-		mtk_pcie_irq_teardown(pcie);
-		mtk_pcie_power_down(pcie);
-		return err;
-	}
+	if (err)
+		goto err_power_down_pcie;
 
 	return 0;
+
+err_power_down_pcie:
+	mtk_pcie_power_down(pcie);
+err_tear_down_irq:
+	mtk_pcie_irq_teardown(pcie);
+	return err;
 }
 
 static void mtk_pcie_remove(struct platform_device *pdev)
@@ -1208,8 +1211,8 @@ static void mtk_pcie_remove(struct platform_device *pdev)
 	pci_remove_root_bus(host->bus);
 	pci_unlock_rescan_remove();
 
-	mtk_pcie_irq_teardown(pcie);
 	mtk_pcie_power_down(pcie);
+	mtk_pcie_irq_teardown(pcie);
 }
 
 static void mtk_pcie_irq_save(struct mtk_gen3_pcie *pcie)
-- 
2.53.0.473.g4a7958ca14-goog


