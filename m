Return-Path: <SRS0=tl/R=DB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4C6EC4727D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 15:28:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 651D32311A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 15:28:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mT1V/5uu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BS9G2Z10"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 651D32311A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KU1FJaBZs2NeQ0d1WoLy2yl52/dJCDYicK/bGdk1V1E=; b=mT1V/5uuM1WO6SgvHVsr+262E
	uzZrDma6hCrsAxsQz+jp9Ln0pZpVukYW2tx925lufJcha3o+6f6vtyarabmIxqIHUtwlZtQ/udeq6
	5vkpkw4TQ7S838bt6GBwcxiFBynRNmszvZttBnPs8GLccwmizdHLe9/2hSSj/uyQAehJHG/jHDrXL
	UC1YzFJ2idkV/i/xL6C4kvKv2bZ/fSzuzsNRzuNP30vM1RKPzOFQRIYbBVYlvUpbdPvbm0Zg1hQr5
	T8WsZQNClAXFM9kWUjoTcJwd1oSTDG46BHBhSZNHcRaMbCtnBkWAcKyzIs90lkxBv3kRVGUNUiSP0
	hR+V7R3Gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLTAn-0003JT-Rp; Thu, 24 Sep 2020 15:28:41 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLTAZ-00039i-Rd; Thu, 24 Sep 2020 15:28:28 +0000
Received: by mail-pf1-x442.google.com with SMTP id x22so2092410pfo.12;
 Thu, 24 Sep 2020 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6HbdXWHUUwENmYPOkj3k/38B+LwukcgShCpL4ORLWz0=;
 b=BS9G2Z10aTHODKi9DPOqtRH1BDkXHi4BDW2MIXTXfcSvRcecmRWkw+uvS+ippogC5D
 lKAPVzmuNIXIw6t4Od6roKdghQUQkPpQKVIuXGnieXc4QEhSms2UVCbN4YLHwaAGihsR
 MD6srxVduIAJIDD2GsibdS10OiSOuV1Zsndkt41hmwVqFXYyGwLpgDzna+K7anx5M/T7
 KjGyiQylxE7U56YZt+iU0W/TICckQsoPkNkiz0LSaAAwgwjdyBc1WvRAM2FXmDbX2dBx
 UaYx2IsHwnPqjkG1qWKq4FVGhyZDZC3OGHisP0d4B7mtyrjUGpkjq8VZ2/fyNv+eLtfG
 mQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6HbdXWHUUwENmYPOkj3k/38B+LwukcgShCpL4ORLWz0=;
 b=gbjUuEEYn+7B7iVxJUscP6G1sWpdYkuy5kqQ+zLH0hQFL5tfNL8XhT5ga1gwc4jXUy
 tuTvNYlAZ4Voq6EIVhKcCoDY4mFd7LfW6W3UbnTEi/8GX0xzTjqNUmRD26rNh7B14ys9
 oTl/vMfw7n2Ni9wpdDjbYKmPLfJaHlt/LUhfRiYG/lwlX97iv6D4P6fBuCVC5k7Y2eHu
 KNRtOvPObm9AkmHLHj6bR6bRHw9TY74uxg12lJTisWYttRNQv6p9Qpg7+W4lbI5WAcEN
 Fgu1SVFKdD1DM02HAiCtxwSt4nPu1daEyujLi+bv3WixH1EpzpGpnBim2VVWwHjBHoRE
 Zr7w==
X-Gm-Message-State: AOAM532+BFJqb8PlNo6d8vpvm8WQHH1R8rISfF4MjPtwC4qp6XBUIeV0
 caP6V8pRcm4B7NB7n4yLCiE=
X-Google-Smtp-Source: ABdhPJwmevCejQOrLAOkrF2jd1QUYjk5raPouovzRqWETtYfP2zCKdaTqfzhPGY4cIWcuxFEPQ0GFQ==
X-Received: by 2002:a63:ea4f:: with SMTP id l15mr148553pgk.434.1600961305967; 
 Thu, 24 Sep 2020 08:28:25 -0700 (PDT)
Received: from guoguo-omen.lan ([156.96.148.94])
 by smtp.gmail.com with ESMTPSA id e62sm3233212pfh.76.2020.09.24.08.28.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 08:28:25 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@vger.kernel.org
