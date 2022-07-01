Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB1EC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 10:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljX4VHxLEnJH6CxFcKPCMc5PmhMdDAHdoJtj9hiur4A=; b=GcKQQczi8mJAgjGYMSVE11RnC1
	JVxO+7eFKuuDxPdKUZ9lK3WAQvlVOVCitiZxnGa4wku1TBE3UEyFaTz2xIfmYFhTzMhdF00cm6Lj+
	tc7KOJOoR8bZ8+TW3OIIEbXEHp9ZTIjPHi85KAnWyxzNtLp3O6dfC6pbu8LCrqxQug8JgjXUXg49p
	y3I0yv7TCl36NQEeM81JvozbzlFG68Xt36bMIPXkk0jpk6+QtQmFFe1lCSI3oTBeTj7KVoh3CoWTc
	YPwwWcs858uEd91U299FshMaQ6GHX8TknZ/2q2Eb9xSjbivsaUz29JVMNZSh2/umsNuYgOID0kcvX
	HiyEo3UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EHA-004D3F-B4; Fri, 01 Jul 2022 10:53:28 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EH0-004CtN-Q5
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 10:53:21 +0000
Received: by mail-pl1-x635.google.com with SMTP id b2so2029874plx.7
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 03:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ljX4VHxLEnJH6CxFcKPCMc5PmhMdDAHdoJtj9hiur4A=;
        b=ZJnV0EvEevnHaF+V45Jfd/vZCRzSzdRu+irbWKzuk44igljTEEObfiqNT4/id84ew8
         7LivaevSw+4G+bwl8ZyCUeOaZp07/xdf0+jrkbHA5CHHEgH33hoqd8rMrihn5oMudQuY
         aBsMIJICDEJxnECnNaZF0mmMNd3PMDVHVtKOs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ljX4VHxLEnJH6CxFcKPCMc5PmhMdDAHdoJtj9hiur4A=;
        b=3uBywvgoLpQzpeXXPlvrM67JcpAd1TRuHcXqTGphBe2Rg5ljK6UPglRZpL6jiTAk8T
         Lyo/3vJsu5MSm4G9y9R62iuWVRlPBKF2YSJriXDDpzClBvPr08KtlOEuho5xo6TYEXS9
         miBywPUBQRuyNwOyU9gTKbqDszs+/3Ri9Wkug3Yon5uSzhOT8q85LVrq6DuUYM5+FM9z
         ELVmuS7HjvyYO0s961bsdA2vrrZB7dd9CK5aEuKnQGqGQSksjqKTast2oJIzoRlbpnjm
         9yJZlYsDvkEk0bUSgmFaAXiJ04qgTUo4m9023ihKrgxRV/LioKjkxnOhCdoyOZQ8ixew
         ty7A==
X-Gm-Message-State: AJIora/pjHjq9TcM1DKzEmOuj+GvYR1EpgCUuZuP95EKdfFL2OGG739X
	buUMvOcH0CEdZlgI2Dl1K761gw==
X-Google-Smtp-Source: AGRyM1tgfY+HHtcbLfi96MHFfZj/RaDV0HbBWEhSC7TBeizj9KXzshRAWOyabhIS2FBHMwG4J9iaYg==
X-Received: by 2002:a17:902:bb8f:b0:16a:80e7:e5d9 with SMTP id m15-20020a170902bb8f00b0016a80e7e5d9mr20663846pls.25.1656672794162;
        Fri, 01 Jul 2022 03:53:14 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b0016a058b7547sm14906670pll.294.2022.07.01.03.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 03:53:13 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 4/6] media: mediatek: vcodec: Revert driver name change in encoder capabilities
Date: Fri,  1 Jul 2022 18:52:35 +0800
Message-Id: <20220701105237.932332-5-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220701105237.932332-1-wenst@chromium.org>
References: <20220701105237.932332-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_035318_911255_EE20D578 
X-CRM114-Status: GOOD (  13.05  )
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

This partially reverts commit fd9f8050e355d7fd1e126cd207b06c96cde7f783.

The driver name field should contain the actual driver name, not some
otherwise unused string macro from the driver. To make this clear,
copy the name from the driver's name field.

Fixes: fd9f8050e355 ("media: mediatek: vcodec: Change encoder v4l2 capability value")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h | 1 +
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 6 ++++--
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
index 4140b4dd85bf..dc6aada882d9 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_drv.h
@@ -22,6 +22,7 @@
 #define MTK_VCODEC_DRV_NAME	"mtk_vcodec_drv"
 #define MTK_VCODEC_DEC_NAME	"mtk-vcodec-dec"
 #define MTK_VCODEC_ENC_NAME	"mtk-vcodec-enc"
+#define MTK_PLATFORM_STR	"platform:mt8173"
 
 #define MTK_VCODEC_MAX_PLANES	3
 #define MTK_V4L2_BENCHMARK	0
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index ccc753074816..30aac54d97fa 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -232,11 +232,13 @@ static int mtk_vcodec_enc_get_chip_name(void *priv)
 static int vidioc_venc_querycap(struct file *file, void *priv,
 				struct v4l2_capability *cap)
 {
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	struct device *dev = &ctx->dev->plat_dev->dev;
 	int platform_name = mtk_vcodec_enc_get_chip_name(priv);
 
-	strscpy(cap->driver, MTK_VCODEC_DRV_NAME, sizeof(cap->driver));
-	strscpy(cap->card, MTK_VCODEC_ENC_NAME, sizeof(cap->card));
+	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-enc", platform_name);
+	strscpy(cap->card, MTK_PLATFORM_STR, sizeof(cap->card));
 
 	return 0;
 }
-- 
2.37.0.rc0.161.g10f37bed90-goog


