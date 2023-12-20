Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8229C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 12:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlKu86icAzwmTlQ5JAH/u60XcnTciU0GB9TOSN1qk+w=; b=J1b4tRYpzBKU04AQavInJoOcKy
	jg9RfStzXPjMh03lpmg7z6rw3BoB3IiFCdYuMh9EgNVF9XkJIIJWaDkkzxBMoDgKY3Mpuv3yQ64Ye
	Kwo8+yCEiVg8CHsQ/PLpVztkNzPRSS7KsqH8zyndEg/x5rzBSbEEyyS1e2sbNmsyArf+7gX7rU75B
	G4JFcieW2hbLBWlzMp5O++P8xiBYMOniNatmL5ejBXzZtbsm+ucFGdExztQ/T9pNETJOSNilkxuH7
	lVLtpYtMfhxEiqM81ncIkGuSFmEq4Y7tUp97Z7s1ljjKMzvuQyZllT0U4bl/FSC/xNVJCcQRJl8z+
	W3izb2SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFvQu-00HJeO-1O;
	Wed, 20 Dec 2023 12:12:16 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFvQp-00HJaB-2u;
	Wed, 20 Dec 2023 12:12:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703074330;
	bh=qpXtJHOu5jSPOW1f5fkCH+JXOiMtY3P5YzcKQ2FIVkw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ywssx7ScKZjCM2E1EcQbkx1F9qHokqUu/A/4/4eRBCWi1Rg05UrivLLMwmzgqCTnW
	 ubFieah8nosM+C42rFcVICmu+qAKFt5b+ZRZVWk/SumefaiWsd+MCIyj3XUdIsERQz
	 YrZPFZdeqHwAqzR7hY1/pRjaYIZNWWD0Ho4ydN+3OdxQv0c7WohDWlJwWjgzSvXdoR
	 aEYd6UsuoHtnv50peP1+gZi81jNZ/x89IeEFrm0HuHkATG8t9m+LT2CQIZ1vQ/kOFO
	 hnV66AB+zBycKo+mCjIQ11LdQ7mOEnfJxsusMGDk0lDcyOx1fBr7AXXvHh9Eb6pEZM
	 KfRsK3ziOhXAg==
Received: from localhost.localdomain (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 682393781FEF;
	Wed, 20 Dec 2023 12:12:05 +0000 (UTC)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: helen.koike@collabora.com,
	airlied@gmail.com,
	daniel@ffwll.ch,
	daniels@collabora.com
Cc: david.heidelberg@collabora.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	emma@anholt.net,
	robdclark@gmail.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 7/8] drm/ci: Rename xfails file
Date: Wed, 20 Dec 2023 17:41:09 +0530
Message-Id: <20231220121110.1441160-8-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231220121110.1441160-1-vignesh.raman@collabora.com>
References: <20231220121110.1441160-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_041212_068116_0D541809 
X-CRM114-Status: UNSURE (   7.32  )
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

Rename the names of xfail files for Mediatek (mt8173 and mt8183),
Rockchip (rk3288 and rk3399), and Meson (g12b) to include
information about the tested driver and whether it is related
to display or GPU testing.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 ...ediatek-mt8173-fails.txt => mediatek-mt8173-display-fails.txt} | 0
 .../xfails/{meson-g12b-fails.txt => panfrost-g12b-gpu-fails.txt}  | 0
 .../{mediatek-mt8183-fails.txt => panfrost-mt8183-gpu-fails.txt}  | 0
 .../{rockchip-rk3288-fails.txt => panfrost-rk3288-gpu-fails.txt}  | 0
 .../{rockchip-rk3288-skips.txt => panfrost-rk3288-gpu-skips.txt}  | 0
 .../{rockchip-rk3399-fails.txt => panfrost-rk3399-gpu-fails.txt}  | 0
 ...{rockchip-rk3399-flakes.txt => panfrost-rk3399-gpu-flakes.txt} | 0
 .../{rockchip-rk3399-skips.txt => panfrost-rk3399-gpu-skips.txt}  | 0
 8 files changed, 0 insertions(+), 0 deletions(-)
 rename drivers/gpu/drm/ci/xfails/{mediatek-mt8173-fails.txt => mediatek-mt8173-display-fails.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{meson-g12b-fails.txt => panfrost-g12b-gpu-fails.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{mediatek-mt8183-fails.txt => panfrost-mt8183-gpu-fails.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3288-fails.txt => panfrost-rk3288-gpu-fails.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3288-skips.txt => panfrost-rk3288-gpu-skips.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3399-fails.txt => panfrost-rk3399-gpu-fails.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3399-flakes.txt => panfrost-rk3399-gpu-flakes.txt} (100%)
 rename drivers/gpu/drm/ci/xfails/{rockchip-rk3399-skips.txt => panfrost-rk3399-gpu-skips.txt} (100%)

diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-fails.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/mediatek-mt8173-fails.txt
rename to drivers/gpu/drm/ci/xfails/mediatek-mt8173-display-fails.txt
diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-g12b-gpu-fails.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/meson-g12b-fails.txt
rename to drivers/gpu/drm/ci/xfails/panfrost-g12b-gpu-fails.txt
diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-mt8183-gpu-fails.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/mediatek-mt8183-fails.txt
rename to drivers/gpu/drm/ci/xfails/panfrost-mt8183-gpu-fails.txt
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-fails.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
rename to drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-fails.txt
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-skips.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
rename to drivers/gpu/drm/ci/xfails/panfrost-rk3288-gpu-skips.txt
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-fails.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/rockchip-rk3399-fails.txt
rename to drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-fails.txt
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-flakes.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
rename to drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-flakes.txt
diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-skips.txt
similarity index 100%
rename from drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
rename to drivers/gpu/drm/ci/xfails/panfrost-rk3399-gpu-skips.txt
-- 
2.40.1


