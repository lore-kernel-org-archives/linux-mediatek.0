Return-Path: <SRS0=xfzx=33=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C83C5C2D0B1
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 04:24:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9B89922522
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Feb 2020 04:24:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bVqJTqx4";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eiiOqXCQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9B89922522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yd4iaRe1V1PkLu+oFb+JChLAkhXpXJ3gnh+vbhgnMSw=; b=bVqJTqx4MEUo7Q
	M/DUmmtkp4jyfsIK5MdkxQLZWAIQJ0jtMqiwI8qtRIzjtd1HqwGg/7WR70j2Il9afFVUVH12XLutj
	/vNT7YyGiaDIACjqCxx/TvHdJ2lEqEfbbiejKVvXdasJko0FQB7nSwCBO6CyXcW3z7S2rlXacllFY
	dVND+8g8tNLnEflRnA09upklZ630fLHFdNFKEwWNCKUgn/HYEh44i4Qw1gMcLJTXGv0ClE8SQHhLO
	smNnoOCU9k+5MlDaoD0trTo9TXJEvY6u4JFLyzbK9Qtf+UBdRDojGRqzl0VvubpdTQpvQKR97zeuJ
	/R1YED6L1S/dyuZXiwTQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1izvBS-0003ib-JP; Fri, 07 Feb 2020 04:24:02 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1izvBP-0003hx-AY
 for linux-mediatek@lists.infradead.org; Fri, 07 Feb 2020 04:24:00 +0000
Received: by mail-pl1-x642.google.com with SMTP id p11so456924plq.10
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Feb 2020 20:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t4CLMTIbjn78HyIw3MbTj9fsK/Q9HVmk1YRH08HvFW4=;
 b=eiiOqXCQpKTTs3qcK0ClTRSeD0ED+jYP1J9vmKsXeIxVqH7nb3dGN8TXf1xmZgDlwZ
 y2cRaE8wwKl+xqQwb9n1WEutzhlXPKh+ksiz8uU4xYzGVv9hHFpOq1Zh4lOqB+UysOVM
 nlPGDQkicWj7hfppZ1DzZB4KXiZedkDnLILEc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t4CLMTIbjn78HyIw3MbTj9fsK/Q9HVmk1YRH08HvFW4=;
 b=PtrXNcofiuAcUvuSa0ThLj4E1WQcoITFuMDPnCRtjlQmt1q5f5lEsfLDpcuGDiv2kL
 1LellYuo3AeLcTNNR6woBp7HzmRanVmSwiPQc4r3AA+nyJ5M8yfnhjumEdf1IWq47tov
 +x/4QL0XidrmFQQwS0L1Mf1BbbOwmUF5w/mrT6NR9JCugFyNd7Z7cJXxMFEs0Pt9ZGyM
 LaCJf24V4+1cgb5yOL62mjG2noo5GMheg90dafY3uiWfvSVAp2PyUuoYoV+cTINqpErD
 4RUkHkVofCRJWOjfFztOl8MenGTu96Xm0JA2GohUp2s8fuWLDbC00oMkvcGXRwz5E2BF
 H35A==
X-Gm-Message-State: APjAAAWolFneNAG3RVq7pPKCxhO5jCXjHWPXFKObIaBmRwNZCmqkPG9g
 OtIwp5Xg/54IHY4ZSHkspR6Hqw==
X-Google-Smtp-Source: APXvYqxiM3mqXCuN//rbnMylmv3QEfgT2tAo0lrKJQKSE7Su2Tg5GR9a9AXOc66j0jtTmDYhbnQnRw==
X-Received: by 2002:a17:90a:3ae5:: with SMTP id
 b92mr1540962pjc.26.1581049438091; 
 Thu, 06 Feb 2020 20:23:58 -0800 (PST)
Received: from localhost ([2401:fa00:9:14:1105:3e8a:838d:e326])
 by smtp.gmail.com with ESMTPSA id v7sm950245pfn.61.2020.02.06.20.23.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 06 Feb 2020 20:23:57 -0800 (PST)
From: Evan Benn <evanbenn@chromium.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mediatek: Find the cursor plane instead of hard coding it
Date: Fri,  7 Feb 2020 15:23:51 +1100
Message-Id: <20200207152348.1.Ie0633018fc787dda6e869cae23df76ae30f2a686@changeid>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200206140140.GA18465@art_vandelay>
References: <20200206140140.GA18465@art_vandelay>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200206_202359_386915_D7B86495 
X-CRM114-Status: GOOD (  10.42  )
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Evan Benn <evanbenn@chromium.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The cursor and primary planes were hard coded.
Now search for them for passing to drm_crtc_init_with_planes

Signed-off-by: Evan Benn <evanbenn@chromium.org>
---

 drivers/gpu/drm/mediatek/mtk_drm_crtc.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
index 7b392d6c71cc..935652990afa 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_crtc.c
@@ -658,10 +658,18 @@ static const struct drm_crtc_helper_funcs mtk_crtc_helper_funcs = {
 
 static int mtk_drm_crtc_init(struct drm_device *drm,
 			     struct mtk_drm_crtc *mtk_crtc,
-			     struct drm_plane *primary,
-			     struct drm_plane *cursor, unsigned int pipe)
+			     unsigned int pipe)
 {
-	int ret;
+	struct drm_plane *primary = NULL;
+	struct drm_plane *cursor = NULL;
+	int i, ret;
+
+	for (i = 0; i < mtk_crtc->layer_nr; i++) {
+		if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_PRIMARY)
+			primary = &mtk_crtc->planes[i];
+		else if (mtk_crtc->planes[i].type == DRM_PLANE_TYPE_CURSOR)
+			cursor = &mtk_crtc->planes[i];
+	}
 
 	ret = drm_crtc_init_with_planes(drm, &mtk_crtc->base, primary, cursor,
 					&mtk_crtc_funcs, NULL);
@@ -830,9 +838,7 @@ int mtk_drm_crtc_create(struct drm_device *drm_dev,
 			return ret;
 	}
 
-	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, &mtk_crtc->planes[0],
-				mtk_crtc->layer_nr > 1 ? &mtk_crtc->planes[1] :
-				NULL, pipe);
+	ret = mtk_drm_crtc_init(drm_dev, mtk_crtc, pipe);
 	if (ret < 0)
 		return ret;
 
-- 
2.25.0.341.g760bfbb309-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
