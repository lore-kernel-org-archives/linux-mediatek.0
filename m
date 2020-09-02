Return-Path: <SRS0=6rwz=CL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50E00C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 11:08:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B5FC2072A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Sep 2020 11:08:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sOtV8WG/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FA9jJNgx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B5FC2072A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=M6Ozy/6pKYBsrtxuZkiJ4L4ScEdSLkL6aeBW4ayjBiw=; b=sOtV8WG/t1p/1GhnLvZN4M/bLd
	Q7cskznfMfEbbyVs+5K4YhE0hJZY3dg5d9lv+h8sQfn/lgl38A7cDj//n8Jh7DVzIOF4S0kHez5MD
	/N7coc7RqUVO3uI78GWG71Ipbi4uGvJQFF7iMMQ71zTRYldEqn5+stj3rJmuTpTc69T0wjMb9Z6yf
	fPGg5121VjR0FfTU1u1Kb5wkrsK8j9mO/4xXBUlkDwHGqL3ETs8RnAvBvHzyvb621AEUXZNfwQOXp
	eAO1kJ2lm7XXS2d3/lzu9fYG7javzTuaJ1u83GIVw887hfJB1WAo0mc3fl3o6QkzMuhU8sHLm9lCE
	x8d5pnAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDQcQ-0001Yt-Ds; Wed, 02 Sep 2020 11:07:58 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDQcK-0001Vu-Qn
 for linux-mediatek@lists.infradead.org; Wed, 02 Sep 2020 11:07:53 +0000
Received: by mail-pl1-x643.google.com with SMTP id l9so2124838plt.8
 for <linux-mediatek@lists.infradead.org>; Wed, 02 Sep 2020 04:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRbPBiajhyZAHFvs+KY/rfMq5G+YigmViKEtUETUpvU=;
 b=FA9jJNgxjJvc9qlnqShwrPZn3AEONW5P4dh7YWPvhcMQXHUhYKjBtiz3kMOeuGCATx
 Fy2XOfBQo6n6bix1+nBZec3g6ou+954h1o+5cfOJzwZUNJHfWktY+cMSeDA8TgrPe3YS
 rHMF0UnGCJcoP9bav+/CLE+5Ymz2ejyJTM0JY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lRbPBiajhyZAHFvs+KY/rfMq5G+YigmViKEtUETUpvU=;
 b=gfrVDXLu50USs2s9FPK2yZDzSW1WEfMd+pmSQkK+e78h8Rks1hl4IdfreNgBu6V3BG
 ZorXc+MT1RRG3Kj9RFwX7f1eKbjHUgo+YZio7rTTZs6N6nSLTztImJ3RTILMochsFlYt
 4KHLy98QxUy2em4o+N/Fj2ynMOjkiTq8eFEw2Qil7yaCIcIFgq685tvwfTB3O/bbdq++
 svnwquOivBma7cXQr6/guNpqMExxHHw8YmJ6XchxqpS7CR4aUl9d8i5UAG0hotefvSuO
 nidSgPfkImecB6IoHLeEVYZcDv4zS3XwC1BT4WGJ85Slp4536OlXf8p6l+dbAf7FT946
 xauQ==
X-Gm-Message-State: AOAM5302ajx+m0iinWvBQOdqYu7Hr9FxucAdQBx874VhAVrFRcLgW5kY
 jdOViZ1dnKVGaGjzCqGm2ZO+qQ==
X-Google-Smtp-Source: ABdhPJz6nufpjZkKMfLCKDxGwZCBogTUned6t9PlQr+Oz/xkKLuHnC2Bj9IhrBEVpB0uYV1lm1f3LQ==
X-Received: by 2002:a17:902:fe91:b029:d0:5d99:c1a2 with SMTP id
 x17-20020a170902fe91b02900d05d99c1a2mr6013188plm.0.1599044870566; 
 Wed, 02 Sep 2020 04:07:50 -0700 (PDT)
Received: from drinkcat2.tpe.corp.google.com
 ([2401:fa00:1:b:7220:84ff:fe09:41dc])
 by smtp.gmail.com with ESMTPSA id l13sm5523144pgq.33.2020.09.02.04.07.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 04:07:49 -0700 (PDT)
From: Nicolas Boichat <drinkcat@chromium.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH v2] rpmsg: Avoid double-free in mtk_rpmsg_register_device
Date: Wed,  2 Sep 2020 19:07:15 +0800
Message-Id: <20200902190709.v2.1.I56cf27cd59f4013bd074dc622c8b8248b034a4cc@changeid>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_070752_912137_5F37E48D 
X-CRM114-Status: GOOD (  12.48  )
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
 linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Pi-Hsun Shih <pihsun@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

If rpmsg_register_device fails, it will call
mtk_rpmsg_release_device which already frees mdev.

Fixes: 7017996951fde84 ("rpmsg: add rpmsg support for mt8183 SCP.")
Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
---

Changes in v2:
 - Drop useless if and ret variable (Markus Elfring)

 drivers/rpmsg/mtk_rpmsg.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/rpmsg/mtk_rpmsg.c b/drivers/rpmsg/mtk_rpmsg.c
index 83f2b8804ee989d..96a17ec2914011d 100644
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
