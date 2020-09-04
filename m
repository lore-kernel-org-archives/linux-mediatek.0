Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A407C2BC84
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 09:43:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5E8821481
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 09:43:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q44wuC4J";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gAzMbl9T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5E8821481
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aMR32HLc8/Byv/Yxxiym6I4Bskkcmw8/XFHJptOTiJM=; b=q44wuC4Joh/21i/OzAtB+r4nb5
	a5bR+ybjuvwDt9X84DvqxPuviDTE7CjO47YN6mEtnM/b5UTpa2dvEZQTbHHH4XJgNgTVXpxoFDIwH
	v4twHrjDvEmsTanzrVNoTDtv5jfFS3eHRt8KDJF29ugFUKZar8+nDw7o1DDqy5+BLP2TTBTW0yqLJ
	pvfZN8x6PXGW/spJTjwetFRx6uP05QEAvmf2bZCdc3CCbgYr0i+Gdd4l7awbs5hYoPU+lml6AuP8m
	/GnsjpUz9Q7YLDA8ougY7Zz7xUol/chpzll6wpKgLMCfIxuiSp4cA4ygqzziX6KWWlntegItAfxur
	SBYVwhKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE8FJ-0003xc-17; Fri, 04 Sep 2020 09:43:01 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE8FE-0003vo-EW; Fri, 04 Sep 2020 09:42:57 +0000
Received: by mail-pg1-x543.google.com with SMTP id u13so4069607pgh.1;
 Fri, 04 Sep 2020 02:42:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=k2pP6uCXGE3hf4kIKSJ0TViSAKe2ZDHRqtthemQoyUE=;
 b=gAzMbl9TqqnXyIRD4TGx12WtzlcUX32PTT1eW7BqLXqe/HdTdxT+emMOtGKKg2tS3H
 jFqZlQ5OqWNgNqx+/n7a4Q7Te6jcGhHPYbSig/rg2q5PObd6SajiemVm3ewlGqpfu644
 5Blfjst9QQT95RzWlLfk9rJvA94vL8w91xs3/BfC+cs37CHNKHlvmbiRivIvL6icBMYZ
 JCrLsfugmAhujtWhAVmimv1MhdKlmKFUmobeCz/rdamM0xqc2Ggn0qP5zHOi6nfqCp95
 yhOTIjgyy9U+EiWIZUcO0Vvsm3M+xsIAlm2y1B/5Ok9NgAQ0PLF8eHwBNjoTR2+EB6oE
 5RVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=k2pP6uCXGE3hf4kIKSJ0TViSAKe2ZDHRqtthemQoyUE=;
 b=Ho5H+8qk82RNETUquUlpSlBJ5jUn+YaSjc1CMElWZw0KQAB3FTJA/J/v2G/7V3kdQI
 k87bmCWIPMeth7XA1a/qHo8PEI7MuMD12BYq8+JlOonCHbYriz6dCcJ0J9fFOP5z2Pkk
 r1lnLEkjU2DsBUMj2iGhInIu9fz6iRN75cxUfvbHVf75KxoRqcF36JRGndzT38XP8JPj
 LkzMbAtane2ijqBaV0Ee//VKzz3QrKJfsERW6UAsSYg5J0L/aRo3EUjN0BuSWnT2O3Cy
 CF72JsL7bdh/jYWs9Ibr5t4OoeF5lNdMga0ry1AYbv9QNyJWsIy77MRNSHG0/Frz8zoy
 HDrw==
X-Gm-Message-State: AOAM532ygOUTCZY6BhCaxM5pFLqsgKWJDaiCblquWrzX0OlGcvtlEplV
 ++VVTaZHNJ78YKzrIwuLODI=
X-Google-Smtp-Source: ABdhPJxL3L6K5Vdob33AgTHPTkGlZCq/T3PVfZsknGNaQ4ivB+nB3Am35D+EDOqj9Yl1PfZqpKP8Eg==
X-Received: by 2002:aa7:8010:: with SMTP id j16mr7428036pfi.210.1599212571903; 
 Fri, 04 Sep 2020 02:42:51 -0700 (PDT)
Received: from localhost.localdomain ([218.247.215.252])
 by smtp.gmail.com with ESMTPSA id a7sm6256342pfd.194.2020.09.04.02.42.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 02:42:51 -0700 (PDT)
From: Xiaoliang Pang <dawning.pang@gmail.com>
To: herbert@gondor.apana.org.au, davem@davemloft.net, matthias.bgg@gmail.com,
 swboyd@chromium.org, yuehaibing@huawei.com,
 tianjia.zhang@linux.alibaba.com, ryder.lee@mediatek.com
Subject: [PATCH v2] cypto: mediatek - fix leaks in mtk_desc_ring_alloc
Date: Fri,  4 Sep 2020 17:42:33 +0800
Message-Id: <20200904094233.11624-1-dawning.pang@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_054256_526764_543DCE37 
X-CRM114-Status: GOOD (  12.90  )
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
Cc: dawning.pang@gmail.com, linux-mediatek@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the init loop, if an error occurs in function 'dma_alloc_coherent',
then goto the err_cleanup section,
in the cleanup loop,
the struct mtk_ring rising[i] will not be released,
causing a memory leak

Signed-off-by: Xiaoliang Pang <dawning.pang@gmail.com>
---
 drivers/crypto/mediatek/mtk-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/mediatek/mtk-platform.c b/drivers/crypto/mediatek/mtk-platform.c
index 05d341e4a696..ebb3bdef0dbe 100644
--- a/drivers/crypto/mediatek/mtk-platform.c
+++ b/drivers/crypto/mediatek/mtk-platform.c
@@ -469,13 +469,13 @@ static int mtk_desc_ring_alloc(struct mtk_cryp *cryp)
 	return 0;
 
 err_cleanup:
-	for (; i >= 0; --i) {
+	do {
 		dma_free_coherent(cryp->dev, MTK_DESC_RING_SZ,
 				  ring[i]->res_base, ring[i]->res_dma);
 		dma_free_coherent(cryp->dev, MTK_DESC_RING_SZ,
 				  ring[i]->cmd_base, ring[i]->cmd_dma);
 		kfree(ring[i]);
-	}
+	}while(i--);
 	return err;
 }
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
