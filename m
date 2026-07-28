Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC0BFC531F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 10:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1Pnt0soTO1gFV2PGWJ/CfWR6YVxz0SNsCn9Ue8Tlcz8=; b=V+3eGqT1q963+5v7iMXcPsNV3I
	M/ncPVQMCNyASqY4f/tBF8N8eNxp0AumMdVHYivdT/MpD0WB1bPZT8QVTNaB1l2wYwzJG1/vw9hmy
	2gZyusQlXJb9hwpEook9z5jL0MpnD/4Dw+cS93Zs7lvLPK3A1KViOeYLZDBjIpmtbz6IKzKFFOVAb
	nBJjEUsXrIKRvXxx1mxgrvBeuFbOPjsbtCJUVwZLS90bA6GbcQnT0KR79gSrX4enkgLaSVGhTj9Hw
	Gv58jnqT92za12bGW+2jOdD0jKBHF4+FoRPCKiq1ucXaUk4txsv9vEo9mBrrP4kOYVTfMJkSmasZr
	xhSJztKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeq2-00000004w9e-2Wyl;
	Tue, 28 Jul 2026 10:15:06 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woeq0-00000004w8q-3Y1H
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jul 2026 10:15:05 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-ca97d139d5fso2168501a12.0
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 03:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785233703; x=1785838503; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1Pnt0soTO1gFV2PGWJ/CfWR6YVxz0SNsCn9Ue8Tlcz8=;
        b=by7ybpKr3yr/8yS+CAqpHAY687uHr4BJDvm3dr830tu/ZNcsVfkWphY7huqZwxH6f1
         J2bm+6BZkmCcrLKVf0w67AR3GH3E1x9juu8RhJpFqyBqfy+LzSXHJJXlk7Oz0nkHph7v
         +qsNHDXiRdtwH4rjlGbGpBvQAqHaQ88cKtr4pUs9qOX67uTEqLcYeyLEGjwtRMtlP8U4
         r0MWrm8OQR+34KYCFHmodx744IuisAvXsQz4aYIYfSIim93sS+4P5FYUtcJylk3tNPFj
         oEWumKON2Q0Dt9DnTLcZw2GlRAt2ZcE7siR3HEot68DbluwTyb9ghaoy7sA/3GpYHkj9
         xDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785233703; x=1785838503;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1Pnt0soTO1gFV2PGWJ/CfWR6YVxz0SNsCn9Ue8Tlcz8=;
        b=DZMMnQb7HT1ID6AICkmHixJapHY9bjP7yFHGBd+sr0X4BwWFxGZv0GeF6dQtyREowU
         aqaMVuerv4/Gwhar2pXqs7R9RFvetvCYH7WEpMc9xNTWGtRJzGf1CKLk+UwJT/niuTJm
         x2MItfz2CiH283sPyf0x5vJ276fnA4KYL1sTifxqVHaTW5MtBV727AiHcTrr9cEpVHpk
         6iiwEAFEwf9zi1JXYI5Qkv6gZX6N1jAFaoSq1xJq3c/dRG4yqimhYbQquBc6JlQRm0Jz
         miO9h0RQHvJZaAI1yshJExTaKHdbrKvP0VNV6pqgWF+1PlQCrmF0aK36+bne1xj6Y1uV
         e+bQ==
X-Forwarded-Encrypted: i=1; AHgh+RpcEUCCMzom5Ow2o7jXOiw1CY6H+CB70dNaUcAVFAsddxrxiZS9ELk8jjijP3BbYR8P1aVdkN/4YGHO7sIxEA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfCVO2xt7YrLV1V2U2vpRA7mKYtJEb0ixEmXo7BmbqVZuVeNRh
	tDIULpbePwQayh4HMq3H+/zEnXq1drNDN68VytX4WtardD41PNN/8fhD
