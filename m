Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD39C35FFA
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Mar 2025 08:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pMAOvYmqAtuRvYjltHXc3sU8OYqxZ2ArZi2BHEM7prU=; b=ZxIx4u1LlT0PjI6SgBHLKvbtNS
	nOV2NwG46UKBmCTxvmv+Ss+uzd9N8E1kspPJ2WkITWgNxZfIgixnMQwgvBPekAMB52+XaGRIKkVgj
	4z1oVJcS02PbwYG8bm5G9RweoRVVccwSs2s2a72WekrVXL8/YpxkKMY8vAyYnmzKihdyow3p/Ckd7
	pWBqHs6YaaVRtoWq/V/x7MSDksuzr3J9VNRYmEYZbsWTQRYcLS2RUNSiDtOOuxjrsaRZB3bLJpc1p
	iJoxv13HOeAba0WJHmQPIPPHx92WeuyuUqMIwl/bzFU6amwlDarfrIP5GY3O//eBKQjgMgwVSQmWf
	8UgJfE/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0t8-0000000DajE-1KFk;
	Fri, 14 Mar 2025 08:59:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt0t5-0000000DafG-3bhM;
	Fri, 14 Mar 2025 08:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741942766;
	bh=dO2g62Nlwp+u8LGId8NUD6lLWl2ArcKsTpjA88vbPVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=owLJ1WJu0YKFv0vCeABK86Cs/4CF+m+pf5V2jGXI5Th+cqcCaysIujd1olFmyZou5
	 BCH9bEIqNTJqx1LnT4yxIuzQofiE/ZmInPnWe0LdLTgbdS4E7MnSSROdWsAZmRNFIz
	 E57s7m+GwOo0FVvu/yTb63il4pNmhvdRSvBNyYx0AUBBgppteciBMEnkMP1bigrN9n
	 FE8PjZ1TMZLHsZNg5OX+KHgCP8hcGn5LKLQMbGVlb+NrziOiD1kfWAbgOtjjughYo2
	 oPCPP/nflkUJDGUVQesX6PZE5MxUzbvkSpbLSsda6Fn2xQHqxvinFdcXt3g7WPcH2z
	 UW8sjJvbCRGrw==
Received: from debian.. (unknown [103.163.65.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CA66717E0ABD;
	Fri, 14 Mar 2025 09:59:21 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com,
	helen.fornazier@gmail.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	robdclark@gmail.com,
	guilherme.gallo@collabora.com,
	sergi.blanch.torne@collabora.com,
	valentine.burley@collabora.com,
	lumag@kernel.org,
	quic_abhinavk@quicinc.com,
	mripard@kernel.org,
	jani.nikula@linux.intel.com,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	amd-gfx@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 3/3] drm/ci: arm64.config: mediatek: enable PHY drivers
Date: Fri, 14 Mar 2025 14:28:52 +0530
Message-ID: <20250314085858.39328-4-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250314085858.39328-1-vignesh.raman@collabora.com>
References: <20250314085858.39328-1-vignesh.raman@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_015928_049692_D1543908 
X-CRM114-Status: UNSURE (   7.63  )
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

The mediatek display driver fails to probe on mt8173-elm-hana and
mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
configurations.

Enable the following PHY drivers for MediaTek platforms:
- CONFIG_PHY_MTK_HDMI=y for HDMI display
- CONFIG_PHY_MTK_MIPI_DSI=y for DSI display

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 drivers/gpu/drm/ci/arm64.config | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ci/arm64.config b/drivers/gpu/drm/ci/arm64.config
index a8fca079921b..fddfbd4d2493 100644
--- a/drivers/gpu/drm/ci/arm64.config
+++ b/drivers/gpu/drm/ci/arm64.config
@@ -193,6 +193,8 @@ CONFIG_PWM_MTK_DISP=y
 CONFIG_MTK_CMDQ=y
 CONFIG_REGULATOR_DA9211=y
 CONFIG_DRM_ANALOGIX_ANX7625=y
+CONFIG_PHY_MTK_HDMI=y
+CONFIG_PHY_MTK_MIPI_DSI=y
 
 # For nouveau.  Note that DRM must be a module so that it's loaded after NFS is up to provide the firmware.
 CONFIG_ARCH_TEGRA=y
-- 
2.47.2


