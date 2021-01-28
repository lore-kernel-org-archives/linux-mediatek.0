Return-Path: <SRS0=CkUm=G7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52FBC433E6
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 11:24:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C26964DDB
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jan 2021 11:24:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C26964DDB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AjVIBIZWJpH7MsLNJ94HUsS3IrbDMS3PLwbNRP8tgWU=; b=RiU+Kcs943vdnV2vRkQwcJ6oS
	irBI0S1+Gew8ZWA+pBlhNw06aCgjGeuO3u7xPGuldDLyeZu6G21KlRERCDYZ8ouwg27JXX1hLmC/S
	azVcOAgiOrcge2ZgD5CiLOIRVI0jWDqut8Mpt3JXgj2vkBbRp2bn+Gny5V3ZxbHJq9jO96Cz4VQ5s
	+7cT9oulY6SW4cM/sRz8XhRZ9p2Q3HG6BiOnGCtHNioESNQ6ieukAiuaALgxQ2KTqtXTbrtdtBUYK
	kv3R5+gQlnco/VDdWvSWwcai1GpIyn0GsBbuQ/KQA9opM8D1V8xY3bkFMnmjx2iDr6toYugvb6fuH
	zA7zO8etQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l55PL-0000lW-1G; Thu, 28 Jan 2021 11:24:15 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l55Og-0000VU-Nl
 for linux-mediatek@lists.infradead.org; Thu, 28 Jan 2021 11:23:41 +0000
Received: by mail-pl1-x636.google.com with SMTP id 31so3140387plb.10
 for <linux-mediatek@lists.infradead.org>; Thu, 28 Jan 2021 03:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0GfJG1NolFJolLu0toUQEenQ6To6l1YhR3Wj2jMdwnY=;
 b=nbIK8k5HGwdeJPuiKijB8ehESstla+9kuSupW6ptPDFIvs+IExuXiO4nN+112Qx2yd
 +42oLP1FEv0owna6tg/baauqZ91TkRWxAvBV2dW9QKmhSO3D1BrbwFgkZOHzFtjMBVcN
 9wWiDgqZJ7vdJQIHITmZJmzww2NMkhTDbiuCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0GfJG1NolFJolLu0toUQEenQ6To6l1YhR3Wj2jMdwnY=;
 b=mqkbDjJ+26u9umRvGbdYur3OnmcsGTrMQJTjLcoHavzZ7ot3CluQVBwzr5OgMhfuPl
 LmflZt81MEJlVfhL+5J171iAy+YVWoNqVPAAsbsIMLF3cGNal8uL5eXo6ULmt4kjvlD7
 PNRmoFdJvdCS3hf51rBpAj/wQ4mDXUj/drSGsfgjLMgDWQt5TJiYpKR46bLXat4MzxXy
 9mtZIE9S918l8DkVE6RiUzPl2TLQjT+kPlS9zxyhNSRzr8dWwkJ+RwwrrarVdVTp8T+B
 8YdKmvpGruj18k8gAwDDGnzSxAfwcAA6QPMQ38fRgMVoasue2TvYOxfRMkKSGxT9NDZX
 QgpQ==
X-Gm-Message-State: AOAM533M/dWSFVJxnMZzSUJPguRL5mKIg/sgfvd/Oj7Njo7MIYcp4jxL
 plftAQIi5W0QAxsTi2GFngCW3Q==
X-Google-Smtp-Source: ABdhPJwcmLQsIkjjvwkUVmik/AWHcieafkBYpo34fY2RntjPEZDLF3oQQR6ps4P1+m5z9CODqvjgNQ==
X-Received: by 2002:a17:90b:1196:: with SMTP id
 gk22mr10605229pjb.168.1611833012608; 
 Thu, 28 Jan 2021 03:23:32 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:e0a5:d2fc:aaad:1e4a])
 by smtp.gmail.com with ESMTPSA id j198sm3138315pfd.71.2021.01.28.03.23.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:23:32 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v12 5/8] drm/mediatek: add has_dither private data for gamma
Date: Thu, 28 Jan 2021 19:23:11 +0800
Message-Id: <20210128112314.1304160-6-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
In-Reply-To: <20210128112314.1304160-1-hsinyi@chromium.org>
References: <20210128112314.1304160-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_062334_878129_BE0E4DAB 
X-CRM114-Status: GOOD (  12.95  )
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

Not all SoC has dither function in gamma module.
Add private data to control this function setting.

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_gamma.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
index 6b520807921e3..5092a27ccc28b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_gamma.c
@@ -27,7 +27,7 @@
 #define LUT_10BIT_MASK				0x03ff
 
 struct mtk_disp_gamma_data {
-	u32 reserved;
+	bool has_dither;
 };
 
 /**
@@ -93,8 +93,9 @@ void mtk_gamma_config(struct device *dev, unsigned int w,
 
 	mtk_ddp_write(cmdq_pkt, h << 16 | w, &gamma->cmdq_reg, gamma->regs,
 		      DISP_GAMMA_SIZE);
-	mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc, DISP_GAMMA_CFG,
-			      GAMMA_DITHERING, cmdq_pkt);
+	if (gamma->data && gamma->data->has_dither)
+		mtk_dither_set_common(gamma->regs, &gamma->cmdq_reg, bpc,
+				      DISP_GAMMA_CFG, GAMMA_DITHERING, cmdq_pkt);
 }
 
 void mtk_gamma_start(struct device *dev)
@@ -174,8 +175,13 @@ static int mtk_disp_gamma_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct mtk_disp_gamma_data mt8173_gamma_driver_data = {
+	.has_dither = true,
+};
+
 static const struct of_device_id mtk_disp_gamma_driver_dt_match[] = {
-	{ .compatible = "mediatek,mt8173-disp-gamma"},
+	{ .compatible = "mediatek,mt8173-disp-gamma",
+	  .data = &mt8173_gamma_driver_data},
 	{},
 };
 MODULE_DEVICE_TABLE(of, mtk_disp_gamma_driver_dt_match);
-- 
2.30.0.280.ga3ce27912f-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
