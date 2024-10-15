Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30230CFC286
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 10:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V2rr896UjJZIJvHhd5U5Pr+M2ve1yVZw4BPOf1jkh5k=; b=Ad3hXxAfPtAfWGQgOU4Q7Paqaw
	JkPUOvn2dxZREhFA7JhhLl7YB6QehGXQMTnsISOFMdFVh8MXx0oAviP/qSTdTdXXhPqzrTMexJ3zc
	rbfCFctDbRyrhT7cK9vOtRXdOKdm36kaeYQdbAC9owc2s1615+XyPCBdDwqHIEo0vWuynoE6zO3Jg
	xrEhZPDSB3B7wUAJr5O5Agg0xcpFFqRIy8IW6D571X7LFWb4W5+dsrY9xWjkJd/5HpuD4Lagpaa1i
	ULn2LZWcb5sULSk3qiIhXqlbDWmowOxcPg9Dn9rYu6SOH6N9sz8U3bFevFMJDV93OQDV5yHsCCDuy
	xHxhUtaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0eou-00000007qOc-0m8g;
	Tue, 15 Oct 2024 10:30:28 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0eor-00000007qNF-0icJ
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 10:30:26 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-71e5b2814f6so1899604b3a.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 03:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728988224; x=1729593024; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V2rr896UjJZIJvHhd5U5Pr+M2ve1yVZw4BPOf1jkh5k=;
        b=ZFua6kT3RZVij3fmgr+gfKqLvC8e9zsAs5NysdWdX3zcII720fxHtYt3TYSCLe/9Kh
         RtjDk1+2VZKe3x3NCJdTDz70Bj0T784yq7tnEjIjrt6r5/EcQmI71RUqdmU7oUOfq8cR
         UnZVDPhGxieQeAgFZU0UBh5odpUP/c8qPXHQU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728988224; x=1729593024;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V2rr896UjJZIJvHhd5U5Pr+M2ve1yVZw4BPOf1jkh5k=;
        b=gO4DyjenaH3pY2Xkobg+3n6cS+fwTJqvM6DiRPw+df/l1nIq6RoL2w+oxlIwa8tpIA
         qTrD2VhE63b6baGr8J3um5dloXZRbAjefze+agpcnNF71E9Ug7p87oakDnBtyg42QO93
         wArCku1EHshJCgcO5j+8cPRbf8t0XflbsS162rdQSkX3b9o5zI/mCmTQjX/rwqhRW2SB
         M2gDGyA61uWczNKAe3qwcwvlmjV4RwsPaScQIOtX0R2tg9wtuSy3xIZOdj6fbe4LmIKB
         dcI7iKUoc9ROjklGPKEc8uayevaTAVb5uSDrLbeOEgzABKR6lhliec8v513C0RFHnmX7
         9z+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV/UvNVe9zQwxSjuOhoZqa7jaGxboqNBOPY+fh1AnaNJ0ZyBAi9zBc+KjN6u1v95nRA9IowLgu33mLuyV3lhA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7zh6Ad3uCeE+6JJ1KoD8ebfz2FRpcLEpqIEsTLn4nvdkZmg+y
	MxA1BlRUg9jIAVUVWhGZqtFIU/qzawkAbLZdNuvIUWIsbd2IidgD8SBgerdwGQ==
X-Google-Smtp-Source: AGHT+IFkLsd54kJuLGI+OOJF3TglxLq80CdGHR32sS02YQTnE9EsV0U9q3MfLsv+EAG7yVeyofCtWw==
X-Received: by 2002:a05:6a00:4b12:b0:71e:6c65:e7c4 with SMTP id d2e1a72fcca58-71e6c65e883mr5595571b3a.26.1728988223751;
        Tue, 15 Oct 2024 03:30:23 -0700 (PDT)
Received: from yuanhsinte.c.googlers.com (176.220.194.35.bc.googleusercontent.com. [35.194.220.176])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e77370dfdsm946011b3a.42.2024.10.15.03.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 03:30:23 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 15 Oct 2024 10:30:19 +0000
Subject: [PATCH] drm/mediatek: Fix color format MACROs in OVL
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241015-color-v1-1-35b01fa0a826@chromium.org>
X-B4-Tracking: v=1; b=H4sIADpEDmcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDA0NT3eT8nPwi3VQjA9NUc9MkM5PERCWg2oKi1LTMCrA50bG1tQBJIzI
 UVwAAAA==
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
X-CRM114-CacheID: sfid-20241015_033025_265730_DD432821 
X-CRM114-Status: GOOD (  11.13  )
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
switch statement more concise. However, there are typos in these
formats MACROs, which cause the return value to be incorrect. Fix the
typos to ensure the return value remains unchanged.

Fix: 9f428b95ac89 ("drm/mediatek: Add new color format MACROs in OVL")
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
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