X-Gm-Gg: AR+sD11ZEq2BpazG8oIRKC85QYbVkN9SW7W4u86q9Zb/mNwmJyrrk4r2LK44tKNIyhj
	kxQbg9s/v36E4dh3EmC4WcoyvvUxpyC11TI5Mnym9hyi+nJEX81PnyIrkzJi8i5eWX1onHANN43
	eSfhqArQuaqugnE7JO/4wtwsHFvbdmK0TjWIsGaiDVb+LeSGALoUAfPWQncez5W4BTwiAC4lnuv
	qPM0X7YZAqYYG5BV25ZPCfyNGbBmU8jb7jIMbc3bZ4XfZWx5CILFN/2Z4aQ5d35ZyuJW87KPTCJ
	DuGZd0pX5vAj0dVjh4z/pzHremwzKqhaGfx3uh2GJXmu51oZoLnPNSmRj1hzk8Dw8XVF31P7yL5
	6WfPE+nHQRwGJ0bKD78gW7Iljag5xBFVZ4RJQ7In7ZbP+r+UkHkVwOeAUGgMp/QOx2Z8I5H5tw4
	sdHbAQ+cEfwEC9DswVVSXnlmN+vHq+WYEuAs53
X-Received: by 2002:a05:6a21:6b17:b0:3b4:61f:1fec with SMTP id adf61e73a8af0-3c8aaf293b7mr2497871637.2.1785233703464;
        Tue, 28 Jul 2026 03:15:03 -0700 (PDT)
Received: from localhost.localdomain ([103.149.158.161])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc5c53f3sm38682831eec.30.2026.07.28.03.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 03:15:03 -0700 (PDT)
From: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
To: ryder.lee@mediatek.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	bhelgaas@google.com
Cc: robh@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Sreeraj S Kurup <sreekuttan2156239@gmail.com>
Subject: [PATCH] PCI: mediatek-gen3: Fix 64-bit type truncation in mtk_pcie_set_trans_table()
Date: Tue, 28 Jul 2026 10:14:13 +0000
Message-ID: <20260728101413.4575-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_031504_884246_7A9C1E4D 
X-CRM114-Status: GOOD (  10.86  )
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

The variables cpu_addr, pci_addr, and remaining in
mtk_pcie_set_trans_table() are of type resource_size_t, which is 64-bit
on 64-bit architectures.

Using 32-bit helpers fls(), ffs(), and BIT() causes 64-bit integer
truncation when computing window sizes and address alignments above
4GB.

Replace them with fls64(), ffs64(), and BIT_ULL() to ensure correct
64-bit types are used across the address space.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index bcbd08c82a5c..b1dc18f851d2 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -334,10 +334,10 @@ static int mtk_pcie_set_trans_table(struct mtk_gen3_pcie *pcie,
 
 	while (remaining && (*num < PCIE_MAX_TRANS_TABLES)) {
 		/* Table size needs to be a power of 2 */
-		table_size = BIT(fls(remaining) - 1);
+		table_size = BIT_ULL(fls64(remaining) - 1);
 
 		if (cpu_addr > 0) {
-			addr_align = BIT(ffs(cpu_addr) - 1);
+			addr_align = BIT_ULL(ffs64(cpu_addr) - 1);
 			table_size = min(table_size, addr_align);
 		}
 
@@ -349,7 +349,8 @@ static int mtk_pcie_set_trans_table(struct mtk_gen3_pcie *pcie,
 		}
 
 		table = pcie->base + PCIE_TRANS_TABLE_BASE_REG + *num * PCIE_ATR_TLB_SET_OFFSET;
-		writel_relaxed(lower_32_bits(cpu_addr) | PCIE_ATR_SIZE(fls(table_size) - 1), table);
+		writel_relaxed(lower_32_bits(cpu_addr) |
+				PCIE_ATR_SIZE(fls64(table_size) - 1), table);
 		writel_relaxed(upper_32_bits(cpu_addr), table + PCIE_ATR_SRC_ADDR_MSB_OFFSET);
 		writel_relaxed(lower_32_bits(pci_addr), table + PCIE_ATR_TRSL_ADDR_LSB_OFFSET);
 		writel_relaxed(upper_32_bits(pci_addr), table + PCIE_ATR_TRSL_ADDR_MSB_OFFSET);
-- 
2.54.0


