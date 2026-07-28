Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F4CC54F4C
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 12:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fQlE679JObsFJHTkpZQZUZIILuIjOEy10+IeTfWR3d4=; b=sdRh4Ld2G7+3lbOjwmDMd/t7Pv
	m5V8SXOQpCO+ceODylVn56Hdmb8LJmuOSu0l3GmT8TnbvAPk/iSKHYp/bCt6CKA6mvnG4VuKRxvVw
	XwmV8CUeicOtMMfHGHxtIrnDT0U4j2FRpE+J+LxveTMAGr+SrHXTWwEWnB/S4r2gRlAIvFFF4QLlI
	8YAIlmCAVoEfN30CA6kENByj7EP3WqtqGYssOqFHHNzko+w/IZ2ZGJ7+S3XlW6OZM7KEcDLp26Nl7
	EB8RzJc1h6dWOCFFYa3EsOYgD7ZMbtc4+Rcvyrc37Aj7r9tELHyK+ijHe0avqlB+VrBdfXt4yOIz6
	Y2xgX1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogXH-00000005Bqi-3rIn;
	Tue, 28 Jul 2026 12:03:51 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogXF-00000005Box-3JnF
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jul 2026 12:03:50 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2cad8076b01so46833785ad.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 05:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785240229; x=1785845029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fQlE679JObsFJHTkpZQZUZIILuIjOEy10+IeTfWR3d4=;
        b=YjClJ3OOtXwA8YD8i4KpdWXAaBjOqdltW3lRgGMW6ey6V+E3651macjlP1/jsm6pxa
         G87cqRVdQ8dMyu6x/r2v442DEgWkcsHrSIb++iC74d1/S8pElG8W5Zged0/Xr1lFlReB
         gEfZf53ZimKtqO1s2OiIifWfjgeVGHeZYqfTcmewocdx4QaClvxP+pZ38jnEm3rNAyLh
         PHfkzeEN0VWPctqFlh54dcTHrD9s0zvlQRKrfML9W3D+w+QSDjVIU5D6AcWa0vIaRuIp
         nLmGz6cNXtJyEEoT79R0fT9mDRyWrc8/mGdy9OIkbu0tq18utNohbd6o4Zyf2HjHYDx0
         iayw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785240229; x=1785845029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fQlE679JObsFJHTkpZQZUZIILuIjOEy10+IeTfWR3d4=;
        b=ExcWnlPseFIuJSg1GU4HkhYxG7nkKEzGsx139waQgV4k56WPQk5MzGj/8MUkhmth8s
         4F3mPvwT3i3lZ8fcJQvfW8pYOa6B0ir6bS//EmQU2lC3OH/xyud2J6L9vLDUV1lT/7/R
         HcFqgakKhRL5OP2rZBDukVmxGw11E+ZeDBTwpwFvBp+jkSkCPdKhUMNz76zaRdn3AN6D
         E+2A50qYfPwsn+offtvfQ6qkX3eVNKAW6ZYqq5AJQ7CXmQJUtNrnsCk/J5PrrZ8sFHuI
         KU9DabXeUVyMTw4dJxeGUlt4wQCGBoaoC4aDgvhusTRf30DTC2/0ceVrABA+jd46CzvS
         zw0A==
X-Forwarded-Encrypted: i=1; AHgh+RrB26N9duc0nNFnzLJRuGmkJ37cwCskkBH4i+xzA4NG3Y1xa/QkeUW5foGwsCQ/dJ0PTbq9kI/uWzKUhNhaCg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7LeLuSoNfsqidkvNMi8dax6tT4w4Q/WKzSA2i7A29GUMQG4U7
	8Fh14AIlejmuPR7X1icLcnGwKOfYwaoRxtWMYtr/sDZnSLpfOXyCdxMN
X-Gm-Gg: AR+sD119ZDz1gAGu+khZWjyhg7WioUeKIzkL9n1epp77lf8ztxw90ybkpOfP1QOTFhg
	kkmrcY81qFFzWzPRNHVOKtCbqhj5c6cEjo3kns0RqLxxSEN4gCQjwx/I5gJGKYgVngYLADP3sR7
	2Ve6z5x5759OmFyTbAY6KTRxCiHVtpJmmpFanQ613yWA5bSUmUmFOXrQUCwPSm4ii4vAXyRHNdt
	+y58AcCIpybuc3Ygr0Qn3323Lh9DzckLw2BHlc2y+OT73pajNzcHfPGczdxPp5QOTaqbXqXpPet
	N8RmnF0SJkBHE19IpDFSWGQ+yU814IxziQj+J3VipZWNE+VOBBShyRJWcTqZjOVhziJud64RvfS
	a0kA+M1Rn3xog62G/4ZKZIEVcN5mh6fvLkaqOnzshmFn5wv1VhSPJmW/4VrX4n7vXkRKIJDmVjM
	Yu/X+dX2EA38CTpaAe2bUZNKMEmg==
