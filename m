Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F298E77199
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Jan 2025 16:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=; b=jNNryikzYGIf9r6P3OHW5h4oce
	sAoRh2aReHT7mF/Ke3cuLnQfrBo9UjH89Mc20zo0h7tNTc5iexxLvDPcfMCePDSTiejTj4ncs/yba
	w/QYzgtRHOAiFGf1FPY0SDaoKvr1CWOeO+cL4cDVfuivj+SApQv58/WIkTVvXrUWHOGoxMwdxEOiW
	3GPsd8eiRggT2sRDkfqnggs1QdLSWIobH85FMTcG+veziDlme50x9XhXI2qDSTGWt0aEFCS2lS1Wk
	z8cP9zcIbGoG/XbMGHg5kLWeidy4opHgsjQOTvRGQSZC/6IEN1qeoP9D717OtEz/NcWx/UAvQf4YB
	JrVUJ3ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYlD-000000098vP-10Kp;
	Wed, 08 Jan 2025 16:18:23 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYil-000000098H2-2l19
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Jan 2025 16:15:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4361815b96cso6315e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Jan 2025 08:15:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1736352950; x=1736957750; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
        b=IPB92KbvgJ0XzBWa2MA8sTllD5036Nw9b4krQex68GtkAapLQdvBlezQ51Bc8jL41W
         y+weOj/lQ52D1wZh7WAVH37QZmi1fR8StS1tE3Csl0C2FxVpustG9SccmG12LNZLW8lM
         h8dD0s44GrckwiquRUL8z/SAtkdLm20hjBIh1Y+7+s5J72ScylcDBgOs2mpZDXJwOdYZ
         WMHf1VD2mUGcC0kY9gFYb+F14i0tCD/y3uR2r04ICDSMbWobFrzUNjQ7+qt+6dtQYp1l
         rxYkDWlMNYn8WSAwvfiO6KUt7b1Cml/rC1oRpbN8wgYjPVvfK1IftQ55Cp1qJwszec39
         tnmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736352950; x=1736957750;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fy/DbTIkkOlFt9RUb5dJSds3N2C+4xTIp3gr3Wl8Gls=;
        b=Gu45QIh3SHXqEvY2otxC6XrXleezoyKy0sWwwUoJdgu6cwcJ4IUAAEEVO7B/2jtOl2
         1nej7am+xXlGMWayb4UkdT8SJ/NpR9hKdPwFb42lnpE6iZf0YO2Gzo1WN6U5P9zuY7kk
         NLgjPgElo6QHIuELfzjAzD3nN3ojHnwfVFvJM008zjFQSteNpI7nWA8rH6NP1PpRyJxv
         WB6uR7mf0kyeRIo7FZJLPzImkrgFlDY+khRY6dz4tVF6ESx7gfwun/4CE3iRVnwYjGqV
         lnqnYCR5At6zVaRoOd8uNME8YIku0z0W5tM1mS18kKvDNQUuaAKI1a3bPCOvFQ4A1mMI
         rcSA==
X-Forwarded-Encrypted: i=1; AJvYcCVC6VPm60/T/Uw+tDeJyvRs7f8Uc0aP3hHHXhR/miEZiHaT3VyOc5EKwGlu+I+NYeMAUsRVlnIWGzfqbS7EZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFUIbW3MC/vgAKHcFa49GsuAzuqfaOpbqA9+MlEwtLbbJmHPDB
	PmECcGLQGLYFC623UXkAoEqL/Tr6Z8oTCu+BhVYuYxuw5OeHNHjlkXJVlrII/zk=
X-Gm-Gg: ASbGncsOVOD9y4Q5ClXiGFypaC1ZpvAVBAJSNMUKVpc25zN44HHmzr3DZDilHzpkGKu
	XpFs7mc4Xh702hLZUR7+D5YUdUUIvn0uGCr/mjXO4zvUpNo5iwLbKQvCEXzUPoTEcWZW9VQqAEg
	VzON6Pf4jt4ldv2w+ccQZ4u/oORUbjZ+iy8G2prlM02iLwvO2YCG5WAeECeHJU9B2ct10KRztsy
	9haiwq8aPpcB7sIRwSK6I4h/b5ZSbQ6Jbz7aP/EwMDzelkuPDohJoz3DBwj
