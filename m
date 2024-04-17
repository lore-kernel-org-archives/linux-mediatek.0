Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F784C4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 10:38:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wGPAZakFv3tW+couZM/Hz58bGfETU82f69mf8+8G4OQ=; b=MrXs9VFM5yLC1gV5cWD+BUN9yr
	Ywjzw2oguUFujcmLjef20CK2ght+LdHxKNB9sebDoTPNR85ab/t+SO52au2/VP5UvykCeNSRvOqB0
	YFDvigHBrCJ5lK9yG+WHUw63FFqTwtAvbJivmtj5L4BICbD7QQa0SCNEQGqBnwxlQ82d5sBJkAOG3
	OIYKiUFWNXsv9OcWCshwA7OAivjXWIaJr0tr2/52Pm7KdUteCgSSSACWn0I4Q4i1c59GLMYF5dP5x
	oRebCuK817bXlGb5yDYzD4tzkkWX8WZNHwc0v3EWAG3M/Yw5PoWs02LouRGZc/zLCyYXkvG6NEFyp
	jDyM3+4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2gX-0000000FdXX-0AxP;
	Wed, 17 Apr 2024 10:38:37 +0000
Received: from mail-ej1-x641.google.com ([2a00:1450:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx2gS-0000000FdVo-0Jdb
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 10:38:34 +0000
Received: by mail-ej1-x641.google.com with SMTP id a640c23a62f3a-a5561b88bb3so35235166b.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 03:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713350309; x=1713955109; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wGPAZakFv3tW+couZM/Hz58bGfETU82f69mf8+8G4OQ=;
        b=FOw3oD0zcguqf17oEEK1QHTnwICqDtN0yj9Rol5GHzhWXnmNE5DahLLEH95kpx+6wn
         dg9g4l+ODh4buJTjwJR9ir4AOqztlFMPFj6AGUi3SAupEElpchj2W+zRKxXR+bI3VxBJ
         J+kqtUUpZZSCn9qm70L8to1zc/NGZhosbBjqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713350309; x=1713955109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wGPAZakFv3tW+couZM/Hz58bGfETU82f69mf8+8G4OQ=;
        b=tUTBX7Vi1atgBksyhKv0kQKOReModIG3p/JiFSs4utmi3ZC9O6hGoMClfJg+PyoiqH
         kOw+ozxEbC6xuoO0o7QJcxzihGGyqVn3lD3MS5twtnn3RSByceDyfY/ZSWGFh7URbgOL
         YzGgeZZ1uwACDrTsLkoFAYhFTky80nj1osSpOLP+I44OFOqNO0DAGKA/uuvK4ETuuSkv
         fWzQ4QCk0w9pwDBE41H2kRrftkUnHuI41YhV2kXT50tPTzOPlXJ0BpT+7f5RCn9TbLvD
         IhD/lKmGueQlxgdQmCIPim60qXtidDoOg1Zn7uEF5XWfCJSTacQUbLnHHh0e9JTn5WJO
         +w6g==
X-Forwarded-Encrypted: i=1; AJvYcCVXsCF/n1cti+DqGwZZH5lkr4H09oiVrTGNRxskan/VGEsNDYYrPGOpYzjaA37RS2alyPkCFIQRdeQnPODV5K0Z3Dlq4fIu5a7QGKA+kE07HBPY
X-Gm-Message-State: AOJu0YwR9Oz8PpplJ9NLjJiethQ1xJqwiY/E9JOKFnjwFIAy8usDg05D
	17hSswWCU7+HMbeonJvB0O8KpC/vgenn8m5E9D3JEouWx3Oby4oa3re25Cd/EA==
X-Google-Smtp-Source: AGHT+IFVcPG0J5A4OYw4wVn0Z7fkAtpovNHvVRNRPx9roE8nRmfmY11gcOt1EWpA8oZzc73jAWSbAg==
X-Received: by 2002:a17:907:928b:b0:a52:54d5:7915 with SMTP id bw11-20020a170907928b00b00a5254d57915mr9533946ejc.74.1713350309663;
        Wed, 17 Apr 2024 03:38:29 -0700 (PDT)
Received: from orzel7.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id gf14-20020a170906e20e00b00a51e6222200sm7989488ejb.156.2024.04.17.03.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 03:38:29 -0700 (PDT)
From: Wojciech Macek <wmacek@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	chrome-platform@lists.linux.dev
Cc: Wojciech Macek <wmacek@chromium.org>
Subject: [PATCH v2] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
Date: Wed, 17 Apr 2024 10:38:19 +0000
Message-ID: <20240417103819.990512-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_033832_139474_5735BD77 
X-CRM114-Status: GOOD (  10.82  )
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

In case there is no DP device attached to the port the
transfer function should return IO error, similar to what
other drivers do.
In case EAGAIN is returned then any read from /dev/drm_dp_aux
device ends up in an infinite loop as the upper layers
constantly repeats the transfer request.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: Wojciech Macek <wmacek@chromium.org>
---
Changelog v2-v1:
 - added "Fixes" tag
 - corrected e-mail address

V1: https://patchwork.kernel.org/project/linux-mediatek/patch/20240402071113.3135903-1-wmacek@chromium.org/
 drivers/gpu/drm/mediatek/mtk_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 0ba72102636a..536366956447 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -2104,7 +2104,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 
 	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP &&
 	    !mtk_dp->train_info.cable_plugged_in) {
-		ret = -EAGAIN;
+		ret = -EIO;
 		goto err;
 	}
 
-- 
2.44.0.683.g7961c838ac-goog


