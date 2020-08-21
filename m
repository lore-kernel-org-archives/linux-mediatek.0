Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BC23C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1617207DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y9SHUIhv";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i6Rv+XXn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D1617207DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Tb4eLqDsJHJhz+05O2Rs9IiU8nVj8Q5YIMfH8Hgt/Q=; b=Y9SHUIhvsCKPPgljdiYJ7OqfT
	9IkVnlWazxwWJ2A7nNXctjKhlhJipvqTfqSkZN05pTbAALw0J91/RiZOxOoe76DyBEYlbTH4ZEk/1
	DE7xQoPRMcvAhrv7cStjrbV/xKfghajfrZqZbeH4mPwpoeHfZ5gEE2S5o5WbL8lPYoSsNkQBHS4ij
	G0vZyLdQBhvzKfGhCm7etMjHZlkVrAp4oBdCYXa5yIkaLIx7JUj3vGrENw/ss6OSUILVGUzVebZsJ
	9SzYto9kidHzmXfIIYHAEBXfbUII5zvSei3hhxs2Y4wEZMJ3UbgCjgXy4cuZClwmGlqWC2nZW7pVy
	wo3ih4eWg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k94Q6-0002MX-D5; Fri, 21 Aug 2020 10:37:14 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k94Q3-0002JU-BC
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 10:37:12 +0000
Received: by mail-pf1-x442.google.com with SMTP id y206so858136pfb.10
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2020 03:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZBKM3WA3cxwbZdd9vidSjpRU6jIZw5t/CObNuc//DI8=;
 b=i6Rv+XXnjNjy27SQXI/HnMTwHPPjsN5K9vvKj/YydK3hJUlen91zcGd1BJAGH71wKl
 9ETzlShNPCuGpWfHgkbCuo3ip124aauRX0kUD+Mmy94bYAQQ/nGc2jW2U41kgwzLU/4p
 t94XMN4WljNjgGAeyPTqBVlHygh9JVAtZaOGc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZBKM3WA3cxwbZdd9vidSjpRU6jIZw5t/CObNuc//DI8=;
 b=HMtvBMhysiOKGqy6RKsjoQJ5038RP4hCkmk9Ynw8TnDGqOvzu3iOqQi5jRc+CH2IGq
 herknW8Py9hLU9RDA7o/Y/bnr4BeVqWRgl8VjqAFwmh/ZQ1/oz8GBtuopULv0Zhskps0
 qkA1ep/zpspIvHHfHbi+0qCfzU4oclk8WbTd1eanvKxeK5qk2gey2CVIk/v2It4xMwix
 0kyxl8kEqeINGmcYiFuBwtilwQHg0bRvUGriP9gSLv8dQYdnf2wlKEC8T241pzq9DMCE
 uATZSTfPPwm82iIAd3baPUimMx+giTFRGpK9WMVSOxK+OEpzygzZS8i0r75Jcf0O3l7J
 x3KQ==
X-Gm-Message-State: AOAM533aipIOXI8YGlT/RLE5LM7l2vn62WfSfGYufUHzespsjNDNx3Fm
 CKUK2tY2d8b6QG1nppy1V7+DkTU/AMCT2t4p
X-Google-Smtp-Source: ABdhPJy2dZG1ArmjW2HfNTswI284X9+chI109neRtlOF7ZLdH/tGkTT3NlNsQdVnT+PR4Ees3+cN7Q==
X-Received: by 2002:aa7:8f3a:: with SMTP id y26mr1981877pfr.54.1598006229685; 
 Fri, 21 Aug 2020 03:37:09 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:37:08 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 11/17] Revert "media: mtk-vcodec: Remove extra area
 allocation in an input buffer on encoding"
Date: Fri, 21 Aug 2020 19:36:02 +0900
Message-Id: <20200821103608.2310097-12-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_063711_496955_ADD29EAC 
X-CRM114-Status: GOOD (  12.38  )
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

This reverts commit 81735ecb62f882853a37a8c157407ec4aed44fd0.

The hardware needs data to follow the previous alignment, so this extra
space was not superfluous after all. Besides, this also made
v4l2-compliance's G_FMT and S_FMT tests regress.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
index 05743a745a11..f2ba19c32400 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc.c
@@ -299,12 +299,14 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 
 		pix_fmt_mp->num_planes = fmt->num_planes;
 		pix_fmt_mp->plane_fmt[0].sizeimage =
-			pix_fmt_mp->width * pix_fmt_mp->height;
+				pix_fmt_mp->width * pix_fmt_mp->height +
+				((ALIGN(pix_fmt_mp->width, 16) * 2) * 16);
 		pix_fmt_mp->plane_fmt[0].bytesperline = pix_fmt_mp->width;
 
 		if (pix_fmt_mp->num_planes == 2) {
 			pix_fmt_mp->plane_fmt[1].sizeimage =
-				(pix_fmt_mp->width * pix_fmt_mp->height) / 2;
+				(pix_fmt_mp->width * pix_fmt_mp->height) / 2 +
+				(ALIGN(pix_fmt_mp->width, 16) * 16);
 			pix_fmt_mp->plane_fmt[2].sizeimage = 0;
 			pix_fmt_mp->plane_fmt[1].bytesperline =
 							pix_fmt_mp->width;
@@ -312,7 +314,8 @@ static int vidioc_try_fmt(struct v4l2_format *f,
 		} else if (pix_fmt_mp->num_planes == 3) {
 			pix_fmt_mp->plane_fmt[1].sizeimage =
 			pix_fmt_mp->plane_fmt[2].sizeimage =
-				(pix_fmt_mp->width * pix_fmt_mp->height) / 4;
+				(pix_fmt_mp->width * pix_fmt_mp->height) / 4 +
+				((ALIGN(pix_fmt_mp->width, 16) / 2) * 16);
 			pix_fmt_mp->plane_fmt[1].bytesperline =
 				pix_fmt_mp->plane_fmt[2].bytesperline =
 				pix_fmt_mp->width / 2;
-- 
2.28.0.297.g1956fa8f8d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
