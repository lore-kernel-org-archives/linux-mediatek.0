Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB13C624B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 13:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/VqdI9YeVyOYP3rilkcTMwdMToZ1TyIAO1ngW+BCWds=; b=n7cyJVOpQI5kVVVOyZ7x73bUEj
	/btWEI+IDSLi1dQHxwZQuAnD0tyxpyJHDkEa5wij21Ds63g1zoelMC5lgRAR1LUNIi9SaVGN1E6SM
	CckHWaKcKr85a96lULm9XQPI2y39wPhmOiO55kb3jmm2jgV44gBgIUK5dwVYqCVjxnqIEmrfGbf4G
	YZIP/KCidQG07YAY0bZ7BrH8d3DK0NdJEwEvDfsC1R1Cysac+6Yk7B+VuOVjIEpWs+qj9i5ARX9TV
	x/Abo+EMtEleFD3U5+W2pOvyvuRTD2Ie5djCmQDumQip8cH7DdLRvLJvL2oij2aFfzxTDDuSd4NAg
	SrVq9rIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r69uC-004uEb-19;
	Thu, 23 Nov 2023 13:38:08 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r69u9-004uCZ-0J;
	Thu, 23 Nov 2023 13:38:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A84E3B82C7E;
	Thu, 23 Nov 2023 13:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39466C433C8;
	Thu, 23 Nov 2023 13:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700746681;
	bh=Kbejb0pedrawxY+pi+DDjvZjKDSamA1YE5y/xYy428I=;
	h=From:To:Cc:Subject:Date:From;
	b=UMAztWdfrWZb+e0C/ri4ppoNy2OFRDYeBO2/klDT6OSA68JTnvdYMOGPwHiOlbKII
	 jfRew+TsZO9d1yfQcIA8PzXJbCrv2wn/kqG1GrZKDmQP2QhN+Lb9VO50CqIiIrD3Lg
	 eqQWxCEOkX1FrL/OTu8q+YB9Oqwd72zg7VVuGRz2Nv/05vSY343Sh/FtJJf+6Z4Q1N
	 3R9Q72CXgM6+HzPcywTBMtlFPVG8PC6MyjKHwRcubfAcX4v/XoMd4K57ExZU9NkYyV
	 T7cexV+whxMegO8gqovedEzEPEi0kt+P9/n7f3dcbkiEgi5yh/185+/2Mgq+3hZd+G
	 J2gf0uf60LdrA==
From: Michael Walle <mwalle@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Xinlei Lee <xinlei.lee@mediatek.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH 0/4] drm/mediatek: support DSI output on MT8195
Date: Thu, 23 Nov 2023 14:37:45 +0100
Message-Id: <20231123133749.2030661-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_053805_278113_EE65226D 
X-CRM114-Status: GOOD (  12.15  )
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

Add support for a DSI output on VDOSYS0. Luckily, there is a new
feature to support dynamic selections of the output (connector).
Use it to add support for a DSI output.

Apart from that, this is pretty straghtforward by just adding new
compatibles and add the correct DSI nodes to the SoC dtsi.

This was tested with a Toshiba TC358775 DSI-to-LVDS bridge and
three different panels. Please note, that the driver for this
bridge doesn't work well and needs a more or less complete rework,
which will be posted on a separate series.

Michael Walle (4):
  dt-bindings: display: mediatek: dsi: add compatible for MediaTek
    MT8195
  dt-bindings: phy: add compatible for Mediatek MT8195
  arm64: dts: mediatek: mt8195: add DSI and MIPI DPHY nodes
  drm/mediatek: support the DSI0 output on the MT8195 VDOSYS0

 .../display/mediatek/mediatek,dsi.yaml        |  4 ++
 .../bindings/phy/mediatek,dsi-phy.yaml        |  1 +
 arch/arm64/boot/dts/mediatek/mt8195.dtsi      | 48 +++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  8 +++-
 4 files changed, 60 insertions(+), 1 deletion(-)

-- 
2.39.2


