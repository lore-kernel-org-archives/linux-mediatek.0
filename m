Return-Path: <SRS0=NSCp=EM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9A5C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 08:22:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 91F7320A8B
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Nov 2020 08:22:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="103aCv6+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OPL+0Szk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 91F7320A8B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Content-Description:MIME-Version:Message-ID:Subject:
	To:From:Date:Reply-To:Content-ID:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tUCbI0Npc7WLbvT4kx38v/pPqKgCJIPkrmzf8JU+yYc=; b=103aCv6+u6Z95DHw/1QuzlrPgA
	b4AZMjoTCEzejzFB5UZNUXd+ML/CWjoRGcGu0lhbvEiO8H50nI2NfVtvYZPkp4NyQ8XM0nizTrzT1
	xITfMJSTOG/lAP3wIlb82+bUacMcQCCxHebrocJTaiBSQHBrsGanO5lqW58wLFwvOwestb343vzRb
	AmHmNlvHXDvXhjHBkA1f7S3Rj3HEc06udRqSRZgNLUt+kO2RO4M7xgw7SpKiOe6Yd+oQ94oTOK/+C
	+ao/ETSGOjCnL3sVYkGT846BNmMjzDP9iaQzHiANkl/f0KeTG3JFcgHQBoBjGuDOofQwjpl6Rwhh6
	JxSeDtIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kax17-0000dn-Ai; Fri, 06 Nov 2020 08:22:41 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kax13-0000cW-Oq; Fri, 06 Nov 2020 08:22:38 +0000
Received: by mail-pl1-x643.google.com with SMTP id b12so328607plr.4;
 Fri, 06 Nov 2020 00:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-description
 :content-disposition;
 bh=lEww5yAkFWrfhIg3JvC4XEkVJHdH/gtbEeQQICiYVw8=;
 b=OPL+0SzkpAeEampvzqnF3PNMQJC7r7rs9LfURTmHmuV4tiXFMt9cIPWweCsB66TOOg
 S+xt4z5F85XSS5R8gg3sVFql/nXzTDMturdzfU+Aj8eN4IEiXipDXLvoSBjsUYJLlcs8
 VtW8a5leVTEm1iTf/zc7pE7XzEQlsLWGyp+jYggaOqHp3RV/+rhm1mA/PdgXMfvd+YDT
 GBYcCH469RgA3FzezODAWQk91sz/02ba1OHJWZiTcJpIDX3j/EFjeZg7dsOXCFmU+u08
 6hdEP/loQ4uAvBuXz3qIQ+ZLm1riK305MXUvdccDhojpn+M4jXFljs/YZ8sBKbH83jMw
 sQaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-description:content-disposition;
 bh=lEww5yAkFWrfhIg3JvC4XEkVJHdH/gtbEeQQICiYVw8=;
 b=pH+quzufAhvRplAdYcw87tKdcYfP9r+W+DXXfaLrvvQuKZnKqg9e7jrC+b2xKP87Sy
 yQHjGXzi1IyK9z6GKj/dXLqCh6v2ocIFCyA9B+ncsvT6sVK7UnPQtQco4FMnv0UQnh1l
 PH5g9ZSvranADIeo1KH3zk9htmF7NEkTdKAVgLpG7O2ocwJtKMfO7/GgYrMjz1p4H2G+
 PmLWNoTmauefPO0hl/lLMb/8JpmSFQQSV1TjrJ6nqakiwyPNucqv/L2l1XAWSQ7ULyhB
 Q0p0ip8u6p0FBLQ7u+jnvd0xxbM6oaxqYbY0z2zSAo3g6z3Or3gHHs6aNmTC9tG5XJdZ
 0fDQ==
X-Gm-Message-State: AOAM532g0vbtSsm5X3SdstGIBaRdaULMte2IRI5jsOXIS9qYAwpzBGlH
 5b5JSH0PKOVGtT1G1fVWHh/aPsH/VA==
X-Google-Smtp-Source: ABdhPJwq+FtO2oHP5rTQ7rqeqmlSy3rIyrQhkXbZBVqUe3WbhYREA/E/s4IsPy1GACee46AHV2kRmw==
X-Received: by 2002:a17:902:8502:b029:d5:b4f4:8555 with SMTP id
 bj2-20020a1709028502b02900d5b4f48555mr982843plb.76.1604650954870; 
 Fri, 06 Nov 2020 00:22:34 -0800 (PST)
Received: from Sleakybeast ([2405:204:8304:6bd6:e537:e8f9:e101:bb78])
 by smtp.gmail.com with ESMTPSA id h11sm1078196pfo.69.2020.11.06.00.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 00:22:34 -0800 (PST)
