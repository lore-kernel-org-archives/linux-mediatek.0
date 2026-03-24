Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E4FF532D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 05:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uaGuEIl74d/AtM9ivAKLmt9Xm6tlq86gWmFME9IpiWQ=; b=h/i8qx2l6Vr/qw1cis8omgld1w
	BPTIaTum9wCQkWEDrByjQ2XI38Hp6vIWYKteOxCoKSH7QA8mN9BE3WIaCmDi0PDPDr0jRXsg3gaQV
	ujbPRy8MhSl1AojJ3rmF6JOMpTXe27GkpneKSi8CkiXjVcHkUaPMYJloCKRuo/miSZed4NeBP7teq
	j+M418toL37/lR1IuNL8ovYRAtyMc3M2bef6Ljn11HzVtDMNPXs/iZ+n3jImD0UU8X3p3kBqaMHFs
	NRienzWoKORiTnvBcpatTNug/wNp8HKggB0xHhhCGTGRoOhVy7ovBApnJMHtDrwxcsaaWi/lD6JAU
	poGURgJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBk-00000000Zvb-2TpH;
	Tue, 24 Mar 2026 05:20:24 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4uBi-00000000Zuk-3Pq6
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 05:20:24 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-356337f058aso2803456a91.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Mar 2026 22:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774329622; x=1774934422; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uaGuEIl74d/AtM9ivAKLmt9Xm6tlq86gWmFME9IpiWQ=;
        b=bWYE7SFtkB21cGwRLb5a03GUY2lKO/OqCIjtFsIaW2c6zicU3kyzkJ7IU3ltHzOctv
         ZCQddm4k4UFvz2s8XSJZr57S/tRqPKB50jrXwHf3iNY7NKJa2Ib3nmDgjS5eXyzEwlPY
         l8I+0g16O0DmMLmh5gWe7djWfB138DrZFsxPI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774329622; x=1774934422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uaGuEIl74d/AtM9ivAKLmt9Xm6tlq86gWmFME9IpiWQ=;
        b=shU6h0HhtH8A1xqf+dtB9RajR6U88QTmH4CfxKkPedAg7HNzSUXsfr5oCKV9QSlT2c
         EbyVew6IiKxCa8vLyzxW4ZCKEFUajWBZeqD16nfE/V+fF09oirxlqecIiAt+/S/CaUIO
         K2+DDBB5f3xknT8Y2yIiU0zSWxbCCOZzPUgE63W19iXZGS5hkBwTnBHosBfAQHWOQh5y
         zOXg2wpM9V6/FPaHpFAZC6XzdO07nSgtiiR11+0YpDnN1TleEfvMq4I4zDxx2Pv0Mjwm
         H0e6WLXUbNpxSoJBBBk97UCm+FUmPGx3KAF+fVyzRDtVuo4MnFdAvwg1voiS0ksxMhPu
         5h3w==
X-Forwarded-Encrypted: i=1; AJvYcCVZmNEyc8kwRMy9ZKrFoiRe93iHkbCugdJam0oD9AuQlsIepX2bpLGBtw9y3I5VyuoJCQK0w9EwD2pcNiqmhA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyS5XEkhYUfICIbdMkqTK32BWcIknQAJ0CwyiBVwoGybdPWSUtE
	ZoLuAzDZFQyB49bFiVhdbJFj+8pqKhl4RIszeffMPsXrGohA0v5EsqdQzSeQMMUyhQ==
X-Gm-Gg: ATEYQzyHGg530hRdnHgRdgVJhLzPlzhj9kyrsSg7wZC2D/Fby2zCaW43GDUVNDJe4Lw
	BEeFItPCFuk2OOIbRk5rJrJ/OxZTl5/i4Hzu+o1SOt9liacHmrZ/dybRieAzZzPyM9Crx0MmS+k
	Z8GgOu1gUja1Yk4Gf8GlKcMYNncDHf32B46wPZPrPymIqMH9N6IWQxuVwnqR/WodyfOy7pXV/hW
	5+6troDHhWdgm/ZjU+ME9wETxkIYL62wcjp+q0RN5ZlcP8j9/ypuO7wRVd9LMMhX9ezFXF2QBT9
	wkXlWdSdV2yW2U9x/oevGp04kq1f9QMdWEhY5xBekFuhfJhUwTuYhi/eGJ/Muig7XLrS23p23Js
	ZEPB+s4xwLJj0ihRQvQFitfAJQUYUgVjhs0aSOOUOanxdi5Q9bpxHS1V82ANKuSBhvXBKSrPTOH
	YXnN2wi/W00Aqf0LqB2zvw1zdl1EQ4c5h/gQsdDYaV15sQ7R5SQfCtU/fRlqikWmFkl5G30cYdV
	adG/Ryc
