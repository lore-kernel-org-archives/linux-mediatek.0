Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD695D2069C
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 14:18:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EVKER3hv6evoPvIqFuw9dG82LeQOTjgI9oXF+N5WCUE=; b=bwJ2v4BAbQckK6U+pXeOXoiV8Q
	GU7/+z7KUcZQ5bd3HtlZJTPTMkCE+XOZHCcUp2dgcIql8v6jB8QZszKMIKs5gbgrqnh091EUBgpyW
	bntqPtbRRYfLviK/XCpzxg3N7catEYzjOspBOu5rkodsT5iyLQTUkqtJFZn7ZcF1tYiwswxFepZLC
	0hdDR/4eBFrT9lmuCIF+2drsh4UuMa7lgYZyWoz95MqGEgS2hhY2Y1WgvkGSdfoQi48W+i0fGzI4Q
	RMcrfaMn6fNwnzDBw6ZeuE6jboHER8jH12q6hb1e6xzwxUiuuB2S3LKOEqgiDK44zlzlPrBeoZI1o
	coMIhfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t14rT-0000000C368-0w2f;
	Wed, 16 Oct 2024 14:18:51 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t14q0-0000000C2lE-18nj
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Oct 2024 14:17:22 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-20caccadbeeso53306885ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 07:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729088239; x=1729693039; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EVKER3hv6evoPvIqFuw9dG82LeQOTjgI9oXF+N5WCUE=;
        b=lWSYEn8xXjztW+WLVRSDwJlO1oOD2LBGkk/dFcgNBBEAk1M8gux2Tmv/kL/V7p5sZr
         +WDO9Qt56OsYfo5yuskk1peB+q6Zo2nMUItB3Jzk9vQFnEj9wzQFnn+u5TlYYHlyCzmU
         docu4zUMO3YsD9lRiOfvFXUu/n4/cmPMzurnc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729088239; x=1729693039;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EVKER3hv6evoPvIqFuw9dG82LeQOTjgI9oXF+N5WCUE=;
        b=SXpfFwLO5zNNopOxcUp2n2ntoWCHlSSrMxKE+U0UqGW0RPOI+5flvQZbILiR1dVOkE
         wYTL1QzFrTQ4ya21aYYFcHpXocTDluSAeiGmNEveisU9tUtCBf0lInsmosBuGsTiRBt8
         xLY2q61EiUHp4vLpVFXRGYC0doQZYR+ocN9Q/82tC7BjAvlaKFZsOre1KEvy8kuWh9aY
         TAFRMIYakD4eLgpcxqY5fScve9f4WXRX7fOBNWsXjackk6NK703lyApjLgETI/zKoAzP
         zCJKPbq6eQga17A6cY3Iyo1G0jFswPt/j5GyFYcTBcGHykoYb4YSqO7D1rrUzH7Se9SY
         4qng==
X-Forwarded-Encrypted: i=1; AJvYcCUi8fdp4twLnpcsVlfmy9CxIVX1nokmaVM+yss3Z3QTrpqR3c2RUrrIrBQ1kuJirRaDe6GjCachSqQ5p+7HJA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+ZVLK1jDPl3XrzZ5t3oLhYv1ZdeewpBqHtCCUqKR7Xe0b5Zgo
	5a9yYNpXaszpN+Q0k7nlFsC6FYTYJ+7tgWF6QxPfDrocwhEmRGSUG6beDRuegA==
X-Google-Smtp-Source: AGHT+IGZHtq9NBH/rxgUzuhq/wqmFAtg/Km4mXJX3jx3iEj2labIFGH9kDPhLj3+H6UaQUaFSyyVpg==
X-Received: by 2002:a17:902:ec83:b0:20c:5404:ed69 with SMTP id d9443c01a7336-20ca167bbbbmr242478095ad.31.1729088239049;
        Wed, 16 Oct 2024 07:17:19 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20d17f844ecsm29243015ad.14.2024.10.16.07.17.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 07:17:18 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 16 Oct 2024 14:17:14 +0000
Subject: [PATCH v3] drm/mediatek: Fix color format MACROs in OVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-color-v3-1-e0f5f44a72d8@chromium.org>
X-B4-Tracking: v=1; b=H4sIAOnKD2cC/12MwQqDMBAFf0X23JQkJlF66n+UHmJcdaEaSdrQI
 v57o1AoHufxZhaIGAgjXIoFAiaK5KcM5akAN9ipR0ZtZpBcKsGFZs4/fGAoucZKN0ZZC/k7B+z
 ovXdu98wDxacPnz2bxLYeC0kwwUrdcNFZbmtprm4IfqTXePahhy2S5L9ofqLMojJto11VW626g
 7iu6xcSdymQ1gAAAA==
X-Change-ID: 20241015-color-e205e75b64aa
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dianders@chromium.org, Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-7be4f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_071720_372084_4A32A5AC 
X-CRM114-Status: GOOD (  12.69  )
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

In commit 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in
OVL"), some new color formats are defined in the MACROs to make the
switch statement more concise. That commit was intended to be a no-op
cleanup. However, there are typos in these formats MACROs, which cause
the return value to be incorrect. Fix the typos to ensure the return
value remains unchanged.

Fixes: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v3:
- Add missing Reviewed-by tag
- Link to v2: https://lore.kernel.org/r/20241016-color-v2-1-46db5c78a54f@chromium.org

Changes in v2:
- Clarify that the commit get fixed was intended to be a no-op cleanup
- Fix the typo in tag
- Link to v1: https://lore.kernel.org/r/20241015-color-v1-1-35b01fa0a826@chromium.org
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 89b439dcf3a6af9f5799487fdc0f128a9b5cbe4a..1632ac5c23d87e1cdc41013a9cf7864728dcb63b 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -65,8 +65,8 @@
 #define OVL_CON_CLRFMT_RGB	(1 << 12)
 #define OVL_CON_CLRFMT_ARGB8888	(2 << 12)
 #define OVL_CON_CLRFMT_RGBA8888	(3 << 12)
-#define OVL_CON_CLRFMT_ABGR8888	(OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP)
-#define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_ABGR8888	(OVL_CON_CLRFMT_ARGB8888 | OVL_CON_BYTE_SWAP)
+#define OVL_CON_CLRFMT_BGRA8888	(OVL_CON_CLRFMT_RGBA8888 | OVL_CON_BYTE_SWAP)
 #define OVL_CON_CLRFMT_UYVY	(4 << 12)
 #define OVL_CON_CLRFMT_YUYV	(5 << 12)
 #define OVL_CON_MTX_YUV_TO_RGB	(6 << 16)

---
base-commit: 75b607fab38d149f232f01eae5e6392b394dd659
change-id: 20241015-color-e205e75b64aa

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


