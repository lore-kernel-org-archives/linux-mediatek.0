Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD708C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:07:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8E72E2053B
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:07:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U7m+sDQe";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gtJRqCnK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8E72E2053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RQ23Q6BWDx2QJL6zQ3QiYJlX08JuDB/kKMxcdaB2Oro=; b=U7m+sDQeZfhofBmozCG5dVBN8
	GYk49fbaicL6/12BQMj0CUCHSAKAxgWNzVCA0n95hs9D95/uqXCw5SMG3cqxr0zucrcTE01D63T1m
	9pO5E5d/XoWr/c1jF0HU8jO2PApjZ2xGpSisJHLY/FeXEDtuFDhuwA8o3STHA4Ii7O+3hwaa1nZoP
	8cEl3izyD9ALyn8s7PxwaF/6kqODcPvz9E6TJ3HvSQA1pI/fXu+W3U/w0BOiIzKvxaWIRrYtaAPqS
	U6cwL/XRFQn7keLqgzsf0TRELA4f642j0xzYiPl1Os5PQVDch9DNInBdUtLukgEj+WIf7h/SQoQxU
	4EskIuOzg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomCq-0003Bp-RT; Fri, 26 Jun 2020 11:07:40 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jokwM-0001gY-SW
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 09:46:47 +0000
Received: by mail-pf1-x442.google.com with SMTP id p11so4411732pff.11
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2020 02:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ju0O0uW2865hksycznBHtUgpNV8XHzR5v3KuNKXnRKE=;
 b=gtJRqCnKsJ7/KtReGeGFmX9uU+fkClb7UaCFvZefifel5YcVKVLpWKbR16XTcL0KRi
 SQ+p8Jz/SCeYDidoYtVOAdmKT9XYAGrNT62/6Oue3mSLR//N4fXbDX/Oqff+IujpBrdO
 StyqeprKYLFhaELA+T+86DyaTYfyzKeOH4AEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ju0O0uW2865hksycznBHtUgpNV8XHzR5v3KuNKXnRKE=;
 b=q8EfZI1HvoaeNPxuXMvzgJ2YtPzQ74Wy4l1/P8nzNFCkjr9ub9maT+5lw+HnTIb24H
 8ZNJFgknX18/+Lc2qDSXdWMAlap4xnVXTQ37UHctNkTWMXzuv3LUOYDrgYDt47533t0R
 GjTl0udRaLrT9e1ZJDE9PmClC8PEcGDt9+WvI0+ed+RYeVYp54+IAyLUIRkMCfmwV0iW
 3xuaCHYjSwbB15CrCSEInBNCqRLhERGSYyxXIoElwPu0/OAif6dKWquL3HJky8fo90KX
 r0+lDiwpl9lOdgrETko5pCT28XhlSiYhw7jmUWjTGpFMK1CtfIxkp/N7UMNITkZWZhLR
 em4Q==
X-Gm-Message-State: AOAM5339vqOeXdsXHpCIX/fymVQ8yW+/oBoVnhPzuHmvEPnoQB3H6Zgo
 jtglJLsulDImjbRE2YKdqTp84qen0ZkOgQ==
X-Google-Smtp-Source: ABdhPJzOkAYsZviFsY47s6Pz1QDXY2VPFW39j2s8prpRXPcCwJzDLMkX9tyA9JPFxd8HTFev1aMWYQ==
X-Received: by 2002:a17:902:7288:: with SMTP id
 d8mr1669811pll.18.1593158768403; 
 Fri, 26 Jun 2020 01:06:08 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.06.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 01:06:07 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v2 12/18] media: mtk-vcodec: venc: set OUTPUT buffers field to
 V4L2_FIELD_NONE
Date: Fri, 26 Jun 2020 17:04:36 +0900
Message-Id: <20200626080442.292309-13-acourbot@chromium.org>
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

A default value of 0 means V4L2_FIELD_ANY, which is not correct.
Reported by v4l2-compliance.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index f833aee4a06f..1a981d842c19 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -893,8 +893,17 @@ static void vb2ops_venc_stop_streaming(struct vb2_queue *q)
 	ctx->state = MTK_STATE_FREE;
 }
 
+static int vb2ops_venc_buf_out_validate(struct vb2_buffer *vb)
+{
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	vbuf->field = V4L2_FIELD_NONE;
+	return 0;
+}
+
 static const struct vb2_ops mtk_venc_vb2_ops = {
 	.queue_setup		= vb2ops_venc_queue_setup,
+	.buf_out_validate	= vb2ops_venc_buf_out_validate,
 	.buf_prepare		= vb2ops_venc_buf_prepare,
 	.buf_queue		= vb2ops_venc_buf_queue,
 	.wait_prepare		= vb2_ops_wait_prepare,
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
