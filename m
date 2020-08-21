Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5324C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B3EA520738
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b0stavpl";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="baUyyaPk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B3EA520738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tQCPgFWNzNjUt5QE1slCmuZFQq6/SfD9L0mUSzK9Glk=; b=b0stavplZjOwUpCnzC+F8OaiE
	aQs7kQjfGpPhHGF61isskx4sfJv9aH2J2OcgdTZvvl08LeGiEiAWcOafJ1FX+cESRW/FD3eZ57Wgn
	LW2q+64NPuG3yTkYctC1hU8rgCwTw32vTwIaP5m6V20egt5fAQUgnQrs0G1BmWk3BIMo3fBTenbWj
	fz91PPaSFmUghNZFguLDTZmKJPg4pyf5l2SXtup1on5qVXJDv+ffdfYIPA7zYLJULxB770Q9qlrN1
	bjGz4aM+Uf0JpGSkZn/WCxkAnsLeR//ITrQiLNMFNDO0o5A0tmuVBRnsRxmpcoa82UZYdxjoDxBJv
	/s5f53aWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k94QC-0002QL-HC; Fri, 21 Aug 2020 10:37:20 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k94QA-0002O3-5o
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 10:37:18 +0000
Received: by mail-pg1-x541.google.com with SMTP id p37so814675pgl.3
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2020 03:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NTmGXWmoAkqQ//i02Xxg3wsdKsf3MX10rBoHCy6DAbE=;
 b=baUyyaPk4NuuofUuSsVJuHgmGDxxanAd0ZY79R+lMaJcZ9CfNOz6gM7k2a/r0LdAUL
 O7FOXH/vRZBl6sFZEa0rbk4P/3LxT0sDb2Wwr/UrVdYmcyznnXe9Th62EW4EUnMRCPTc
 7NyEY1qRj8kFjlNlIthQsFEwMk6uKrSSyZ2O4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NTmGXWmoAkqQ//i02Xxg3wsdKsf3MX10rBoHCy6DAbE=;
 b=H3H1wG6TxFiy7i1VmOSfLwKI6Zm7QgqeZBfRWuJQ/HeObkauiMhSKxf4Ad0rRNjaDf
 yr9SlQOimjLyXV6atXXiaVWXWAPJVslH20I061FAzm+pyGONGeEP6l9oXv64uPUwUpny
 CPRzcMIw9UH8snFHdVOr5Qc/9J7SXaqSaEag+DlkPROtnnJybclGuvCl7gAvypQ2hVRK
 foxmIpehAXKnhxpesHOBKFUZ2DnoK0hipnoNykBmPS4/6tv2zzBueY6D7DGn0eVmFF71
 CMO+jMpxcXYJtQgH4S3UV35OtA5TGcn7zHMotZiBk/J5ru8kq0lvD6iqjr7xTQoPUqB+
 STKg==
X-Gm-Message-State: AOAM533lzcijvB1V5kRUCpk85qM8cmvGkgRdMafLsa7Z5FdfzAvWJp8d
 +BDT9wjYLz+EIbdS9T8vnafSM0pXLAYo5S58
X-Google-Smtp-Source: ABdhPJyF/baDtWFr/TfueZNpoHPnrddg19+ju6pSWd/HAlX12nToqpklR0u9IZ/HlwBZRtPLTiMw4Q==
X-Received: by 2002:a63:5049:: with SMTP id q9mr1897800pgl.219.1598006236301; 
 Fri, 21 Aug 2020 03:37:16 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.37.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:37:15 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 13/17] media: mtk-vcodec: venc: set OUTPUT buffers field to
 V4L2_FIELD_NONE
Date: Fri, 21 Aug 2020 19:36:04 +0900
Message-Id: <20200821103608.2310097-14-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_063718_243029_32D6B279 
X-CRM114-Status: GOOD (  11.89  )
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

A default value of 0 means V4L2_FIELD_ANY, which is not correct.
Reported by v4l2-compliance.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
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
2.28.0.297.g1956fa8f8d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
