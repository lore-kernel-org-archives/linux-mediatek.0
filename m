Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706A8C05027
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Feb 2023 10:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ddsF8fDC+BeGZBqaN5axcXRMT6F638aXO2FpLw30GWM=; b=5EWdj/Amtlnna7rAQoeP4VHPc2
	iSsg22sDzm7xoZGyNpVSvgHX8w0kovIWGlEehUB/hTXW2kES9efjLk1golhkuEPYKSBkzJWA0/U5X
	N2Ff+L3u/0aVQwWWCb2hrldKc/iqkCernIlZkIKvFh99WXDu6eXxh6z/UWBXcFy9W/J8XiRDT+Ur5
	myOtrjmVsfbnCSWPSttSALyi/hL4s2QFZFTKAvuCUN4zZY0SCcYJTp01PCdXtQ/TTbuNEdVWWXX0c
	DKZ8/Ck9dgaLAvrI2YkHe+fH0nUFpCWQhSa0OTuNFErHjbsXd6K1SVdziqK8dlxq2JB2UwjAV54vF
	8VmA9a6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhpd-00FDl3-Qj; Wed, 08 Feb 2023 10:37:41 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPhpP-00FDbA-0E; Wed, 08 Feb 2023 10:37:28 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 926276600362;
	Wed,  8 Feb 2023 10:37:24 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675852645;
	bh=/TfPvp6plAjoFcYtaig2qjMKVF3/MF8RCUeLjIAi3p8=;
	h=From:To:Cc:Subject:Date:From;
	b=jsYyniUpwhKiEmMCpHCSu7FEIZHemSO7pZ5dhdU9XIZJ6qA4UAjeg2CsNhM+CuPGT
	 ua0DQDDEQe9HqZgr3cx7xwcZvdNfOtGcKfrd8U+pOxZ0pIuM9D0NiR3HZjseDq0tDK
	 0djHoqY1NwshX4wqhMewQ/XEhXtGI93+iC3X5SeOhkNdtN6Lqdh5YAvMn5NpSdIwmE
	 ugYy1SKGdx1oCMr7F8Vq63NVealo52RpaxejkvdLr1M+hnGue0b38AWcp4zWVmRreK
	 5qYWdsrAaaY3i8DrMnPXM4jUAXMrzcWDpgP5nzZa/t9pVKaFDdOH70Arypy+KgxjJr
	 /6EmWDQs6p3rA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Cc: daniel@ffwll.ch,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tomeu.vizoso@collabora.com,
	steven.price@arm.com,
	alyssa.rosenzweig@collabora.com,
	matthias.bgg@gmail.com,
	robh@kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 0/9] Panfrost: Improve and add MediaTek SoCs support
Date: Wed,  8 Feb 2023 11:37:00 +0100
Message-Id: <20230208103709.116896-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230208_023727_194721_513A384A 
X-CRM114-Status: GOOD (  10.81  )
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
  dt-bindings: gpu: mali-bifrost: Don't allow sram-supply by default
  dt-bindings: gpu: mali-bifrost: Allow up to 5 power domains for MT8192
  dt-bindings: gpu: mali-bifrost: Add compatible for MT8195 SoC
  dt-bindings: gpu: mali-bifrost: Add new MT8183 compatible
  dt-bindings: gpu: mali-bifrost: Add a compatible for MediaTek MT8186
  drm/panfrost: Add new compatible for Mali on the MT8183 SoC

 .../bindings/gpu/arm,mali-bifrost.yaml        | 68 +++++++++++++++++--
 drivers/gpu/drm/panfrost/panfrost_device.h    |  2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c       | 28 ++++++++
 drivers/gpu/drm/panfrost/panfrost_gpu.c       |  8 +++
 4 files changed, 99 insertions(+), 7 deletions(-)

-- 
2.39.1


