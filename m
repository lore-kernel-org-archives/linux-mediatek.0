Return-Path: <SRS0=4tSC=Y7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90AA2C5DF61
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 03:31:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61AF9218AE
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2019 03:31:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dvA1nix4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XFeWOMUh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61AF9218AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SuA9gFlB/cWnGiUZbe2fUWYWg33kPghN8/LI66fgF/E=; b=dvA1nix4PJFz+O
	WBParzioA5GXfK+0dDQh3FuTYPUqb5y3Jutj6/bG4+AMqtrMVfzavdoW5I0/EQVMSMRhOdyybmFjp
	aBAnjz3ly6tK2Ia+LPS6Ua5m5SDlWlyWUSRvVblLv6gcWy2Br+MmJuOQUV6/oi534I4NfCiRQguwq
	iFahrbXgduc4fC2yIjtBUfTisMWhdXqUjhyMfhBIkJpRkMUgdD6FF/Tu0342RsXHY4uuN1kvH/xa5
	ho9Ff0KQCigxEflypZ9hR/EuGMMDvDUURry+FrZWlUYiqAde30Y60UcsUT0C4Zk7P3a0r+dC4x3pe
	OUcgWukaCmvzPAnHdNiQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSYVq-0000IL-2t; Thu, 07 Nov 2019 03:31:10 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSYVn-0000Hu-EG
 for linux-mediatek@lists.infradead.org; Thu, 07 Nov 2019 03:31:08 +0000
Received: by mail-pl1-x644.google.com with SMTP id e3so465675plt.7
 for <linux-mediatek@lists.infradead.org>; Wed, 06 Nov 2019 19:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YVMKh2e8YQpMospkl4uly62/DXfMMR6TYHQbH303b5U=;
 b=XFeWOMUhS7MWx/RPebBtmCTa3v9cTmuIqF0sIt4h/CPMv889KM470slck2VUqYY2lo
 2UeLrke9Zr2PjxyNv0J0juZAmCq54wv+tpRIlsvEyYIDzX3vo0vDFy/K7IFPJpUMpKMo
 JgZ+rFiOCS4jEjPjW1LKNcPMBrqVqnAqKYXow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YVMKh2e8YQpMospkl4uly62/DXfMMR6TYHQbH303b5U=;
 b=p3sSzQsDl4eq/4Dup2IJsgMcSRalsiRVUiA578W/qOXplRg3rr1QHoyVRQM3r3C2gu
 CwweTakwuErrHATXKiFVL+S5nAwpp+mvHarzHb0VTWEueUnBCiq6AcktTLytw+tIS6Wj
 nvul/PipcoOd3P1pLp+AFGeJSeYAM2pMxrGPPlTx1NAF8vr/drq/EM+QMw5yWD7tjPJh
 9HE2SQCL2AcvWg4T0ZYiIs0/nb2yBOWWOEm6kXst6j5OHFmd91vHZpCkv1rrB7ROSBDm
 9M/qyJkNr+jdiMap34dsHJmz4s1Scjy4hiatnEVhYQRhYMGDXa1ywYi0g606TZiK+Wxc
 kd3Q==
X-Gm-Message-State: APjAAAUGXpZ+ISloYdh5yDzJh8A499lhtHulZe6XQa2QMwiDnJbChcBP
 jJg+Tk1XrqD9PrAcIXKM8C0prw==
X-Google-Smtp-Source: APXvYqxn6IhqqTyBR6NWv+KCnyGaorjTU5whZhdLjWbHn9627vkK/4GPQH+t7Z4ro0MKx+0DNxFmpQ==
X-Received: by 2002:a17:902:449:: with SMTP id 67mr1331873ple.20.1573097464392; 
 Wed, 06 Nov 2019 19:31:04 -0800 (PST)
Received: from hiroh.tok.corp.google.com ([2401:fa00:8f:2:3bf4:6372:5b56:dd4c])
 by smtp.gmail.com with ESMTPSA id s24sm464642pfm.144.2019.11.06.19.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Nov 2019 19:31:03 -0800 (PST)
From: Hirokazu Honda <hiroh@chromium.org>
To: linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] media: mtk-vcodec: Remove extra area allocation in an input
 buffer on encoding
Date: Thu,  7 Nov 2019 12:30:57 +0900
Message-Id: <20191107033057.238603-1-hiroh@chromium.org>
X-Mailer: git-send-email 2.24.0.rc1.363.gb1bccd3e3d-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191106_193107_502469_7DFEC3ED 
X-CRM114-Status: UNSURE (   9.05  )
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
Cc: tiffany.lin@mediatek.com, acourbot@chromium.org,
 linux-kernel@vger.kernel.org, tfiga@chromium.org, hiroh@chromium.org,
 mchehab@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MediaTek encoder allocates non pixel data area for an input buffer every
plane. As the input buffer should be read-only, the driver should not write
anything in the buffer. Therefore, the extra data should be unnecessary.

Signed-off-by: Hirokazu Honda <hiroh@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index fd8de027e83e..6aad53d97d74 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -332,14 +332,12 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 
 		pix_fmt_mp->num_planes = fmt->num_planes;
 		pix_fmt_mp->plane_fmt[0].sizeimage =
-				pix_fmt_mp->width * pix_fmt_mp->height +
-				((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
+			pix_fmt_mp->width * pix_fmt_mp->height;
 		pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
 
 		if (pix_fmt_mp->num_planes == 2) {
 			pix_fmt_mp->plane_fmt[1].sizeimage =
-				(pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
-				(ALIGN(pix_fmt_mp->width, 16) * 16);
+				(pix_fmt_mp->width * pix_fmt_mp->height) / 2;
 			pix_fmt_mp->plane_fmt[2].sizeimage = 0;
 			pix_fmt_mp->plane_fmt[1].bytesperline =
 							pix_fmt_mp->width;
@@ -347,8 +345,7 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 		} else if (pix_fmt_mp->num_planes == 3) {
 			pix_fmt_mp->plane_fmt[1].sizeimage =
 			pix_fmt_mp->plane_fmt[2].sizeimage =
-				(pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
-				((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
+				(pix_fmt_mp->width * pix_fmt_mp->height) / 4;
 			pix_fmt_mp->plane_fmt[1].bytesperline =
 				pix_fmt_mp->plane_fmt[2].bytesperline =
 				pix_fmt_mp->width / 2;
-- 
2.24.0.rc1.363.gb1bccd3e3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