X-Google-Smtp-Source: AGHT+IErwM3j92JVYdrvJX3rbay8OfkvXx94igFMozvvvB4mQLpq0RzpMVuPEGWSZVlYGy9bvneCfQ==
X-Received: by 2002:a05:600c:1d9c:b0:436:1af4:5e07 with SMTP id 5b1f17b1804b1-436e2696d35mr27681225e9.1.1736352949654;
        Wed, 08 Jan 2025 08:15:49 -0800 (PST)
Received: from [127.0.1.1] ([2a01:e0a:5ee:79d0:a6ac:e6d2:88e3:8ea1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-436dd14dfcasm44378105e9.1.2025.01.08.08.15.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jan 2025 08:15:49 -0800 (PST)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 08 Jan 2025 17:15:44 +0100
Subject: [PATCH v5 2/7] drm/mediatek: dsi: Improves the DSI lane setup
 robustness
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v5-2-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
In-Reply-To: <20231023-display-support-v5-0-3905f1e4b835@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1234; i=amergnat@baylibre.com;
 h=from:subject:message-id; bh=Yn0yDiaGCUYQbX+kBDNWi7Wqy2+4x3TU5RubErw6Doo=;
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBnfqSx5htXrZ1ekJrvaqOwSRFlMwld/dEfa0QLcinc
 YbzjdD6JAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZ36ksQAKCRArRkmdfjHURXnkD/
 4+h/AOARecYGq4oShtmb2NW0jX93mfDG2xklUJT2F6zBdbeNzF6+Hf9vpfH4IpJ8qCOhzaDAiccTsL
 n/F91FRgA3NhV9vLIweMBfpouNgCAJqDxu2pVQ8JyFArTbNkI6MaA6tXhjHbSFdkiZkH8YSC72VtwM
 bodY/gV06hSkUUimxNUXCx4v1YuSI8QENLLVyMHqubbw2PAm0ROJpZKngxxzQF9Rq9bqENCWWiJNRY
 Ytvo7Bx4FGwzHo57pskqyQ1mAmfje/TeJfv7GuFhUpZ61PaoWaCK0/2ewIrMg9c62/X2ZOR3VY1ci/
 /+m09ncl6oqERlR2m9zs7k7q9b9jHAEVeeKaCcHuSjYP9kRyfI9jygs7XOJCnpMlcLDLNDRra8gR5X
 FvhyaNTLwPHtRkcueY6llSeCx569I6CL3vY6Kctoc76+wJN/ZYGXnIRbu977CDV4r/PvTP9njiTJ84
 ADMCGK3XcaIRppY8TNSWvsCyP0JBEQSt8lWNXtGem2TkJJePfcXNdp8Dca76q9L7/t6XheWKjOl/CT
 eO3iTUH5b0ZhjfF7Vbbq8kHA7F82w79IHNou2cAvQaKO3Yx6ExoIWkcvl76WWSaY+eikcL3TgEVN2J
 keKvH3T/7q8YjxVodQBfIsjyfX9ikYrJJ/UquoQr3Hl0ZXEosxA3at8BhiRA==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_081551_700302_54436805 
X-CRM114-Status: GOOD (  12.02  )
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

Currently, mtk_dsi_lane_ready (which setup the DSI lane) is triggered
before mtk_dsi_poweron. lanes_ready flag toggle to true during
mtk_dsi_lane_ready function, and the DSI module is set up during
mtk_dsi_poweron.

Later, during panel driver init, mtk_dsi_lane_ready is triggered but does
nothing because lanes are considered ready. Unfortunately, when the panel
driver try to communicate, the DSI returns a timeout.

The solution found here is to put lanes_ready flag to false after the DSI
module setup into mtk_dsi_poweron to init the DSI lanes after the power /
setup of the DSI module.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index e61b9bc68e9a..dcf0d93881b5 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -724,6 +724,8 @@ static int mtk_dsi_poweron(struct mtk_dsi *dsi)
 	mtk_dsi_config_vdo_timing(dsi);
 	mtk_dsi_set_interrupt_enable(dsi);
 
+	dsi->lanes_ready = false;
+
 	return 0;
 err_disable_engine_clk:
 	clk_disable_unprepare(dsi->engine_clk);

-- 
2.25.1


