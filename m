Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60BDEC47DB3
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 11:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zSCx2dKxVX2jjxlW1moVTK/K9kEOqnKmJKC6V9NAvBw=; b=hDEDryfyQfue0B5IEjqFUvGtdz
	USUac3+q0nVEnygp6/LBSrXi4lP6m1XSodMhESYvNZVdaA7tK6QprjearDnAnHXbfKjn9pESrRV/v
	ckfAG4pV5o0bKXXnFZUagD0n1y97tYManvO62PXbM0mEWLcxbHYzQenEPXX0GA2XS28YRifDBYcJ5
	U0HQBOYHlvaadLtRPgFzGXWiZsShuskJ7iOemrGLu4Org0oaiLe58GJwS6xsxShEVTCnZ9cB4Ikls
	hBGT1XcLxEkxzTIeUDUkVmFwbSVhTcHHVIvgbYnCLB+b0zLQU5Hn8DRlnWeU1kRSJBCbiajM2dxUk
	NSrM24TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVs23-0000000BMDL-04BI;
	Fri, 02 Feb 2024 11:48:31 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVs1z-0000000BMBx-28QB;
	Fri, 02 Feb 2024 11:48:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706874505;
	bh=iajR0bgdPy77vBNmr8TVPZPrZc0bjA48bs7iKNgDlvE=;
	h=From:To:Cc:Subject:Date:From;
	b=RGEix9zyVbP4jzGSio307EoHs7SJTEZ4BTXUcj0oIrCcemdYc7FkLqaiCybMtBxD7
	 5cUE9iRk2Ov5rA7AQpbop8VUDFOb8ss/P2Thblx0Z1jJ9GeOZ7JLvU8Xq/kVLyYavG
	 ex+9z1yLFmVXXUO/+WChqJqDudFvn0Ew5D+lVw1mufYH3ZERd1ZpklorG7BLWR5PZc
	 ZwWAxJBJepmNX7HDRTf6JQjF1Z72F5z74luo5NKodjqx2db1KdwgSgOBSSNW5pgYg8
	 wGeLa1TCaQOTCkXkF8jxyDbTr9WxDdSEHKBN9ow87FI1rGD5QbkH23IKtB0olieUwl
	 60hdt6ndX4feQ==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 610A437811CF;
	Fri,  2 Feb 2024 11:48:24 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	macpaul.lin@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	stephen@radxa.com,
	tom@radxa.com
Subject: [PATCH v2 0/2] MediaTek: Introduce MT8395 Radxa NIO 12L devicetree
Date: Fri,  2 Feb 2024 12:48:19 +0100
Message-ID: <20240202114821.79227-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_034827_702666_50E71B8D 
X-CRM114-Status: GOOD (  13.00  )
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
 - Squashed device tree bringup per-device commits into just one
 - Removed dependency on MT6360 PD_IRQB removal series

This series adds a device tree for the Radxa NIO 12L SBC, powered by
the MediaTek Genio 1200 (MT8395).
Not all features of this board are included in this first series but
it's already quite usable, as the eMMC internal storage works and can
be used to boot the system (as much as MicroSD external storage), the
connectivity via ethernet and WiFi (PCI-Express) are working as well.

The two I2C, two SPI and the two UART ports are also ok.

What is missing (and what's next...!):
 - UFS storage is not working yet (but eMMC works)
 - Type-C role switching is not yet implemented, driver is there but
   mt8195.dtsi has no MTU3 yet, needs some research to avoid breaking
   compatibility with MT8195 Chromebooks
 - HDMI Input port: no driver yet
 - HDMI Output (from SoC HDMI IP): no driver yet
 - Audio (sound card driver needs some love)
 - MIPI Camera
 - System LEDs
 - "F15" Button

Cheers,
Angelo

AngeloGioacchino Del Regno (2):
  dt-bindings: arm64: mediatek: Add MT8395 Radxa NIO 12L board
    compatible
  arm64: dts: mediatek: Introduce the MT8395 Radxa NIO 12L board

 .../devicetree/bindings/arm/mediatek.yaml     |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 .../dts/mediatek/mt8395-radxa-nio-12l.dts     | 825 ++++++++++++++++++
 3 files changed, 827 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts

-- 
2.43.0


