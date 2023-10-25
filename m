Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9543AC07545
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Oct 2023 17:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70qdNXbgp7mMO78/SPuLeWZa4xfLIughW1Q+g0cjqr0=; b=ttHWXWUFQc3UDv
	ufxAXt5k/eHknEZuHXQnyTEGhcYPfiMf2ZrxdZAyHyLmFXgjTBEv26r9KjWIZgWnwCo40anTfPOrW
	hqEvNHwMgzPXUrDn2p7rMemSKojSWswPa0Jr/dmNrLyRjaG1pW23pwvIZeRJlF0c1T9PHnCVSWuwd
	Ji0y0Edeat4vwDnPDuL6VCGxkfvJOEzE+OiidSjJJekY23hDm2qbPhQUJQEhrvCX3wscR4I0vPpmD
	VBUmLWKH23YG8UMcAyc4w+HUDJG25NQ1QnedPhp1/4g0WhbzgRwCafJ+adzM1YKbNGWUy86pNd1cm
	MKiK3xN3AmQ5kobj7Uzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvhNF-00Ckru-1N;
	Wed, 25 Oct 2023 17:08:53 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvhNB-00CkpC-1n;
	Wed, 25 Oct 2023 17:08:50 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout3.routing.net (Postfix) with ESMTP id 305336264B;
	Wed, 25 Oct 2023 17:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1698253724;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=70qdNXbgp7mMO78/SPuLeWZa4xfLIughW1Q+g0cjqr0=;
	b=NSf1eKQaOyAzpcKZ6qbk7UroE2dniPWMCSzt4J5Q+8XsuVI1Gp19jh/UWX2fOcfndOVZAN
	3r48n5dvmPqh4tJo+gVR7Eekj6zmRjUM4dMX1uBKkp1G2h3BTIajHHVpQ4QPXYlV1X0twm
	z2waVg0YfD85CvzFaJw6hD0MZ9Ugkeg=
Received: from frank-G5.. (fttx-pool-217.61.159.50.bambit.de [217.61.159.50])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id 8B60F3607E4;
	Wed, 25 Oct 2023 17:08:43 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2 2/5] arm64: dts: mt7986: define 3W max power to both SFP on BPI-R3
Date: Wed, 25 Oct 2023 19:08:29 +0200
Message-Id: <20231025170832.78727-3-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231025170832.78727-1-linux@fw-web.de>
References: <20231025170832.78727-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 55a383b4-c02b-4178-bc07-5f480166bd68
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_100849_748723_125B55BD 
X-CRM114-Status: UNSURE (   9.89  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Eric Woudstra <ericwouds@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

All SFP power supplies are connected to the system VDD33 which is 3v3/8A.
Set 3A per SFP slot to allow SFPs work which need more power than the
default 1W.

Fixes: 8e01fb15b815 ("arm64: dts: mt7986: add Bananapi R3")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


