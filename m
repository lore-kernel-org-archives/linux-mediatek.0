Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5AECF43699
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2026 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7B1zAJzyc2aJm8FtQJrwknWWRUXny98vqjyGldOGID0=; b=EOtBcwWsAmOUwvzsZlDwiSUOWm
	GCLkXrigZcmFLb39Z2mW6LrEzMtE7esOkQt/esulCeczASZQ9msXti55gyY71ZacjXgLGGcbP+0XF
	J6eKUVwqVd9m3nYCU8KGfnZL7iGVJI0h90XJFCCcdNy3o/ztpZv3a4zR6qiV2V9mUp0pToEld5nRJ
	eC0/NsmbqKaQtcXmD5Xbz9NGhzOL9JexCad20ISngxGjG9Sslr2O8BiqvgO/cVn6yrpfIXBocVRPE
	2ws7S9NgOezi5JLEWMU9sRXampZShtoG0DJnFECGUBMucOTBAigZEe5eOml+JRCrBi2RGZ79UFCj/
	9B/2ckuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiIQ-000000042O2-3nLv;
	Fri, 17 Apr 2026 12:27:42 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiIN-000000042N4-25Ye
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Apr 2026 12:27:40 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso381953a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Apr 2026 05:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776428858; x=1777033658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7B1zAJzyc2aJm8FtQJrwknWWRUXny98vqjyGldOGID0=;
        b=TQyBmzyLdtQxefCrD1tM5MaILqwaLbbdsitLG9nTf9s+q2bYSq2MCx/eDNxAZBUhRw
         qAqS16SKDQWQ4dAJps3K6RC32JxzDKMMYuimqk6NqDWrSkbh9wzLMeXsRgyzwEwW33Iz
         ngOWbN48tWpHNEJalHTCevUU1q94NIyfKtD/WXceIHqJgRH0kj+ezh2Le+0a6HfHp20z
         715HxXPRh8eZHv/6fk+2MHCWMdZ0daJoB2U27kgRrzCmrtlxzK9NO50zU1Wknsn3rY9+
         xlO4xJSGfhNLpwyzSxZ9otBYxPNNGiqyxt42Z7ny1zMvcBMKppE+waNcAvfoRtHOyI3f
         Da7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776428858; x=1777033658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7B1zAJzyc2aJm8FtQJrwknWWRUXny98vqjyGldOGID0=;
        b=AMOqYBNsdLl/2+sxGfek8RefC9lARZXXrHRIMYQwDmGTtO3GiPiQpOGOq0s1QTZRb5
         GqAai5+1q4RJb50gR5N1C1sZweFx5Or4k16JcevSreWcLHU0HigTwrJKSWDU/PQOnQN/
         R3CQ9nXFaiCaY21uO+ZD7jt2ly76yj6fFCDgfn66uU8YN1yK4xVA7C8xIqH++jZrMzih
         s8iVZ2YA0b6aglx/5+GJz0Pl1E7VLnqZ0ydf7YKULIMBhUNhSfocxU3b13KZ3PXJJErX
         MhxBeB9hD7bfxL6uNVMVJJSpnktfuy8A0kG9racxSedjDvf90hPRyPdijujLDlc1FW2t
         HDmg==
X-Forwarded-Encrypted: i=1; AFNElJ+F/ahtqMnbA3E2ue+W5qkDsce0HWfRd8DIBkIiRSeReB34Wt1ELpYfg9GIq/AH4kf2KGkzZ6VvJeIuosB1xw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhYj9ZenFqTYmMOiCRfRY1ILGdI+Yf8AtteAoIrLUSah/7pT6E
	ffJuzIirUHuM6W7p89qCLAeGj7aDg0q6tSxbfCFy/RazCOwdrKcVSaNC
X-Gm-Gg: AeBDietj31+289PFTBvj7pI945qAyu5761DcIzetUzqncGENHbviuYOLzsHW8JF1UyP
	+Yr8QAdbZKmsPCFX3penA+1lRBMIFJuxSvQWHi9hJncE2n4jTNOReu3jkCL0l9soFQREug9Py+S
	WHa09Hv21wu9O/D0Hj6ZG43iFTsrAg4jDYtwuX21URqaWszZS26LoFZKjJZc2x/whtxgf11ouiZ
	OHVYrdnSkot3QD7PBHOAaLwkT/6BUZ+zuOZu3VP6yccMgoZBIfgCn26uTgi6dCh/T3Jqk1YNwpP
	8jZg0sL4MmCUbe39WcqahmqiCU9/5KoIttmrEZPCDZFCQi+0J+YZdsXkw0hxHyKS6ObEA0KPh/U
	2UiFWE/LQjcWgQRKq5+OD2UQqqFSdSzBsT2yv9sRBe5c8ib1jxjiNCAxrl+r3ExSnXmDCQ88a3m
	Iwjv7T5l9NTvXNKOPgO72NMcY7q0ZZYWeTEqDISUZpcQsiQ/w9bGWINQ==
X-Received: by 2002:a17:90b:1e0b:b0:35d:a542:2dcb with SMTP id 98e67ed59e1d1-3614048a731mr2630632a91.16.1776428858176;
        Fri, 17 Apr 2026 05:27:38 -0700 (PDT)
Received: from dbc5pt3-os.ban-spse ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-361410cc196sm2074491a91.17.2026.04.17.05.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 05:27:37 -0700 (PDT)
From: sai madhu <suryasaimadhu369@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sai madhu <suryasaimadhu369@gmail.com>
Subject: [PATCH v2] drm/mediatek: hdmi: Convert DRM_ERROR() to drm_err()
Date: Fri, 17 Apr 2026 12:27:26 +0000
Message-Id: <20260417122726.2948518-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_052739_544533_050480C9 
X-CRM114-Status: UNSURE (   9.39  )
X-CRM114-Notice: Please train this message.
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

The DRM_ERROR() macro is deprecated in favor of drm_err() which
provides device-specific logging.

Replace DRM_ERROR() with drm_err() in the Mediatek HDMI bridge
driver and pass the drm_device pointer via bridge->dev.

No functional change intended.

Signed-off-by: sai madhu <suryasaimadhu369@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 1ea259854780..4ddcdbf7bc8c 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -981,8 +981,8 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 	int ret;
 
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
-		DRM_ERROR("%s: The flag DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n",
-			  __func__);
+		drm_err(bridge->dev,
+			"DRM_BRIDGE_ATTACH_NO_CONNECTOR must be supplied\n");
 		return -EINVAL;
 	}
 
-- 
2.34.1