Subject: [PATCH 2/3] spi: spi-mtk-nor: add helper for checking prg mode ops
Date: Thu, 24 Sep 2020 23:27:29 +0800
Message-Id: <20200924152730.733243-3-gch981213@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924152730.733243-1-gch981213@gmail.com>
References: <20200924152730.733243-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_112827_920244_1A2491FC 
X-CRM114-Status: GOOD (  18.12  )
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
Cc: linux-kernel@vger.kernel.org, bayi.cheng@mediatek.com,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Chuanhong Guo <gch981213@gmail.com>,
 Ikjoon Jang <ikjn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

op checking/resizing logic for the newly added mtk_nor_spi_mem_prg is
more complicated. Add two helper functions for them:
mtk_nor_match_prg: check whether an op is supported by prg mode.
mtk_nor_adj_prg_size: adjust data size for mtk_nor_spi_mem_prg.

mtk_nor_match_prg isn't called yet because supports_op is currently
broken. It'll be used in the next fix commit.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/spi/spi-mtk-nor.c | 76 +++++++++++++++++++++++++++++++++++----
 1 file changed, 69 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index a0087a5e869b9..4bbf38ef5b4b1 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -168,10 +168,76 @@ static bool mtk_nor_match_read(const struct spi_mem_op *op)
 	return false;
 }
 
-static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
+static bool mtk_nor_match_prg(const struct spi_mem_op *op)
 {
-	size_t len;
+	int tx_len, rx_len, prg_len, prg_left;
+
+	// prg mode is spi-only.
+	if ((op->cmd.buswidth > 1) || (op->addr.buswidth > 1) ||
+	    (op->dummy.buswidth > 1) || (op->data.buswidth > 1))
+		return false;
+
+	tx_len = op->cmd.nbytes + op->addr.nbytes;
+
+	if (op->data.dir == SPI_MEM_DATA_OUT) {
+		// count dummy bytes only if we need to write data after it
+		tx_len += op->dummy.nbytes;
+
+		// leave at least one byte for data
+		if (tx_len > MTK_NOR_REG_PRGDATA_MAX)
+			return false;
+
+		// if there's no addr, meaning adjust_op_size is impossible,
+		// check data length as well.
+		if ((!op->addr.nbytes) &&
+		    (tx_len + op->data.nbytes > MTK_NOR_REG_PRGDATA_MAX + 1))
+			return false;
+	} else if (op->data.dir == SPI_MEM_DATA_IN) {
+		if (tx_len > MTK_NOR_REG_PRGDATA_MAX + 1)
+			return false;
+
+		rx_len = op->data.nbytes;
+		prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op->dummy.nbytes;
+		if (prg_left > MTK_NOR_REG_SHIFT_MAX + 1)
+			prg_left = MTK_NOR_REG_SHIFT_MAX + 1;
+		if (rx_len > prg_left) {
+			if (!op->addr.nbytes)
+				return false;
+			rx_len = prg_left;
+		}
+
+		prg_len = tx_len + op->dummy.nbytes + rx_len;
+		if (prg_len > MTK_NOR_PRG_CNT_MAX / 8)
+			return false;
+	} else {
+		prg_len = tx_len + op->dummy.nbytes;
+		if (prg_len > MTK_NOR_PRG_CNT_MAX / 8)
+			return false;
+	}
+	return true;
+}
 
+static void mtk_nor_adj_prg_size(struct spi_mem_op *op)
+{
+	int tx_len, tx_left, prg_left;
+
+	tx_len = op->cmd.nbytes + op->addr.nbytes;
+	if (op->data.dir == SPI_MEM_DATA_OUT) {
+		tx_len += op->dummy.nbytes;
+		tx_left = MTK_NOR_REG_PRGDATA_MAX + 1 - tx_len;
+		if (op->data.nbytes > tx_left)
+			op->data.nbytes = tx_left;
+	} else if (op->data.dir == SPI_MEM_DATA_IN) {
+		prg_left = MTK_NOR_PRG_CNT_MAX / 8 - tx_len - op->dummy.nbytes;
+		if (prg_left > MTK_NOR_REG_SHIFT_MAX + 1)
+			prg_left = MTK_NOR_REG_SHIFT_MAX + 1;
+		if (op->data.nbytes > prg_left)
+			op->data.nbytes = prg_left;
+	}
+}
+
+static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
+{
 	if (!op->data.nbytes)
 		return 0;
 
@@ -200,11 +266,7 @@ static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
 		}
 	}
 
-	len = MTK_NOR_PRG_MAX_SIZE - op->cmd.nbytes - op->addr.nbytes -
-	      op->dummy.nbytes;
-	if (op->data.nbytes > len)
-		op->data.nbytes = len;
-
+	mtk_nor_adj_prg_size(op);
 	return 0;
 }
 
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
