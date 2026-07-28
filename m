Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A11BBC53219
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2026 12:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BXD9NT1yZlFkaXVxjdMwL7vBIK75Ivf+FWUGyrR0g4o=; b=pZUU9b5LkBuRHni17GuFgrCB5p
	qQ/faP1FYms5sCmsl29YKrmLiS6p92x8IHA9+Mqipz/n+HNnHWbDsDqNhhya8AtmKq5RhoIqeZPoh
	Cpj40bBQ+1FYbKegdYqrJ0TzzPeGXloSLl9daNCCb9ax5NDjHuuVfVT1Y7cOMtd9whGIyjIg6zVWp
	NZbUjqDU6+3MAvEGEe5CtZFPFJZNWmsJJqhZjh1zRlmbMt3g5lPNF42yc2zUyoqwPCRW2UN9r48w3
	aGEMgq8/PAxhnuKknyMsXJXyIM4GIkuWU99sjjAaKzV9BBloywouCv648Oo5Pmx5TJIpt9RQllAHe
	CUB+101Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogvL-00000005FB5-2YX1;
	Tue, 28 Jul 2026 12:28:43 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wogvJ-00000005F9I-1Iq6
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Jul 2026 12:28:42 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so2979585a91.2
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Jul 2026 05:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785241720; x=1785846520; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=BXD9NT1yZlFkaXVxjdMwL7vBIK75Ivf+FWUGyrR0g4o=;
        b=mLlMt9GB6gYb7YzT7IZiwGTCUlETKWGLerUW4+XWTmnRbWEBLUL6JqBM8r7QUZdBhZ
         EGUVA30t/FJ/7lTFjuk2oHvhPaK/ZPn5/plQMtrCsPwCxNfaJGbzrBSIzHZDrd6qG3sI
         wV3THMf4zEzEjRASuzHe42xFh7m2RZ73/+r7Tn8PJBwswjG/nhhGh9asoEGM0FbBWEYQ
         YutvPgYdd6RjAqNychmfy8yqps9pDKUv3ZX5usvDETuJaIaxb1olfK5SKsmTCuwK0en1
         qsS3gBsYqyFC2Dr8MEnfy8IVEPky7Cokdojznrb8y/3cIWNy/hq2lvQdQHjzo8kymR61
         rnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785241720; x=1785846520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BXD9NT1yZlFkaXVxjdMwL7vBIK75Ivf+FWUGyrR0g4o=;
        b=HAU4p/bphax7FbFvehDSipPIF016lJqK76SMdcq6Uq7BgzUKR3+6Z+Wbl9w2Mb6Hm3
         QWIYDujb9nbiEldowNON/yE2huOZGmEYUKdYy1wJuf/7tRjCEmOwVdsy6U2BRI73ozR7
         avBBn34SLCz0bPcbaAYC7dY39aOSMZ4ycZT3uUU+FvrxL0AShcpDnjCG7wvDuJFwQRn7
         XZyyLwWfIekIjqgk+ksjAoV8BCeFHCrToBEOQUFYdQVQzulNAnDQGc0ioF0GYbKNUZJd
         xz7FbQD3wnjLPHuRiYCwERZ7HxYip81NV95sIhXOgjwBqeK4LDMYfPAxHdIsJ/PqVUlv
         bQmg==
X-Forwarded-Encrypted: i=1; AHgh+Rp5Dg4bHcoVoanjgmfhsMuGuYGpF4eKasYF+0M/F29TRU0vPAl0ja8g4py7E8T507htRZ1DmQb8Znb/94uWAA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzKoMfcsNWETDcAbutewIfS5K3FnKAZOT8WTcXGYQtm2ct+1Dec
	R0Ad4u7PeOTM5E+yzMemNjg5r0vsl79MfpVDXtrZDMDfa6JMlrAUhahp
X-Gm-Gg: AR+sD12i+DmLulu/ChpIyz2WnhEp55LO+hxCefS/oG5Bv3DACPA1gb6BLjhxvIyTsMb
	CLDnXdL71ZTGsJn5TZb4osaSjXAaR+k/WLaxjrVA4MLSIA4xAwdvaHRd0t8Jwq4bVo/4hHND76w
	f13n3NfRItZR+H7IIfzbnd1mnYGoUWCuYJ+qHaqxGGGvCtmMi8Sd5jIOWkmERhGStHlDPm4tLnZ
	FoiMdKQhOSUAMnXeNhaufuEQ2Afu7v1FrrANrJ+Gfb5B73R/5aKHnZs7Oqz7HOT3FDUZFvhioyA
	6sbu+9xPLdqKjGT/eev7u7Nz9S9e8JDDIAHNx8/GgedZ/pyfPCpl21Bh3vzzbNTrBYXO/GXDfW1
	sgvxAFtHLMHK5dY1hfeqFmrEspt+EUyu5IrT6jh3cG7xkri8aXuyO3RcANC4ILxDnYXuPWWX8gz
	4IIHrB5J+KRJQnjZvSnKPf/Hud6d66RNJAR76P
X-Received: by 2002:a05:6a21:748a:b0:3c3:a41f:ce83 with SMTP id adf61e73a8af0-3c8ba62e7e4mr2893948637.61.1785241720223;
        Tue, 28 Jul 2026 05:28:40 -0700 (PDT)
Received: from localhost.localdomain ([103.179.230.124])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e1290sm43423129eec.1.2026.07.28.05.28.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:28:39 -0700 (PDT)
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
Subject: [PATCH v3] PCI: mediatek-gen3: Fix 64-bit type truncation in mtk_pcie_set_trans_table()
Date: Tue, 28 Jul 2026 12:28:10 +0000
Message-ID: <20260728122810.3475-1-sreekuttan2156239@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_052841_376219_7FC9F1E5 
X-CRM114-Status: GOOD (  12.91  )
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
__ffs64() uses 0-based indexing, so the '- 1' offset is removed.
Additionally, return -ENOMEM when translation tables are exhausted to
prevent silent failure.

Signed-off-by: Sreeraj S Kurup <sreekuttan2156239@gmail.com>
---
v3:
 - Reformatted commit message lines to under 75 charactere.
 - Aligned multi-line function call arguments according to checkpatch rules
v2:
 - Replaced non-existent ffs64() with __ffs64().
 - Corrected 0-based indexing logic for __ffs64().
 - Returned -ENOMEM on translation table resource exhaustion.
---
 drivers/pci/controller/pcie-mediatek-gen3.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/pcie-mediatek-gen3.c b/drivers/pci/controller/pcie-mediatek-gen3.c
index bcbd08c82a5c..e2fb6e372ede 100644
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
+		PCIE_ATR_SIZE(fls64(table_size) - 1), table);
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


