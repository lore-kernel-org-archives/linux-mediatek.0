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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DF02C43461
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:44:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1F3E821D40
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2020 09:44:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="e/jtZdrt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="unk6p8hI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1F3E821D40
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=C2vE/lR9b0cUUpYoA+Ti/AfK2eSGG6kobCoyugzetW0=; b=e/jtZdrtnjCjj0tjYzcHOP2mYF
	EflAvVdtGjKb1ti5h0a0fPgczHekAVE4VdoKKjdo3gOgnwlEuQxXqJ5IEoTnWBFI4Va6jgpMyxNfV
	alQGdXeaGbU9kl7p/dkL3DhlGYueDfW+qt0Y0IxAnMDeWwIpd5kP/QAwZcOUWnpMnt7SIomyYPqaq
	CLC10SihH9pf9JwQeVNzZs65DmjUQ7877SpUQSQNzGZ8VTazt3o2FSsOEs59P3FP63hVygkR8NjIp
	/PiooxrfTSqCburKsTnBBUAQJWWpvITuAzFU+qUA2fkLPb26asevp9W+6VSB7V1FzF1x6I+Wse1uz
	OLVCttIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kGfax-0005Gh-4e; Fri, 11 Sep 2020 09:43:51 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGfau-0005FW-2F; Fri, 11 Sep 2020 09:43:49 +0000
Received: by mail-pf1-x443.google.com with SMTP id x123so6897629pfc.7;
 Fri, 11 Sep 2020 02:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=bJ0up8YgWBaqrOdwt3l9bHaiRijlj1VCPYtRtI0qJWc=;
 b=unk6p8hIjiC+Xy2cAWNQ+FwnWVQAXbmC2you+SpVd20dAZ8obZsGYAQKCVaBSy9OK8
 JHyRT7E1tmBScUZyoFBeLii2fRjIqhakeCWOXcUinoFh+ynxxZUL/tYQxwk415PHubz5
 DxORYp3zBkfOQZyQgoB88jOq5BqZPYT74hLwwpIp8mysWpJjKRbhhhjTx5/fWnfqkYQ1
 IkQbhTp6wRcLrLpzAKmOjUUrwVDb4nLuLejV1X0Cob877LGwJ4G+hulP1JyMtWg3/S3O
 IwRbIzxKRKqnv0d+ZDTM4OJIQD/VzFo3nCEJBc4Uxs/GQG9cXZdajJXQ3jfX6Ar+2Aiq
 zfdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bJ0up8YgWBaqrOdwt3l9bHaiRijlj1VCPYtRtI0qJWc=;
 b=q4mCXSJlhKvMaem1Fj3dVVayYXcillCegMb1Ovyw/gm5TDipLtO7DZk1hqkLtj0u2o
 W1ZTq41Z0Ov0vxN7RavUpftt6q34b+tzLae2oL4qAvc5o8OR344dLrrlNvVLJxEgcJpp
 +Q6nXUHphvPH+hLcoKQF1v7rewfUTVLxwPSU++rO50v3w2UCxJ8VuAX/cYE9UsCaujtb
 WYzKv9P+IvLlEpfMT/v9QfIemE1zarlhAU2oBXIYdo3Er0BsToL+oHpG5u3E2MF9ci1f
 ODlvnUJLvkS/Lkir6BFtv6diFZtvDDZA+vQnsk5Zo6vyDMQLrJMTKrBWr7Y5JFsmByz7
 GnaA==
X-Gm-Message-State: AOAM532OhoC0/xl1J3SDJFIxCNy4NKOEXTl/hewc2KjUyMI+V78zRvbs
 bf1+qN0G8eXpp9M53yuAXe8=
X-Google-Smtp-Source: ABdhPJzXu4H8xGMfnslGYi4xCEqJAOoGiXoEoV4zSW7z85Vk/I/jabX/VAiG8RfZGqqR9EPj9C9Ltw==
X-Received: by 2002:a17:902:7fc7:: with SMTP id
 t7mr1208270plb.159.1599817426171; 
 Fri, 11 Sep 2020 02:43:46 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-13-52-163-24.us-west-1.compute.amazonaws.com. [13.52.163.24])
 by smtp.gmail.com with ESMTPSA id h35sm1477260pgl.31.2020.09.11.02.43.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Sep 2020 02:43:45 -0700 (PDT)
From: Xiaoliang Pang <dawning.pang@gmail.com>
To: herbert@gondor.apana.org.au, davem@davemloft.net, matthias.bgg@gmail.com,
 swboyd@chromium.org, yuehaibing@huawei.com,
 tianjia.zhang@linux.alibaba.com, ryder.lee@mediatek.com
Subject: [PATCH v4] cypto: mediatek - fix leaks in mtk_desc_ring_alloc
Date: Fri, 11 Sep 2020 17:43:33 +0800
Message-Id: <20200911094333.3584-1-dawning.pang@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200911_054348_130842_253EAD6B 
X-CRM114-Status: GOOD (  12.40  )
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
index 7e3ad085b5bd..654a6ba4bf17 100644
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
+	} while(i--);
 	return err;
 }
 
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
