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
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2E00C4727E
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 11:50:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F6EA221EB
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 11:50:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="oJz1gpLa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gtqp4rrT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F6EA221EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2fTP+nnghDGhqWMy2m7flhO4l0yk7AzBRqZ0jI3YoVc=; b=oJz1gpLah9drMOHzbd0gUoQ+7Y
	VfWy1JcwPcCR33pu80AzCMVOBdBC/kWBueewaaIAQGdSY2zS4XGiMacOTTHOTp5rrXEf//yysAe8Q
	81Cc3HHMODQh/vZ88qmDnIviaj+Oa++OuO3oUQp/COTxHuVd7+KzP2x3UuTOXaMfA4S5bFv/yEDoX
	GQwohDEFmjoYrCK+x14WOJdZjoZIDyTFvhumAeO5dM+cX+vyeupkCz5O8xaaAiHKlfYfuAOzZCbXc
	CddzDA//DG0G0hAV5Jib07PvCsUU1nkhuv8tXZ/uTiwRxCGA4Alr7gdzea2IdmZCG9PEL2nJtQpja
	V1+erWnQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKgo8-0000cK-8F; Tue, 22 Sep 2020 11:50:04 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKgnr-0000Vv-6z; Tue, 22 Sep 2020 11:49:49 +0000
Received: by mail-pg1-x543.google.com with SMTP id o25so6798387pgm.0;
 Tue, 22 Sep 2020 04:49:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EJwpKrbgqo/Jc/SWHvyAGB9CrpkZ5L1Hzq9tInFHTYk=;
 b=Gtqp4rrTgM1+bYxfUQXe+lfPcgHRW6GccdN42Iszl6ozMbezvftl1BUcKE22S6eFW3
 Vs+lcKZN9Eh9C53YAAd0cuZYhJ2GqlfGNLA/9SyB7s/gIwHqO9Cuu17YpB9dAFfEUxoS
 825uUcTeRe6BTagZAh2/MBluiMY3TszRi94MbOftxUg+wSqp0wMAPe9RN0gAEc/l2xgK
 8PhXbZv3uItI4QqoKYiz93vrF/zYhj+oGTI44g2li2fpAgCNL7lXCpSE2C9NsEe+YqTw
 aO5A3W8t4jvp8oCJEvr/MWY1ZZLd1fVJ17W3aGXoDi/7EUcAvX9G5Ee7U68UXGMtty/d
 z5Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EJwpKrbgqo/Jc/SWHvyAGB9CrpkZ5L1Hzq9tInFHTYk=;
 b=XhcpP16zYyJr/qCT9JbO3fn8RyfI44xJL3hvgNrlcr4ljkEZ4TF6OfyhjdEZYeeA3C
 kLlWuAqrSn6mweuhS2LZ0BV5QL/YYaVO4wP4B/y3j+tNbnW3JNM0NtEY19pOtaM4vYK/
 tPuNxld5RvJWxQ9BLs8hH6y7j/ob6oDug170P5YkwK6Wa/FLCi2bw92/vldhdnFP/Nny
 1bbiWRVls1Ra/Q3z90tGViMkBdlcff6MI9DR5M6a1HTQN7kN9rLDCMGs3r9XVComY07N
 ECbrZbL+iJwuRuT43RAUxE72X/Pn0WYD20unzITf8bta92usNDRgEuxc1bLyL+uHxgUk
 YQKA==
X-Gm-Message-State: AOAM531Xr1Bg4uwupCAPpH4eBWVrXGALjIWa+5AVNZ8w6ltS4BGgWv6b
 e4g6ycKnUp/KalpJhOMi90o=
X-Google-Smtp-Source: ABdhPJx36OliaaLkiX3ZeZNNWgd/qSKiRor2X0eeHScDrjMSi5bTiEzAfX5j7hkQgqz8ZUT0qqLRNA==
X-Received: by 2002:a63:1863:: with SMTP id 35mr3131307pgy.413.1600775385014; 
 Tue, 22 Sep 2020 04:49:45 -0700 (PDT)
Received: from guoguo-omen.lan ([156.96.148.94])
 by smtp.gmail.com with ESMTPSA id r4sm2223750pjf.4.2020.09.22.04.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 04:49:44 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@vger.kernel.org
Subject: [PATCH v2] spi: spi-mtk-nor: fix timeout calculation overflow
Date: Tue, 22 Sep 2020 19:49:02 +0800
Message-Id: <20200922114905.2942859-1-gch981213@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_074948_345420_69207EBE 
X-CRM114-Status: GOOD (  12.60  )
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

Change since v1: fix transfer size cap to 4M

 drivers/spi/spi-mtk-nor.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 6e6ca2b8e6c82..62f5ff2779884 100644
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
+			if (op->data.nbytes > 0x400000)
+				op->data.nbytes = 0x400000;
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
