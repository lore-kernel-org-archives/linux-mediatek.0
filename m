Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C7E0D1AD47
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Oct 2024 11:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=l4u1X+4asBMPU91TR1WAl6Ub71JuEkCWwBm90GJmfMc=; b=llVyStuAV7gwM2Meyef448aSGa
	j7HibIXe46NoL+pkuUpYPlef4vmniLY4wczO6XTi3fP3kTKaUYDr7WFuvWO9PzZIw+Owm181jGGCC
	fE0gWn+3zCAWfz0M9VidubpE0+06KXMxiN0LhuC0DWFYX2sPHs13mSfB2AZC6bKDmxzUSPziimM5Q
	QQaMJM2J2QjgXndtwTRgZgf8r5d0BTQcMC3X3rRMDeX1+x8YHTkmjId8eOH0jdqYckq11gVbvumOv
	YaV672YT4X2wn18Ki6lk3+hOdsFTDtIu2fLHL/2fmuuBc+WhQgln3IWl6pAiQaIZduIuLwchBA4c+
	/dJqO3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t11v1-0000000BYnX-1cqf;
	Wed, 16 Oct 2024 11:10:19 +0000
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t11tZ-0000000BYXV-1LBt
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Oct 2024 11:08:51 +0000
Received: by mail-pg1-x533.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso5361179a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Oct 2024 04:08:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729076927; x=1729681727; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=l4u1X+4asBMPU91TR1WAl6Ub71JuEkCWwBm90GJmfMc=;
        b=l+BuR8IyzMOZyUg14I3b0wCCZEz0Cl1w29Pn6oVGNrCio7eKblDkkYYdD8kZzQPmlM
         IOZj+VegNchx5Rzq25OE2zq3hnPhh33J8NZ6fISBzeSqrl5oQRJyK4zq7RcKwxFYoou3
         5mZh7KBFZjPPDX5UWtvZcWOGjSMY0fMzKciWU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729076927; x=1729681727;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l4u1X+4asBMPU91TR1WAl6Ub71JuEkCWwBm90GJmfMc=;
        b=nDYqi/wLhYrT0p18J1SFeFy7ZNFojI83R4ohBs25i2rWXKo7C5ABHS0OUH7IL9cdsz
         RKEboixmf8JPqplmHglqKYLOSGPjWIUrNLtjOuKhVLE20OYs8J0R6R+qP9VPRQdA8whd
         JpyS+DEFzRvbzYvSY3sqAHseg4Xv/4GMOhWkUT8oWQ5eZ5+Lwh6nP01kacjlIvTFS7Qg
         3F2CB2RIKteaunbAJZJbjA4gw9ziDnNU+m6E1V8dW07ISOGqehub3SfpZkddCIXvTEGR
         sl2QYMFKi5MRcDgFpy+MzReTCZn3yOJkKbwVBSwvZ25VnQf4ugz4iJobeQcKuiiYDdWB
         G7PQ==
X-Forwarded-Encrypted: i=1; AJvYcCXysb/S/VtU6hn33DERvF/ap62eUijVMODWIE6n78xvUFHBjMYukLxxwsfmSUHO66bO2fUsNC5t4Fq5gQy0MQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjfnNn4WMj38QWNrMUzZMSlwDdZmPKXkDgbBWRs6eiL8kiAINL
	gkf+q7vdcEjwNW3KS9y8Zlt25WAVLMkUY0xvO/AQtugEzn4x3yAmQuyfyOfHaw==
X-Google-Smtp-Source: AGHT+IGbiRRm9/GVZ2H2pkAbe5Hh0MuXI6tyXwqFg8lOcZTaM/hUsZa8Rxc3qKSg6bWgPyMziv1sPw==
X-Received: by 2002:a05:6a20:d504:b0:1d9:542:8d40 with SMTP id adf61e73a8af0-1d905e99a58mr5466764637.5.1729076927053;
        Wed, 16 Oct 2024 04:08:47 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e773b13a0sm2826188b3a.77.2024.10.16.04.08.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 04:08:46 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 16 Oct 2024 11:08:39 +0000
Subject: [PATCH v2] drm/mediatek: Fix color format MACROs in OVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-color-v2-1-46db5c78a54f@chromium.org>
X-B4-Tracking: v=1; b=H4sIALeeD2cC/13MQQrCMBCF4auUWRvJxKaKK+8hXaRx2gzYRiYal
 JK7G7t0+T8e3wqJhCnBuVlBKHPiuNQwuwZ8cMtEim+1wWjTokarfLxHUWS0paMdutY5qN+H0Mj
 vzbn2tQOnZ5TPxmb8rf9CRoXqYAeNo9PuZLqLDxJnfs37KBP0pZQvRosOf50AAAA=
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
X-CRM114-CacheID: sfid-20241016_040849_423644_6ED0F397 
X-CRM114-Status: GOOD (  12.59  )
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
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
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


