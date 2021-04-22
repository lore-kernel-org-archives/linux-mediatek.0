Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B989EC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 12:04:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E2846140F
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 12:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E2846140F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZiORr32/91z/6BIqSpLSjl/83n2n2kovwBJgPLGarvo=; b=G0YmTkQL6SZ7LKJnYJ4g3GPNIu
	S326qHZHcgp7xNuJ4i/Ok9YAtGVoGeucnwtC02y99Hqk8QuBQtv+hKlRF7ShR8NL5S/aG9H70G3ss
	dhr3zcoGfdHM72oU9yw5E+h1jWM9aRN9nugSvmgNYhyqmk+4AfH8nArp8vBLb6esB3Z2FNcyLPdxB
	8f2yMhMHMqP5HQR/kimdCsWKvwJZrYEiQzQjn8299s3uhVmCoYx3PjrNBlyffa5j+X36wSeJCzobq
	NrPF2JqMFz/uouDef1eJLqC/c/RzBfm0qGuP2UaafuJXIMojKkNgIEfSqh+TITymC0D71+SZ/pAJx
	jEcr7wjQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZY4R-00GeNd-M6; Thu, 22 Apr 2021 12:04:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZY4G-00GeN2-C5; Thu, 22 Apr 2021 12:04:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=+3Kzd9ZhSeiD+dhbC8WlXWjTP7FVzy0eQUYx0BsyDxo=; b=vHseYbN24JfE+3qeX4VSBLn+6x
 05iM4iPFeiC78xzC0g9mgdDtAdFwnvzWulWitqVtpvzN12dAtRO03v0ltsukzJDWj9aYqTLMC10do
 bNFWZFlXed8y/Fiu1baQou4r+xP5CLW1ez3E/PgaWrrd+MyDLGhNzus0YmqDRLhPcPhGzVzzCcDSE
 B8mAGwYKh9d3gvfiElIdOhOp+qbynSy9/bDNHt8N6cjJB6UTvss0YKEz3FAfytXHdBLk6t1Yisjbz
 4qXUqauENSvSF1c4yvYT4ZJ7FmSZd1gFgwcHQFLy2KA7s2N2QbfBmWZDd/b51GMoL+DkYQFyHCXl0
 pRi2YT5g==;
Received: from youngberry.canonical.com ([91.189.89.112])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZY4B-00DeMF-H2; Thu, 22 Apr 2021 12:04:21 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1lZY44-00040i-Ua; Thu, 22 Apr 2021 12:04:13 +0000
From: Colin King <colin.king@canonical.com>
To: Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] thermal: mtk_thermal: remove redundant initializations of
 several variables
Date: Thu, 22 Apr 2021 13:04:12 +0100
Message-Id: <20210422120412.246291-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210422_050419_714614_B1E05D3F 
X-CRM114-Status: GOOD (  11.61  )
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

From: Colin Ian King <colin.king@canonical.com>

Several variables are being initialized with values that is never
read and being updated later with a new value. The initializations
are redundant and can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/thermal/mtk_thermal.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/thermal/mtk_thermal.c b/drivers/thermal/mtk_thermal.c
index 149c6d7fd5a0..97e8678ccf0e 100644
--- a/drivers/thermal/mtk_thermal.c
+++ b/drivers/thermal/mtk_thermal.c
@@ -573,12 +573,12 @@ static int raw_to_mcelsius_v1(struct mtk_thermal *mt, int sensno, s32 raw)
 
 static int raw_to_mcelsius_v2(struct mtk_thermal *mt, int sensno, s32 raw)
 {
-	s32 format_1 = 0;
-	s32 format_2 = 0;
-	s32 g_oe = 1;
-	s32 g_gain = 1;
-	s32 g_x_roomt = 0;
-	s32 tmp = 0;
+	s32 format_1;
+	s32 format_2;
+	s32 g_oe;
+	s32 g_gain;
+	s32 g_x_roomt;
+	s32 tmp;
 
 	if (raw == 0)
 		return 0;
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
