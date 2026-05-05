Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44A16FF885A
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 May 2026 10:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Jm/1AnMDt5e46hwN56ltGnjEOkXvSOu1rxl9OIWCxKE=; b=XUifr7Q5ULgrod7JBhUht0BEH/
	rA0HlA/TSNXBS0rZcEKj75JL3qgDUlaHYEgqcNQodcZvZEIV7AkwLpoc7fo0CZD7lKjthJ3qX5FYH
	31ObSe2ZmmrV4zNil+x/x2oXWqCBQ78fV5iJ0zLiDJo4wzUvwsm/R5O/rkVFxjB6L4wZiG3Q8F+5f
	vDBQEA/xkqx6pceLUnLkVlEp93RTBVDneIovtPX+CvVe685hoNsuEfCEuz1KrXjnKV5gdTMxUs7FI
	8Mr0mW5XHUyt/UMpj0q74aPsJCQSumwElZOJI2UT9Jn3x+Ac6qSst9nUr8sNMvr3K8UrHm46Kt48F
	TD/hFyrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDUv-0000000Fy4E-1ZfC;
	Tue, 05 May 2026 10:59:29 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKDUs-0000000Fy2O-2ODs
	for linux-mediatek@lists.infradead.org;
	Tue, 05 May 2026 10:59:28 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-c70e27e2b74so1642879a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 05 May 2026 03:59:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1777978765; x=1778583565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jm/1AnMDt5e46hwN56ltGnjEOkXvSOu1rxl9OIWCxKE=;
        b=I55v3mR2ZEzB+4rOPC2KHQDfktwTxQNoqeOa573WI/ztAjuF5fihlRXqYm9xrcMCj2
         Y7JMyaRM7neo1yxxgU6jwHB2WYQJkVX/ovbquGhLko2vE1gJLeZb4B9Z7khfOprxvH5I
         hi8/KS2raxPvYCvASrIxvbYlXRnerJbZbTNw8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777978765; x=1778583565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Jm/1AnMDt5e46hwN56ltGnjEOkXvSOu1rxl9OIWCxKE=;
        b=YhXUcgiCPbl+DPtnhI3j1kR1r9ZoexuuBfpGZHt5KjMsqXIqWUduamnrckPvgmQdTc
         JQW/WSFU9z+Y1Bkzt5Vdte02bzJ1wqsurUiAOklXl/j5Q4UmUEVJx0syCvmn6/i2kNVK
         MHRFHe9x32pNw/n3GzfZA9anZEkokAueFLDpHcAzaUP9LnTqXY51ZWQeZEoUt6lkBFRl
         hYtUaflu7fYSGOVg1aDFTXe30huH0tZGVP5Y0yjbxDHgyTfD3wXy50LrGu/F7EJe808K
         u2xlbmwT2a78HcDBebiybL1h5iDwCG1klWxdXGHXYYvXxEcu4rMc4HIz3RNpMUTNpCbd
         jvXA==
X-Forwarded-Encrypted: i=1; AFNElJ+yT477Zlmr4viZ4VwNn+vGFLfqXyPS95sQGleUQvQUuWMxaEzC+HZZSDzgujUSpx+cBtLutdrswijCzj6c9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxawupgAwvGQHTC/ZhW+exTUi/bdIJL4+PVk6KraSvAfkH9J8DA
	cfb9FKa5ezw8lTIw10tu1SYqf7hz20NIh8P7hITCRiYvMChF0gke8bP+WGNU83ymRQ==
X-Gm-Gg: AeBDiesbpZiS0ZjsPf0CLlm8WaEQW3IdIz5yRRvEjUZ+f3CFdeD6ChFKs8puTUwR0sz
	uYZstANtUx/AmoFpqFNISZAjh2t7vFyZwK9gEZf+bzA8Hmk4Dhm1UhLQ202HetrdC4+V5+5YPVb
	XPI9N0IWjj1rMiv6CDkw+r4dDJ24mvoPkBCOWH9UpqIDeNiQAlsm3CuZ+Ea4nXymUPIz/0fJwfu
	kqHOkYniTszmCqomv0PvhyLLOWKA38l2CMcmew/KSa0Amb4i7ukDCjV0JBvlTFU7RjmKG1DbPqn
	iLD65cFSNWmSzy8V+PIR5xAG/IU0OwxU12r5lt07u0PeH/6Abpf6Eir4dzyog3DQjBJppezSnJN
	a84/mqY8qITbfp0yEvd/uID+B85rkbjCEhFtgkhlN/F0x3VmDGzADsBds+oERt8y/qKlk5osDUX
	b9LY229GzVRsCW3WQSoYy/ZSIZzksauMte1ZuJaHfdTRJ9spIH2uj57OKChKihLQB1INkKbgaCl
	0PXnxyCJa/IC8HxpjQ=
X-Received: by 2002:a05:6a20:e210:b0:398:7ffe:472f with SMTP id adf61e73a8af0-3a7f1a1e096mr14432341637.2.1777978765661;
        Tue, 05 May 2026 03:59:25 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f1d4:2ef0:7d08:9dd8])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7ffbba71b0sm13005611a12.2.2026.05.05.03.59.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 03:59:24 -0700 (PDT)
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
Subject: [PATCH] PCI: mediatek-gen3: Do full device power down on removal
Date: Tue,  5 May 2026 18:59:16 +0800
Message-ID: <20260505105918.1823170-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.545.g6539524ca2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_035926_642202_A619B173 
X-CRM114-Status: GOOD (  12.87  )
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

When power control for downstream devices was introduced in the
mediatek-gen3 PCIe controller driver, only the power to the downstream
devices was cut when the controller driver is removed. This matched
existing behavior, but in hindsight a proper power down sequence should
have been followed.

Call mtk_pcie_devices_power_down() on driver removal so that in addition
to removing power from the downstream devices, PERST# is asserted.

Fixes: 1a152e21940a ("PCI: mediatek-gen3: Integrate new pwrctrl API")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index b0accd828589..e6acca7e79a0 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -1260,7 +1260,7 @@ static void mtk_pcie_remove(struct platform_device *pdev)
 	pci_remove_root_bus(host->bus);
 	pci_unlock_rescan_remove();
 
-	pci_pwrctrl_power_off_devices(pcie->dev);
+	mtk_pcie_devices_power_down(pcie);
 	mtk_pcie_power_down(pcie);
 	pci_pwrctrl_destroy_devices(pcie->dev);
 	mtk_pcie_irq_teardown(pcie);
-- 
2.54.0.545.g6539524ca2-goog


