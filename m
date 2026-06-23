Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141ABCD4F26
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jun 2026 08:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=39k9hJtIngFDc5kAzhTQBAbWUtLN4p1Hj+Wp34GgIk4=; b=fs+M6RMTUW5t0thIEia19yiwlj
	d+sCDeeFbOSogFB/yNoJFiyFK+AvyVPDH56nuk8QP4DzhnPMiqKhhY8rs3QqIJy1D/4i3fp5lmFXJ
	5EcV0yXFfqKeFNn72bfjwciTTtBmfobGUOEaiHkOiJEMCOoLt4nYteI8HFz81jA50N0pDEaOrShyU
	dKpwXL7Nm+kNhBDKlvC7TxiKbMJdHCylwmvD5vtWsdqe0GKlePhWUwbkNs4XbEPw4j1ysBGp5Zd/v
	GIkxf+5oWZ7BaszijIHfFxZ8rYvYewj07EUEv5hFjRBOK5FwDoASv2hJ7wPEGflrbXwG7l3Lo2n6s
	CXxehrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwKK-00000005te7-1u4d;
	Tue, 23 Jun 2026 08:17:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwKI-00000005tbe-37sa;
	Tue, 23 Jun 2026 08:17:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1A442445E3;
	Tue, 23 Jun 2026 08:17:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E74B9C2BD00;
	Tue, 23 Jun 2026 08:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782202666;
	bh=6Uru3oiN+KUnWcz/gv4yCW62HmXWPmwm2tqYSe5EbcY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=YDNg1l1j/PBL9hYipl/xrtYJgsfkdQUxp3A9QhPdCAIARbsgh5uE0hQwxrnOdPB3K
	 ODb7NZQ+kDnUYVM/kwfGsJr40Mezk8zD/42AfO9wHosRf4t0tr3n3iwGxaMpvK8q5n
	 CsH+uXIZfI/pdfIUw2j85Bcso/6fOztnZ/X+DY/O+gt0MfTRN1SgVcUVFh07WWLjQ9
	 TQTTHdE+Jxz0drMuicaLYlzKaTlfYr2pPdI2jeV6lXv37UEYYRpz4mH+L3zp/RwMK4
	 9GPlcEUDf0bvrRQoC1ZTTQaxGoxB0cj/kPaQDTpLfVSnEaSNxELMtlnju9oTYKeoZH
	 jaUzNObYAQHzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBC3FCDB471;
	Tue, 23 Jun 2026 08:17:45 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Tue, 23 Jun 2026 11:16:16 +0300
Subject: [PATCH v4 4/4] ARM: dts: mediatek: mt6323: add AUXADC support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260623-mt6323-adc-v4-4-299680ad3194@protonmail.com>
References: <20260623-mt6323-adc-v4-0-299680ad3194@protonmail.com>
In-Reply-To: <20260623-mt6323-adc-v4-0-299680ad3194@protonmail.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lee Jones <lee@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Ben Grisdale <bengris32@protonmail.ch>, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782202663; l=814;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=WC9jUSlABoGBdBqPU8PZ4ZIU5LJl1TAO11/EPH3tS8U=;
 b=7INW2CgswksIs+XU8bAxD7sfPzY8kWos0mK3FRqMAgVqnE9vsLoXbBkAFEnkDd1sOwQa581yW
 MMCGBykYV81BWm8vYgLKK3k5hH4r2aRbUQOBzSOV2k6ZnfeLyemmI+4
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
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
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Roman Vivchar <rva333@protonmail.com>

Add the devicetree node for the mt6323 AUXADC.

Tested-by: Ben Grisdale <bengris32@protonmail.ch> # Amazon Echo Dot (2nd Generation)
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 arch/arm/boot/dts/mediatek/mt6323.dtsi | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6323.dtsi b/arch/arm/boot/dts/mediatek/mt6323.dtsi
index c230c865116d..c070f4b0936c 100644
--- a/arch/arm/boot/dts/mediatek/mt6323.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6323.dtsi
@@ -14,6 +14,11 @@ pmic: mt6323 {
 		interrupt-controller;
 		#interrupt-cells = <2>;
 
+		mt6323_adc: adc {
+			compatible = "mediatek,mt6323-auxadc";
+			#io-channel-cells = <1>;
+		};
+
 		mt6323_leds: leds {
 			compatible = "mediatek,mt6323-led";
 			#address-cells = <1>;

-- 
2.54.0



