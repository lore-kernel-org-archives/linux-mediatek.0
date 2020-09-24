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
	by smtp.lore.kernel.org (Postfix) with ESMTP id E71B6C4363D
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 15:29:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DB5B21D91
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Sep 2020 15:29:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="u+JFtWnc";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="knL//Jbb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DB5B21D91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GsumoIewsEQf47TAno/TJM0NHdxmH1bwP/pSMLee1qI=; b=u+JFtWncNhT7scGwPNhQ8j9iy
	IU8c7M7nkJAFncZOdzbtcWmstayVZMNxm32+2bR0m54l4+lLl/qpPiQJdAn1GfQ7I7Cs08TiqR/jY
	nwWTPGp1fC/iITbJFttXlvvtrWuu0oxQqlH1eUnMVPaezPb5YKviwc8HWvEvX6gpph3ZxtE7i+rDK
	+xTI+yPbHLSBIp8WiXOY8vZhkfo/EQY55Y9v4vF+dkuVLKCTZ5qS11urAwmq6TKVtNvuELaT+aMgc
	eWEA/MSeUrIPvdX4qUSlJzyYDJEqR847DERrRSWRaOQIHvpKQUN+wOoNSmYiVrT4kf2FeJOTQ0KxG
	PiqU2h0iQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kLTB1-0003Pq-5h; Thu, 24 Sep 2020 15:28:55 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kLTAd-0003B9-Az; Thu, 24 Sep 2020 15:28:32 +0000
Received: by mail-pj1-x1043.google.com with SMTP id mn7so1778312pjb.5;
 Thu, 24 Sep 2020 08:28:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ydse9JJ+ftTyRWsvhcjm/YwUAWDIwbgK0aq4Xyc/pN8=;
 b=knL//JbbhIACLiQWUd5tja3co0hcd2If1nx/SGslZd13vEJI3NG9V0tLfyx38WXjOp
 d5sOdxkLd1CwWw6QFJ/IS6BcPPGHSd+0A5Z65VB/ZjlfR4LpbCKgqtJYiPdEu8ZD7Zdr
 7b1y37RbdH1IzBFOsLRbb0JlFj7FquwrV9kheoYHfsiIhTRW+ZJGpJRl22lfWUacMhDu
 Wq1mng24/fMotHwEcTWgTNmeE3gSkuNwnhwfDTu8fYLhGj/oHn0LwWOhceG4t5JF2Y5r
 5LEGswbVc8YoTsIAV2d5j1PFugoocmqh8NzgOdA8f6UdtLMpeKOW72S/OL1EbIoqEPkx
 7MCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ydse9JJ+ftTyRWsvhcjm/YwUAWDIwbgK0aq4Xyc/pN8=;
 b=Y5gjBipBCc5omEO9yGxLwOJsLGd7xwN+b6i7PP7uj0WAxhe5hPGG+EEQqWYssyGu8Z
 KBshkdnSyK7kqMQlo/1lbxzeN5ZBindiRVOGCIhBPuUukBAoK3I9ZtjkMxfNE81rPGTX
 pzEBGGd93g7jr0LdZlhoLHu2WVBbpvjSzuflPRsc1CvA9hhKZnhhoQfh9r+7uSKmhKkG
 4peyv577507IKaRf29WgO1CzFp7YAsaSKOrMZCBxc0cGmu/mWMlyISTRIydkpFvBaWHE
 5eNFwTHYdeCqwQ8U25zwmsOHyKFvCETLDpIsdkfteZtAU/gxJJVPbCRyIyIbSCNAvyVI
 Rfsw==
X-Gm-Message-State: AOAM533ZylvbyravTNjHiK49ebsKTq/drVu1CtZcWtY8iFac5jka3M+I
 344xgWSu8Kl9E+0sPNfXqPQdgovMZEhMVA==
X-Google-Smtp-Source: ABdhPJwj0O9VBAEbiiRMiUQP412SndgpBFZlx6tI3A6GsG2itd7F6Gc5r4f6bDJSVHSJD6gBN4IWrg==
X-Received: by 2002:a17:90a:c255:: with SMTP id
 d21mr4647745pjx.212.1600961309445; 
 Thu, 24 Sep 2020 08:28:29 -0700 (PDT)
Received: from guoguo-omen.lan ([156.96.148.94])
 by smtp.gmail.com with ESMTPSA id e62sm3233212pfh.76.2020.09.24.08.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Sep 2020 08:28:29 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@vger.kernel.org
Subject: [PATCH 3/3] spi: spi-mtk-nor: fix op checks in supports_op
Date: Thu, 24 Sep 2020 23:27:30 +0800
Message-Id: <20200924152730.733243-4-gch981213@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200924152730.733243-1-gch981213@gmail.com>
References: <20200924152730.733243-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200924_112831_424378_94A7A4E0 
X-CRM114-Status: GOOD (  14.89  )
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

commit a59b2c7c56bf7 ("spi: spi-mtk-nor: support standard spi properties")
tries to inverse the logic of supports_op when adding
spi_mem_default_supports_op check, but it didn't get it done properly.
There are two regressions introduced by this commit:
1. reading ops supported by program mode is rejected.
2. all ops with special controller routines are incorrectly further
   checked against program mode.

This commits inverses the logic back:
1. check spi_mem_default_supports_op and reject unsupported ops first.
2. return true for ops with special controller routines.
3. check the left ops against controller program mode.

Fixes: a59b2c7c56bf7 ("spi: spi-mtk-nor: support standard spi properties")
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/spi/spi-mtk-nor.c | 21 +++++++++------------
 1 file changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/spi/spi-mtk-nor.c b/drivers/spi/spi-mtk-nor.c
index 4bbf38ef5b4b1..ea39736de2918 100644
--- a/drivers/spi/spi-mtk-nor.c
+++ b/drivers/spi/spi-mtk-nor.c
@@ -273,7 +273,8 @@ static int mtk_nor_adjust_op_size(struct spi_mem *mem, struct spi_mem_op *op)
 static bool mtk_nor_supports_op(struct spi_mem *mem,
 				const struct spi_mem_op *op)
 {
-	size_t len;
+	if (!spi_mem_default_supports_op(mem, op))
+		return false;
 
 	if (op->cmd.buswidth != 1)
 		return false;
@@ -281,25 +282,21 @@ static bool mtk_nor_supports_op(struct spi_mem *mem,
 	if ((op->addr.nbytes == 3) || (op->addr.nbytes == 4)) {
 		switch(op->data.dir) {
 		case SPI_MEM_DATA_IN:
-			if (!mtk_nor_match_read(op))
-				return false;
+			if (mtk_nor_match_read(op))
+				return true;
 			break;
 		case SPI_MEM_DATA_OUT:
-			if ((op->addr.buswidth != 1) ||
-			    (op->dummy.nbytes != 0) ||
-			    (op->data.buswidth != 1))
-				return false;
+			if ((op->addr.buswidth == 1) &&
+			    (op->dummy.nbytes == 0) &&
+			    (op->data.buswidth == 1))
+				return true;
 			break;
 		default:
 			break;
 		}
 	}
-	len = op->cmd.nbytes + op->addr.nbytes + op->dummy.nbytes;
-	if ((len > MTK_NOR_PRG_MAX_SIZE) ||
-	    ((op->data.nbytes) && (len == MTK_NOR_PRG_MAX_SIZE)))
-		return false;
 
-	return spi_mem_default_supports_op(mem, op);
+	return mtk_nor_match_prg(op);
 }
 
 static void mtk_nor_setup_bus(struct mtk_nor *sp, const struct spi_mem_op *op)
-- 
2.26.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
