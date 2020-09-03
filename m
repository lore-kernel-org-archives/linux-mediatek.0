Return-Path: <SRS0=sr8Z=CM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84C2EC433E7
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 00:06:37 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5020620773
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Sep 2020 00:06:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zQetRaCo";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W+DOsAlA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5020620773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Us0SylkrcoPxFoJwDMKIcVbyOrJfhqFjPYhsCUh9qYo=; b=zQetRaCoqaiVp83BiHk65RSdhG
	36YSlEFLuR/kRHMIK+UGe61Rj4/xq+Uy6kSD9iuPPjC+lhg2WPkGFvjc3ncKvKiTMPIvTBnCWkuxA
	rve7EiqJFiVe3TKTebMQGlyP9kwvEmJODd9eK43vP47bF+YkEu8xctY4Y1aMvYoyKvrqmqysDfJad
	v6cb2Ni98jnTfQAI6CVcmYP1MQ08pWHK07gInyjK6xU2LqSeMMml+riPilENXhfN7JuL6IoS6GB8F
	lh0jFtYM+8aF0gw549dUe7iJJlX7vIrATZwE/RYfsCiBH4oI5+uY3FaOssPkrKUKgIUW/XurDxQ1g
	APdeP2IA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDcli-0006lI-T0; Thu, 03 Sep 2020 00:06:22 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDclf-0006kA-HD
 for linux-mediatek@lists.infradead.org; Thu, 03 Sep 2020 00:06:20 +0000
Received: by mail-pj1-x1044.google.com with SMTP id o16so584108pjr.2
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2020 17:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z04vsoOUn7JwZd/p6IxCr5Uu7ufkQph2sZ/+/wCM6Mk=;
 b=W+DOsAlATrKpzZEseA1m7WhWDyUKst3T4q0mLaydrOeoREGz2Ox1/Mri6QwMsxSXBs
 bcBBGjMJOVLmsIrZB2EGrL1jFeMJ4viiasi1GsuGzLm8jkP9RCcNAiJ+hL4LgWS9M8n+
 1kvwnTLA1NUrvLZv81NBSsHsU70A6yjZaSqpA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Z04vsoOUn7JwZd/p6IxCr5Uu7ufkQph2sZ/+/wCM6Mk=;
 b=qGW/F9kax65h/3elNQwNgKcibBvHU9rWnANBtxrS+4B3FEhgTwjtJ9mBEIfoc90vg+
 J6/002MkI/BWNy5+JHGmajnsHLCXBrbikiWzylO7T7NIIHGF1K71exukCXhsk75PAw9R
 5AkkXhHM/LvnNT+/d6D3HGwajQws77dx90VJAz09VRkdDabovUem6/aWZJ/SNcX2J56s
 KAj+UOWw9xzJYYN6vJyFoUtVHaQk0/1kjy0cE4EnDaFubtQcSYmxRGPgH/3g1bocqVf3
 XSDtRBmsklwVJNO7XvP016AAZq1Eq6Q1gZ7CPSD2jcTza/PcHBh3eNlNUIQjofCl9mxQ
 4Jsw==
X-Gm-Message-State: AOAM532O6bi4lHY8Yj30FGEmE/hrBlb5GWicuQ1qe4xIjpwYmHl0Zl27
 RFswlvTAWrhc4lfZC6ztf+Bg+FJcytYSTg==
X-Google-Smtp-Source: ABdhPJyDYOH+kR2LzNuzKkhYgxKK4anL0GLAhY3wBw4PKVEzGUP9xXeD0JDhuJkTGMRs9dOYGjD3Rg==
X-Received: by 2002:a17:90b:2388:: with SMTP id
 mr8mr220861pjb.161.1599091575254; 
 Wed, 02 Sep 2020 17:06:15 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id gt13sm478342pjb.43.2020.09.02.17.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 17:06:14 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v3] rpmsg: Avoid double-free in mtk_rpmsg_register_device
Date: Thu,  3 Sep 2020 08:05:58 +0800
Message-Id: <20200903080547.v3.1.I56cf27cd59f4013bd074dc622c8b8248b034a4cc@changeid>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_200619_614072_93FD2CF3 
X-CRM114-Status: GOOD (  12.59  )
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
Cc: Ohad Ben-Cohen <ohad@wizery.com>, Nicolas Boichat <drinkcat@chromium.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, linux-remoteproc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Pi-Hsun Shih <pihsun@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If rpmsg_register_device fails, it will call
mtk_rpmsg_release_device which already frees mdev.

Fixes: 7017996951fd ("rpmsg: add rpmsg support for mt8183 SCP.")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---

Changes in v3:
 - 12-char Fixes tag (Mathieu Poirier)

Changes in v2:
 - Drop useless if and ret variable (Markus Elfring)

 drivers/rpmsg/mtk_rpmsg.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 83f2b8804ee9..96a17ec29140 100644
--- a/drivers/rpmsg/mtk_rpmsg.c
+++ b/drivers/rpmsg/mtk_rpmsg.c
@@ -200,7 +200,6 @@ static int mtk_rpmsg_register_device(struct mtk_rpmsg_rproc_subdev *mtk_subdev,
 	struct rpmsg_device *rpdev;
 	struct mtk_rpmsg_device *mdev;
 	struct platform_device *pdev = mtk_subdev->pdev;
-	int ret;
 
 	mdev = kzalloc(sizeof(*mdev), GFP_KERNEL);
 	if (!mdev)
@@ -219,13 +218,7 @@ static int mtk_rpmsg_register_device(struct mtk_rpmsg_rproc_subdev *mtk_subdev,
 	rpdev->dev.parent = &pdev->dev;
 	rpdev->dev.release = mtk_rpmsg_release_device;
 
-	ret = rpmsg_register_device(rpdev);
-	if (ret) {
-		kfree(mdev);
-		return ret;
-	}
-
-	return 0;
+	return rpmsg_register_device(rpdev);
 }
 
 static void mtk_register_device_work_function(struct work_struct *register_work)
-- 
2.28.0.402.g5ffc5be6b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
