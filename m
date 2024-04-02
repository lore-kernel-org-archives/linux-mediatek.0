Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1761AC6FD1F
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Apr 2024 07:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZnIWTbeR2GXQXE2WKV9Ap/wvI2y5jKr9SDTIrGO5fgY=; b=O9dLiSCj7Gd/+iXRMQhO3iIdIY
	nmZ/hGLF+mb09N+8Eogs0fngxdieeAvGEokvXRIUrdzH8rjT+L3S5BWajcWrRHBHCccS5sSZWRGfh
	xtLiTFwyejGT9LYleu3ye/LVmC0bLMs287J+fxzqPvRune7UlEAKjciffbwscs37YDTE6BdiLt8cC
	fXfOCHwM/EnGcWXc5wpm/S294RU+vL193N/68WQ3IPNr5iTUqbrDYOdmt80TF9RyPwOwaHFGq3IyU
	LU3Vkcq2NF4zE0u2I/Bw9D20LpU5m81dPntcx8clo4Yrs24rHkZ3qiSP4Mo8ny8zsjD7DaV1yqsFt
	cGAxvbow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrYIn-0000000A1uK-30mU;
	Tue, 02 Apr 2024 07:11:25 +0000
Received: from mail-ej1-x644.google.com ([2a00:1450:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrYIk-0000000A1t3-3Lo3
	for linux-mediatek@lists.infradead.org;
	Tue, 02 Apr 2024 07:11:24 +0000
Received: by mail-ej1-x644.google.com with SMTP id a640c23a62f3a-a46cca2a979so268373166b.3
        for <linux-mediatek@lists.infradead.org>; Tue, 02 Apr 2024 00:11:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1712041879; x=1712646679; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZnIWTbeR2GXQXE2WKV9Ap/wvI2y5jKr9SDTIrGO5fgY=;
        b=QJe5/s2cKv7hgHtpPFMVb3mIX0i0kZq8wSKZ2PHMS3Q6gOVzHAnoNqaZV4U5XMd0+I
         YldY2yp/1mRryxkhvRjOitiWDm0Ajr3A3bf6CK5ZWZbkzNPyrYMb63NJQr2gGvZoJtZ1
         zXjoirw2G3x3vd2KpauJcEvYW2HxhCcL3S3C0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712041879; x=1712646679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZnIWTbeR2GXQXE2WKV9Ap/wvI2y5jKr9SDTIrGO5fgY=;
        b=h+blpx+GwLncrmgOQh5U3096777UblCTqviT7XHZOOty8sogEMJnFYTIv1M+evPEEz
         JBm/smYS2B89SBzCMb/+JGuHmaNAsWRhOCvmXQqix7jGsF1ESt+3tdAZfxW69L8vbhjD
         KIxp/U/Vq5rtda6vxc/+SRxldhIoqb/HSa6uCu/FqRaZW9tYgqDqJVS/tAypt5jaxg+L
         xvHgNih7pIF6aIAJJMGAfB1Lbtyu6xwpLBYWvcRjAvTRY7VWyB2hdPpcMTX5VYFntRag
         5Fkv8s63ton9iTBUm2jG2Y7B3uFNqhqIxhJGYPJzc7g2fyUZNFaiH4+ApOd7ywNY+8Pi
         5zgA==
X-Forwarded-Encrypted: i=1; AJvYcCUfnKGcdkSDvdeA4xOQZjC+pvRH4honmNijhNfeWlKoLGVap7fn0KOc5EDtXAxkledGcXp9RyJpqDXBXpwg2jA6VzcJNA39xkQkVpc79qiGskKe
X-Gm-Message-State: AOJu0Yw4j1jZLM8fiGFUbJmlq5PlhY2rbtfW8HS0qCK5hbriirmU4S+6
	l2MnhMpDZtgYgGCd7lnAqmEbz+sknJAwbouKeFvvbOpZICEY26fdRsqs02lKxQ==
X-Google-Smtp-Source: AGHT+IGUOjA6NKyVT/+ELVqwwCceZpb+FILLMln0YYk0jw8k+fwEMqxkgdfJr/x+JyjJ3SCGlsnvew==
X-Received: by 2002:a50:f603:0:b0:56d:e947:dd52 with SMTP id c3-20020a50f603000000b0056de947dd52mr471101edn.26.1712041879594;
        Tue, 02 Apr 2024 00:11:19 -0700 (PDT)
Received: from orzel7.c.googlers.com.com (229.112.91.34.bc.googleusercontent.com. [34.91.112.229])
        by smtp.gmail.com with ESMTPSA id g28-20020a056402321c00b0056c1c2b851esm6395171eda.0.2024.04.02.00.11.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Apr 2024 00:11:19 -0700 (PDT)
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
Cc: Wojciech Macek <wmacek@chromium.com>
Subject: [PATCH] drm/mediatek/dp: fix mtk_dp_aux_transfer return value
Date: Tue,  2 Apr 2024 07:11:13 +0000
Message-ID: <20240402071113.3135903-1-wmacek@chromium.org>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240402_001122_878975_DA811D55 
X-CRM114-Status: GOOD (  11.82  )
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

From: Wojciech Macek <wmacek@chromium.com>

In case there is no DP device attached to the port the
transfer function should return IO error, similar to what
other drivers do.
In case EAGAIN is returned then any read from /dev/drm_dp_aux
device ends up in an infinite loop as the upper layers
constantly repeats the transfer request.

Signed-off-by: Wojciech Macek <wmacek@chromium.com>
---
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
2.44.0.478.gd926399ef9-goog