X-Received: by 2002:a17:90b:390c:b0:35b:e844:3b4 with SMTP id 98e67ed59e1d1-35be8440e51mr6095494a91.32.1774329621952;
        Mon, 23 Mar 2026 22:20:21 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:19a5:8f2f:d584:8078])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35c03124a87sm1068647a91.3.2026.03.23.22.20.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 22:20:21 -0700 (PDT)
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
	Bjorn Helgaas <helgaas@kernel.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 3/7] PCI: mediatek-gen3: Move controller setup steps before PERST# control
Date: Tue, 24 Mar 2026 13:19:55 +0800
Message-ID: <20260324052002.4072430-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.983.g0bb29b3bc5-goog
In-Reply-To: <20260324052002.4072430-1-wenst@chromium.org>
References: <20260324052002.4072430-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_222022_858695_E14224D0 
X-CRM114-Status: GOOD (  14.69  )
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

Setting up the translation windows and enabling MSI involve only
configuring the controller, not the device. These can be done before the
device is enabled.

Move these steps before the existing PERST# control. This provides a
cleaner separation of controller vs device setup. This also allows the
later patches that split out PERST# control and add device power
control to have cleaner teardown.

This change only moves code. No functional change is expected.

Suggested-by: Bjorn Helgaas <helgaas@kernel.org>
Link: https://lore.kernel.org/all/20260309215056.GA603013@bhelgaas/
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 50 ++++++++++-----------
 1 file changed, 25 insertions(+), 25 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index 04ae195d36c2..1b6290f2c360 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -464,6 +464,31 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 	val |= PCIE_DISABLE_DVFSRC_VLT_REQ;
 	writel_relaxed(val, pcie->base + PCIE_MISC_CTRL_REG);
 
+	mtk_pcie_enable_msi(pcie);
+
+	/* Set PCIe translation windows */
+	resource_list_for_each_entry(entry, &host->windows) {
+		struct resource *res = entry->res;
+		unsigned long type = resource_type(res);
+		resource_size_t cpu_addr;
+		resource_size_t pci_addr;
+		resource_size_t size;
+
+		if (type == IORESOURCE_IO)
+			cpu_addr = pci_pio_to_address(res->start);
+		else if (type == IORESOURCE_MEM)
+			cpu_addr = res->start;
+		else
+			continue;
+
+		pci_addr = res->start - entry->offset;
+		size = resource_size(res);
+		err = mtk_pcie_set_trans_table(pcie, cpu_addr, pci_addr, size,
+					       type, &table_index);
+		if (err)
+			return err;
+	}
+
 	/*
 	 * Airoha EN7581 has a hw bug asserting/releasing PCIE_PE_RSTB signal
 	 * causing occasional PCIe link down. In order to overcome the issue,
@@ -510,31 +535,6 @@ static int mtk_pcie_startup_port(struct mtk_gen3_pcie *pcie)
 		return err;
 	}
 
-	mtk_pcie_enable_msi(pcie);
-
-	/* Set PCIe translation windows */
-	resource_list_for_each_entry(entry, &host->windows) {
-		struct resource *res = entry->res;
-		unsigned long type = resource_type(res);
-		resource_size_t cpu_addr;
-		resource_size_t pci_addr;
-		resource_size_t size;
-
-		if (type == IORESOURCE_IO)
-			cpu_addr = pci_pio_to_address(res->start);
-		else if (type == IORESOURCE_MEM)
-			cpu_addr = res->start;
-		else
-			continue;
-
-		pci_addr = res->start - entry->offset;
-		size = resource_size(res);
-		err = mtk_pcie_set_trans_table(pcie, cpu_addr, pci_addr, size,
-					       type, &table_index);
-		if (err)
-			return err;
-	}
-
 	return 0;
 }
 
-- 
2.53.0.983.g0bb29b3bc5-goog


