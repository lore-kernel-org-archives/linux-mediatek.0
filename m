Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8949C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:55 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F25C1613C2
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F25C1613C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=m5MQ00h4tZM8jvGgkyqEeIwtJ7D+iZDCNSMe2Cpw9Kw=; b=AkFdOF35SrRlTSTg72KcV0sec
	l6wPQBso4grnxTI/vvDGMU9T3IPTrGILC62NqopmV8Af9/ND4lwo6eya/5vkq2OHwxzuVwz1b/0Z1
	Zl33bMRRFXGO/sNcNS2XKQgZYWO05Kk4JWJay5RZBLBVI2T0Fsyw6b1Ysngo2fnbU93Z155jqLzW1
	yzd+t22vjXDNXamL+YUReppm0y7O8e33WC3Xi5uLZ6XuDAOys8HfuMU3igls5h2XdoUus8gGa+bwX
	5WORrfMecnnLW5rKOTyfafSubPEdf5xvNn/tTJ01RoTCe/gqei9WmayF01VHTi7e39ByiZiLe1zb6
	21Slcys/A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbLhm-001TxR-0H; Tue, 27 Apr 2021 11:16:38 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLhV-001Tr4-TE
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 11:16:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=LRYcC6JRMw2HH5N7Fjj9wmX95hNIxpHhk8y6CWjmLf4=; b=X2Wj66Rglf1hlTcN2eVNsXN25D
 n/RXvdJ4wsgXuNPCpDK/r3Idoid9v1OdWzWdrOBiBtopqRl+NoDDzjWb6g/nUDxbtj5wrgqLzqt2e
 JVA9YhduIo0emyjEk+xfG6Nw4gRRl3e7W9c0UWloHzJYyeJi7WDJLCnwYFkvr+98Rdr1H80tjr1ib
 VBucN1p+MyAAGOtJAJZVu4tcFqLd8zG0KP8p+xO75WeRVIYf2xPKcP9PaBzwJWrBmA2sIFd84hGk0
 ywEKciOGQyhsgOp8UWH77w8lR4vJ4OVTvNgTfufLbtbYR8qw07aFVHM4Sr/NJ/ZVyMfLh/MZr6urI
 1WxaTjmQ==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLhT-00GgJY-Df
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 11:16:20 +0000
Received: by mail-pl1-x62b.google.com with SMTP id v13so17087182ple.9
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Apr 2021 04:16:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LRYcC6JRMw2HH5N7Fjj9wmX95hNIxpHhk8y6CWjmLf4=;
 b=VEoRlYzOjro25RCira7dZDbU9ivfml8G3QGRi5jr5OzbSxfkFjaMLB8rL7OEqRodtX
 X11RuP0ja5lnP5ZDa//HZEpZgbvEC2yJhuKKOe36lKgnYPShoEzemRfNUmM4vojdMOA/
 15qnFsRA9w5pBqg3DYcsNu+z9923AbSPiHMjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LRYcC6JRMw2HH5N7Fjj9wmX95hNIxpHhk8y6CWjmLf4=;
 b=QNEHFntSMkOhzI3AjFtJ+6ttQlQxrh7vss3+bQXtAZiTXzUD+094+jHAONDhGICC5Q
 fY9+8/NvvVnBgN9vqpU9w9eik0eIwWR8dmShJmNZHzmka1fXSJ0Geqkrwnu3LNLtXeHD
 OiWTNRhhl/f+7F8VK7/X+EN2aWXld516qcCRKgn/w9AskHZUsJorxeUG6i4lIhKQ6Z8l
 mEdb0aMGiHn2HUN/Nxj4ii43hHTr0J9Sm026voqF1aFvd0CtL9hnzcaLEo1UvbSmzBx2
 PqfQUi6lKWqOo9AUu7jYt//Lk7Kq3rfICXiiq9EcoZlVS4TSFxPFWOEKleCp4kblTOwR
 ZyRg==
X-Gm-Message-State: AOAM530XD0+eevkpijoG5sb3Eu4aMmkTEi1pT8ZaS2AXv9aLDQwbE21m
 VlZ9lenQgfYIwOis+mbuPCE2FA==
X-Google-Smtp-Source: ABdhPJwl4Wn0JO9a4KyCbxWyRN2pBdg2gooU24WpXrrZ9iR3prEelIYI1svQrYGlmDDCokocMtCmfg==
X-Received: by 2002:a17:902:7892:b029:ea:b8a9:6190 with SMTP id
 q18-20020a1709027892b02900eab8a96190mr23934992pll.80.1619522178794; 
 Tue, 27 Apr 2021 04:16:18 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:b182:d363:32d0:53a2])
 by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 04:16:18 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 15/15] media: mtk-vcodec: venc: make sure buffer exists in
 list before removing
Date: Tue, 27 Apr 2021 20:15:26 +0900
Message-Id: <20210427111526.1772293-16-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_041619_482069_13F5AA1B 
X-CRM114-Status: GOOD (  14.31  )
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

From: Hsin-Yi Wang <hsinyi@chromium.org>

It is possible that empty_flush_buf is removed in mtk_venc_worker() and
then again in vb2ops_venc_stop_streaming(). However, there's no empty
list check in v4l2_m2m_buf_remove_by_buf(). Double remove causes a
kernel crash.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
[acourbot: fix commit log a bit]
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_enc.c   | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 8058331dc553..4701dea251ca 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -945,9 +945,21 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
 		}
 		/* STREAMOFF on the CAPTURE queue completes any ongoing flush */
 		if (ctx->is_flushing) {
+			struct v4l2_m2m_buffer *b, *n;
+
 			mtk_v4l2_debug(1, "STREAMOFF called while flushing");
-			v4l2_m2m_buf_remove_by_buf(&ctx->m2m_ctx->out_q_ctx,
-						   &ctx->empty_flush_buf.vb);
+			/*
+			 * STREAMOFF could be called before the flush buffer is
+			 * dequeued. Check whether empty flush buf is still in
+			 * queue before removing it.
+			 */
+			v4l2_m2m_for_each_src_buf_safe(ctx->m2m_ctx, b, n) {
+				if (b == &ctx->empty_flush_buf) {
+					v4l2_m2m_src_buf_remove_by_buf(
+							ctx->m2m_ctx, &b->vb);
+					break;
+				}
+			}
 			ctx->is_flushing = false;
 		}
 	} else {
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
