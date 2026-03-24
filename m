Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4CAAE9A74D
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 09:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0wNRdSzAgBmj3W1HLVnK+M5XPg8WJUDMQukRyAUFTZY=; b=iiSEcSOo98cgkTo/kYRCHzo+BU
	JogAsPXONgPxcu6y1xVVl1sWiSkPsVjv7RjMTXxXv6LhG/395EmL+QzH/AepkqYEOn3m/EsWrS4Tj
	8idXJ8hiq7pn0yrlhRoxFR9FWqEb+DzeBZAk+m2HEU3Mg8LuU4N44qf1Oa5ElT8iFiQSPdNpABeNx
	n+HT6t7fW/lBKnCiNiGdQWt1kwKuhYxWH4UmpCBLo/v978tF3zRDj0bbPj9zhw7hfHCYUlpN3WmnV
	qd1kKt9hqRXxaSG/WRhDte2N05Ny3vO3fySKcWYFKq3t621tGQuCPYlo31MsOEOEzV6BVqj4jfFky
	IGm+Fvsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yB5-000000016Ml-0lVJ;
	Tue, 24 Mar 2026 09:35:59 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yB2-000000016MO-2LCC
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 09:35:57 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2aecc6b0861so29836445ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Mar 2026 02:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774344955; x=1774949755; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0wNRdSzAgBmj3W1HLVnK+M5XPg8WJUDMQukRyAUFTZY=;
        b=JwA4lYHL2JgJdzrXkEZ2BCUd5VDC61Afe+Q771C/Y6BmJBAWW9YCcblIX2mR41nQsn
         JdLaqWqZ2cgW5r2NabWM4TwOjHBr2RsM2Fi7flqaC1v5IKpr/2ETw04jmmnovuNl4841
         6ztn3eFi+doO+OvGL76AnGOeOifWIU8ve7DHA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774344955; x=1774949755;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0wNRdSzAgBmj3W1HLVnK+M5XPg8WJUDMQukRyAUFTZY=;
        b=p8Qpjem2pEbdCJSlNk0Qkomwka+9PqPb+mDzWBzSnBlZcCMhG226CeV/SOEAbeVdw+
         wRU6JXw9rNf2t9hhZf+DcC4zvDuvq2SCg+ripxjQJi8k5vQgcOa/ajC981HL0t9ybjEQ
         6hAgSxKl1spU68djwA+kw/VChqGGaqVAiI2WjRDXZNdPcw/j0okVq5QcwOJF3VfirIUf
         buo2nJrB7fV8Y3hsW2B/ZwIX268SHmZYjHmDxHGe1mZqHZ8Kiz9OhRi63eyDWPj53vlY
         jI84LWQStgNp+5VLao5bgHCuKMZafAOK6rLIkI8bkjx1ZjdIj7IEX0RKkt4OqTifef0O
         9EPA==
X-Forwarded-Encrypted: i=1; AJvYcCUK9oTQ4AD/BBnpeTazDrRRp9iZKzhSHDeAjkL2vzkWy3q/T1D61jD0Vy42Xq3cbwjD9/1HM4UDGhInDOooFw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4YtGZ+84FK/55EM7WA6dHvCLfBhwTEVzL31+2toneFZnvWh+I
	CsNNpTp5sB3KJMBCAIEVmZBkz6y8NA/y8ibA9Y0GV6zIPLsieL0ssG7BpvAOrwocFw==
X-Gm-Gg: ATEYQzztDeWHULfx89hSUJcmGt0gydXCQXgqyQGqAcwT3CCnPZBIYM0OBEbhIKuUX1W
	susT9epw+PTh9TVopXczMT6jcxIcYIYUQ98Q9k9onrzfLl3Z/KcA8MjSRxuVgt7gyW2XZ+sLLz/
	EcBmznoKU08tqtt8DP5ufkUwgZC3yesv0NAPze7oBLMswZ+s52o0VseiUnU+LPsCJMLmF7RASB7
	ehvg178/I4d6JUNEa/hcdtV1s8ym8OppoHn4qhmq+kv8zyHu6VakwKAmNTB0SX1x0nTYdWWVarZ
	vlJFPBGJCW/AIgQelkR3TuqfidSUphM2tPvBrpbyZfILqIIh3ZrYgBbr/zazt3Otz33hVeEnU5v
	pmvPYAEHxZra5mNrcYBZqKsqRE7FRAKuoTJMi1WjkING6ue85ioglm74C7GpZkbSQho5nKcVscf
	pL8azVaUpgO/25Ky/NhC2AN9mp8ZdGxy40PXvb8wC8iyo4Y1oyxHKFkg7qAIDwZSuYJfRdKnMnS
	KBCX8XK
X-Received: by 2002:a17:903:2288:b0:2b0:5548:7d84 with SMTP id d9443c01a7336-2b08280c1ffmr147273335ad.48.1774344955576;
        Tue, 24 Mar 2026 02:35:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083679867sm163785785ad.65.2026.03.24.02.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 02:35:55 -0700 (PDT)
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
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: mediatek-gen3: prevent leaking IRQ domains when IRQ not found
Date: Tue, 24 Mar 2026 17:35:41 +0800
Message-ID: <20260324093542.18523-1-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_023556_652597_86441ECF 
X-CRM114-Status: GOOD (  11.68  )
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

In mtk_pcie_setup_irq(), the IRQ domains are allocated before the
controller's IRQ is fetched. If the latter fails the function
directly returns an error.

Instead, reverse the order so that the IRQ domains are allocated
after the controller's IRQ is found.

This was flagged by Sashiko during a review of "[PATCH v6 0/7] PCI:
mediatek-gen3: add power control support".

Link: https://sashiko.dev/#/patchset/20260324052002.4072430-1-wenst%40chromium.org
Fixes: 814cceebba9b ("PCI: mediatek-gen3: Add INTx support")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This was flagged by Sashiko during a review of "[PATCH v6 0/7] PCI:
mediatek-gen3: add power control support", but is otherwise unrelated
to that series and can be merged independently.

 drivers/pci/controller/pcie-mediatek-gen3.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index a94fdbaf47fe..2f9365930d6a 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -890,14 +890,14 @@ static int mtk_pcie_setup_irq(struct mtk_gen3_pcie *pcie)
 	struct platform_device *pdev = to_platform_device(dev);
 	int err;
 
-	err = mtk_pcie_init_irq_domains(pcie);
-	if (err)
-		return err;
-
 	pcie->irq = platform_get_irq(pdev, 0);
 	if (pcie->irq < 0)
 		return pcie->irq;
 
+	err = mtk_pcie_init_irq_domains(pcie);
+	if (err)
+		return err;
+
 	irq_set_chained_handler_and_data(pcie->irq, mtk_pcie_irq_handler, pcie);
 
 	return 0;
-- 
2.53.0.983.g0bb29b3bc5-goog