Date: Fri, 6 Nov 2020 13:52:26 +0530
From: Siddhant Gupta <siddhantgupta416@gmail.com>
To: matthias.bgg@gmail.com
Subject: [PATCH] staging: mt7621-dma: fix alignment warnings
Message-ID: <20201106082226.GA22990@Sleakybeast>
MIME-Version: 1.0
Content-Description: evel@driverdev.osuosl.org,
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201106_032237_819577_4343C97B 
X-CRM114-Status: UNSURE (   9.96  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devel@driverdev.osuosl.org, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, mamtashukla555@gmail.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 himadrispandya@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix the checkpatch warning of alignment should match open parenthesis
for some dev_dbg() calls

Signed-off-by: Siddhant Gupta <siddhantgupta416@gmail.com>
---
 drivers/staging/mt7621-dma/mtk-hsdma.c | 44 +++++++++++++-------------
 1 file changed, 22 insertions(+), 22 deletions(-)

diff --git a/drivers/staging/mt7621-dma/mtk-hsdma.c b/drivers/staging/mt7621-dma/mtk-hsdma.c
index a9e1a1b14035..838fd05d33ee 100644
--- a/drivers/staging/mt7621-dma/mtk-hsdma.c
+++ b/drivers/staging/mt7621-dma/mtk-hsdma.c
@@ -208,24 +208,24 @@ static void mtk_hsdma_reset_chan(struct mtk_hsdam_engine *hsdma,
 
 static void hsdma_dump_reg(struct mtk_hsdam_engine *hsdma)
 {
-	dev_dbg(hsdma->ddev.dev, "tbase %08x, tcnt %08x, "
-			"tctx %08x, tdtx: %08x, rbase %08x, "
-			"rcnt %08x, rctx %08x, rdtx %08x\n",
-			mtk_hsdma_read(hsdma, HSDMA_REG_TX_BASE),
-			mtk_hsdma_read(hsdma, HSDMA_REG_TX_CNT),
-			mtk_hsdma_read(hsdma, HSDMA_REG_TX_CTX),
-			mtk_hsdma_read(hsdma, HSDMA_REG_TX_DTX),
-			mtk_hsdma_read(hsdma, HSDMA_REG_RX_BASE),
-			mtk_hsdma_read(hsdma, HSDMA_REG_RX_CNT),
-			mtk_hsdma_read(hsdma, HSDMA_REG_RX_CRX),
-			mtk_hsdma_read(hsdma, HSDMA_REG_RX_DRX));
-
-	dev_dbg(hsdma->ddev.dev, "info %08x, glo %08x, delay %08x, intr_stat %08x, intr_mask %08x\n",
-			mtk_hsdma_read(hsdma, HSDMA_REG_INFO),
-			mtk_hsdma_read(hsdma, HSDMA_REG_GLO_CFG),
-			mtk_hsdma_read(hsdma, HSDMA_REG_DELAY_INT),
-			mtk_hsdma_read(hsdma, HSDMA_REG_INT_STATUS),
-			mtk_hsdma_read(hsdma, HSDMA_REG_INT_MASK));
+	dev_dbg(hsdma->ddev.dev,
+		"tbase %08x, tcnt %08x, tctx %08x, tdtx: %08x, rbase %08x, rcnt %08x, rctx %08x, rdtx %08x\n",
+		mtk_hsdma_read(hsdma, HSDMA_REG_TX_BASE),
+		mtk_hsdma_read(hsdma, HSDMA_REG_TX_CNT),
+		mtk_hsdma_read(hsdma, HSDMA_REG_TX_CTX),
+		mtk_hsdma_read(hsdma, HSDMA_REG_TX_DTX),
+		mtk_hsdma_read(hsdma, HSDMA_REG_RX_BASE),
+		mtk_hsdma_read(hsdma, HSDMA_REG_RX_CNT),
+		mtk_hsdma_read(hsdma, HSDMA_REG_RX_CRX),
+		mtk_hsdma_read(hsdma, HSDMA_REG_RX_DRX));
+
+	dev_dbg(hsdma->ddev.dev,
+		"info %08x, glo %08x, delay %08x, intr_stat %08x, intr_mask %08x\n",
+		mtk_hsdma_read(hsdma, HSDMA_REG_INFO),
+		mtk_hsdma_read(hsdma, HSDMA_REG_GLO_CFG),
+		mtk_hsdma_read(hsdma, HSDMA_REG_DELAY_INT),
+		mtk_hsdma_read(hsdma, HSDMA_REG_INT_STATUS),
+		mtk_hsdma_read(hsdma, HSDMA_REG_INT_MASK));
 }
 
 static void hsdma_dump_desc(struct mtk_hsdam_engine *hsdma,
@@ -242,10 +242,10 @@ static void hsdma_dump_desc(struct mtk_hsdam_engine *hsdma,
 		tx_desc = &chan->tx_ring[i];
 		rx_desc = &chan->rx_ring[i];
 
-		dev_dbg(hsdma->ddev.dev, "%d tx addr0: %08x, flags %08x, "
-				"tx addr1: %08x, rx addr0 %08x, flags %08x\n",
-				i, tx_desc->addr0, tx_desc->flags,
-				tx_desc->addr1, rx_desc->addr0, rx_desc->flags);
+		dev_dbg(hsdma->ddev.dev,
+			"%d tx addr0: %08x, flags %08x, tx addr1: %08x, rx addr0 %08x, flags %08x\n",
+			i, tx_desc->addr0, tx_desc->flags,
+			tx_desc->addr1, rx_desc->addr0, rx_desc->flags);
 	}
 }
 
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
