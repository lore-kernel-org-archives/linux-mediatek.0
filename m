Return-Path: <SRS0=cvih=CU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE10C433E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 01:37:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D203B208FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 01:36:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="udvIjSED";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="krwr8eUe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D203B208FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=popzDMWNOAkdpWQQ69Olpdgy6s/GR0cqHmNCibrTGC0=; b=udvIjSEDv96u50VNhFqzBge9k6
	SfDg9yM1VHAFvWx1Vk6NswrOX0NsMyiR4dNOXFSe7B6l+eIeWnSK0xBRPYaCgIxx8r+2EQ8DGFo56
	QwN/xwq7nX9ujOQY72vMaJdG2mpnd/M8z3O0pY/zqC0J7lqQAo0ETM2mnxD9cXX3u9xaFqnzmyP6L
	F89ezDpTUF5zrTgegZ/ixOA4NFb5jrCK6qAD4WvEAx375pr2mxdMDWKL8g4/SkwA+xteJmv9ZoKWT
	w6eT3oQ9I7sqK5qLlALOTbwAWmeH6azymhpUL8Em6VLGOChBH0pZGYkUwi9qItErXnt5nCqQzFhz/
	pA1z0lYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGXzX-0001jq-HZ; Fri, 11 Sep 2020 01:36:43 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGXzV-0001jD-1G; Fri, 11 Sep 2020 01:36:41 +0000
Received: by mail-pg1-x542.google.com with SMTP id 7so5409966pgm.11;
 Thu, 10 Sep 2020 18:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=tgNahNYZMXrtXJeygjsMjzSrNWcxFP6xVcE3T4mcxQI=;
 b=krwr8eUejyOxlLJDdQubB7ACobn+yVeTllJsTrtCQSgf1ac41zcVHcDEj8sEt64Vs3
 DyMVltAnWqd+570rbrM+YYpmcESjuwou87ng5go8hyKn+a8ldVzon1mH43t9s4piUnLG
 pvj0zRbPjH0YPelzR7RSR8WsuKd52OvwXE51Y6pvgqqaGc0BdwAdoCblpRswW3cyfCTS
 j9dQIcfM/hfLufRkCgN0dIaahtF4QUD5pKvzf6dKtZ4EqDrROc7JIUVp3j6jR3rlpvTv
 ztjp2E9C7C1h2CRn+kqa2X/q2H/f5GWZ9FE0oNixFWxfKTyemA31lKJesUVKbVzYXi9I
 RBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tgNahNYZMXrtXJeygjsMjzSrNWcxFP6xVcE3T4mcxQI=;
 b=X5cp3oOvR6LowVFV70Oh+ranwO9RGMcaD3sm4u81mf0OQ5kpcbE7gXkdGtcOuZAKTN
 3Pu6viqXlwuoP4mjU25ZDKfIe1tKYRs+OLIz2sgwqmXjQR3/6BbciYjd5HAq2K9RI7w3
 DfBjuCLBG2pWW2COO6Pd6pZkUZuo9OKrOPASOJuyae0jNsCd8yCaHcnaEfEvmCNJKBDA
 j4CvUqtKnFu1E3rKpJIyTNtTBqEK6lfBWS5CZM9hBROlJnDwUgkKAzxZChtlLrBk4KC1
 9E+Psoc8fgqP04ZAPPg9aya97Q7isE1itim05MJsa5TXha/w793l/H1wl1UXcfxue/iT
 xm7A==
X-Gm-Message-State: AOAM531T56iU954Wg3+2Dq155EyK+71EhyonLD8UqiUsp8FfPPj5zNxs
 mYNpgzgexLL8dMbZERxf8Q0=
X-Google-Smtp-Source: ABdhPJxmpvfBvedNBMBi9uwqLUpcsx12AwdlkASNXqkxCT5l4tYvZbMRwKDXdnU+d574Ry+yP8dtMg==
X-Received: by 2002:a63:d512:: with SMTP id c18mr6475530pgg.387.1599788197927; 
 Thu, 10 Sep 2020 18:36:37 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-13-52-163-24.us-west-1.compute.amazonaws.com. [13.52.163.24])
 by smtp.gmail.com with ESMTPSA id l9sm245112pgg.29.2020.09.10.18.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Sep 2020 18:36:37 -0700 (PDT)
From: Xiaoliang Pang <dawning.pang@gmail.com>
To: herbert@gondor.apana.org.au, davem@davemloft.net, matthias.bgg@gmail.com,
 swboyd@chromium.org, yuehaibing@huawei.com,
 tianjia.zhang@linux.alibaba.com, ryder.lee@mediatek.com
Subject: [PATCH v3] cypto: mediatek - fix leaks in mtk_desc_ring_alloc
Date: Fri, 11 Sep 2020 09:36:19 +0800
Message-Id: <20200911013619.9809-1-dawning.pang@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200910_213641_108887_F252949B 
X-CRM114-Status: GOOD (  12.84  )
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
in the cleanup loop, after run i--,
the struct mtk_ring rising[i] will not be released,
causing a memory leak

Signed-off-by: Xiaoliang Pang <dawning.pang@gmail.com>
---
 drivers/crypto/mediatek/mtk-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/mediatek/mtk-platform.c b/drivers/crypto/mediatek/mtk-platform.c
index 7e3ad085b5bd..ebb3bdef0dbe 100644
--- a/drivers/crypto/mediatek/mtk-platform.c
+++ b/drivers/crypto/mediatek/mtk-platform.c
@@ -469,13 +469,13 @@ static int mtk_desc_ring_alloc(struct mtk_cryp *cryp)
 	return 0;
 
 err_cleanup:
-	for (; i--; ) {
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
