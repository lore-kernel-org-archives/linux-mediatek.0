Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF461C83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 09:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I6+0BsV6qdXQP7PjuS+noAxPkQb7MO2n4/GCE1tFh00=; b=LsxAdR0I6LtGMy
	VH7RsGd8cJyYogUEozyxe/i5WSXK4Kh6GVgXm4CEu0Vbw4uJ3jeSGVqck2EWtkwLljMs5b1ZJRA0h
	BvCfhr01wokmJkSLjjgru/nxzYSPbGzAqkIy8UfT2mGngRe5A7TldVUCse4PfyDCHbxxjGBZlosSP
	iZeuEWAJQhXK0c9IeuDYwbQoqUPEk44vvg5SVWrQRUmtFvK0kCkZutTCcskINtCy+1Rhkkq2ffer6
	C0tYOAXSh5zBgDvqp8Jjc9WYf4WVd4q+VP8grTt/TzbGdysebTUBzJ0b7i/cvFv7ueQI5TIQ59VRb
	JR9V2fTv2A859cDOMj4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesaQ-0000000775H-2wlQ;
	Thu, 24 Jul 2025 09:50:02 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerVA-00000006ttV-41bD;
	Thu, 24 Jul 2025 08:40:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346431;
	bh=9fKIYjIV4SGt7rPXJPvy/SpLKjsqtMdVmIqKKyBRmX0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XtkoGg1UWqDhQ7Vb1svrYHeYg3br8OxgQy7pXTi0Q7POqcmfx6TDd2q6RYEP6/o8l
	 nt1cyFs6YalHENJAuPfpmR9iF1w9p8CLXGMRcLmSdJNRxYqZJkntzFvza82o0rZ1Zd
	 vRJeOq0w+ZSeK/x7achH0qXcSe/2tO2ATNl1A64kUIGmaA76P8zMLGw6EHvkn3K2ut
	 B4f5NUgmsYm/8ab8KzZNnFj9bt3GIbWPvKYcrGyxNoVmtQ0gyiqIaffjHxqW9VewRF
	 5ZCQT/6onF9khBboqUhC81P0zg4Hoq1Mgx51zh1Mx4QoFCDpAb22vUoFg51+gjOzHH
	 Ay2ajyoiVZJbA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 38A9617E128C;
	Thu, 24 Jul 2025 10:40:29 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org,
	robh@kernel.org
Subject: [PATCH 25/38] arm64: dts: mediatek: mt7986a-bpi-r3: Set interrupt-parent to mdio switch
Date: Thu, 24 Jul 2025 10:39:01 +0200
Message-ID: <20250724083914.61351-26-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_014033_145335_A8AA76CE 
X-CRM114-Status: UNSURE (   9.00  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, devicetree@vger.kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, herbert@gondor.apana.org.au, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, chunkuang.hu@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kishon@kernel.org, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, eugen.hristev@linaro.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Being this an interrupt controller, the binding forbids to use
interrupts-extended and wants an `interrupts` property instead.

Since this interrupt controller's parent is on the GPIO controller
set it as interrupt-parent and change interrupts-extended to just
interrupts to silence a dtbs_check warning.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index 6d2762866a1a..e7654dc9a1c9 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -200,8 +200,9 @@ switch: switch@31 {
 		compatible = "mediatek,mt7531";
 		reg = <31>;
 		interrupt-controller;
+		interrupt-parent = <&pio>;
+		interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
 		#interrupt-cells = <1>;
-		interrupts-extended = <&pio 66 IRQ_TYPE_LEVEL_HIGH>;
 		reset-gpios = <&pio 5 GPIO_ACTIVE_HIGH>;
 	};
 };
-- 
2.50.1


