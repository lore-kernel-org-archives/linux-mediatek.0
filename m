Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F90EC636D7
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 Feb 2023 15:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yWDzXZ2CTB0HE6Y+RGzFo3UpDy7ZrYb9s7Rfu9VNsG4=; b=hiTf/K4L31Ym8MuCAWtoa5RA4a
	3pa/xtGee7SjBp4hPYPm+/OW0DRXnXcZ4eA30ws1dNBPhX8La2XpixhN4yP16VNJjKmuvvyUdsXvh
	0+dwx16uIe+MqAJfvKE9c4+f13UIY5GSnqGwo+xNLZqYTenVmNnuMair7JNmj1ELEK6IxXbrRG4r/
	dTWprDCYQ2YGKndxK6g8I9I158iv+iDt9Eopl6fwiQIfDRTFXNq0GZNfBOG7/cTR/TTgRUbfu8FON
	J+2oBB76Eb/TIZYieFqH6GWoTw2NFWcDKMz5rfuTGI/kWNWz+hXzV8HQyJRG3FKORiarhIKihduu6
	pU+o63Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUiX-008iAa-Pv; Tue, 21 Feb 2023 15:38:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUUiB-008hwf-B3; Tue, 21 Feb 2023 15:37:48 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 109EA660219C;
	Tue, 21 Feb 2023 15:37:44 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676993864;
	bh=wLp/MUto4Fbzizbpgz+5YvVMCnz98kh6pK+WbSY6Uzs=;
	h=From:To:Cc:Subject:Date:From;
	b=OTLUP9TgqYt/3GgW20g1l2DK8lfY8HfHvAicX3/PS1xD2HDbzsXOCx8zsuFzQ2N+I
	 zWl/bq9sf/e276DEAJVTM/uzUGdz/79qMbY3Fli+So9jb1p4rgc9OAkLPyNrZXLKYb
	 A2jwRSVPy2pOlmKzCJRlUE81YP+C6t5aXMjTVmzxCXyZYviEfNnYymJXneVpYPhI3/
	 NeYP1bv2kdJn86AN6zWUt5e/+F62akvXwB1Dv8UtL1A+ziBDVS4qEwjfPPnILn+9bT
	 kSqcsXXWeGbg2E0GinP+1bbZdTzA9bUvcISZziuFrd/Xmm6n883YvqzRnNNDHb72gC
	 Lja9zajOOG1gg==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 00/10] Panfrost: Improve and add MediaTek SoCs support
Date: Tue, 21 Feb 2023 16:37:30 +0100
Message-Id: <20230221153740.1620529-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230221_073747_607453_50BC7D51 
X-CRM114-Status: GOOD (  12.88  )
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

Changes in v2:
 - Add power-domain-names commit from Chen-Yu to the series
 - Kept sram-supply in base schema, overridden for non-MediaTek
 - Added Reviewed-by tags from Steven Price to the driver commits
   (as released in reply to v1's cover letter - thanks!)

This series adds support for new MediaTek SoCs (MT8186/MT8192/MT8195)
and improves MT8183 support: since the mtk-regulator-coupler driver
was picked, it is now useless for Panfrost to look for, and manage,
two regulators (GPU Vcore and GPU SRAM) on MediaTek;

The aforementioned driver will take care of keeping the voltage
relation (/constraints) of the two regulators on its own when a
voltage change request is sent to the Vcore, solving the old time
issue with not working DVFS on Panfrost+MediaTek (due to devfreq
supporting only single regulator).

In the specific case of MT8183, in order to not break the ABI, it
was necessary to add a new compatible for enabling DVFS.

Alyssa Rosenzweig (3):
  drm/panfrost: Increase MAX_PM_DOMAINS to 5
  drm/panfrost: Add the MT8192 GPU ID
  drm/panfrost: Add mediatek,mt8192-mali compatible

AngeloGioacchino Del Regno (6):
  dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains
    variation
  dt-bindings: gpu: mali-bifrost: Allow up to 5 power domains for MT8192
  dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
  dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
  dt-bindings: gpu: mali-bifrost: Add a compatible for MediaTek MT8186
  drm/panfrost: Add new compatible for Mali on the MT8183 SoC

Chen-Yu Tsai (1):
  dt-bindings: gpu: mali-bifrost: Add power-domain-names to base schema

 .../bindings/gpu/arm,mali-bifrost.yaml        | 67 ++++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       | 28 ++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c       |  8 +++
 4 files changed, 101 insertions(+), 4 deletions(-)

-- 
2.39.2


