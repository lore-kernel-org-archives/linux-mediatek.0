Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03D93C28B2E
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Mar 2025 06:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6+r1QXMQf3uYFE2tvxH1CYcSYXjplxaG/oGSLQxpEO0=; b=W3QnU+pQsUIpuUQpTKrvf3QcAM
	joBEYx5Qm6dMX/jNyf9Z88KRMpFdrHw62YYLxs+4GlqJ2dS7c0hF8KJMuDL0gZif7rJrjUp68piv7
	qetE2icR0HYdujbbDWC2YIBiNQ9i1GZ4q92Z7p3Qoo5lsCWwjctIiUcQcLBq3a7bSoKNEIiIdBf2r
	5GQZ5nhkebJ4OpWPY3f0hneaPqkb9V0JrbcpE8HmKnxWYqR9fD9Ijbmih6OUk3RHptlH1lVi0B3tI
	rnCCY5k+U4dMi+Y4BXJ1IqmiaP49HrOkcS2f6ZoBAnLriqwPf4sYhAc3xJEI8uII4d4iTprZIAhMP
	1m+vAovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trt2S-00000004kbQ-2t4b;
	Tue, 11 Mar 2025 06:24:28 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trsvV-00000004jdo-14Ry
	for linux-mediatek@lists.infradead.org;
	Tue, 11 Mar 2025 06:17:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741673834;
	bh=+c3rP9l5bYRgyQgzqdBiyBHNs0Vnao3tQSZD7Jt0tYs=;
	h=From:To:Cc:Subject:Date:From;
	b=hlqCPBvZMIIR/XIcU/pmYxeSrxXNRMeqE9xR9QTJ4wXTEUxs3Y5jTim9sw3HRYpoo
	 G9Cn9/HfnD3xKt+3i25/+u69Cp8WQdO2kILlNGOm0ZQQzj2WZiCegRAcj3h4BfjBgo
	 VaEMtjKwNyMgXHqC/wI4Gi0ru52KWtdJYM2pMqESWC7BDS+FL1uGabefiNeANI4YDQ
	 meYujK8q04Tv57hsOWrV2qC21mWV9/qEC7fYfV0Z/6oRhzSUIglMjB9katfKwnTNME
	 0x5hVGViqbiWqg/agYeAKgAPkvrxm8tXPrzRFGCaEh+7Y5ZI+BbWGjm/RbKMKfQtvT
	 dh/bFTY9YsGpw==
Received: from localhost.localdomain (unknown [103.163.65.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D1F9617E05C1;
	Tue, 11 Mar 2025 07:17:12 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	nfraprado@collabora.com,
	angelogioacchino.delregno@collabora.com,
	daniels@collabora.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] arm64: defconfig: mediatek: enable PHY drivers
Date: Tue, 11 Mar 2025 11:46:59 +0530
Message-ID: <20250311061703.16850-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_231717_454502_5F7B5561 
X-CRM114-Status: UNSURE (   7.24  )
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

The mediatek display driver fails to probe on mt8173 and mt8183 in
v6.14-rc4, with the following errors:

mt8173:
platform 1401b000.dsi: deferred probe pending: mtk-dsi: Failed to get hs clock
platform 14025000.hdmi: deferred probe pending: (reason unknown)
i2c 1-0008: deferred probe pending: (reason unknown)

mt8183:
platform 14014000.dsi: deferred probe pending: mtk-dsi: Failed to get hs clock
i2c 4-0058: deferred probe pending: anx7625: fail to find dsi host.

Enabling CONFIG_PHY_MTK_MIPI_DSI=y in drm-ci resolves this error,
but mt8173 still fails with,

[drm:mtk_dsi_host_attach] *ERROR* failed to add dsi_host component: -517
panel-simple-dp-aux aux-1-0008: DP AUX done_probing() can't defer
panel-simple-dp-aux aux-1-0008: probe with driver panel-simple-dp-aux failed with error -22

Enabling CONFIG_PHY_MTK_XSPHY=y and CONFIG_PHY_MTK_HDMI=y in drm-ci
resolves this issue for mt8173.

So enable these PHY configs for mediatek platforms.

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f25423de383..09aedc3447b7 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1573,6 +1573,9 @@ CONFIG_PHY_HISTB_COMBPHY=y
 CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
 CONFIG_PHY_MTK_TPHY=y
+CONFIG_PHY_MTK_MIPI_DSI=m
+CONFIG_PHY_MTK_XSPHY=m
+CONFIG_PHY_MTK_HDMI=m
 CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
-- 
2.47.2


