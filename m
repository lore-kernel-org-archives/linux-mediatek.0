Return-Path: <SRS0=Eo9X=NA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 592CDC4338F
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 13:20:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 131066101E
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Aug 2021 13:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 131066101E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Mime-Version:
	Message-Id:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=gbklqg2SijKDHHT0EfpiP4FM+aumHKzoFk2RvmjMJcc=; b=vJ7
	TNgisjOilSfLSumd0QO+fB9d7/U+6PkamTRBStWt+djbiwxWXuOrJW4pk5ZmDRc9oEwL+OHgQNfB7
	mxTjkYZb8PNcqVy/pQL6SklXH9ViYUxhQGXQ6g9K8PdlFChkjoCFTbIhOOJJYFNwx+wiNzeHA5/E4
	wY68FRP9m2lRKLlx2xPeqste+auibA6nJOabUPL56pm+JadgBg34TR8ZZf1oArsWY7m/hos6ogsEk
	d+yrI11cakqLY2yd4GLPLBjzMF6OT8Aib0ZATM4bevHqx41XzHnKOfFK/ZJZjlqORT2XpJjv5hJel
	FWQznRVuH0iIWqijs6CJUJY3DqUsJqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mD5CY-000kl1-Q5; Mon, 09 Aug 2021 13:20:22 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mD5CL-000ki8-E8
 for linux-mediatek@lists.infradead.org; Mon, 09 Aug 2021 13:20:11 +0000
Received: by mail-pj1-x1049.google.com with SMTP id
 g12-20020a17090ace8cb029017797b2c0f8so14324627pju.4
 for <linux-mediatek@lists.infradead.org>; Mon, 09 Aug 2021 06:20:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=B9pfgHx94Mp6VS74RBiZjYF3tpik3lJpO946s0UsSic=;
 b=mAuIQtkaP0fzYFW6h6JQa1cEz9AoQfPARLqb+YpSwBvFqfEfZKQSAaVbFoKFeaNcJd
 cydTti3lobCvmQGsRBpQg59HWlDCqo8Uw1xZNVeFi+eOTti9jtI/b9awQul606CQAFoP
 I9uClYw8qm7bBimTcc/VZKLXqTMH7IMB0OgPikzz5fo3vR4DGXXq4x56iKUt01f6lqNV
 yg68CHhUPHT10W0kQ/douHD9tA/fYY6MhUaundwT4sEVWnVNmE/wrEoL1oCsViqHGwbe
 5bZwgU1zlNnVn9woI7LciBvWYb6ywvXOhQB3U6hdyFr5YYDhz+wltSuMYtjxusBx5xb6
 o+Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=B9pfgHx94Mp6VS74RBiZjYF3tpik3lJpO946s0UsSic=;
 b=IA6uv8v0dbn3dDW0DBPmifQzSffyMYtLTujPAu8ZLwYj8KjKmw2kLAP8f6TAgeWGup
 DzCULOHH0Kwvmmhh3XnSBW0+jKQkPMbMEQLO5BsZg1xia/7BFDWxKXCttJcZUljJyAC2
 vB3NokPG+VWq9zgeOh8XY0YzjdWHj05/fCoKq9BkbAOfk82TZoEv8Ejy1gADJ6GqhhEg
 3EGDBhXO6ypTWnP0E7KPtXUqcqy1VikoyzCgfgEpHIgRKkSNmLGHcBTk/SzAOxF/q0u9
 N43GLRM5KVn6vJiuEw1C4gdvwpoRnrw2K+HtgJcVQ/rEtGP/DnlH8rAta9800qUXcOKK
 86Gg==
X-Gm-Message-State: AOAM531zh6akEAAxLcKqZmcLcDILdSPdTm3yYEsKQxO49gpzowPNQKNR
 6IBZd42g3P5hveMqVhM8eM3ebackZC7A
X-Google-Smtp-Source: ABdhPJxIewl0V72VGtEJkuskjE1bDRXXbrFucVnESfeYsyGu9cj4xHe6y8NbEVYV0E1hDY1gZAG7egqHh8t7
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:8c61:f7b3:b14d:6bb2])
 (user=tzungbi job=sendgmr) by 2002:a17:90a:7886:: with SMTP id
 x6mr121pjk.1.1628515207043; Mon, 09 Aug 2021 06:20:07 -0700 (PDT)
Date: Mon,  9 Aug 2021 21:19:40 +0800
Message-Id: <20210809131940.2890108-1-tzungbi@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH] media: mtk-vcodec: fix warnings: symbol XXX was not declared
From: Tzung-Bi Shih <tzungbi@google.com>
To: hverkuil-cisco@xs4all.nl
Cc: linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, tzungbi@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210809_062009_520865_66F344B0 
X-CRM114-Status: GOOD (  11.88  )
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

Fixes sparse warnings:
- warning: symbol 'mtk_vdec_8173_pdata' was not declared. Should it be
static?
- warning: symbol 'mtk_vdec_8183_pdata' was not declared. Should it be
static?

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
The patch applies after series [1] to fix the follow up sparse warnings.

[1]: https://patchwork.linuxtv.org/project/linux-media/cover/20210806041530.4170869-1-tzungbi@google.com/

 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h     | 2 ++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index 9fbd24186c1a..46783516b84a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -65,6 +65,8 @@ struct mtk_video_dec_buf {
 extern const struct v4l2_ioctl_ops mtk_vdec_ioctl_ops;
 extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
 extern const struct media_device_ops mtk_vcodec_media_ops;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
 
 
 /*
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 36ae3e6017f0..e6e6a8203eeb 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -372,9 +372,6 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 	return ret;
 }
 
-extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
-extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
-
 static const struct of_device_id mtk_vcodec_match[] = {
 	{
 		.compatible = "mediatek,mt8173-vcodec-dec",
-- 
2.32.0.605.g8dce9f2422-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
