Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25068C32774
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 07:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/kpt2RV6NM9K6J+Df1fFRo6EZL8n/4JlPeLG7FAew6U=; b=hK8IoZUUBJw5kZSGZ0fGUDckEc
	eQG6XcK+5BrEo/R9jE6KiRkQ2yqJZUwdFt3Fmw4FHVlwGMo1QZgz2w+c9zCUV8JZT81V0/eVqhwNi
	qxbxRLq1ooJi8uEuZ4Xzxu1bKxu+9UOnrhb6VZQIaGf1AJxignYS0hHiKq6DUUei62C7gLEhkdS2O
	WEwZwA75uGIBg2TBkK12NEGhXKgLn9+hZrskSzEFI3WqggqUGTI5rz/H7L/cKMeDIh+E7iUVAQJgc
	P5A325GCK2RWI0aDysa4BtVTjZTrZkXFsdxTGifWz9ZraA8AArORvTkM3Y1xv6mPvp01zagIqwmnV
	RzxPab9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7Dj-008xwr-Bb; Thu, 25 Aug 2022 07:24:07 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR7Dg-008xrX-CX; Thu, 25 Aug 2022 07:24:05 +0000
Received: by mail-pg1-x52e.google.com with SMTP id bh13so17145405pgb.4;
        Thu, 25 Aug 2022 00:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc;
        bh=/kpt2RV6NM9K6J+Df1fFRo6EZL8n/4JlPeLG7FAew6U=;
        b=UDBqe9YjPW7t3UyrluqNFqCKncHu/IFGNJrVjvdU/qUzU9/RInEy1OUH+YhUtqZSjo
         H5KCL6YWlLFAc4dzcpZLFyZWVItgkRUiUpAuGkDVWylwYv4S8vPQ3QzXirhjcM4BL5LJ
         IC7PGzR5x7uffJJB+z5VktykrB0bl6cMp52YSNx+AeW2KWjy/SgD7A2gxFuqBpWoV6hz
         QQ2zT5406WVkKvb/ykqJgDTja5ESHrRoCMht2AUVoU4nahwFzg2EKNda4NEP51N8k5B6
         BP2m6t52bad71ST+B+m0XnikxPtbmkkQKkqrjDi3cqas0dJOPRMc4Fgdaa/848EV5/eH
         /qUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc;
        bh=/kpt2RV6NM9K6J+Df1fFRo6EZL8n/4JlPeLG7FAew6U=;
        b=W5aF42sE9H24lvg+SeMX3M9J+drXaqfMmOFOqc208K3YG27pXMFNFn/VGVooQkSIFp
         vzBUuxy3D6MZSX6/xrc8N+pYhoYAa3uFKtv3iADyDJkT5BCJNu81xLhcEyxgZyy6I4BL
         nn7zEMxIaJ/8dNXLtpif0Oemq2xUxCx1lPZvSCURumz5xwwPJY2yN3oAW7sSgOciQUiD
         jKoNnnv12vdfpaD0hiiBVfDMqe4Cf68BYWoUItxiHrpXNkv4jsMF5NbR9YIQOz0rB6aJ
         hXfq7WOa6EWVbYmtZru6h9tMdiKhuT3czaF469sudOCpSLB8stNqkuFNvNIT+6IjXPcN
         88vQ==
X-Gm-Message-State: ACgBeo1K31EUnSUV7sAA57sVtlNUorY7VYSLz8x4M40737j5+seD0vlC
	AE5fAx7pn3gXNb9HI1+BH50=
X-Google-Smtp-Source: AA6agR7v/r3DRgd8SnJ0ZIUhy/OVQel9Bx9fmiJXxu11YC3eOwMJefcW1JsusLYI5j/00IiosOtX/w==
X-Received: by 2002:a65:6b8e:0:b0:42a:162c:e3a0 with SMTP id d14-20020a656b8e000000b0042a162ce3a0mr2215384pgw.464.1661412241538;
        Thu, 25 Aug 2022 00:24:01 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id x124-20020a623182000000b00534cb3872edsm14256958pfx.166.2022.08.25.00.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Aug 2022 00:24:00 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: ye.xingchen@zte.com.cn
To: matthias.bgg@gmail.com
Cc: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	airlied@linux.ie,
	daniel@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ye xingchen <ye.xingchen@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next v2] drm/mediatek: Remove the unneeded result
Date: Thu, 25 Aug 2022 07:23:35 +0000
Message-Id: <20220825072335.228921-1-ye.xingchen@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_002404_468681_23D86757 
X-CRM114-Status: GOOD (  10.11  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: ye xingchen <ye.xingchen@zte.com.cn>

Return the value drm_mode_config_helper_suspend() directly instead of
 storing it in another redundant variable.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: ye xingchen <ye.xingchen@zte.com.cn>
---
v1 -> v2
Add all the mailinglists that get_maintainers.pl give.
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 5f02f8d0e4fc..91f58db5915f 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -833,11 +833,8 @@ static int mtk_drm_sys_prepare(struct device *dev)
 {
 	struct mtk_drm_private *private = dev_get_drvdata(dev);
 	struct drm_device *drm = private->drm;
-	int ret;
-
-	ret = drm_mode_config_helper_suspend(drm);
 
-	return ret;
+	return drm_mode_config_helper_suspend(drm);
 }
 
 static void mtk_drm_sys_complete(struct device *dev)
-- 
2.25.1

