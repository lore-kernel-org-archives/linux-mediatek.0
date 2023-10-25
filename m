Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8FB9C25B6B
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 21:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7ywqZpJrZfzn5BR9N1DQ4lan5McpBx0tLYzW74gOARg=; b=hXm8Gq2lHgHm24F8rfItfLpVF4
	a4EIoyCfpMZLE/1O9HerX83boL5+gHenWopQOiXdNKyOupLZoHUVYC2lwKMDZOBOL0EhNcMsUfj7r
	58zuaJzJca48ll7c8Kjwa0kGkj4HM1nGvWtLCcFHTN8o6s4zIJbVH2VZSb8JMHz0wK89eYi8reGpz
	Y50gWE51TGgXNTdpvQ7iR7fGZbOrDQr/3uOpCSn92EihLHjNgd7xQU/qTqDAnj4bzdyCg67b0fHZ3
	jN0xD89ajch27IOK7pqZGL6J11fGi9AZsiic52VdzF2JkaCNSRWTPvQfE+cWsG6rAMblDLnEprSj6
	NcyMLN8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvl2V-00D8Ug-2I;
	Wed, 25 Oct 2023 21:03:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvl2Q-00D8Sj-3D;
	Wed, 25 Oct 2023 21:03:40 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98F74B2A;
	Wed, 25 Oct 2023 23:03:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1698267803;
	bh=fXEmUy0WZYyb85bJrFBI+SJljhy4sPuA9x8g0VUcsfM=;
	h=From:To:Cc:Subject:Date:From;
	b=c+x34auYXyi/tBE2412J1pn0RATqIXoYqoPwL9AJeiJcnq5uewxAaEASQD0VOs/zv
	 7YybuvWM6cEs+5p6KkjP7xK1ZFfDvEDcNIUMC9TsHYVxllDMFvKtD8K5b70anS0xM4
	 HqL2wynmGViXLsbrai8DIwKS5yK/mr9u+Yo1VBvE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Fabien Parent <fabien.parent@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>,
	Julien Stephan <jstephan@baylibre.com>,
	Suhrid Subramaniam <suhrid.subramaniam@mediatek.com>,
	Ted Larson <ted@ologicinc.com>
Subject: [PATCH v2 0/3] arm64: dts: mediatek: Add device tree for MT8365-based Pumpkin i350
Date: Thu, 26 Oct 2023 00:03:39 +0300
Message-ID: <20231025210342.30995-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_140339_178747_7C61B841 
X-CRM114-Status: GOOD (  13.39  )
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

Hello,

This small patch series adds a device tree for the Pumpkin i350 board
made by OLogic. It starts with two small patches to add a vendor prefix
for OLogic (1/3) and a compatible string for the board (2/3), and then
adds the device tree (3/3).

The device tree is based on work from Fabien Parent, with a few features
added, and a set of devices removed:

- Audio support, as I can't easily test it at the moment due to lack of
  local access to the board.

- Display support, for the same reason.

- Dual-role USB support, due to missing bindings and drivers for the
  TUSB322 in the upstream kernel.

Support for the crypto processor (ATECC608B) and the WiFi/Bluetooth
module (MT7663S) is also missing, but this wasn't present in the BSP
either.

Once camera support for the MT8365 lands upstream, I will probably send
patches for DT integration with this board.

Laurent Pinchart (3):
  dt-bindings: vendor-prefixes: Add prefix for OLogic, Inc.
  dt-bindings: arm64: dts: mediatek: Add ologic,pumpkin-i350 board
  arm64: dts: mediatek: Add device tree for MT8365-based Pumpkin i350

 .../devicetree/bindings/arm/mediatek.yaml     |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../boot/dts/mediatek/mt8365-pumpkin.dts      | 541 ++++++++++++++++++
 4 files changed, 545 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts


base-commit: 05d3ef8bba77c1b5f98d941d8b2d4aeab8118ef1
-- 
Regards,

Laurent Pinchart


