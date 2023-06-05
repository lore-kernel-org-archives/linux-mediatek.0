Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A780DC7EE24
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jun 2023 16:21:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gHg83O1pDbUWxZFMruRbXwz7Ag8lg4u49eAuGfGvS50=; b=QfNm/vLRcSSgnj/62ZbuZ5AMOf
	hDjsKBE+yvY00kimLxIcA3Y9zca4vDA+xutXX1wFA1mGvhHRSB8Ba+c6K1xLJEnV1EgbTArIKCP+V
	VI7qSViueBpSqWfaRSNAq0F36WqT3rb6T5PO9yPStMPYu8tNtEikpSBBeEEU7/emO4yT5zInug13e
	Gp7NSnwnQV3OeWSB9akHyQ4ba7Icst99SbywWsUZ3E4dvRBeyoyAOUUbuHm7JPSVXMsTL5ARo8w48
	/AeCCETboYVQRHZ63BfIji2qtBotLE0a52Yh65UG4tWBBRBiAe57prDbPg1XuM2IuNdEqUM7/5Tqo
	PMeMwqeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CxV-00G6FV-28;
	Mon, 05 Jun 2023 16:21:29 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6CxS-00G6Dx-1B;
	Mon, 05 Jun 2023 16:21:27 +0000
Received: from notapiano.myfiosgateway.com (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E07336602242;
	Mon,  5 Jun 2023 17:21:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685982082;
	bh=2xM4D3RXODTjflo/pDhE5ajGirQ2J1DJCOKW4dD1ots=;
	h=From:To:Cc:Subject:Date:From;
	b=F++k+VTwB0Fu79tr3WdJ3h/zt13mnAkCtnn5Fppc1BzEzL/Eys+buzrlbawcEK1uj
	 sbxLt27KtZDuoJ2aLDZwS+cd4BOb9vf0Jbw1NeoU4w4xJHhl68fiB/qbwrn7jec3ub
	 Y3DN8Br4UJjhA2hgbivcTYT5WqXWxJlFQz4Yq5gPwsvBZ6cbVSgecTCJa1jXg8dPED
	 Wo6fsNwR8eqZM0D0oU9OtZuEbs3ZbbPVN7nBRz5j9qgkMUuRkMgu6y/A2+YYdX3GFq
	 OoyYAg8+xLTkrqwwgV6iCeL3oW071cmoWCeuic6rX4tzqaV6xwoA87je9nmz0uJmP1
	 YsAZFmnZ0riFQ==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?= <nfraprado@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	kernel@collabora.com,
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
Subject: [PATCH 0/6] Enable decoder for mt8183
Date: Mon,  5 Jun 2023 12:20:24 -0400
Message-Id: <20230605162030.274395-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_092126_626638_0B8267FC 
X-CRM114-Status: GOOD (  10.57  )
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


Nícolas F. R. A. Prado (5):
  media: dt-bindings: mediatek,vcodec: Allow single clock for mt8183
  media: dt-bindings: mediatek,vcodec: Don't require assigned-clocks
  media: dt-bindings: mediatek,vcodec: Remove VDEC_SYS for mt8183
  media: mediatek: vcodec: Read HW active status from clock
  clk: mediatek: mt8183: Add CLK_VDEC_ACTIVE to vdec

Yunfei Dong (1):
  arm64: dts: mediatek: mt8183: Add decoder

 .../media/mediatek,vcodec-decoder.yaml        | 56 ++++++++++++++----
 arch/arm64/boot/dts/mediatek/mt8183.dtsi      | 39 ++++++++++++
 drivers/clk/mediatek/clk-mt8183-vdec.c        |  5 ++
 .../mediatek/vcodec/mtk_vcodec_dec_drv.c      | 59 +++++++++++++++----
 .../mediatek/vcodec/mtk_vcodec_dec_hw.c       | 20 +++++--
 .../mediatek/vcodec/mtk_vcodec_dec_pm.c       | 12 +++-
 .../platform/mediatek/vcodec/mtk_vcodec_drv.h |  1 +
 include/dt-bindings/clock/mt8183-clk.h        |  3 +-
 8 files changed, 165 insertions(+), 30 deletions(-)

-- 
2.40.1


