Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20BE4CDB465
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Oct 2023 21:51:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j3l4fAGaqWTJv9cSVW4cB5gatKCd4RNRO2qeEH9WQOA=; b=qSa6ZN4EvvZ3As2nSQHDyl1A0T
	2swmmoEnMqu4Ps3AVxyZrMCaO58YPM5fJQRJC5a0A/+DpwdCztj6snJDbvFlHKyPuEaQ42sTrHYpP
	ZAre6ul01VdsaCitL+omo9lCB4FGW5f6/dxMZkA5m+wjJndWHbWb9EtI/KS8jwG0OPQjwnvzi+XhT
	kKhMEy20iLZP7E5Mwg8BiJcxYTQY/tDDCnl36zWFVuKz8J5NWp5DXz8smmGCQLS+DMcoypz/ZIecz
	QCy+FnGoCj/hmg26UE0iOpfYEpAxw9tgKP443L45vAYkMHjyRYvL0lw+Nm8X7U+9ar0fQXDjwMMiU
	kttXa2Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVUh-00AdNB-3B;
	Mon, 16 Oct 2023 21:51:23 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsVUe-00AdLJ-1e;
	Mon, 16 Oct 2023 21:51:21 +0000
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 621C4552;
	Mon, 16 Oct 2023 23:51:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1697493071;
	bh=3d/7SCNqU7/RsD8wbHd7RzFgECg/EnHTwz1WsD2cXBM=;
	h=From:To:Cc:Subject:Date:From;
	b=E9DxHMUhrSgScicLIJZ7TZp+dReeHAPEp6ezW9T5qkOiEb/fZr9+HfES7DXcem75W
	 vO6hm7oPoXMys1jwE/h71rUnz6aVN1zYsGSAv6Vs83vQBIRAdYHZdyqKNbjyLigZ/c
	 grKgp/7YeXy7aBYBy6jcEQKxBcjyxz5W6IF/qf2Y=
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
Subject: [PATCH v1 0/2] arm64: dts: mediatek: Add device tree for MT8365-based Pumpkin i350
Date: Tue, 17 Oct 2023 00:51:20 +0300
Message-ID: <20231016215123.30343-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_145120_698200_301E7A2C 
X-CRM114-Status: GOOD (  12.95  )
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
 .../boot/dts/mediatek/mt8365-pumpkin.dts      | 542 ++++++++++++++++++
 4 files changed, 546 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8365-pumpkin.dts


base-commit: 58720809f52779dc0f08e53e54b014209d13eebb
-- 
Regards,

Laurent Pinchart


