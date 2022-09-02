Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A348FECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Sep 2022 08:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=98zBclkyhCxuO8iQ94b7Yd+QkBznRR5d4ncAW49dn7I=; b=SqsgZBS0MXqK9SSsqxlv/aW67R
	ASyAac2VeMlkbxhq5UNVEi+RgfplUeydBJo/nkOTJNcVA2r8IPFmqu0a6kxIovtZKzhrcJRWaLbwC
	0hWO8Dd4vEtBL/LF4yQ/vUtfGAaBI1RY+iaMtU6Bkz7X3mv4Ys2U1KeDA64PPmErXEt0peYaJliHT
	ijcpC1CKaLozVF5M37xsQXpv8x/RjAbProQrSsQeRZ7JMMg81ebqYCbkQHGCW//486bPIv5JRvpjv
	P57T5LmXtWxlzxNRtxn/k47s8Te1rT0n01EvEbqzWbVl79G2LdCb2Z1o1JtYnNo07E3faLo5dVFnY
	jym1hb6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1nQ-001gN7-Hv; Fri, 02 Sep 2022 08:13:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU1mh-001fv2-EL; Fri, 02 Sep 2022 08:12:17 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F0A486601F01;
	Fri,  2 Sep 2022 09:12:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662106329;
	bh=a52Rb9lUaNEcUSv5/G8YM3EWPJZbdtrNJh0NmApFglg=;
	h=From:To:Cc:Subject:Date:From;
	b=LRCKklRrVvk+ft9d4GHtu/caqoAyvmhZFbdxlYs0Lb+cxFUHW4KHZ0Uulr0atjfKG
	 RjF5j8la741+bFpIABO1r6rpKjtS2442yG6ca2EnjuYlxsyxUhKz9slaoLlpiQTzRh
	 B9U5nezGGxrnYTCus2YnpNVzONWASEHqZl1oT0cqGfKV7olTe3msohpN6w7T/I8y/L
	 XjRYLOUwbH6Jkr2zQM6AKVvlkEnyrcm35pBEulbuCvExwlBOGPy+VRD1Nmocvab2d1
	 AOhLACBwsKh8ImVhjpNHo3PVhNG5hKdv/ofcQRbDvg22fbEO7zx7Nb4LhcWRzwUVdU
	 Z6h/c1RbL0Ynw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	wenst@chromium.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 0/7] MT8195 Acer Tomato - devicetrees Part 2
Date: Fri,  2 Sep 2022 10:11:49 +0200
Message-Id: <20220902081156.38526-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_011215_754502_CB3252AB 
X-CRM114-Status: UNSURE (   9.82  )
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

This series enables more functionality on the MT8195 Tomato Chromebooks,
bringing it to an almost usable state.

With this series, the device is able to boot from the MicroSD card
and is able to communicate with the EC for various functions,
including the enablement of the Chromebook's keyboard, battery
charging, fuel gauge and other standard ChromeOS EC functionality.

This also enables the Audio DSP, codec and sound card and adds support
for the regulators found on the SPMI bus.

What's missing (coming in the next part)?

* Format:    feature  (location)
*
* MediaTek vcodec enc/dec (mt8195.dtsi only)
* PCI-Express WiFi card (mt8195 and mt8195-cherry)
* VDOSYS1 (mt8195.dtsi and mediatek-drm/mmsys drivers)
* DP/eDP outputs for external/internal display (mt8195 and mt8195-cherry)
* LVTS Thermal Sensors (mt8195.dtsi, driver is missing)
* GPU support (comes later, clocks implementation is in the works)
* Audio/ADSP support (waiting on SOF OF commits)

Changes in v3:
 - Commonized pin definitions for secondary SD/MMC controller
 - Added firmware-name for SCP
 - Changed keyboard backlight to google,cros-kbd-led-backlight

AngeloGioacchino Del Regno (7):
  arm64: dts: mediatek: cherry: Enable the System Companion Processor
  arm64: dts: mediatek: cherry: Wire up the ChromeOS Embedded Controller
  arm64: dts: mediatek: cherry: Add Google Security Chip (GSC) TPM
  arm64: dts: mediatek: cherry: Add keyboard mapping for the top row
  arm64: dts: mediatek: cherry: Enable secondary SD/MMC controller
  arm64: dts: mediatek: cherry: Enable Elantech eKTH3000 i2c trackpad
  arm64: dts: mediatek: cherry: Enable MT6315 regulators on SPMI bus

 .../boot/dts/mediatek/mt8195-cherry.dtsi      | 256 ++++++++++++++++++
 1 file changed, 256 insertions(+)

-- 
2.37.2


