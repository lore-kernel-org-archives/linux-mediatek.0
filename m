Return-Path: <SRS0=4pGO=KM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE6F9C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 10:55:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C855611ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 May 2021 10:55:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C855611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RC+RtDaK7ZeFn5pMGMLI74Cw1129ijO24oyTj+ZIt7g=; b=hteIOUI7yRDNAp8dgvBtE988m7
	E1UVPYwbk6SgVBRCcCD+YQpMsSTRbc98qfej0wJcA2/cflYpx5V4J6Ljj4aWWr0kzqEduPkic1azh
	P92mElKIsT8xls2n6gkZ3Q4c8NJvhMqZ0zFOhQpViDFcyh3XC8op+roXMvlP1Zkj1C7hcrnj7HQ7Z
	HKAcqMFZ2goHZX9CTX3s9aNgOU6vzqBWVm8Ndh4Ozov6MPVTV/zo8K3j6uZDXWGbqk6XDvPtjrRpO
	ZT6CVubOxt+tuYpaUkP5ZUw64lQwEJyzse3Zpuz1ho4nBvBJtPmD8cTb+hivUxtBhwmZ+9mFYDxyF
	/ye6GwnA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1liatj-00Eeil-6o; Mon, 17 May 2021 10:54:56 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liate-00Eei4-Pq
 for linux-mediatek@desiato.infradead.org; Mon, 17 May 2021 10:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=yzBuMiC2XaLs/j1LpNGe2K8TP7QRiNZvMg2908xwCXA=; b=NSEkMiS/9Bhf5EI1nnAIt8jkrW
 1u02PDtPBDdvyIAYslV3wTHFuiSIrd2m7GEnmIUC7mpC6qkpaAgB5oviAC1Rsf/9z2/Z0t976K79H
 2Xeh/RIClxUjcpMZB+KcKJhFIkM3RzeidNcVJLcWWaB26zRgBjnUozgTLoIXnwCiYHc0+PtM3648R
 D90QW7vHmC0ChcNyrHpkL/eQPIuHioNuU/SiiNZ9ZStqCU++rL/Mbmr79lXsZJbQX8v9qTcaT9UgN
 IgT9825wFMWEHbJvC3YSmv98nImhq5g7D/IAJrSys2AbAG7k0GPVjlPuUl2/WkjBRn/6+M2TfK6kB
 ls18/SQQ==;
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1liatc-00DhAo-AH
 for linux-mediatek@lists.infradead.org; Mon, 17 May 2021 10:54:49 +0000
Received: by mail-pj1-x1029.google.com with SMTP id
 g6-20020a17090adac6b029015d1a9a6f1aso4323707pjx.1
 for <linux-mediatek@lists.infradead.org>; Mon, 17 May 2021 03:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yzBuMiC2XaLs/j1LpNGe2K8TP7QRiNZvMg2908xwCXA=;
 b=ZRu4cOsTud8oyRg8K/dNWXVOFRjhDkEt6GER7grMfhXnJs1Oe2H0kBBbDt7DdT7bXb
 7BYgb+0rL9PrK/4hWSLNuM1XWyontoVNyc0e1t51rEA1r3t3wzzxsTN9g/4CDJSGODQk
 fzknAvXky0Jj5hN5zKWjFt32Yg9z/EzGxlagzAhOMkA2s4gYrA3SrX2H3CvE8uqVdYyt
 JlI4DuQ7MteCjHcXQhO/2lk05O2qxHZSK90Aa6GSfnbFeUptfOdTXX6x2BDZL4GFAjD2
 dZqbel5mgzh7EcPF64NZTP6l8Iuu2m6KoE87aC8BmdKQqIMAgyniPIJZ8Cr0cYobs67t
 W0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yzBuMiC2XaLs/j1LpNGe2K8TP7QRiNZvMg2908xwCXA=;
 b=J4I74yrn5qytuVaWwMAIwWlj0r5X1rjyO/Has4ka4ZoUtWOQFJhI0lODfdcROoDpiv
 GAw9gTCIScruAuR9MdE+KXNEGQyDeWUa0BXkibC0mYVtew4ra/usNQ5Orj6zqMzMP104
 TbWloVBsQ4+fP/SuUoFoH8Dcq18f7lyfaMxCyTxS0mYYbQi73Ftk8kg6HizNUFCFgyDK
 CatYeugpnQXVpfb9tDQvefYjtF29k7B3nmwrzPfeFwr/ODsRjsJOV2ah4DKvpngOm7cB
 uOiVkd4FIPAGMbNPyV5YUpCAql44IQoWKFDXvAzbCUsk+QxPQH9RKcI16j6YwiW8XPRz
 hTnQ==
X-Gm-Message-State: AOAM532WG8mDKSx8anH+V5inA22vDssnN97NaBs+J1hixpi/Nj6mqR86
 p5yxheKjmzVhTHYewwzkMLw=
X-Google-Smtp-Source: ABdhPJwkEw1HtZdsBPLVsJMejfuHolPdJBtBxADQ2kfLqLczA1fjfWTMnR8aQE8eC/N6TVolDm43GA==
X-Received: by 2002:a17:90b:fc5:: with SMTP id
 gd5mr24334538pjb.99.1621248887281; 
 Mon, 17 May 2021 03:54:47 -0700 (PDT)
Received: from tj.ccdomain.com ([103.220.76.197])
 by smtp.gmail.com with ESMTPSA id w8sm10855074pgf.81.2021.05.17.03.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 May 2021 03:54:46 -0700 (PDT)
From: Yue Hu <zbestahu@gmail.com>
To: chaotian.jing@mediatek.com, ulf.hansson@linaro.org, matthias.bgg@gmail.com
Cc: linux-mmc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, huyue2@yulong.com, zbestahu@163.com
Subject: [PATCH] mmc: mediatek: remove useless data parameter from
 msdc_data_xfer_next()
Date: Mon, 17 May 2021 18:54:32 +0800
Message-Id: <20210517105432.1682-1-zbestahu@gmail.com>
X-Mailer: git-send-email 2.29.2.windows.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210517_035448_376256_B92241BD 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yue Hu <huyue2@yulong.com>

We do not use the 'data' in msdc_data_xfer_next().

Signed-off-by: Yue Hu <huyue2@yulong.com>
---
 drivers/mmc/host/mtk-sd.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
index c4db944..4dfc246 100644
--- a/drivers/mmc/host/mtk-sd.c
+++ b/drivers/mmc/host/mtk-sd.c
@@ -1347,8 +1347,7 @@ static void msdc_post_req(struct mmc_host *mmc, struct mmc_request *mrq,
 	}
 }
 
-static void msdc_data_xfer_next(struct msdc_host *host,
-				struct mmc_request *mrq, struct mmc_data *data)
+static void msdc_data_xfer_next(struct msdc_host *host, struct mmc_request *mrq)
 {
 	if (mmc_op_multi(mrq->cmd->opcode) && mrq->stop && !mrq->stop->error &&
 	    !mrq->sbc)
@@ -1407,7 +1406,7 @@ static bool msdc_data_xfer_done(struct msdc_host *host, u32 events,
 				(int)data->error, data->bytes_xfered);
 		}
 
-		msdc_data_xfer_next(host, mrq, data);
+		msdc_data_xfer_next(host, mrq);
 		done = true;
 	}
 	return done;
-- 
1.9.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
