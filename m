Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC6FEC6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 17:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DO+Kai6uHcGtIrflVOaJfB3Dlyn9sWx2CTPIoz4ygcs=; b=LTb90oDVmWKFp4N0xFUSNNLEKG
	AHXYHxBhDos1gTyZ+wzkoiG4VagQ+mGCq1/5tOhpFeQsb6Fc9CgT+fwbVao+pWOYGr8AXC9FHjdZg
	pgYT6p0k36/MwpCKd7MVn/x+b3VqsAVb/lgLIS6KDnZlPqCxlk4z05btKsXE51wR10vc5De5AsyYH
	q1k5k9UswjP9Kzs9yem5KitEQIoPJGcxN25AuZ7a/BpAQ/95iMyyy3xpp20plN/P+GsEfh+4Qtefy
	v6xdfnuJA31D7KqQoPRJcGBw46N+NTvulgfFzV2f7si43g8b6UnUcq2lVthVgrTLRn77B9SNyl30A
	exdaJwlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oah5T-005Tq0-RX; Tue, 20 Sep 2022 17:31:11 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oah2J-005Ru3-2u; Tue, 20 Sep 2022 17:27:56 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663694848; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YC68ZALOSZFKpI18bEuXTjC3fSKm90WHhCjp8FSnFxI7GKEdscUg3awinM7iHzAkCkLH25mJxlw8jIIwdsXzUmTQ9Hdk69wKTVqCCVXoQcJqrvkyivrwzJ8A+kfKnLuecPlgNeGDkmAKBRwKq5QtjQOObPsATUu4Ko6IYehEkfY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663694848; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=DO+Kai6uHcGtIrflVOaJfB3Dlyn9sWx2CTPIoz4ygcs=; 
	b=J9yIbpHS7jbdc4/hpNnZG8WX3SXDYRPOQGqQNpOv8hK0JErJoh0ir1nRroz9LYsU0obIvIMEbX+lg3M6Yz3mz8wnPdNeExcv+PQqfejD6zFmCz7rAqcKm+hx+wHMUMT3la5nmLYsS5KyIZjxiXC9lE3dEnnCwhUUh0aTUpSqxNQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663694848;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=DO+Kai6uHcGtIrflVOaJfB3Dlyn9sWx2CTPIoz4ygcs=;
	b=DaYyvq8lBDRq7+Wim217hKmFjwCojZ6kukZmy44uVxKHSlCRAG5XwW1V5FBrQYTm
	Q8Nmyv64fGYYBi8DLgbqLKrsz02XtuQaXseKVhhzjAz39WFj3LSFPGwTKNRhqBgD1rT
	VnV2c5ALr192cEjddJpyd2HOFv8JS+hbF/XL3MYo=
Received: from arinc9-Xeront.fusolab.local (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 16636948477413.9160261642912246; Tue, 20 Sep 2022 10:27:27 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	erkin.bozoglu@xeront.com
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sungbo Eo <mans0n@gorani.run>
Subject: [PATCH v4 net-next 08/10] mips: dts: ralink: mt7621: change mt7530 switch address
Date: Tue, 20 Sep 2022 20:25:54 +0300
Message-Id: <20220920172556.16557-9-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920172556.16557-1-arinc.unal@arinc9.com>
References: <20220920172556.16557-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_102755_204978_B4E5A94A 
X-CRM114-Status: GOOD (  12.49  )
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

In the case of muxing phy0 of the MT7530 switch, the switch and the phy
will have the same address on the mdio bus, 0. This causes the ethernet
driver to fail since devices on the mdio bus cannot share an address.

Any address can be used for the switch, therefore, change the switch
address to 0x1f.

Suggested-by: Sungbo Eo <mans0n@gorani.run>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index edb7dd8b34da..f3f4c1f26e01 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -340,9 +340,9 @@ mdio: mdio-bus {
 			#address-cells = <1>;
 			#size-cells = <0>;
 
-			switch0: switch@0 {
+			switch0: switch@1f {
 				compatible = "mediatek,mt7621";
-				reg = <0>;
+				reg = <0x1f>;
 				mediatek,mcm;
 				resets = <&sysc MT7621_RST_MCM>;
 				reset-names = "mcm";
-- 
2.34.1


