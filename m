Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90EBCEA8550
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 09:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VkopRVj6tuJbWd5GjoKb9TnBTEgj+l2ZbxAGzKv8UNM=; b=hpfUbDztszwYgNBwX84y+S04Bp
	WACgQHvVvp6bAcEnAMJbskaCgf+JuDbP5lQMQoP+eSuqUZSEPf1CnVTZpiKvkCMvqVOV/VSc09LAn
	CRx2ZU/7iGofvULuMgB7em+75qrq50Vzb66RoV3HjQ1EBOOYdH9yRB/8x6YwE1N0Nef3C94FnvXhe
	jIXQz9bSx0/RIOwgB8m48MjjNv+m1GGgy6EARZRJ6bVXJc7Gt6q4xzJFgLkLNN4JvSARAEwrQjMDe
	ApnI5q8caW4oTtT7lVJ3RDmQ1XkblNDzlA6fa2cN3uynWYreGZhh3r+AMT3pF8rP2naB4Op9tc7F/
	oZvCHPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztG4-000000094Ri-2wEE;
	Tue, 10 Mar 2026 09:20:08 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vztG2-000000094QA-0Bhi
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 09:20:07 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8296d553142so3024480b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 02:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773134405; x=1773739205; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VkopRVj6tuJbWd5GjoKb9TnBTEgj+l2ZbxAGzKv8UNM=;
        b=RWePhJBuJl4vWVlWNKxIQgfPDkt1XZfmTKT4baaC3IS+t0pbC993vTUVnpL8cOE14B
         iAawt63WQ2A+XKLkeLXFYf0NFeQukK/PkvgXes+oHA6Du0OygzbI8oQWzOu1jmcUVpwz
         Q6RgZukXv6HgqXxuasI9Gf3RiEmp+wqRFJbfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773134405; x=1773739205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VkopRVj6tuJbWd5GjoKb9TnBTEgj+l2ZbxAGzKv8UNM=;
        b=aIZN3V6yGog8qn8bt1bVNvnD6cd5jUtBk9oM4GwQkhmRdYYMl1iDpijHidVJ8gKEvb
         ECDhjAHdJZNqvnBLJGGrSSCGpECAv6QMe68eYZdvdk+wuzZ5yw6bkc4zLjzJY6+ylWI2
         HHOxLX0nvoxYnVACllX4X81mPgPRpXrqLtbTx5djt6dYjnMjGhWHJanH8fj0hJ3GrXiJ
         MnE0/bY279bSgM6SWArkMGKyiDlxcI/caA71cHMIwEtsQDETUGZKA4DjRMK9Cy8O9uc9
         Z7UkaF8N8RlHAnibCERtcFIv9MxAzrrsQnXVCMlF4hn/3k2AOY4PlUn+FfmfeHJpRnmO
         rQJA==
X-Forwarded-Encrypted: i=1; AJvYcCVj5BNkgyUflXhj0kQTzf+7o3Bftbf0AQRZnpf8NiS4vc2s8iXva33dRIcMRW3+GrZXGMckNg5SsM+FzBIxGQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4ZpqRvi6u3N/J3zJHovhXoDad9fcMD90MJOauttk7480+SmbO
	3n/VjqOFl7lOHelEHy3OzwHq812yJSafeHFFQSb4rcPFAwDpwAgJIkTjh/C+2DC/dw==
X-Gm-Gg: ATEYQzy/PyyQ0jiCRa6ExQcnzSMquLJiy3wgM3aumi7NBRF0AUd9kXTfaW+yRrK0P8K
	67OeWT/sXxJmgpGQXvlTiR3sfzcNhJkNKnrCb0kC37osR1vLeNxgA1X0jB4kNznwFSedruwJCWs
	6VxOQF6s4Pg17qIayZIdqEMjjy6fRBrf5Y4pLA1iPfNptCcRJNaaHq3H4v+LhwQsFq3kCM0KN9h
	AZ0visbbWbgEhvtXTXZSdZFL33cTaoyyM2UTgTIsvSv4N7ORzLoXH8eWmb/eiVdPl7cOP+r0K+v
	9n4pMGR9hbTJc1G5jsUi0+rBvQ65AphRd+JbRtOWFQZb5AGkT9Q1bAvo8EEkSnHgDc9brwCotqH
	yBkY005MniN4QyaHoqN0RFY0qU+vUpMVw6P1xzi8+HPWuaEVyCM2dUVAOAQw0SlCbzx6KZeBSin
	yH0gKZf1cRD2cBLpnwKQVFZr8Kjj/zzvljrBY/RqjC/8qRmpekXYdhGU6cbWSaPcxND4q/eeSeq
	ai+7tH2
X-Received: by 2002:a05:6a00:3a1c:b0:829:737e:7d77 with SMTP id d2e1a72fcca58-829a30d131dmr13244794b3a.66.1773134405103;
        Tue, 10 Mar 2026 02:20:05 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:ee38:e01e:e888:6900])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829a48a3b74sm16965190b3a.45.2026.03.10.02.20.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 02:20:04 -0700 (PDT)
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
Subject: [PATCH v4 3/7] PCI: mediatek-gen3: Move controller setup steps before PERST# control
Date: Tue, 10 Mar 2026 17:19:42 +0800
Message-ID: <20260310091947.2742004-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260310091947.2742004-1-wenst@chromium.org>
References: <20260310091947.2742004-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_022006_085822_059A37B8 
X-CRM114-Status: GOOD (  15.24  )
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
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v3:
- New patch
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
2.53.0.473.g4a7958ca14-goog


