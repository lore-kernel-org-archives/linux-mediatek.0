Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81858C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:38:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25C9E64E98
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 10:38:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25C9E64E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=M+w9IPBwFYpCjj5ho0iam6422XVeH1NN1p+HQxiTnII=; b=HSIZtzMMCeujlk62Uk+B6e4tp
	CUzw75RGcxNGZv2X4m0cQKJkKhxhJ9WvMlJhE5V072fO81xssS0MBXDXv9GAcH2d9gW66PTDmmqIQ
	1z51dE4mhTZx6HSp4vb4WkR9wsCrzohyEqcMbFjIwGApBhn+CDeyE9qawDLV/dDoT06vg++RGwif+
	UsxEu9fKU9BmzIORdr6mhCHYATH7tt132fS4mTTFI6xIZTBQJmAGT6ueGlcGD8AqatqSf5V/Mk/uQ
	P37QAMwdWnqzhSFN1vU2/58gLGx5B+X24REMBxYoUVRUytJI29ctgbwEYa+mVQaGAgdK7ZmCbT9/m
	JMVRj1XTQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Wb4-0001yj-Tu; Mon, 01 Feb 2021 10:38:18 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6WaZ-0001hI-Kh
 for linux-mediatek@lists.infradead.org; Mon, 01 Feb 2021 10:37:48 +0000
Received: by mail-pl1-x62d.google.com with SMTP id b8so9720653plh.12
 for <linux-mediatek@lists.infradead.org>; Mon, 01 Feb 2021 02:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f1Znj6OivgMAdlpTmZtNwTUdHVfyjxsrVrIZX5cgCQQ=;
 b=IqbgFDU6SacFk6Q8JhPBEmJAFEhQ/ymT7/a8vm5CwjxqaAZiCdjM+NOcurbcxqQ5Em
 k6XTuW9LT9nueisEfNgpM6C5CLLJNjFSxsR/83UNv9pxyCjJO6Bo9FQHaFO7RQrV2XbU
 mt8sp5rv8iPsrJXjVhBU01g7iGOjHB7qlDEsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f1Znj6OivgMAdlpTmZtNwTUdHVfyjxsrVrIZX5cgCQQ=;
 b=Q9HqWmORsy0Vu8rnacn8wO2yqXsZIajAWU7coZ0eCVz1hK5oIsDsFG0pY9ng1Kc8Ga
 r0SCfBDpYCyByumkOZZSZDph1x7F5NernxsXM3BZ9/cj9aEOVIqKc93WEzeviQfGBaqS
 +2lnzZu6kTR16S1TNIdDQUSkRn0rwW9/F9HOFRe4jVj/WAqfcTpiq3QttZX1tdZ9Uq9U
 Y6axAMd2gw+EzAx3jG38B2K7RcMdxg9U+OsIiuxAGl+Kh7w2whr/TxBvbdTYYcArNTyW
 5LzRIuvAIstSyK931ywjqeZi654BFHR3sxGLODIZlHNLWy2zXUrDYUiqlx0fy0ZNdhe+
 si0A==
X-Gm-Message-State: AOAM531RphLe5fMu1t+20I2xplkBejGNjwqDBTcxfE7YMFFI9rvjwhzn
 +cUgl+4aFTBxypIQi4AyPZT2ng==
X-Google-Smtp-Source: ABdhPJxGUkkAe7tJYEX6+fmpVDu6k+JrucNgsMp+k/qXCq7PXx13UGJgUbgz79Nopoo1YkUnJH/rfg==
X-Received: by 2002:a17:902:b206:b029:dc:1f41:962d with SMTP id
 t6-20020a170902b206b02900dc1f41962dmr17350708plr.28.1612175865282; 
 Mon, 01 Feb 2021 02:37:45 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:a0cd:1b84:6d56:68e1])
 by smtp.gmail.com with ESMTPSA id 76sm17610356pfz.174.2021.02.01.02.37.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Feb 2021 02:37:44 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v5 5/8] drm/mediatek: Fix ccorr size config
Date: Mon,  1 Feb 2021 18:37:24 +0800
Message-Id: <20210201103727.376721-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210201103727.376721-1-hsinyi@chromium.org>
References: <20210201103727.376721-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_053747_723602_61616006 
X-CRM114-Status: GOOD (  13.43  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

Fix setting to follow hardware datasheet. The original error setting
affects mt8192 display.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
index 6ee2431e6b843..6c86673a835c3 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
@@ -65,7 +65,7 @@ void mtk_ccorr_config(struct device *dev, unsigned int w,
 {
 	struct mtk_disp_ccorr *ccorr = dev_get_drvdata(dev);
 
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, &ccorr->cmdq_reg, ccorr->regs,
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, &ccorr->cmdq_reg, ccorr->regs,
 		      DISP_CCORR_SIZE);
 	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, &ccorr->cmdq_reg, ccorr->regs,
 		      DISP_CCORR_CFG);
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
