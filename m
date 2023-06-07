Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D33DC87FDD
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 20:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2ODT61TphyftSLJ6O1NQGmCrNsqKtl+gxSjHbKJ1Vck=; b=D7nBXCvO/zKynAEwr02zuoyv/m
	52OYaDAfguVsxm7ckfy0KxnVw3A4HJacSsZyXT0KXIWzzgWro39MxA1+jMfoMfP4AYyJ9ofVK3adE
	/BKGgf8ld1VEXBlmLPm47IXIU6YhwdaYjh4Zr35JeCzgRG1aJw5hHKpke/ZjzzQr+2fQXEF1p5Sko
	kqsUoxr2Y5svHM+pH18kZRYH4fh9fLHPa7iD362dsf+KglghSHg2bEZgPi4SnAu95fQjt8MLEshrV
	BagrnMKLWZPBbadgZdo9rcc3G3AV5CtAI6lqk5LH9bdGxjZozd9mazn6Ttwcceylfd99rmip93qjU
	H7VOvgTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q70Dm-007DKZ-2W;
	Wed, 07 Jun 2023 20:57:34 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q70Dj-007DIN-0J;
	Wed, 07 Jun 2023 20:57:32 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8C01166032D2;
	Wed,  7 Jun 2023 21:57:26 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686171449;
	bh=3Ss4Xbs+eUeVm0wwUGrfx/rLq0kUmO44VcFrpD6blPQ=;
	h=From:To:Cc:Subject:Date:From;
	b=Hjy4ZAVDbkJPCL4X1AXfEB2Qx119GEsaxIbUuBS0OMEF7Rq9rtwOugPt2aFyEie0i
	 fKbdk32a3zQF8wT4eUuV1aZVpksNTJFwhr1BVsRUkaY2VDNb64IagZxnCyfEsm7JSr
	 YlHGXXbaw7WuKIiJcc2wQRA2jBRFc7JifUkg+wBW/1UahWkwhXJKRg21WkAJGR8o1Q
	 hbXEVn06a0H/rFhsnkHyqGx8hSBdVRfnm9TguMpGP5QYPUYqh4VdfIR+/EFNI1YVO7
	 8YON8g1BUz0/1/D/NrO/+3mbbWR8o9CumX2U8FczxHYottf3ww5OiUX7wzyH+udumm
	 lxmDVGfI+tEOQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Miles Chen <miles.chen@mediatek.com>,
	Rob Herring <robh+dt@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/5] Enable decoder for mt8183
Date: Wed,  7 Jun 2023 16:53:37 -0400
Message-ID: <20230607205714.510012-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_135731_317203_E6DE146A 
X-CRM114-Status: GOOD (  11.88  )
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


This series enables the hardware decoder present on mt8183. At first
glance, the only missing piece is the devicetree node for it, however,
simply adding it as is would cause an address collision between the
first register iospace and the clock-controller node, so a rework of the
dt-binding and driver, as well as addition of a clock, were needed
first.

Tested that H264 decoding works with the hardware decoder on
mt8183-kukui-jacuzzi-juniper-sku16, giving a fluster score of 98/135 on
the JVT-AVC_V1 test suite. And ensured other SoCs (MT8192 and MT8195)
still work as usual.

Changes in v2:
- Merged commit 1 (media: dt-bindings: mediatek,vcodec: Allow single
  clock for mt8183) into commit 3 (media: dt-bindings: mediatek,vcodec:
  Remove VDEC_SYS for mt8183)
- Further constrained properties in dt-binding
- Added CLK_IGNORE_UNUSED flag to active clock
- Reformatted reg-names in DT node

Nícolas F. R. A. Prado (4):
  media: dt-bindings: mediatek,vcodec: Don't require assigned-clocks
  media: dt-bindings: mediatek,vcodec: Remove VDEC_SYS for mt8183
  media: mediatek: vcodec: Read HW active status from clock
  clk: mediatek: mt8183: Add CLK_VDEC_ACTIVE to vdec

Yunfei Dong (1):
  arm64: dts: mediatek: mt8183: Add decoder

 .../media/mediatek,vcodec-decoder.yaml        | 65 +++++++++++++++----
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 30 +++++++++
 drivers/clk/mediatek/clk-mt8183-vdec.c        |  5 ++
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      | 59 +++++++++++++----
 .../mediatek/vcodec/mtk_vcodec_dec_hw.c       | 20 ++++--
 .../mediatek/vcodec/mtk_vcodec_dec_pm.c       | 12 +++-
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  1 +
 include/dt-bindings/clock/mt8183-clk.h        |  3 +-
 8 files changed, 165 insertions(+), 30 deletions(-)

-- 
2.41.0


