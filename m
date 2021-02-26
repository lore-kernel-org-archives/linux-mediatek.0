Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22991C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:03:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B76E364EE2
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:03:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B76E364EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l8pC5j+X5uBZA6kQSVSMhpMjMDvFpXkl0t96c7LJeXA=; b=k6fL0ZwNMNhzTxkKbfL5/Y0eF
	p/eROcA0Fm15xoERuej4XDz0oJivcYcXK6OHTFtfoAlaG0IOwDnZpgEi7YV9eKdueo7Dw5C4qfeTQ
	mT5EbZr+5bVdMouZ81q4rcrIC3k/pzZMI1bOLvNvopPKtik9sIv8FaoopTjO2wKBwJ+TGwI16DEZK
	iriJbFbvswlubUUqizNAqGipG/mvsUEDDw386FH+rDPm1tJXaHkSW750b/gqsea/n4fO31Q+NdQ7Q
	I0RY7A8QQlHZ6p+PdsUSwSd/+X44DQuV5K95ya5oFgwRUxtLSXn3EU4IhiZ5WYh+QT6rgiPL5M9P7
	/5KxpNE0g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFZxQ-0008G3-LZ; Fri, 26 Feb 2021 10:02:48 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFZxO-0008Bb-Fa
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 10:02:47 +0000
Received: by mail-pl1-x62f.google.com with SMTP id s16so5037209plr.9
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Feb 2021 02:02:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qPSwT+xX3Q2DkuYpMonkhO740MAPhHWpp3ujktCbaHc=;
 b=X4nxA0w5pmGgqLUYe0BOnqj45ihcSpiLztDeSncdzC9m0rQJU9xeUFLykmDZoYIiem
 vQZKoRF4NHRKkv5s/McwJsu8gL+NSLhjKm6bcyiXfjjpl1VA9NMgdWUqNc6Aba+FSHmJ
 sc/S9fjMP3y94Nhg8VriyQ9g1pP9WGiO9aZYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qPSwT+xX3Q2DkuYpMonkhO740MAPhHWpp3ujktCbaHc=;
 b=izieiGPaxfqP8f23rv/i0Pw50epnXroGn+v5g9pDMkBJIp4g9k5NTwjD5lv142769/
 n0XZbjQlUhquPBexK3mJlK3HAbhHXtBhb1eXhZAAZCtLZLOE1QNHv+NwpIzhMuEBOoQs
 m2xVirwh2QlAnwKtEX0rYHimAC7IXTuoQbVLh0lsVm65nB504OXstiB+2F+l8g9rl+dF
 IL1viP09ArlINwihnlzo3g9rkWX4luJL1p4QprjW942bz6lQgooGMaPGVqqE4y94vHn/
 Uk+D7VsGjU9ui6b/ISB8aC9CJACA72jDpwT104CQAWMtmEfzBASgAaLQ8gX7QCBY+TPJ
 PYyQ==
X-Gm-Message-State: AOAM530xmBLUQo6rLH2hE6R9HeZXDVWMlFoEy+loEk9qz7btlXnKUitn
 IHuflt+PtsAjsfVzgvd5itoIlxXechuW2g==
X-Google-Smtp-Source: ABdhPJxxQ1/2RZLhAohciVH031MqHR6rC1b7Td8HnDYnkfdgFOYwjFkptZILSZR9srUYEPTpAj+puA==
X-Received: by 2002:a17:90a:8913:: with SMTP id
 u19mr1816161pjn.59.1614333764019; 
 Fri, 26 Feb 2021 02:02:44 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
 by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 02:02:43 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH v3 15/15] media: mtk-vcodec: venc: make sure buffer exists in
 list before removing
Date: Fri, 26 Feb 2021 19:01:48 +0900
Message-Id: <20210226100148.1663389-16-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_050246_587426_BE100E92 
X-CRM114-Status: GOOD (  12.95  )
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
Cc: Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
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
index 4de381b522ae..8af7e840b958 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -933,9 +933,21 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
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
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
