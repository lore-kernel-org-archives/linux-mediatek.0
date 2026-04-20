Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D835F36C24
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Apr 2026 06:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7B1zAJzyc2aJm8FtQJrwknWWRUXny98vqjyGldOGID0=; b=klIwdQMi5ttgt895zd9cs0uUhq
	zmXGLSO1i2tzeTHuoEgN9nwcDrHrwQdoSwOGKub5pBEffknMJ6d3o8wUUkk9/wu4jt7DEAXacwLzX
	WxVJ9r9nY3woMlAhrFP0D4q6BJCu9DMcEUEq2vJkSGjFYALHldGx27/08kp+NwZ4TMh+FYURvUuNE
	oQ74PijBzXxJUtlUqNzNVabtci2CZj+9fVa3kIz5docuKRKEQoMsXaDxSBwf/51cH+Ku5fWWLu5fe
	1Wgo3DZ2lS2Q+vsvGU+rkUeNxmxi4TDwVHEL0czC3c+poyzZUBBC0sFo3GP93PYE7/K+FjyplZWRF
	NX1N+yiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEiON-00000006VRp-0lTv;
	Mon, 20 Apr 2026 06:45:59 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEiOJ-00000006VQU-0f2d
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Apr 2026 06:45:56 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-824c9da9928so1177847b3a.3
        for <linux-mediatek@lists.infradead.org>; Sun, 19 Apr 2026 23:45:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776667554; x=1777272354; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7B1zAJzyc2aJm8FtQJrwknWWRUXny98vqjyGldOGID0=;
        b=g/AeL2PE/j0r4YUFwu+27WjSqfcGXhiilx1MeF1O8X9GgqfZ6bPYjlKeEjhH+NHVoa
         qdgM2hUHzU9G9YwqbPrsrK6OaoEPptakwm19YWUE4n/pe/K/RLfkRTR7qLyqFWAMW0gG
         a0xaZyquesOzfPeCa4F1HiqOaj7ZAGyqe+vlODgp+R4Umb6t7n95Ha1VNKkkr9x50t1O
         dh3P0SWZ5GcIhRnDjj9XGxYblV8TEzMsQZe2LKRoKo2N3OwJOy26AOuJ9v0PNAAYS5tv
         fwcVPTcF6guzWwUxGwlm2Oknlji8e8SGJoSEttXQ0nPzPvSS5nyAMD16venFH5hExBjS
         iZww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776667554; x=1777272354;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7B1zAJzyc2aJm8FtQJrwknWWRUXny98vqjyGldOGID0=;
        b=DAu6e6yK3qkFEqaUwepUsYvN1w6GqGNk45yBMs0w+b6gXZuwC4pgrj1Xjxpwp2AY+5
         2Z52b0NlnxofEBk1k4Qzwx7oT70iY5KrDz0wl9eBDuTxU+5DOgDkIrOaJVWTI/BalALT
         XgpJUNaRcoKyQNCrHtf6sqP9UNomHKsctj5MVk4j2RjQbImRoB+hYjZX1j0BjijLzi+6
         9HJgEJd45kcuCMc9QooertLBCDC66SDuQCst4Q+tAJzp9obIpj7Chn8U7UudBX3BiWq0
         6pqssxSm36gZzMGoigEeo0qVco2MGbyhI2EAwBjJk1mQdY8S4kn7qsrmGzhQaXHy4mGS
         Nqyw==
X-Forwarded-Encrypted: i=1; AFNElJ+2OS3lRHC5nRAICAawKkgIDGzDwt68sgQxiLxaiRJq3WLCePcRCIbnLgvU9Rf5q/Ifzb1DPN+ziO9o9KzfXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyOMEuslvywsuYlgcOS/jYuiqbnCUL2oE6ZKHCIV4dp6uJEJyL4
	HBoODssKxQlRD4QEVOs/ddys/A/75a2CJ8RzHIyRjMXmeuRq19GcFH8H
X-Gm-Gg: AeBDieuVC+v/QMLEx1K1SJe4wfupyxNhUFwLVnT4nimGi6rsAy1dtPoiL1hcZ5S9pL2
	6QjDzzVjFtqfjL1EuJG/4I/jVPkWZHZba8mBTPuI6poqNojov/odan3isktQeIxnIjnopXDOFjW
	V38lWtrWbFcSuEOIGgxArupzRel2bagzuZ4rvNVcRBUCD7YbcMo+D9ZlGnoeGtDIpKw7WKk5lcp
	4iL9DI/HKZM7I1Ro63GNOdkTNT5e5CtCUjwX7Km/Bad6Z7EX/h+bEZ8Q1QbkEAQvPHmr3nzUzDk
	9H41r2/vpHWAQN84zC7SOfUS6uF0wqutoO4oVN0cDRdDqgv0V84RXZpAnj8fu8Si/zISkxf+aqe
	9ZWCGqOof3hHKXaoluttxxdCXGS03XMhgSRudWbG+1xO+Ik70FgSF2Qee26k5yYCMx83WwJglkm
	Ls6doGDkJMlxIj068Oi/aV+YcRrl/vMsfd6SSuK1GUwUJN9gjQ4B3HsA==
X-Received: by 2002:a05:6a00:1891:b0:82a:f02:7355 with SMTP id d2e1a72fcca58-82f8c97a4admr12481591b3a.32.1776667553827;
        Sun, 19 Apr 2026 23:45:53 -0700 (PDT)
Received: from dbc5pt3-os.ban-spse ([165.204.156.251])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebe68ebsm10509177b3a.47.2026.04.19.23.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 23:45:53 -0700 (PDT)
From: sai madhu <suryasaimadhu369@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sai madhu <suryasaimadhu369@gmail.com>
Subject: [PATCH v2] drm/mediatek: hdmi: Convert DRM_ERROR() to drm_err()
Date: Mon, 20 Apr 2026 06:45:44 +0000
Message-Id: <20260420064544.266478-1-suryasaimadhu369@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_234555_211435_B00151B9 
X-CRM114-Status: UNSURE (   9.49  )
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


