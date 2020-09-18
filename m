Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A47F6C43464
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 08:32:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3D91720789
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 08:32:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="J8g9es+R";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gIWNzXXI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3D91720789
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F0k9w7OmgXb5RDlkJrt2JfCCsIl7+AIi+X8RTV5s+us=; b=J8g9es+RrWB5UbbRroilFg6YE
	kCLgXEJ4GhTuTlTAkelAkTN+IgDpA9lP9phfRqgXr3/UF80BR8Sb8uIwkGrBo61Ljrbu0haUG8evW
	KOvfGvr4ar4BeWspwV35oVOHw5QMab75aG8YSi2Y9jsckP0MA9TYvAkKmlAIAwRvU7jBd71NPuW9I
	jI4rasNE5K9ah3nEinFj+Nd+MLSyjfPszhXRbSCSZviIF7+GKRqPL2X/Hcux5k9feC3XU8SdzGSRF
	HwnnWS4iboceFwXBxKb+twM3vSsHGGBIE2Hacn+RcLHQL+HDY5Mcg3ENBnBEqlbd9UFg70vyOhoZf
	gv0n2TUgw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJBou-00008t-5E; Fri, 18 Sep 2020 08:32:40 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJBnu-0008DK-Fh
 for linux-mediatek@lists.infradead.org; Fri, 18 Sep 2020 08:31:41 +0000
Received: by mail-pg1-x542.google.com with SMTP id l191so3052385pgd.5
 for <linux-mediatek@lists.infradead.org>; Fri, 18 Sep 2020 01:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PtgT8oGdi7tJWYrZylWP5X+Qu5mtWrTjssOMjWBLBio=;
 b=gIWNzXXI/65W9lRuW4rM4ZuoKImgBcadG9k1ZTZdlozcVR0w6y7VHSw5ovnfxV+y4s
 me4YUC5KA0N/CovI2zxVtNEXpQ8aXA1C+c8tsuTUo/mPKvhbcVunwTsO8sq35KVqV2wP
 tRlaD2cHR/DshX6cxwuMkOhzPkx4cdjcbJxpY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PtgT8oGdi7tJWYrZylWP5X+Qu5mtWrTjssOMjWBLBio=;
 b=phqJqslAwa22HQZhZF6+pWlyvJffiTshDoWWP2LRM8BVt0dOx0uwePs/A2DxMmzg7k
 UzbT3evjCaDKjB230vStmJsQOTZ7j4+wzcajCafuTA0kSkA8Q2Qv2RuokXA7bxz6uHU1
 8dU85F5U0TK//tRAEGvozNUCcc7NAOThzfQP53LV285D2B3YbpF6y/3Oe0OEm+NOkrCD
 toq77izyf/Cjv8u5hmq8B2i6yaiPkKrGR4h6wz/tBqbEYr/Xl9lqHAC9a+Ko+42pHD+d
 bJIxOdYOb11oSbQ/8tFy8LJsZZUPrCaIUVrO2v8npo408VZwGy++rDPtUATGkO2iOJ0R
 1dYA==
X-Gm-Message-State: AOAM531euzpDZnk1gl52wR6qOz+sAE1bmcJfbKHjfFFu65moFAjixLX4
 ERnWQRfbvGtGs21irAArK8Xrng==
X-Google-Smtp-Source: ABdhPJylLeVr7aTAeXl/TquJqTgllezEHHoyI6zJ5/+F2fB1EMgD/15lCBC8Kt+Lo/SC0WxayecFLQ==
X-Received: by 2002:aa7:934e:0:b029:13f:d056:593 with SMTP id
 14-20020aa7934e0000b029013fd0560593mr25187131pfn.15.1600417896081; 
 Fri, 18 Sep 2020 01:31:36 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:10:f693:9fff:fef4:a8fc])
 by smtp.gmail.com with ESMTPSA id g206sm2193172pfb.178.2020.09.18.01.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Sep 2020 01:31:35 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: [PATCH v2 2/5] spi: spi-mtk-nor: fix mishandled logics in checking
 SPI memory operation
