Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD4FC636D6
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Feb 2023 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qv16WovP+i63f01U6yE5nGQSgXhCKEfAq4QKaaRSsM0=; b=tDA6Yql9m6Xqcy+vl+tLu36HdS
	VVS8PIvL+OVsiwvXk9P6efPtZvBzVmwzmN+P+ExQAmMoBAb21Yfv52Iw4YdAzu/iIuhn8CmJL6vaX
	h5A+fxcbzMRwcIZ3gUzkku4t3JTqHtd8443RxGqKcMd/i+ReHl18x+5EX72OEch4K+/xY5MFYJ44t
	G446tgGyi9ozaDg13kETfdeLZ+6LfDEyxa4CfSCRRpw5QBIDgxdjVzwv1G6Zq4/hy5VAfkZpx+Ecy
	QjSYz8HahneQvV/+NP2JZ5WOr/c0/kpljDZZqjwJdgAWLly7AJj4C4Q4FQAg905bQ0A6izl8JJNyP
	onJOK9/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBka-00GT7C-LC; Thu, 23 Feb 2023 13:35:08 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pVBkN-00GSwn-1S; Thu, 23 Feb 2023 13:34:56 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A42EA6602206;
	Thu, 23 Feb 2023 13:34:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677159293;
	bh=J05VOJ/v8ZM7p27Zfp7JPs6FlzOQ0Zl1Z4LmO44WWW0=;
	h=From:To:Cc:Subject:Date:From;
	b=aVlcM9y0itDo2u20hnTMH+9kRHmVOG5U90DIodX+9QMNY+RItjxJq7Z1MRgEu/Sgu
	 DuoBqQJCUQghxYzKMcwHuF9frPrarwqj/85fbtg9E1dIrldJ2UkGyMg8sAp0jlBrrW
	 /K3I8m5WWPrEGYs5TFV4HkvPvtiL/eJPD6CDJLJcW+dzIV99WvpEu/N93o2FGwr0CC
	 716Tyi5cRrxGhYzL0a9MPRAIQMSCrIkNjqjqqgZkkkxwsifnnIW/zSbHnr/FeMmP+h
	 UfUsAFL8tk8A8WmGRBaMB2WP6tO7XnVD9V3SPIS61c/xybegnKC56X+jTEDuhbYEne
	 ErD0hDg9xp6Rw==
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
Subject: [PATCH v3 00/11] Panfrost: Improve and add MediaTek SoCs support
Date: Thu, 23 Feb 2023 14:34:29 +0100
Message-Id: <20230223133440.80941-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230223_053455_236863_91CCF8A9 
X-CRM114-Status: GOOD (  11.86  )
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

Changes in v3:
 - Changed MT8186 bindings to declare only two power domains
 - Added a commit introducing MT8186 specific platform data to
   panfrost_drv

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

AngeloGioacchino Del Regno (7):
  dt-bindings: gpu: mali-bifrost: Split out MediaTek power-domains
    variation
  dt-bindings: gpu: mali-bifrost: Allow up to 5 power domains for MT8192
  dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
  dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
  dt-bindings: gpu: mali-bifrost: Add support for MediaTek MT8186
  drm/panfrost: Add new compatible for Mali on the MT8183 SoC
  drm/panfrost: Add support for Mali on the MT8186 SoC

Chen-Yu Tsai (1):
  dt-bindings: gpu: mali-bifrost: Add power-domain-names to base schema

 .../bindings/gpu/arm,mali-bifrost.yaml        | 80 ++++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       | 37 +++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c       |  8 ++
 4 files changed, 123 insertions(+), 4 deletions(-)

-- 
2.39.2


