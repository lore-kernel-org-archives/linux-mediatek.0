Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41329C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:24:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00435611C5
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:24:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 00435611C5
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=PNq8YoGQ16YmbWtENcBzhkDW/KzYIt6qwjp0/t9aYs8=; b=a1d82oCfYvOSzmDTQ4UVH8SlU7
	cSHco9JVOlvUJ9R36Ua0LR9+328WbEeduPaZvnmDAeJCkDMsSlefKDly8VeBfegabILDRcl9bO6Xr
	eebU+TlkIS3aneg0PJD6DKgWbWBmLall5bu9uL1ETwnGLglV/JZSGUUkkxExyQaveqYJETFxwiaGX
	736LC8gt+rWrfFux1jU+aQNME0U5ithdf+I2V2e4+wPvoYnKApbCGo6ekxW2bvRQXCVghOmDHhcLN
	u1qs+zta1W7LeP4bUPs+3We/Bn6YRrmpnovhL/8BjfRsxMmYWa72+QRp82IrwVg2yI89awwTTLVSc
	wuYbwlNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBrPc-00BX2w-IM; Fri, 06 Aug 2021 04:24:48 +0000
Received: from mail-pj1-x104a.google.com ([2607:f8b0:4864:20::104a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBrHp-00BTES-Gb
 for linux-mediatek@lists.infradead.org; Fri, 06 Aug 2021 04:16:46 +0000
Received: by mail-pj1-x104a.google.com with SMTP id
 q6-20020a17090aa006b02901779796d79eso1513133pjp.1
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Aug 2021 21:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=VRCp1gt1+Tm8DKrP/bEBz4/wYC+uwc+iQhHn0pgVUPM=;
 b=qqjK53VfiiIyZXKieqMrPne4RfS+RoIGd+Vs+zgcRBTVQ2or7efv+fyQDpWwa/v6yc
 V2Nm8vCaiHPeMuv0tWK3acbZMTTGJDO2oJoTzidqaYzCZWcB7J2DhUhxwHKq53O8JkJj
 SK1Rbi6+5eeC95kPp0xm8PkPJ/3MiwEdsG0raX5T/LIC3AANrZBoQJC5bjEdBN19taKt
 56LPVMFcKBRQ2XWEXM4WGz6TQAEbMHjUXAUGOaoupgKZGLBfCfCUN+ygKSi1umW+qeBT
 l4U4qvtDOxXKoCDa8E+CsPe6LE9rR/fz8oUc2TPmRpmzzPA2zYjWsQjq1ZWbd0GKvZTC
 WX+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=VRCp1gt1+Tm8DKrP/bEBz4/wYC+uwc+iQhHn0pgVUPM=;
 b=HovpWHHph/D8yoHca05steYSL/cafz0yi8vVPOoug2ZfUKdsW8ePQDn/k+eXtDzEIF
 NFnrXMKVolg5860bmVDQz8kU2Z92XVsWV8aTu7S8BnPMKnCl/5o5KyKV+zMnaJxyRfvs
 POnKeWis8MR7+0sdTNbkH5KSavk8bM7CtxidAlshJDe/xAW5f/V/OKCJepjKvtBPhmdA
 C8OTnKS6J07N+1HLoWdMQbjk868WZFFW0gMOmsgsWtbs826kuche8PBr+/54cA6IZ8Qh
 nJGdW14IDj5MV2GR823kbL/v0jHqekOlBuNQX5JUGNtJFKnkaWYJh9chufQ1+AV2NLMn
 bjqA==
X-Gm-Message-State: AOAM532veVfMMD7QnwGJyGK9/XrjaGGJ/MZfI/sEmXZdKCgfEKxrQFfY
 t4vi+EuQ26AH920lwulvi+Dqi36Lp8mj
X-Google-Smtp-Source: ABdhPJxYcHrjQQ4a3Sxpy0Mj49WvdIyMPVK6N5vcc2g+T/OMwr+DJisr+Meut0Leq4TWpLJPRTzKEAjWkSfK
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a17:902:d652:b029:12b:45c1:21ba with SMTP
 id y18-20020a170902d652b029012b45c121bamr4702610plh.9.1628223404249; Thu, 05
 Aug 2021 21:16:44 -0700 (PDT)
Date: Fri,  6 Aug 2021 12:15:30 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-15-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 14/14] media: mtk-vcodec: enable MT8183 decoder
From: Tzung-Bi Shih <tzungbi@google.com>
To: hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com, acourbot@chromium.org
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
 dafna.hirschfeld@collabora.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, tzungbi@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_211645_622704_A1C6586F 
X-CRM114-Status: UNSURE (   9.62  )
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

From: Yunfei Dong <yunfei.dong@mediatek.com>

Now that all the supporting blocks are present, enable decoder for
MT8183.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index fe345aab9853..36ae3e6017f0 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -373,12 +373,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 }
 
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
 
 static const struct of_device_id mtk_vcodec_match[] = {
 	{
 		.compatible = "mediatek,mt8173-vcodec-dec",
 		.data = &mtk_vdec_8173_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8183-vcodec-dec",
+		.data = &mtk_vdec_8183_pdata,
+	},
 	{},
 };
 
-- 
2.32.0.605.g8dce9f2422-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
