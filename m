Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 030FCC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:07:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3607207E8
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:07:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VaSQxq2E";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mVW/w9EZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3607207E8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=En3uJ8IQEJteZ5LSFlVNm6RqyUL1rsKClYtqCX30xDk=; b=VaSQxq2EEkCh9HmgmuJVYM9sJ
	FC578AbsIRTtJALiPFxfb6fOgNtK+K/nnCkkrTcdHhizf49hVoKfMzXNmKEWeENYlQBFQTX+mtp7n
	5bMqvOSgQH2XDwciUhOLIvNeU2ICucYY/ZAEOmuFDANQW1kN+wTKL0EFIKz4tTGNFuQbA8kPJboUA
	EQ3OaRvZiE32mIA+uk0JN/So6JQxTK9G63mjtRk8OrqdhUIiD4CR5WSY55d3LxUaQL5bVXxuraOxh
	hAiTnAkfCpS7m0flNGMbBXyp0swYW+paU1JSfSt0KfBu9P2LoxsRl1i+r0qYcJylz1xfqxA24FkHk
	yzbiHY/tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomCE-0002vo-OM; Fri, 26 Jun 2020 11:07:02 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jokKW-0008AY-RA
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 09:07:55 +0000
Received: by mail-oi1-x243.google.com with SMTP id h17so7485642oie.3
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2020 02:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yhsc5/BUf/rFJ1jmIyJumR2Pa1+ibsatUEuysY587tw=;
 b=mVW/w9EZZM2gM29UIWmTj5kifZrnNr/AGahncLj2c1rD4kIL0j54MCHg7/IjDa+M4o
 CyoT5V0ch6z/f2vnShvOAbZGcJXVbjAzj5nWmUbSKFVm1OGOeKEwUV7eI0H6BXguljsJ
 t7eElD7Wu43wMxC0C5FQCal0yh5spWDkPmnPE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yhsc5/BUf/rFJ1jmIyJumR2Pa1+ibsatUEuysY587tw=;
 b=hM+BOeyQf9k2JJog2VqP3qV7kyVdOg8fQqh46qb4qQKUkUlbVfgeZSDkzg4tAz/A8/
 H9/mL/DwgTXNj/r/sGJzNMvMw2++ZRdiPjb0nNbUMPEm46mC82IDDkCB5O3/ZE/5mDv/
 sUH0m+3wF0JDEA5c5qbbszRxlv/7WmNxA0lcHKL8oSGIyd5Dl8Tu3hwYI6dCFlnXn4rh
 S/Xwa1tGQLyLHXSHtLYg6t8LM+cc+st+pctJRJ2KkonhaOerkByZ9DO3G0Ei7lFt/tS+
 VHomIMW1Lkld+n38i9OrR24dT4bzQx+uhq8UC+IbCsOaIlcojeWmzLspQdHxXo87FBSw
 hNEA==
X-Gm-Message-State: AOAM532rHp0PZauB39gVgBIFJBnbdpp+dpCBs+EfOKP8ayuRSHB5kBvY
 lXVeaQzrZ4yEbdJtkqTYSQuC/T6QYRWyBQ==
X-Google-Smtp-Source: ABdhPJzdWYD3IizlnYuYZNEJGr/sH0TUNx37MN3eJzxNFXZl1S8sJE0ynLh2SdmqqaMrRIj84W4sFg==
X-Received: by 2002:a17:90a:3749:: with SMTP id
 u67mr2045818pjb.129.1593158777720; 
 Fri, 26 Jun 2020 01:06:17 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 01:06:17 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v2 15/18] media: mtk-vcodec: venc: support G_PARM on CAPTURE
 queue
Date: Fri, 26 Jun 2020 17:04:39 +0900
Message-Id: <20200626080442.292309-16-acourbot@chromium.org>
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

v4l2-compliance requires this.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 6cef61cb7883..aae610e6d4e8 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -218,7 +218,8 @@ static int vidioc_venc_g_parm(struct file *file, void *priv,
 {
 	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
 
-	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE)
+	if (a->type != V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE &&
+	    a->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
 		return -EINVAL;
 
 	a->parm.output.capability = V4L2_CAP_TIMEPERFRAME;
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
