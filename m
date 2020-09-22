Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23DBDC4727D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 11:44:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A1F7E214F1
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 11:44:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="259W95zu";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TZur9F8P"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A1F7E214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cCrf0A+7V/EJ68fnGQAtdmrjURqKCeRhx9Vkj9C8ri0=; b=259W95zu/Q3WUrkFgu4vsyhaqx
	KhgjAawt47BIqooHV0KwrLCI0OO8sGeayS7kfnzJRAJCeWBFfM5l4Y8NBk1h03XX6RXJnaqXbmaPP
	J3A1OZOtyA2apLtjJBlU1qgrfd4PKVLTBsqwZsehVz6sYC1TscMhhRKzjFtbAFAXlXWsEjAjoczGq
	P6DYIriQ2aCafc4eINji+699Y8m1OS7Uforg0DLu9dxsL3c18KOGERMP/Hgo0Fe/T/IjCehHObJqf
	MlPFk0ZV1Hu7vY024/ECUEqnCIpjcDZpIONcKU2YVsR6dWf+F6+yrySwtBsBu7coAJSTtOrxc8zH5
	zMobGXsw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKgiA-0007fX-5M; Tue, 22 Sep 2020 11:43:54 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKgi6-0007ee-MQ; Tue, 22 Sep 2020 11:43:51 +0000
Received: by mail-pj1-x1042.google.com with SMTP id s14so1176521pju.1;
 Tue, 22 Sep 2020 04:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V2VjYly8YXl5EI4Tg/+laJM2UumOWuwQAVbPJYyz4D0=;
 b=TZur9F8PDyYbsDiO0VBy9PuSALAJtXA7A3MOMzpLhDzIVb4bRaNHoZ5KRp/WqZlDY/
 h3sNg9bhUDTzI5UPswWyPVcIHCXAsiGuyYgnwVoIyBBZdzaVESTe5ESdNqmwZKrAHxs2
 6VD1IESsegZQcSGLs3E0wN2nGuLVX6tnTyhtPqzNuFjznNQZyG2Yg+m0JaWoxLqW+ErI
 GA9OkKJ62D0CNxqKsr6+NYXAANEM9nkerzIrl779cGFivYG6HKhfglG9deCwxut/I1/3
 Y23S++Rz25MI8+9+nQbTEfN+W0x5ixw5lA28hE0R9TovGEuoyATkFjN83OBliSTTS4K0
 tC8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=V2VjYly8YXl5EI4Tg/+laJM2UumOWuwQAVbPJYyz4D0=;
 b=iYYQLRJWm2s7cOkKrMlSstxHKL4fA5I9sjbl5+XwLPiGfADhuMQmvIEhuQ9S/IEh7I
 HjSX9W4Q6fl1O94kdrxGKfyceq6vt4UZKW0zjk18Lhq1uzcSO2kGczGP6lJ2T0ymx7gI
 bT5tDQ9gqGB/BMPWfgCtwToeXsukYtJxpilpUm0RazyZHM8NWz0dVmUDTQolvbxY+y1y
 t/mrioKVyKJlzmv4gwP83U5KNViU8m1P1YCpLZUnucf4iYC5abRxGmtGY77ES7foVbSy
 1Lz/B3AKfZvrR2N7aHKUQqVsBH7ul+AjKqJdDqi84P/YbrKTuqiJmLQ4LkzyLYgumU7h
 88kA==
X-Gm-Message-State: AOAM533WD0YfAQG6c951ISw/vvpRyPbYETgYtPZYueTWjcegRMWSNh/1
 mXuZfZgNX+1EOK3HxczDh9g=
X-Google-Smtp-Source: ABdhPJzjspDLviipX8iGk3qMnTqf3IErP0S4c3BsVZUA3+sm4i0FljmNVmIT/3nchofuaHPwXUi95g==
X-Received: by 2002:a17:90a:6741:: with SMTP id c1mr3331202pjm.6.1600775025377; 
 Tue, 22 Sep 2020 04:43:45 -0700 (PDT)
Received: from guoguo-omen.lan ([156.96.148.94])
 by smtp.gmail.com with ESMTPSA id r16sm2179486pjo.19.2020.09.22.04.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 04:43:44 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@vger.kernel.org
Subject: [PATCH] spi: spi-mtk-nor: fix timeout calculation overflow
Date: Tue, 22 Sep 2020 19:42:59 +0800
Message-Id: <20200922114317.2935897-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_074350_823783_68E753B0 
X-CRM114-Status: GOOD (  12.87  )
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 bayi.cheng@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>,
 Chuanhong Guo <gch981213@gmail.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

CLK_TO_US macro is used to calculate potential transfer time for various
timeout handling. However it overflows on transfer bigger than 512 bytes
because it first did (len * 8 * 1000000).
This controller typically operates at 45MHz. This patch did 2 things:
1. calculate clock / 1000000 first
2. add a 4M transfer size cap so that the final timeout in DMA reading
   doesn't overflow

Fixes: 881d1ee9fe81f ("spi: add support for mediatek spi-nor controller")
Cc: <stable@vger.kernel.org>
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/spi/spi-mtk-nor.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 6e6ca2b8e6c82..619313db42c0e 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -89,7 +89,7 @@
 // Buffered page program can do one 128-byte transfer
 #define MTK_NOR_PP_SIZE			128
 
-#define CLK_TO_US(sp, clkcnt)		((clkcnt) * 1000000 / sp->spi_freq)
+#define CLK_TO_US(sp, clkcnt)		DIV_ROUND_UP(clkcnt, sp->spi_freq / 1000000)
 
 struct mtk_nor {
 	struct spi_controller *ctlr;
@@ -177,6 +177,10 @@ static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
 	if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
 		if ((op->data.dir == SPI_MEM_DATA_IN) &&
 		    mtk_nor_match_read(op)) {
+			// limit size to prevent timeout calculation overflow
+			if (op->data.nbytes > 0x2000000)
+				op->data.nbytes = 0x2000000;
+
 			if ((op->addr.val & MTK_NOR_DMA_ALIGN_MASK) ||
 			    (op->data.nbytes < MTK_NOR_DMA_ALIGN))
 				op->data.nbytes = 1;
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
