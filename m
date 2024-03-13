Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10539C54E58
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 14:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ALGwTdh5dzRyfQbIq4sXmOxOwMmhncdh/xsS0vcJYLU=; b=iHsa99D2sXiYrORDZWRcYFRaDO
	2rrBBjwiYB3HsJM57124izQhApTN+i3pGpbRQPPxec46KFeshD0HXF7LMJt5R5F02tdK2K7SZkIxB
	U17bke0ZxdGO/TlLH1Ck3BPEPiQHH/46y7MydS0hTxuZ/c1pSRo9NIXvTUsSgNivpNW1sEiKtjtaz
	AK32w/JeKb/j2KYIbEo77Tz+JWnUA6TK0LwSMQ/6hwmWHi3i2mmpeTlGj65Yxl+5gOK4I1G4b7q0T
	3mJEdjhYHB6Q2MJYap9DU8ofUpMQMI8dlAAMtJL12Bb76BgaTOwqWBdp/uIpgqfJjiIVCDNKEaazz
	TcW5wM6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkPOW-0000000AOgN-05p9;
	Wed, 13 Mar 2024 14:15:48 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkPOS-0000000AOfC-2MUG;
	Wed, 13 Mar 2024 14:15:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1710339343;
	bh=b7NxdHsxuVEj+LuKsJSyD0dVHK9bDYyB/Dk/KEcQ7o0=;
	h=From:To:Cc:Subject:Date:From;
	b=3joBS4A7AQI2OPNd+35Mda5N2QOE10PxTpYtbQ6DLanGEss/zKMFB9rByJ5TV9BJl
	 7+qp8MP5BcpK1TCQvlx0KSLvp5+2beN4XvpjYH3Yp3Tv8opsAafoPINvDRLM1nW8H0
	 T82KvJ+QknmnxuvKw+Q8sCtvh4IVLGqDX55xdyaw6emhUEE1ybgYesGkb4QBEWyZ+S
	 t+BvfkCbAdpASVVuzi6D1AIhsSgcHpY4tEBQurrFKtjGrVTtJmD1vQe0hxTHJ33DY3
	 C/VrxBuVa/gIxQa5LcUMseObFyjkpiFlBTica4x0A4uM8FHV/PbTf/r+MdgcbJdw+M
	 kQkDhuKLUTbOw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 482E037820D4;
	Wed, 13 Mar 2024 14:15:42 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 0/2] Add missing chassis-type to MTK Chromebooks DTs
Date: Wed, 13 Mar 2024 15:15:36 +0100
Message-ID: <20240313141538.1438167-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_071544_782764_E6F98469 
X-CRM114-Status: UNSURE (   6.99  )
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

Even though the chassis-type property is optional, it is useful to
identify a convertible vs a laptop (etc).

Some of the MediaTek Chromebook devicetrees were lacking their chassis
type declaration: this series adds it where missing.

AngeloGioacchino Del Regno (2):
  arm64: dts: mediatek: Complete chassis-type for MT8183 Chromebooks
  arm64: dts: mediatek: Add missing chassis-type to MT8192 Chromebooks

 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts      | 1 +
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts | 1 +
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts | 1 +
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts | 1 +
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14-sku2.dts     | 1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel14.dts   | 1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kappa.dts      | 1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts      | 1 +
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku0.dts | 1 +
 .../arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-willow-sku1.dts | 1 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama-sku32.dts       | 1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r1.dts        | 1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts   | 1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts      | 1 +
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts      | 1 +
 15 files changed, 15 insertions(+)

-- 
2.44.0


