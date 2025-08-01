Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9D43C87FCB
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Aug 2025 11:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BfLE512b+VzqwHd+S0in5fMLRpS9RkPvxkAj1oAfeyQ=; b=BdUiKPYJ+FgDrXFtLr1ZHbfdpL
	rKIya+SSAbevO2i+nJ5VoMOjPOiW4JcRqKfxd7dGaU68KVH7sI91sQ2MXIQ/Y96JzHveU429Ygelg
	eKY+KTMp4xEyqAMJYI5GKUbltLA+MjQ2m2DpzMRncKV1YkJLREBsRwBQJ6TZJRQjxzFhG1jVD8aqt
	VzTddAkIuEttHcJJcKkuRufJd26z7r3DDvXfq8GbJoHEbY712+eO3/gfLy9N4gIJGV6ExLlJlMh1H
	a2b68qHiSYCvt1mjhLmDUKDNLgY+NSluLdssiTaZIeuJ0eE5nRWIxYSAUvkmRr4vEgvjr9Ho6GO6N
	eGAUJNHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnwL-00000005Yzk-3hnr;
	Fri, 01 Aug 2025 11:28:45 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnm7-00000005XHc-1HFC;
	Fri, 01 Aug 2025 11:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754047089;
	bh=bRr2a7sQwiBwtC+x6Fs6orMifRMyL8n9C/3E/xqqXrE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pIKXTBcaxkzxthd0ZuRtQp9ig009lWy+s+JJ+kNxAXOyivD+ioEISgiS+R/syfHO3
	 q95Wxl1sUA/8UCp/3GgB+trml2qgeMb5d1/j0UMmr52tZ3xFKZuf+lt/NDyArqP4+X
	 rajAewKMS79OmMgS1j1GZ4N8SiYBE3jFPHRWME7jLWlxnzqEoiNzzsNs/uuxt2heFh
	 P/xX9dYm9mu7bBIOhpRHGe2NGgcY9KocKopEbzNHfbLeQW6BUz1yEbKLNd3PJN2K+D
	 1XjB85xrC3BNkDavyH6M1+84odGjv2/RI390KuWtLZExHIoYPA/QrZuG8rbxnRYF/k
	 oLXrZHp3ONXzg==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8E90E17E0F3C;
	Fri,  1 Aug 2025 13:18:08 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 13:18:05 +0200
Subject: [PATCH 3/9] arm64: dts: mt8183: Rename nodes to match audiosys
 binding schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mtk-dtb-warnings-v1-3-6ba4e432427b@collabora.com>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
In-Reply-To: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_041811_491966_B2947DA9 
X-CRM114-Status: GOOD (  12.01  )
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

The binding for "mediatek,mt8183-audiosys" expects an audio-controller
node inside the audiosys block. Rename the nested AFE node from
"mt8183-afe-pcm" to "audio-controller" accordingly.

Also rename the audiosys node itself from "audio-controller" to
"clock-controller" to better reflect its function.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 3c1fe80e64b9c5e32703f1e8663942a24543cf23..e2500e3c3f66d12a6fd19f29fa9fd63a6f04821f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1445,11 +1445,11 @@ usb_host: usb@11200000 {
 			};
 		};
 
-		audiosys: audio-controller@11220000 {
+		audiosys: clock-controller@11220000 {
 			compatible = "mediatek,mt8183-audiosys", "syscon";
 			reg = <0 0x11220000 0 0x1000>;
 			#clock-cells = <1>;
-			afe: mt8183-afe-pcm {
+			afe: audio-controller {
 				compatible = "mediatek,mt8183-audio";
 				interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
 				resets = <&watchdog MT8183_TOPRGU_AUDIO_SW_RST>;

-- 
2.50.1