Date: Fri, 18 Sep 2020 16:31:20 +0800
Message-Id: <20200918162834.v2.2.I3de2918f09b817cc2ae6d324f1ece62779ecc7cf@changeid>
X-Mailer: git-send-email 2.28.0.681.g6f77f65b4e-goog
In-Reply-To: <20200918083124.3921207-1-ikjn@chromium.org>
References: <20200918083124.3921207-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_043138_723537_0677BEB8 
X-CRM114-Status: GOOD (  16.42  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Ikjoon Jang <ikjn@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Fix a simple bug which can limits its transfer size,
and add a simple helper function for code cleanups.

Fixes: a59b2c7c56bf ("spi: spi-mtk-nor: support standard spi properties")
Signed-off-by: Ikjoon Jang <ikjn@chromium.org>

---

(no changes since v1)

 drivers/spi/spi-mtk-nor.c | 62 ++++++++++++++++++++++++---------------
 1 file changed, 38 insertions(+), 24 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 6e6ca2b8e6c8..54b2c0fde95b 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -167,52 +167,63 @@ static bool mtk_nor_match_read(const struct spi_mem_op *op)
 	return false;
 }
 
-static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
+static bool need_bounce(void *cpu_addr, unsigned long len)
 {
-	size_t len;
+	return !!(((uintptr_t)cpu_addr) & MTK_NOR_DMA_ALIGN_MASK);
+}
 
+static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
+{
 	if (!op->data.nbytes)
 		return 0;
 
 	if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
-		if ((op->data.dir == SPI_MEM_DATA_IN) &&
-		    mtk_nor_match_read(op)) {
+		switch (op->data.dir) {
+		case SPI_MEM_DATA_IN:
+			if (!mtk_nor_match_read(op))
+				return -EINVAL;
+			/* check if it's DMAable */
 			if ((op->addr.val & MTK_NOR_DMA_ALIGN_MASK) ||
-			    (op->data.nbytes < MTK_NOR_DMA_ALIGN))
+			    (op->data.nbytes < MTK_NOR_DMA_ALIGN)) {
 				op->data.nbytes = 1;
-			else if (!((ulong)(op->data.buf.in) &
-				   MTK_NOR_DMA_ALIGN_MASK))
+			} else {
+				if (need_bounce(op->data.buf.in, op->data.nbytes) &&
+				    (op->data.nbytes > MTK_NOR_BOUNCE_BUF_SIZE))
+					op->data.nbytes = MTK_NOR_BOUNCE_BUF_SIZE;
 				op->data.nbytes &= ~MTK_NOR_DMA_ALIGN_MASK;
-			else if (op->data.nbytes > MTK_NOR_BOUNCE_BUF_SIZE)
-				op->data.nbytes = MTK_NOR_BOUNCE_BUF_SIZE;
-			return 0;
-		} else if (op->data.dir == SPI_MEM_DATA_OUT) {
+			}
+			break;
+		case SPI_MEM_DATA_OUT:
 			if (op->data.nbytes >= MTK_NOR_PP_SIZE)
 				op->data.nbytes = MTK_NOR_PP_SIZE;
 			else
 				op->data.nbytes = 1;
-			return 0;
+			break;
+		default:
+			break;
 		}
+	} else {
+		u8 len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
+
+		if (len > MTK_NOR_PRG_MAX_SIZE)
+			return -EINVAL;
+		if (op->data.nbytes && !(MTK_NOR_PRG_MAX_SIZE - len))
+			return -EINVAL;
+		if (op->data.nbytes > (MTK_NOR_PRG_MAX_SIZE - len))
+			op->data.nbytes = MTK_NOR_PRG_MAX_SIZE - len;
 	}
 
-	len = MTK_NOR_PRG_MAX_SIZE - op->cmd.nbytes - op->addr.nbytes -
-	      op->dummy.nbytes;
-	if (op->data.nbytes > len)
-		op->data.nbytes = len;
-
 	return 0;
 }
 
 static bool mtk_nor_supports_op(struct spi_mem *mem,
 				const struct spi_mem_op *op)
 {
-	size_t len;
-
 	if (op->cmd.buswidth != 1)
 		return false;
 
 	if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
-		switch(op->data.dir) {
+		switch (op->data.dir) {
 		case SPI_MEM_DATA_IN:
 			if (!mtk_nor_match_read(op))
 				return false;
@@ -226,11 +237,14 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
 		default:
 			break;
 		}
+	} else {
+		u8 len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
+
+		if (len > MTK_NOR_PRG_MAX_SIZE)
+			return false;
+		if (op->data.nbytes && !(MTK_NOR_PRG_MAX_SIZE - len))
+			return false;
 	}
-	len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
-	if ((len > MTK_NOR_PRG_MAX_SIZE) ||
-	    ((op->data.nbytes) && (len == MTK_NOR_PRG_MAX_SIZE)))
-		return false;
 
 	return spi_mem_default_supports_op(mem, op);
 }
-- 
2.28.0.681.g6f77f65b4e-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
