Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A64ECEEF33E
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Mar 2026 09:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3m+ZBfQr6KmPEhxpy7eMNYP1AMMqlCKAQGv3MS7448=; b=xNCfzAtWMWKwvbq18f9OyHuVBL
	BwS3lFhsMhRXrQLxV01BpTIHMJuMQhSeGrtHpS26NcL/FzpRh5kqVb9fmw6OYCUulJcp2EyFxjcJR
	daDw3eV0lz583mLUu7kFDjSaIhPb+yZKiTRZnGHcQ4thB2i43sGbkp0xF3uWel14cPozo8/UKGwSs
	NNtPdz8h5xsHwX2XCV5kmUWHYwBK4/eaGJGJUB3l5lPiPjl6dTIYugFf8tQ+r8NeT6O0f4+lVvs/d
	eYNoLMwo9LW+3RhrRvZByvVIa7I8l5ZJKngu2C7CWK4bX42dW7P8fpLP42/Tz0pxxKLTm6PrT96VI
	vmL3cDNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4e7-00000001Hd3-1RiS;
	Thu, 05 Mar 2026 09:05:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy4e2-00000001HWf-1PE5;
	Thu, 05 Mar 2026 09:05:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A740661344;
	Thu,  5 Mar 2026 09:05:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEED7C116C6;
	Thu,  5 Mar 2026 09:05:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772701521;
	bh=sIOpPbGND5afLcivkJfIxu5waFc041nLNjD3trLHArs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SdiZzGCk0jG//olHlzTWO/kOiEJpJ7o6c9g50CKSWxebcaVcxhBh1aHCsCaaXrxn1
	 lFbskQe6oMlYkyH2Xpg2r9gDsUBIYg5elnYFsSMaOpIKpuSNs9utcQN/T6D9sacupI
	 lfsM9qTWlEk5B1hs8US0ZLUoy3yut6wckc0dO2Y76SZFyJ8fnvrKnAnTDIaSZX3ZO5
	 9HaXROAQXiG5bKyWhDSjMsuNUv3WPyYiaNvGYMuR3YhyxS+Mxb7GPdvDFt7FswoJyL
	 tYKvWcfFQVcb7YIbX74rPx1qMzyWlPWxCQ0EdY8bYEbD3outgsKh4UtYf877bSe3zD
	 hyccnJEyKmOng==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 05 Mar 2026 10:04:58 +0100
Subject: [PATCH v3 06/14] drm/bridge: analogix: Convert to
 drm_output_color_format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-drm-rework-color-formats-v3-6-f3935f6db579@kernel.org>
References: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
In-Reply-To: <20260305-drm-rework-color-formats-v3-0-f3935f6db579@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>, Liviu Dudau <liviu.dudau@arm.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Liu Ying <victor.liu@nxp.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1747; i=mripard@kernel.org;
 h=from:subject:message-id; bh=sIOpPbGND5afLcivkJfIxu5waFc041nLNjD3trLHArs=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkr3S1vBT4IWX79y+djb19r7181f/WX3b0NyikBqbnKZ
 dc/mk3S6pjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATsb7F2HDKIOitk5KmySlh
 s1OXZZckvdmyJ9ey6WHr7Mm2xjZ7t504xXK88vTbpevzIiflV+zQjGJsOKlrxCD8JU5N5+4i7Rs
 5q7tW129bLXygy/Pj+a+ly5pkjT/+3Kn3e4LneSPbNxkP91pLAAA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
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

Now that we introduced a new drm_output_color_format enum to represent
what DRM_COLOR_FORMAT_* bits were representing, we can switch to the new
enum.

The main difference is that while DRM_COLOR_FORMAT_ was a bitmask,
drm_output_color_format is a proper enum. However, the enum was done is
such a way than DRM_COLOR_FORMAT_X = BIT(DRM_OUTPUT_COLOR_FORMAT_X) so
the transitition is easier.

The only thing we need to consider is if the original code meant to use
that value as a bitmask, in which case we do need to keep the bit shift,
or as a discriminant in which case we don't.

Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index b1687a4aa04739fa53f1039376da649ddcea7f41..1dd194bf49cd8f94a2b48f1f32baa262e5e5dbf9 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1221,13 +1221,13 @@ static void analogix_dp_bridge_mode_set(struct drm_bridge *bridge,
 		break;
 	default:
 		video->color_depth = COLOR_8;
 		break;
 	}
-	if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
+	if (display_info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444))
 		video->color_space = COLOR_YCBCR444;
-	else if (display_info->color_formats & DRM_COLOR_FORMAT_YCBCR422)
+	else if (display_info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
 		video->color_space = COLOR_YCBCR422;
 	else
 		video->color_space = COLOR_RGB;
 
 	/*

-- 
2.53.0