X-Received: by 2002:a17:90b:39ac:b0:38d:56aa:6f32 with SMTP id 98e67ed59e1d1-38f6a4c6bbbmr2080804a91.38.1785240224085;
        Tue, 28 Jul 2026 05:03:44 -0700 (PDT)
Received: from localhost.localdomain ([103.179.230.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc419c52sm42878472eec.10.2026.07.28.05.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:03:43 -0700 (PDT)
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
Subject: [PATCH v2] PCI: mediatek-gen3: Fix 64-bit type truncation in mtk_pcie_set_trans_table()
Date: Tue, 28 Jul 2026 12:03:01 +0000
Message-ID: <20260728120301.3188-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_050349_844103_88AB7F1E 
X-CRM114-Status: GOOD (  12.70  )
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
truncation when computing window sizes and address alignments above 4GB.

Fix this by switching to fls64(), __ffs64(), and BIT_ULL(). Note that
__ffs64() uses 0-based indexing, so the '- 1' offset is removed. Additionally,
return -ENOMEM when translation tables are exhausted to prevent silent failure.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v2:
 - Replaced non-existent ffs64() with __ffs64().
 - Corrected 0-based indexing logic for __ffs64().
 - Returned -ENOMEM on translation table resource exhaustion.
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index bcbd08c82a5c..67635af0ed2a 100644
--- a/drivers/pci/controller/pcie-mediatek-gen3.c
+++ b/drivers/pci/controller/pcie-mediatek-gen3.c
@@ -7,6 +7,8 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/bitops.h>
+#include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
@@ -334,10 +336,10 @@ static int mtk_pcie_set_trans_table(struct mtk_gen3_pcie *pcie,
 
 	while (remaining && (*num < PCIE_MAX_TRANS_TABLES)) {
 		/* Table size needs to be a power of 2 */
-		table_size = BIT(fls(remaining) - 1);
+		table_size = BIT_ULL(fls64(remaining) - 1);
 
 		if (cpu_addr > 0) {
-			addr_align = BIT(ffs(cpu_addr) - 1);
+			addr_align = BIT_ULL(__ffs64(cpu_addr));
 			table_size = min(table_size, addr_align);
 		}
 
@@ -349,7 +351,8 @@ static int mtk_pcie_set_trans_table(struct mtk_gen3_pcie *pcie,
 		}
 
 		table = pcie->base + PCIE_TRANS_TABLE_BASE_REG + *num * PCIE_ATR_TLB_SET_OFFSET;
-		writel_relaxed(lower_32_bits(cpu_addr) | PCIE_ATR_SIZE(fls(table_size) - 1), table);
+		writel_relaxed(lower_32_bits(cpu_addr) | 
+				PCIE_ATR_SIZE(fls64(table_size) - 1), table);
 		writel_relaxed(upper_32_bits(cpu_addr), table + PCIE_ATR_SRC_ADDR_MSB_OFFSET);
 		writel_relaxed(lower_32_bits(pci_addr), table + PCIE_ATR_TRSL_ADDR_LSB_OFFSET);
 		writel_relaxed(upper_32_bits(pci_addr), table + PCIE_ATR_TRSL_ADDR_MSB_OFFSET);
@@ -375,9 +378,11 @@ static int mtk_pcie_set_trans_table(struct mtk_gen3_pcie *pcie,
 		(*num)++;
 	}
 
-	if (remaining)
-		dev_warn(pcie->dev, "not enough translate table for addr: %#llx, limited to [%d]\n",
+	if (remaining) {
+		dev_err(pcie->dev, "not enough translate table for addr: %#llx, limited to [%d]\n",
 			 (unsigned long long)cpu_addr, PCIE_MAX_TRANS_TABLES);
+		return -ENOMEM;
+	}
 
 	return 0;
 }
-- 
2.54.0


