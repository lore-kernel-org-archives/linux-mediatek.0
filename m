Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C94EFC00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 09:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n0DGmThIv3kykpPAhXnY4NL+I+IgAp90xF7lYh8GSg8=; b=erSEQ1g4PjTlTJa+RnF8DKoLD4
	FChc+wMzrHn1sPZBq3jI7cunnlp48X2yjT9tVxHPAO6uNWEhypkj6tvOaw9OlYT8VxlZL7Kkt1Nlc
	gb4u5Yzl+3dftunxAbKNP6lQbs9SQo+G/L0hN2/4MqluEmrX6DTmS+6ZO+QoBmwNGucPCxUKrD1e1
	Bm9VhcUU3NCWjOlNcywZxXt+D7/lwZR7PHtrWHVzb83S+Wiptq+oUWJejhCLolW29Fza2n52dm9qX
	lwqFUfz58poc0ykxdabfTbsG4SHY98x4+BThxhN9AMEzDf/hNpF33ttZgk5zIaSY2oiBl3RJ05KnU
	d2mKFCEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHMPX-003p8e-7Y; Fri, 29 Jul 2022 09:35:59 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHMPL-003p2K-Ru; Fri, 29 Jul 2022 09:35:49 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 11ED66601B51;
	Fri, 29 Jul 2022 10:35:41 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1659087341;
	bh=pw9xTOk9v3V4FiTXBQbWTtQRmlJWsKMyW63P0AgFxhQ=;
	h=From:To:Cc:Subject:Date:From;
	b=nbemYziwH4GIkcmLEOGySkCwfgA6Aj8wofc+Ck60at/IegAJmLo9GENhHdrS8zKeP
	 g7nphxWWKvgGsmxlpCtUnJWB6aWxJqniSZxfXz7S8PQURWzxatJhvQQPhVDC2a021j
	 Upn3K+9ba94hfaVeCAOiqnX4ERtlixi6JwRWgZ0VY1+9mr2hLay6PgLR+FBvk/VY05
	 UMfiNh/SA7ooATHeF21D3U7oNem08JkFhHX/jHHYy/zXuiG06TZsGdG9qrFYDNEavw
	 wbHb3+GXAC9u/Bg84dbgtytq8Ooq1AyTGbGGX0maXwtagNcNCCRDHOEOLzI0WvOXqh
	 zdafetwG6BzAA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] arm64: dts: mediatek: mt6795: Add CPUX system timer node
Date: Fri, 29 Jul 2022 11:35:36 +0200
Message-Id: <20220729093536.27623-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_023548_047192_7C025F68 
X-CRM114-Status: UNSURE (   7.93  )
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

Add a node for mt6795-systimer: this is necessary to start the
System Timer(s) for all cores, finally making CNTVCT_EL0 usable.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt6795.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6795.dtsi b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
index d4842b4a4eb7..46f0e54be766 100644
--- a/arch/arm64/boot/dts/mediatek/mt6795.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6795.dtsi
@@ -230,6 +230,14 @@ sysirq: intpol-controller@10200620 {
 			reg = <0 0x10200620 0 0x20>;
 		};
 
+		systimer: timer@10200670 {
+			compatible = "mediatek,mt6795-systimer";
+			reg = <0 0x10200670 0 0x10>;
+			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&system_clk>;
+			clock-names = "clk13m";
+		};
+
 		gic: interrupt-controller@10221000 {
 			compatible = "arm,gic-400";
 			#interrupt-cells = <3>;
-- 
2.35.1


