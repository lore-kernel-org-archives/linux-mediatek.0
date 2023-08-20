Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09B7DEE4993
	for <linux-mediatek@archiver.kernel.org>; Sun, 20 Aug 2023 15:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xl/Xr1AYEB8pKmlNDvd2VVnVn8pANzbVbDszA4un1gQ=; b=EmkVDwIOoY85pe
	zfR4P5fxd0sl4WArbrT3dXbc14Ho751ORwgV1zuTtPcOhqfxH/7mjcUMoT9sGUuGKcZEwL7gK5miv
	PmakFGHwHxzhR59ePc3L8YH7KpS69dvZIqKcB1K7Tlrr5xz0irpv8f3itIG5MD+f5UDvnH4glZAgw
	gInUnLOR1KuBaMX4mxf9sGvdKK9j6K2dEHT6P97zjiozbsmxNwcFnacwc3Xj6nU8LgD/JB9Szkr/6
	qro/Nb/cHXd5poYT1ZiPRJcbyTlQDeoxhfX3URBKzO/7ntCeveKKqiIZzv+YRPlcU3FT2ucFExCM2
	YMRZBitDCUE0LvC+AXCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXkPK-00C6uu-0i;
	Sun, 20 Aug 2023 15:32:02 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXkPF-00C6sE-2x;
	Sun, 20 Aug 2023 15:31:59 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout3.routing.net (Postfix) with ESMTP id B1CB2605B4;
	Sun, 20 Aug 2023 15:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1692545512;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xl/Xr1AYEB8pKmlNDvd2VVnVn8pANzbVbDszA4un1gQ=;
	b=th3qTgfFD3yL+mMx19zZzBzjkPzEfQONvx9weyw/T/jL3BhxHSSlp2k0LM7CfIRnbpk95g
	M7ABmp0r78vOopAbLMTbQbpB58pYi4ZfCctkHPNKwCrK96kMSeM0+tUVfPfTSF1s9W1s3L
	fQMl+ttO27oQkmBGb/ik4IUGj6gyT80=
Received: from frank-G5.. (fttx-pool-80.245.78.65.bambit.de [80.245.78.65])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 12CAD406A8;
	Sun, 20 Aug 2023 15:31:52 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v1 1/3] arm64: dts: mt7986: define 3W max power to both SFP on BPI-R3
Date: Sun, 20 Aug 2023 17:31:33 +0200
Message-Id: <20230820153135.42588-2-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230820153135.42588-1-linux@fw-web.de>
References: <20230820153135.42588-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 00bc8e6c-d91a-4620-80c0-866337966e05
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_083158_167017_3684AD82 
X-CRM114-Status: UNSURE (   9.42  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

All SFP power supplies are connected to the system VDD33 which is 3v3/8A.
Set 3A per SFP slot to allow SFPs work which need more power than the
default 1W.

Fixes: 8e01fb15b815 ("arm64: dts: mt7986: add Bananapi R3")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
index af4a4309bda4..f9702284607a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts
@@ -126,6 +126,7 @@ sfp1: sfp-1 {
 		compatible = "sff,sfp";
 		i2c-bus = <&i2c_sfp1>;
 		los-gpios = <&pio 46 GPIO_ACTIVE_HIGH>;
+		maximum-power-milliwatt = <3000>;
 		mod-def0-gpios = <&pio 49 GPIO_ACTIVE_LOW>;
 		tx-disable-gpios = <&pio 20 GPIO_ACTIVE_HIGH>;
 		tx-fault-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
@@ -137,6 +138,7 @@ sfp2: sfp-2 {
 		i2c-bus = <&i2c_sfp2>;
 		los-gpios = <&pio 31 GPIO_ACTIVE_HIGH>;
 		mod-def0-gpios = <&pio 47 GPIO_ACTIVE_LOW>;
+		maximum-power-milliwatt = <3000>;
 		tx-disable-gpios = <&pio 15 GPIO_ACTIVE_HIGH>;
 		tx-fault-gpios = <&pio 48 GPIO_ACTIVE_HIGH>;
 	};
-- 
2.34.1


