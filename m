Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC57EC433E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F0C720738
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lbWZpvNn";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HvtvAHLN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F0C720738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=A7K+4i4/963uGVNgTMtCtuzAvpHzctaNZ+Wl4dc9/+E=; b=lbWZpvNnRdSx9bOsIhmRQKZ92
	80aVvSLf1dbn70XL9+gEhRg51ctXCJvKF+kau6SxZtiNve72K7leT7gG5CsHZm99lOcQY9dBRHBcv
	mEfdjNmdsUyLbw7qLSNwvCzcjkwutzKwqIw2jU2/Zk1NzUJubfOx4jINtPRw/kHvREBqcDEmdURfV
	J5mKxC07lLz1byn3GeLGdLKBbeOR7AqGj3B/YRnlw+oQlURyVZ3dPtuBqytv41GJG9AETdDjgaeCG
	OVmPm1SBhp3dUn183r+qglxUprkZipkEhzKjUuEUGO7bnX0Ly2HUA7gSqD79JizNS2cyjylHRWNxk
	qX4z1xC9Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k94Qg-0002aP-MY; Fri, 21 Aug 2020 10:37:50 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k94Qe-0002a6-KD
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 10:37:49 +0000
Received: by mail-pj1-x1041.google.com with SMTP id 2so637825pjx.5
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2020 03:37:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DufvN1VHKhvycaUKRq7bCN3zR8+vkOiC/Y9oiV+15/w=;
 b=HvtvAHLNuEBtOSAUa+7D7d50ohlMgLoBYEZZbiVTcm9izI+AGbs6y8jlsmWnkcMU3N
 q4AP13L+wM7iufOmGvaxPVQsglfouW9tD/iCeCQcaJurm3jux6JjQMo7YVc2GHQ4GNH4
 PkOXOLKnCislXsGbtjcFFMwQR625Ue9zBxPVc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DufvN1VHKhvycaUKRq7bCN3zR8+vkOiC/Y9oiV+15/w=;
 b=YBmSYTPWNCWCeC9eray1xa9fvvPue4PebUO0Tw+kgRT+4ezuWY5j3ukqwKBs5FFsnn
 P+VNYJ7O3G3UJzgZHTuTZwxSstjQXIvWTS8qzV+3l6ZZlAKyFXSCMgsUch8F0xiMl58X
 DbxwZ4FMuxar8ryNGe98Tywx0v1yPl5H7rXJTydO1dfexALdvUPszjrEjqSVbXldHyCp
 LzosDmNjks+fMYEHGm/gAZ0ZNGOg7FDh+PV6Z0R6W65GPwbEmRiiPQ+Ja6pbx3/JbGNM
 cGSkXeLCV6jW9uTMj0ms9ez8jx17jGRb6MtD36wCr8iPyHz4CYoDPc4o3ZkJDnAHgZEv
 4hNA==
X-Gm-Message-State: AOAM5336XBr+nNzKYk7a+1jhVzjoIpegdu587dqztkqAfbDzVMTbwJWO
 ZgXRcUtkos2JgUeCM54n+QLJyw==
X-Google-Smtp-Source: ABdhPJwDddg8xE6aw1cgQorjp++aUtEmKN10tnGi0rgs5jvKyG1NLD77bBM5fWtyTpMsucUd1d2s/Q==
X-Received: by 2002:a17:90a:bd15:: with SMTP id
 y21mr1898704pjr.144.1598006247152; 
 Fri, 21 Aug 2020 03:37:27 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.37.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:37:26 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 16/17] media: mtk-vcodec: venc: set default time per frame
Date: Fri, 21 Aug 2020 19:36:07 +0900
Message-Id: <20200821103608.2310097-17-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_063748_695565_724D0A65 
X-CRM114-Status: GOOD (  11.78  )
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
2.28.0.297.g1956fa8f8d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
