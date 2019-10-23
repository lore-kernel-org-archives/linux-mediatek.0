Return-Path: <SRS0=HtVu=YQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15402CA9EB9
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 19:51:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA1AB2086D
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Oct 2019 19:51:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KTQBadyB";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=poorly.run header.i=@poorly.run header.b="akx8r6jT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA1AB2086D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorly.run
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Uowfg51jfnhrFFeNHFtlLtC/L62IFsS/6Xcp2g3XbNQ=; b=KTQBadyB5eK3B1
	aj8Zr9v8C5WZeS8z4d9KSRb6DEvTT8dehlPd//IjN8z+oC/0Lz5lrvQHy5DQrZrrKRFuW96tYP1qa
	ODI00xgAV6FN7WUilUT1So2Xs3Tx+RYXNGVepq1NIXNijugXVClxlkEA5PC5yhKK0PgpQt1VpTqfQ
	TXgLJEUYl3CQQ9Cg0d7UlEe6bp1eLdM7jPqpFBxyfX8onnIn4MsW9dd6zJf5y1M1yh5JfwdoYYnZ4
	XNXvtCmt/R0WhUUh9Czpa4MWg+gqzsSR85cE0ZQj9C1TDoDIEWnwuxMxiIwxPNmy5maXyp+7einNI
	LhXcg+C1iZJDoG5K2cIg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iNMfW-0003LX-4C; Wed, 23 Oct 2019 19:51:42 +0000
Received: from mail-yw1-xc44.google.com ([2607:f8b0:4864:20::c44])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iNMfM-0003Dn-VX
 for linux-mediatek@lists.infradead.org; Wed, 23 Oct 2019 19:51:34 +0000
Received: by mail-yw1-xc44.google.com with SMTP id o195so3033340ywd.8
 for <linux-mediatek@lists.infradead.org>; Wed, 23 Oct 2019 12:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JKxzTkPUnLBEMDTwoJW4PDaivqT9rS13Dxxf3jk+VxQ=;
 b=akx8r6jT3I/V5VK3DFavJjpWCKXwwJ54pN/CwmMI0RlJyZXFn/JghN8q9eMkILt3Bj
 oti1pmNbQckNpl/EOB+0rvU43Jkp64k2lwFauXbNzIFglRxrjixYWv+/9vFbz4FSx7xt
 aCMFM4zSJU68ra8kLEV0pq7q1NvvpRqI6rsXzt5dWB2ohv+oXhO9pJPUPI1oF1oem2Sw
 rq6JfMoGgw5JXRYPA0jreainYMEzVFOeuSrMGwoUZa7igdExt3DSBSdtEL+p6xVDcD5S
 WXwlEWUgilxeHrI8+MHumVZ3Yo5yQmHsNzu+kRSyX06v+n31hCwfQH3eiyoGwvdDwwGE
 cHtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JKxzTkPUnLBEMDTwoJW4PDaivqT9rS13Dxxf3jk+VxQ=;
 b=owxLCgdnDUb4roQSNJqjzp0/bqqOoZ4nXSVepaNNtxmPFPfEW2Z8w2+W8UwY/cYhTn
 M3kXlIyHhkD6ewFq6tqD6Lu9mlWBNWAEX+xjMfcPAKxC1HaW28jYpGE0y+N4H4hWUCuU
 FGnovJndsUoNmE1IgGGSHDvUOSHPPoD7Rp1u8CMTndTZJc+ZILzR2F2+gJjlMC1AntSm
 9NxJ3sI15xVof8T2eAnIE+qYSI+RXt/vDNtsJ+q8al1Nfu6mZHTE/GPeiV9hN2nOSWqi
 Ei9DoVdLRXsmqbsRf+fKgLT5be3Ng9PvJb0GG1bcXfhbUvmx8bNFohiEk4zyaozk9jCv
 cMrg==
X-Gm-Message-State: APjAAAV+nrIJtKivaxJ5D9Eisx/3KUcg5Nd/+mPNcz54l6gG1a6FTr3V
 bUqseiw0VOjLVBYs7Teuj4vTJQ==
X-Google-Smtp-Source: APXvYqxMQsj3ijgyrWt7i52xtn9PuwOHnFfUuiHehIa12RuB5Pietb4A88Y+G276WQTvDzHNA0Sbfg==
X-Received: by 2002:a81:a042:: with SMTP id x63mr4309899ywg.301.1571860290828; 
 Wed, 23 Oct 2019 12:51:30 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id i190sm3863706ywg.1.2019.10.23.12.51.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Oct 2019 12:51:30 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mediatek: Add RGB[A] variants to published plane formats
Date: Wed, 23 Oct 2019 15:51:17 -0400
Message-Id: <20191023195129.165775-1-sean@poorly.run>
X-Mailer: git-send-email 2.23.0.866.gb869b98d4c-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191023_125133_012593_B491894E 
X-CRM114-Status: UNSURE (   7.91  )
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
Cc: Nicolas Boichat <drinkcat@chromium.org>,
 Daniele Castagna <dcastagna@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Matthias Brugger <matthias.bgg@gmail.com>,
 Miguel Casas <mcasas@chromium.org>, Sean Paul <seanpaul@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Paul <seanpaul@chromium.org>

These formats are handled in the rdma code, but for some reason they're
not published as supported formats for the planes. So add them to the
list.

Cc: Nicolas Boichat <drinkcat@chromium.org>
Cc: Daniele Castagna <dcastagna@chromium.org>
Cc: Miguel Casas <mcasas@chromium.org>
Tested-by: Miguel Casas <mcasas@chromium.org>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_drm_plane.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
index 584a9ecadce6..49d59470cc11 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
@@ -20,6 +20,12 @@
 static const u32 formats[] = {
 	DRM_FORMAT_XRGB8888,
 	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_BGRX8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
 	DRM_FORMAT_RGB565,
 	DRM_FORMAT_UYVY,
 	DRM_FORMAT_YUYV,
-- 
Sean Paul, Software Engineer, Google / Chromium OS


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
