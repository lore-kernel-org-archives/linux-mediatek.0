Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54068C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:03:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F261964EEE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:03:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F261964EEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gZEoecR2r3QqYfgck/AhCqM2CSF/sb8WrIhBi1vLnC0=; b=JNOG80b2uV/wd4Jld4Kr6oRoi
	yFzON27FuHZPmKdFcxqqUQLC9UEpjxxmHARi3SrqbtZL1iQYsyJTKOBRX25CHFid8XXZKq1C3E9wv
	NYMBiZ+amJs90I7ArqW9TMc34WELSHVzW9ahyDoj/dvkxeursmF6pLVBtamHkDGOB0A+2HcUMrbtt
	8Gh69iO3KZf+bFdo8+Ana5CgnFBks9rIQYcr4O060nYPjGlrHhmL2IJ8l5eER3rqm3cBqk7bZqV/w
	aZrkngWcA9niNux+Ampno8PkzLde9R9MJUfZ1mzgunDDfYKdnEHJqkdLkEJElb2BzTh7GpnLLasQQ
	MZnsIlfBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFZxG-00084j-Gf; Fri, 26 Feb 2021 10:02:38 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFZx9-0007xE-QB
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 10:02:32 +0000
Received: by mail-pg1-x52c.google.com with SMTP id t11so5916690pgu.8
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Feb 2021 02:02:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PcG87Nkjt5QbBleG5vxtSUtdpzRi3L5C7FtYOK30lrA=;
 b=lMSZtP4FYUD2nm5CZRVJ0sR/tBAIEYwJOxYXgHQTg2i50hELRMDTRTTOtz4/f6eJGJ
 XVeR7HrUDD2BpEPi+04FudIInSA3snmvscXcv73gUJlpqj4SA8a+k4qPP/UMnDnzKtt2
 CL5rFK4SCUHmDm5HFws2yHW8poG9bz1W5NpIQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PcG87Nkjt5QbBleG5vxtSUtdpzRi3L5C7FtYOK30lrA=;
 b=apkga1ocG+TB4yvPLhrsvq4oYEWS7gJOA9o5KhDCzV8Wuzrx6J1dzI5PcYGYN1NcBl
 gtCJFsHS2y87+bAuPYp91ztjYGIsh3pYFL9XmU8qsjy/04TYfDDWrJVW91HMGvVbJ+Ef
 VxubZoJpOFtcdm+DHIZLVcQ1m00j7+DX6T1aUVu84IFu235XoIR8lr19mXmbvPVUKa5M
 XDzeg3tENQX/YBdZtNpjAQtK29dasIjWFzYI3sgXTdVqt08h50lLgMBGhS5YDqtBLQkh
 A37pOe8SWK2DuKYTNny6ODDKHXSZClKO9ZLXcHBBsJJUCC9ESoqcLMgRZ2h5cAXbp+JR
 wYMg==
X-Gm-Message-State: AOAM530grtd3+21B7iS97CW1Eopuy/WHOGsbzEDbpdIWxX/Bvc23Uxlk
 9dqZ0q/A9LMwu4Dis6gxpc/Q9g==
X-Google-Smtp-Source: ABdhPJxOVnAMqf31FI6FHypB/fD4gWwwatIP/m8f0M7R/TSznMR+445vQprjiAla28YWfDTWQziEjA==
X-Received: by 2002:aa7:9a09:0:b029:1ed:9919:b989 with SMTP id
 w9-20020aa79a090000b02901ed9919b989mr2699134pfj.20.1614333749259; 
 Fri, 26 Feb 2021 02:02:29 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
 by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 02:02:28 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH v3 10/15] media: mtk-vcodec: vdec: use helpers in
 VIDIOC_(TRY_)DECODER_CMD
Date: Fri, 26 Feb 2021 19:01:43 +0900
Message-Id: <20210226100148.1663389-11-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_050231_908119_79FBAD9B 
X-CRM114-Status: GOOD (  12.35  )
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
 linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Let's use the dedicated helpers to make sure we get the expected
behavior on stateful decoders as well.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec.c   | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index c286cc0f239f..8bcff0b3626e 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -52,22 +52,10 @@ static int vidioc_try_decoder_cmd(struct file *file, void *priv,
 	if (ctx->dev->vdec_pdata->uses_stateless_api)
 		return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv,
 								cmd);
-
-	switch (cmd->cmd) {
-	case V4L2_DEC_CMD_STOP:
-	case V4L2_DEC_CMD_START:
-		if (cmd->flags != 0) {
-			mtk_v4l2_err("cmd->flags=%u", cmd->flags);
-			return -EINVAL;
-		}
-		break;
-	default:
-		return -EINVAL;
-	}
-	return 0;
+	else
+		return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
 }
 
-
 static int vidioc_decoder_cmd(struct file *file, void *priv,
 				struct v4l2_decoder_cmd *cmd)
 {
-- 
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
