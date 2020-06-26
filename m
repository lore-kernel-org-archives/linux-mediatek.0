Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFA75C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:06:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE19D207E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:06:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QhJTPsQu";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gM1di/XS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE19D207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W9ZCqloRx/5bX7j+8ZEX2SWEHup4NBkq65hqyqGbq6g=; b=QhJTPsQudGt+juREDpc2MiFB9
	xNKTh0HYF2460KNie4O9CH/JyeQ/kTH+lIMiiiI5if1OF/AE03r+/7ASEkXhNmPlt42fVGQpCFPXW
	F6aKmjxoxM8exban83MaWRUOOPR6DTgLDH11uHiFBeiCXq68vm1GeSAYcBX1xkHTLW5MQrK351jh1
	NNsBJVPMj2ain0BtTccInhiMzyveASiiY944gFvTDIGxZg8CloaNtz+3Z5ZFnsjwxXt3H1hVJivwe
	cXFCc2co1Uvn4lNg1cguBjx0BLIFGgzhSsSJUAh7UZ7ApEHSuGb5NQJc6RD+HTYTOooYcETBV8hIS
	mHDIjJH9A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomC8-0002se-3c; Fri, 26 Jun 2020 11:06:56 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jokAG-0002Q9-5B
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 08:57:17 +0000
Received: by mail-oi1-x244.google.com with SMTP id p82so7477603oif.1
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2020 01:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F6U2kLLRCj0NVNw/QlFArT2QiCEFka/0C4bkaDQjPqM=;
 b=gM1di/XSYvnZe1PpTYoZ7dmbK5xqrvIjVpb6pD0IL5cxvE1X4a2CDs8/pYofq+9/FG
 LpTplu9ZcMLWF3PXIw80f93CwQ69vPwn6p3MSIq9DuYOx3mi+eH8P8SstoyjxNZE4Y5z
 Yu5WMC7PyeIDZZwUyWbUsiarYd9a84UU0zX9Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F6U2kLLRCj0NVNw/QlFArT2QiCEFka/0C4bkaDQjPqM=;
 b=i38ZWs/pQfRYxh6t42TXty1BK5skGolk4YSUur/uNb0mF8LsM/N8BAk8/MB7XGieIn
 5hrGvgJvdcLGd2L44yWE6zYYZwaUlOdL4EBE+FerZp44aWFzYwuc34swGh/MCf5o+ofS
 WT55WaVnuMVHElEbKEw6uxhHWlbB3LjRex2B/Bq/aLY5i6PnvHWItdKUr/+DosqB+UMc
 UtOMxaPN9uDYBoPbInaWH0tLZVUViWKotBhCY2bkDBTFtsN4BXT9nlFuT+UkDYl/F8qM
 VSXwso33WBQb4uB8t9ylBs1cp1jwi0lxhnmc1+/ZvLyz05AGtRO+X/V8TdfTaiE53EjF
 TvDw==
X-Gm-Message-State: AOAM533JBwZBOyWls4UzIlT2nFV98Xl6MsCUvZdNOsW0IkNwRHToqM3W
 2oR7ifhnpSDSqYCtxnh9cNfZfxomSCEbyA==
X-Google-Smtp-Source: ABdhPJyG5OutRcLxxs/czs3n6d1rqJf8k0E9DH0hoHXoW2R21CXvKW4LIRQcUAye8Aeh/mDbigVRRQ==
X-Received: by 2002:a17:90a:5c85:: with SMTP id
 r5mr2188895pji.40.1593158780782; 
 Fri, 26 Jun 2020 01:06:20 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.06.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 01:06:20 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v2 16/18] media: mtk-vcodec: venc: make S_PARM return -ENOTTY
 for CAPTURE queue
Date: Fri, 26 Jun 2020 17:04:40 +0900
Message-Id: <20200626080442.292309-17-acourbot@chromium.org>
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

v4l2-compliance expects ENOTTY to be returned when a given queue does
not support S_PARM.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index aae610e6d4e8..346a33c6869d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -200,7 +200,7 @@ static int vidioc_venc_s_parm(struct file *file, void *priv,
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 
 	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
-		return -EINVAL;
+		return -ENOTTY;
 
 	ctx->enc_params.framerate_num =
 			a->parm.output.timeperframe.denominator;
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
