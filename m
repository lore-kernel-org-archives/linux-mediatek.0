Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 104CCCCA47F
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 10:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zRI9Gh7/YtjgP8mVgApQyA3GHi/707s2OxZOLEZ9+C4=; b=HvGhNYr14MQurp7DAhekA7lXCE
	2MYYH13zqPt+hCsK4WhaMBjIXliyTG55MvuAsFaLmdXfsleNPEf/RUlf3CoRziWcK6QZTe846Qo6E
	2qq87D/F43Pm40GvXyNkVQ15+jpEcGEyFg9aiNVAfaygy0h1uTR98AcaTS/VDAq9RDi+yYquRbFjm
	0qqFC+MOBb81o9LuEuZEZBKJAKAnwCbjQGB9x7cJmvq8QUFN9Ub6jEWJkdIMZsqmcTUWHNsqgVjkr
	mSI7CDklzhVZUmWED4pcyr7Z9Q98/xuGlcdqT4rWUQ6mLbelPX17Ng+aP8ER42k7VWdoQYuVp5Jtj
	al0Lnwtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EGv-004Csa-LG; Fri, 01 Jul 2022 10:53:13 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EGr-004Cpe-8o
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 10:53:12 +0000
Received: by mail-pl1-x62a.google.com with SMTP id q18so2005273pld.13
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 03:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zRI9Gh7/YtjgP8mVgApQyA3GHi/707s2OxZOLEZ9+C4=;
        b=Hs8XspyQYDCsbTiyxekYNXorFxxz/uNUUV1G6tU7K0S9W/6puaw0ZMpKUGGZs4Tatk
         hA/iAbm6BPVSQRsQDD02OXTxKoQdFyHteMx9SVYTsFeBrHECss4HdVqLNMsSVkVIWyqy
         pEuFr4+J80MSXT0OqwAO8+fXVkbGwYjx4fhP0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zRI9Gh7/YtjgP8mVgApQyA3GHi/707s2OxZOLEZ9+C4=;
        b=hl8odvazKU3r8CXzIH3jsjLi5SVHJadRdgfs5vpK8kSGnLYXjFVaIBQEcg3B7A/Rpo
         AMuZK+YPLzg/w22IeF1pxCNlfAR40FITdOhrjbiVAhiIeMV+hG+2xXzWtACPwtsZy9VV
         PDM4F2TbMr+lK/OkyuWQu6D10DH2QKaPCh1v7jZgJfV8qmmjCoHDvVqetaD6Ma5eYNd0
         zyMuZZn94YLlGtzn0nw/OBGQVWWnmyo6j91FbDFjRUJJQpJE0hHmAzgY8cFspYHG4py0
         3NULgTkJ9+yAvfKZFxrj9CnZtA3cFMj9nt/U3xmfr18bH+C6BVBNT1fzEd/EaHHv76Eb
         HV9w==
X-Gm-Message-State: AJIora9Yg8x3D7zZRBM5WTHwdbBsFXUPMZeP1sn1AgWD0EHHQ1D0Qmgp
	dOMgXkHh+OeZEnJgnQLQVUkGRg==
X-Google-Smtp-Source: AGRyM1thrJAL4fMosshrrxIa9gN4QIMY/Q1Zq8NQRWgztOQpLfQiSsViCjvDYvLI4NRK+Rca0AtsbA==
X-Received: by 2002:a17:90a:bc84:b0:1ec:81f4:f86f with SMTP id x4-20020a17090abc8400b001ec81f4f86fmr17714158pjr.29.1656672787210;
        Fri, 01 Jul 2022 03:53:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b0016a058b7547sm14906670pll.294.2022.07.01.03.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 03:53:06 -0700 (PDT)
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
Subject: [PATCH 1/6] media: mediatek: vcodec: Revert driver name change in decoder capabilities
Date: Fri,  1 Jul 2022 18:52:32 +0800
Message-Id: <20220701105237.932332-2-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220701105237.932332-1-wenst@chromium.org>
References: <20220701105237.932332-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_035309_396856_0BA54C72 
X-CRM114-Status: GOOD (  13.10  )
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

This partially reverts commit a8a7a278c56ad3b4ddd4db9a960e0537d032b0b3.

This recent change caused ChromeOS's decoder to no longer function. This
is due to ChromeOS using the driver name field to match the video device
with its accompanying media device. After the change, they no longer
matched.

The driver name field should contain the actual driver name, not some
otherwise unused string macro from the driver. To make this clear,
copy the name from the driver's name field.

Fixes: a8a7a278c56a ("media: mediatek: vcodec: Change decoder v4l2 capability value")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 5d6fdf18c3a6..e7ea632a3f94 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -243,9 +243,11 @@ static int mtk_vcodec_dec_get_chip_name(void *priv)
 static int vidioc_vdec_querycap(struct file *file, void *priv,
 				struct v4l2_capability *cap)
 {
+	struct mtk_vcodec_ctx *ctx = fh_to_ctx(priv);
+	struct device *dev = &ctx->dev->plat_dev->dev;
 	int platform_name = mtk_vcodec_dec_get_chip_name(priv);
 
-	strscpy(cap->driver, MTK_VCODEC_DRV_NAME, sizeof(cap->driver));
+	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
 	strscpy(cap->card, MTK_VCODEC_DEC_NAME, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-dec", platform_name);
 
-- 
2.37.0.rc0.161.g10f37bed90-goog


