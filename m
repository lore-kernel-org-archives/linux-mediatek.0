Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAA80C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 09:52:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C71864EDC
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 09:52:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3C71864EDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SD6kbQTpe1uag5LZ25mgKQyhJDG1XxgI9Eqm7clOCxA=; b=uAhgPVbZdN2oU4RBGh83h+iAYO
	+9fJIbZ+NgMtydy5LMYshVBXTeQBEiz+ZJKzJtaiwuhHLP7dBYKm13Y3kKEdbxTg+gunLPSHVPhTD
	HRHv9esgwYi+Knh32hRrXQxmgIIR6Dq6ExwIeFLCq+gHwbDJrRaYHDZaRGjQoUSbT0GjNz0A4K5ke
	pxvnf7cWJk22zln9AvdPZOEMkYsRLlM+rI9vWQKehYsN9MaGWI7RufrezjK0zLTLaTrIpLecAA06T
	1CypeakGUD8ABq9A0+vHRRo3G4tkOFSEwS4aFxCMiO1cOfS8lsMxjUXHwzrgF7hUr82G9JPKys4d7
	etfwJ1ww==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFZnE-0006jz-Ep; Fri, 26 Feb 2021 09:52:16 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFZnB-0006jI-M5
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 09:52:15 +0000
Received: by mail-pg1-x536.google.com with SMTP id g4so5931338pgj.0
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Feb 2021 01:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hnnanrWTNg2jT3kmApBFVzR+WBdWvVozJWPDZ+h5DIk=;
 b=mxANwjkh3DAS+qI3KIQXTBgBicNnM8c4B0dLIzPB14c3GMLGfKY6jy8mA+lHlEDl6k
 IUBv7p0li+7WJ3/Vf0e48Nb8IcUO+n+GSAJoBGbBuKxo0cKA6dtxVGlFKbaIVqZx6rwu
 yHPJ8mj2keKM5PP+TXbB6AC7+kTytdIAFYoZU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hnnanrWTNg2jT3kmApBFVzR+WBdWvVozJWPDZ+h5DIk=;
 b=oqFmP6IRIPYyCGE+AKqJzxHtAmZSU4pFmUQUoDSi32yClpQTOSgnm9vSO8ZaY/TTTx
 EZFAGiGIEBnV1rbroyeo0/OOv3ciewZPJQAfUWymLTi5mTfZrDyrsG/jkAaiwsZKyP4i
 SYQ3dYpkRgkvkpnoGgmFfJwcNNE6PVnn+/MyGFbYoY64rWEW4gC2ub7KYWnbftltGR5u
 GE5IkzygCqCI5Vcp5Xl6RbcCQ9OUPmNpw4fztR+1WqJQalni8eRg1oD935440rfBfUVJ
 TUN2hU1aNLplvyY0EZw8MB/HCNcOIE/lS1vmDHxf/WTNpL2q/2EWBmbUUr0C8g0j2TA+
 PI4w==
X-Gm-Message-State: AOAM533hDLzdyWnOBgPTnS4C2cNVlJbRZ/0JGdso5HiMLSz3ncmnFKYL
 /GOjBJl7cWI0C7MkzXpArDbqhg==
X-Google-Smtp-Source: ABdhPJxKHWkljHIsQKuRZYIEQtpNxuxOZMJigquhnP9JaQDPwnMLx5mQ2HldGwn7oW0IfteZkCPhZQ==
X-Received: by 2002:a63:1648:: with SMTP id 8mr2275871pgw.392.1614333131763;
 Fri, 26 Feb 2021 01:52:11 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
 by smtp.gmail.com with ESMTPSA id q4sm9013458pfs.134.2021.02.26.01.52.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 01:52:11 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>
Subject: [PATCH] media: mtk-vcodec: venc: remove redundant code
Date: Fri, 26 Feb 2021 18:52:02 +0900
Message-Id: <20210226095203.1661054-1-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_045214_414576_7702ADB1 
X-CRM114-Status: GOOD (  10.95  )
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

vidioc_try_fmt() does clamp height and width when called on the OUTPUT
queue, so clamping them prior to calling this function is redundant. Set
the queue's parameters after calling vidioc_try_fmt() so we can use the
values it computed.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_enc.c   | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 8c917969c2f1..d16e1ec87a49 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -442,7 +442,6 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 	struct mtk_q_data *q_data;
 	int ret, i;
 	const struct mtk_video_fmt *fmt;
-	struct v4l2_pix_format_mplane *pix_fmt_mp = &f->fmt.pix_mp;
 
 	vq = v4l2_m2m_get_vq(ctx->m2m_ctx, f->type);
 	if (!vq) {
@@ -467,20 +466,13 @@ static int vidioc_venc_s_fmt_out(struct file *file, void *priv,
 		f->fmt.pix.pixelformat = fmt->fourcc;
 	}
 
-	pix_fmt_mp->height = clamp(pix_fmt_mp->height,
-				MTK_VENC_MIN_H,
-				MTK_VENC_MAX_H);
-	pix_fmt_mp->width = clamp(pix_fmt_mp->width,
-				MTK_VENC_MIN_W,
-				MTK_VENC_MAX_W);
-
-	q_data->visible_width = f->fmt.pix_mp.width;
-	q_data->visible_height = f->fmt.pix_mp.height;
-	q_data->fmt = fmt;
-	ret = vidioc_try_fmt(f, q_data->fmt);
+	ret = vidioc_try_fmt(f, fmt);
 	if (ret)
 		return ret;
 
+	q_data->fmt = fmt;
+	q_data->visible_width = f->fmt.pix_mp.width;
+	q_data->visible_height = f->fmt.pix_mp.height;
 	q_data->coded_width = f->fmt.pix_mp.width;
 	q_data->coded_height = f->fmt.pix_mp.height;
 
-- 
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
