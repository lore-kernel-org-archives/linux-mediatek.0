Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16D2CC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:11:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5B412080C
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:11:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xgKYyYBg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="AeFZoIN/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5B412080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A/l66Y6DkCCln7zE9Z/fJPKsSh73AQ0lvGh8rEaj5N4=; b=xgKYyYBgBLqsaKn7rMHBRzaFb
	1fLZPR0WVyDA//qcSTooAx3HMS41hH/WjBh+UQzuqA+mFq4OvPmGZKMv9NweL9rt28giZ8rMF2jNp
	7LAHEW99k1SLOf/AzCeVi177F0VlGAR9Fs/0oHPsOuP6tcjTsjtSo9sF3IXs60Ujlj2k95N3QFv9a
	U5a34HFka4sSjyiwXy/GNFYJvzB9ge6KM/YYLnUFU/BEFXmwwg5c8IZFVqvK52CHxBJ5l8VBatTPs
	o2iCz7w6FJtlNdrtmdMCXaDXMDAnmsT1x+G/zNtoirlFdE3bWN7Q4mkd+TMNqLEjEoy2WHquarQLD
	x2k/nVOGQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomG5-0004hI-IG; Fri, 26 Jun 2020 11:11:01 +0000
Received: from mail-pg1-x542.google.com ([2607:f8b0:4864:20::542])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jomDU-0003Tl-8e
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 11:08:39 +0000
Received: by mail-pg1-x542.google.com with SMTP id t6so4822625pgq.1
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2020 04:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=e/SQkaIkQYThWAWodZ31ujagTBZlI1iDzzrB4vJVM6s=;
 b=AeFZoIN/fr4cIMvuYSHhq5dGMtYtBpPIl51KTcus8jLUWyrsd3bW/QasAwLiUnyKVY
 XZpKXuglmID8LOTPDjHjFNu2TwHeN1HZkNaV3zQfD9hr5pTYjtzScffE2nRLKxx6ik91
 TzRISkAX1ZMMqV6aGLGPlhHGNAFPFkw14UNIE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=e/SQkaIkQYThWAWodZ31ujagTBZlI1iDzzrB4vJVM6s=;
 b=lDl3PwI5I9eeLBnmHWSI7zLjZ7ShWd0Jqs622gVZsjeARvJ3BJgfNvilAPWf5emhmy
 BChco8Sva7NXagyqzHXxdvQLdv4W/rm32qLHncP7lths0bHg6Lt3bLXaskI2WPg+r/MV
 qhcGKEU6U6q5aywoN0ymaxqnVbA+0PWJI3VChC508Q3tOULmhSobcZ23HEDP5zT9XniX
 JPIAVwdK+DeKsUl/+KbMbyjuubdFOy2nPQerOlbvD5cd3uy74HnbQYH1ZXO7XAVzVTkx
 fW1Lv1yiM1EAU9HcGrh23I4MdYZYHl1Vg+7Rhmg1mlUl0jNAVOmcKQAmIgPshx4ZXJCt
 akaQ==
X-Gm-Message-State: AOAM530U1GqflJKd9OpHdwCPj56rIs7nu5/+1atpYNFPmqWKFsQl6VDj
 uLczl/YKygXS7rRyb6MpzLFGgN9BRazlwA==
X-Google-Smtp-Source: ABdhPJzcGcfKhOrU39qKlXLmxNs5YJdjrelLysgC2xeVATizxK3iWSsOEOtEmDWKAZT2UkkJEJdMbA==
X-Received: by 2002:a63:9246:: with SMTP id s6mr1658143pgn.22.1593158783791;
 Fri, 26 Jun 2020 01:06:23 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.06.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 01:06:23 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v2 17/18] media: mtk-vcodec: venc: set default time per frame
Date: Fri, 26 Jun 2020 17:04:41 +0900
Message-Id: <20200626080442.292309-18-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
MIME-Version: 1.0
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The time per frame was left initialized to 0/0, which make the driver
fail v4l2-compliance, and also leaves it potentially exposed to doing a
division by zero.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 346a33c6869d..c9756a4748ef 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -24,6 +24,9 @@
 #define DFT_CFG_HEIGHT	MTK_VENC_MIN_H
 #define MTK_MAX_CTRLS_HINT	20
 
+#define MTK_DEFAULT_FRAMERATE_NUM 1001
+#define MTK_DEFAULT_FRAMERATE_DENOM 30000
+
 static void mtk_venc_worker(struct work_struct *work);
 
 static const struct v4l2_frmsize_stepwise mtk_venc_framesizes = {
@@ -1199,6 +1202,8 @@ void mtk_vcodec_enc_set_default_params(struct mtk_vcodec_ctx *ctx)
 		DFT_CFG_WIDTH * DFT_CFG_HEIGHT;
 	ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] = 0;
 
+	ctx->enc_params.framerate_num = MTK_DEFAULT_FRAMERATE_NUM;
+	ctx->enc_params.framerate_denom = MTK_DEFAULT_FRAMERATE_DENOM;
 }
 
 int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
