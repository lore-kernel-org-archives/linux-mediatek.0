Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECC9C43469
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:10:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C217F208B6
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:10:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fCWVoXgp";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DzaaXGKE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C217F208B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4i6ubFLLN79r601Lf6Jx9/hWPodHVVF55gBH7eWMbdU=; b=fCWVoXgp3YGLwD2zSHiZgP2ok
	0lCxdxszm9gT638zY+WylJN7fhH+QO5zuuqVxMt9Qmn9IdapYi0+Pq3m2qbyjbcLtusolpVIDQXVh
	Si9udDA+KCgHe9a6JFowJqKGRQONZc3YO3YG5wH1iYZzfEfkbXK/obHuA0zI9YE3HFU/Ql0TCmFNk
	w4RimxUgpr1Jkq8lPMJRMiMJRF2SeP02KKcMJhTlRaQdubX9HVYkgTtAkivxZiekIuoG+kTybOfto
	llhHFa2jzzL91BWWaumhXnsolQnXSOMWwy/qbB8Goafz7glP/ryvHtgtuUvmcBTttp4DgpxqC9r/n
	TsKOxuCVA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jurf7-0000sx-Mm; Mon, 13 Jul 2020 06:10:01 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jurf4-0000qd-Sn
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 06:09:59 +0000
Received: by mail-pl1-x644.google.com with SMTP id o1so5065959plk.1
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2020 23:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bQh/36jCZcDByG+9nx4Kj3oZ/1DPecGh3s/vB7rmmZs=;
 b=DzaaXGKEpgVhqKOYBrv2Ua3uko6Tg//W4TOh35bm6GY9/BkI0zqcEeLc6TZXpm7Sfm
 /XgTqZwkYtLSEtoNNHrfGrLK/G/na3RKiExc3Z/NTkrILxC1ZYUiffZ4XZ29QZ9QsAFB
 V9RuE+kPzERAWf/+jzRmBghIJRvi65l8g9G+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bQh/36jCZcDByG+9nx4Kj3oZ/1DPecGh3s/vB7rmmZs=;
 b=MJiQCKcJkxQ34u8yJ3xg62qNDyOMl+sskvvpyXJINvv9OsmNhdWC1BWH9+Ji7IaBPZ
 456IkdgjndaFImp4G0jtlvcrp4edvxldQV/gEop/mk6cZzXj4K8fC8ole6pQikUUw+I3
 XhbOeSilOtVp+8fkSLg8MKNu90io77pbSkqFgHt8JTj5htPYjCVsZZA1LxWnh8mQHBVy
 RhZWsdN8ltrIPfm3GwWYe0lmY5iAY7tmYd+ohaBDfSuNojEh3ccXHjZlXnIq6gM3EaZs
 2YjqSBum3AUSCEWF7t3Znq2IVDGNxymGw62fPBpdTmnjHlLY00z+SN+WEXSer0/9Aw5g
 3h9A==
X-Gm-Message-State: AOAM530mfYedyw5dexdPjJOSXEmft/flTkmoWakoWT7M2aXwTRYr6nk0
 kiv3WwCV76Hs5NEm+CHRpc26lQ==
X-Google-Smtp-Source: ABdhPJxi6dRFSoNOfpe8svPhA4stIApLXMgBoBr29yqAkj6fN7ebrXCw8Sp2gNNc+/KJEwH9NIvggg==
X-Received: by 2002:a17:90a:71c1:: with SMTP id
 m1mr18559733pjs.22.1594620596992; 
 Sun, 12 Jul 2020 23:09:56 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 23:09:56 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v3 15/16] media: mtk-vcodec: venc: set default time per frame
Date: Mon, 13 Jul 2020 15:08:41 +0900
Message-Id: <20200713060842.471356-16-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_020958_993830_F445AAC8 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 linux-media@vger.kernel.org
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
index 1b79185cf922..09baac2dbc36 100644
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
@@ -1197,6 +1200,8 @@ void mtk_vcodec_enc_set_default_params(struct mtk_vcodec_ctx *ctx)
 		DFT_CFG_WIDTH * DFT_CFG_HEIGHT;
 	ctx->q_data[MTK_Q_DATA_DST].bytesperline[0] = 0;
 
+	ctx->enc_params.framerate_num = MTK_DEFAULT_FRAMERATE_NUM;
+	ctx->enc_params.framerate_denom = MTK_DEFAULT_FRAMERATE_DENOM;
 }
 
 int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
-- 
2.27.0.383.g050319c2ae-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
