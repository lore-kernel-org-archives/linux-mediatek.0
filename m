Return-Path: <SRS0=tuDC=AH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD65C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:24:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57C22206C0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Jun 2020 11:24:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aSxjrNrj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="QZgwZVv0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f8w7ucx1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57C22206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=33cd0z42FihrKAosv7R13rcCBzj0mapG1E7Ga0wjAKM=; b=aSxjrNrjat3A7NhBLamxcdFkx
	IQMyK4ogDJ/hv45NUe/vHRHgHVa1YnyunUADXyhPixICo+/+j1n57vbq9v6zwg4HmeqfHaKua+nDN
	rc7erWtDwwJ99zZSSiU361oURTS491ztdgJL+ceff6iStqWX4oAbi39Zy6lwfqD0upZAONwEkWKTD
	GSCHoMZQdvcjoLhK256GcBRsWXzIZghcRwdcNgBSjMdexArZNb400S2hiYZ/vUvMDOeBxYtd8smKZ
	Sdjx3wEnZqLE1g+7BpP4ghHGW8iVK6kfsk9mKRg8J5je12H+lJW0lv1EbGo4+ne+E5pedBjB/nUvT
	epbWi939w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jomT1-0001Wu-MU; Fri, 26 Jun 2020 11:24:23 +0000
Received: from casper.infradead.org ([90.155.50.34])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jolEN-0000aR-4L
 for linux-mediatek@merlin.infradead.org; Fri, 26 Jun 2020 10:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Sui+aE36W22DqtS2fgsG54iRuVi4BhJkSmMBR5vkIvo=; b=QZgwZVv0Frk1iiHEdGmv+l0P2p
 WiXXAShe44yI2liv6/y5oyk4EaQ2oqOWu5ouyY85xD/Xr3VxlO349aoyI4PPddjUhm4+2w87qVlBH
 GyAzEr1c1MhEuAJpsgOzdlaacs3uUWP93bXHn9/OR56DnFGblZMc7uWXm8Si3T1bb0RMP6uigsbdh
 AhPH+ZnxofpOKNEwJQkX+XdJ6yvMuJw9BFELNbAVAYf+Q2k8i9pNqtAJIViKsoJYnchRfiHGe1rpY
 eyvyt0vARA//M1k7+ljKM7z9wp1FVVw1Bw68UAFPTUweWiXKT0BamEoMIhgyYUxcu/e39T4s0hcUG
 5UpBJe/w==;
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jol0j-00080s-QA
 for linux-mediatek@lists.infradead.org; Fri, 26 Jun 2020 09:51:13 +0000
Received: by mail-pf1-x441.google.com with SMTP id u185so2399805pfu.1
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Jun 2020 02:51:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sui+aE36W22DqtS2fgsG54iRuVi4BhJkSmMBR5vkIvo=;
 b=f8w7ucx1BwENgxJR/Rc1pSalVXftgwFc0KkcZbAs/TcppB9xRQDLPkJNPWLBHngmxf
 +I/rAXJjvWJX37+ZaQHg0f1px3DVH8/oo6ANHkBcm9F3LrqCUIkTvKyMC78TcLHx02lB
 YSwHRp+hLpwilQul5ijJegqktK8N6qIeJ+TPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Sui+aE36W22DqtS2fgsG54iRuVi4BhJkSmMBR5vkIvo=;
 b=JukpLsp8vFLH3Y4ymPixBfGgQ8mo7640vhlCQ190PTBPQmNNZ7RmuQhfOjsW/PFCKm
 C8yjpfjLTuQ/EzVmlVDa8Kc/GovnT6O1mJw+Jn1F/euWCpo0icXz0rHPx4H2wGpMfWdN
 ZnVzqmJAj3Uqj5Lt924xlI6IFNsoK7ffdGuhYmMpMXmlnNvhhNEYYUialnUuW7Ly/4Bx
 Au5T9/pDi7Mg10gyH9lSaciogoa8izgGe+MCVY41EGaleNNRYeFX35d+hHb1vNjdeRFK
 EA+F2Z28Dlp4nT2e83LZKVLnIa5J2jcHnbu0MCzDQg1DF/N58kTxUzNVRnPrEws4uvKR
 dIYg==
X-Gm-Message-State: AOAM5312ijUqmuXRwYKM1caHXLTJZuNALavRADLzdKFWdXsEN58j3Bi8
 hpZWiHyWrDluugUiKqZb8uTRAbJenrf8LA==
X-Google-Smtp-Source: ABdhPJzZ7MWGk9jvC+DPhRc7+KTbwzgKCEciabh8q+jgkASL1WbRsleAMj3y90vF2Ou1wTEbTB2X+Q==
X-Received: by 2002:aa7:8dc1:: with SMTP id j1mr1625300pfr.194.1593158765373; 
 Fri, 26 Jun 2020 01:06:05 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id 137sm21809843pgg.72.2020.06.26.01.06.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Jun 2020 01:06:04 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v2 11/18] media: mtk-vcodec: venc support MIN_OUTPUT_BUFFERS
 control
Date: Fri, 26 Jun 2020 17:04:35 +0900
Message-Id: <20200626080442.292309-12-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200626080442.292309-1-acourbot@chromium.org>
References: <20200626080442.292309-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200626_105106_195054_FF1261CB 
X-CRM114-Status: UNSURE (   8.87  )
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This control is required by v4l2-compliance for encoders. A value of 1
should be suitable for all scenarios.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index f2ba19c32400..f833aee4a06f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -1206,6 +1206,8 @@ int mtk_vcodec_enc_ctrls_setup(struct mtk_vcodec_ctx *ctx)
 
 	v4l2_ctrl_handler_init(handler, MTK_MAX_CTRLS_HINT);
 
+	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MIN_BUFFERS_FOR_OUTPUT,
+			  1, 1, 1, 1);
 	v4l2_ctrl_new_std(handler, ops, V4L2_CID_MPEG_VIDEO_BITRATE,
 			  ctx->dev->venc_pdata->min_bitrate,
 			  ctx->dev->venc_pdata->max_bitrate, 1, 4000000);
-- 
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
