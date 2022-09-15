Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AE60ECAAD3
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 07:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sk44jnot7uocJ4arpLBcXWdU4CoMjGzCainAQsmuR8w=; b=qRpckXtrmGeuS+/qqn19RN0KHM
	t1tqTF89w2XekGkYpURocMW9WCqzz1eKRan96q9+SEjZxA5xPJwqrcdrdbUKTAE9uIkdFCDywR4XR
	G/eDbU3dsq5xDaQgUg3Z242Wd3mctJ/zKPUj7ejjE3XktKuNDEoITe7MqgARUlUK33XqHrRn5Sn/p
	wv6kEz0OJ9iZwwzlBEboEHSDbqKIoSFdK8aWY2jtAOZnlKPEHOX8IUDvk5kzBUNCZhkZT4FzidEWZ
	dM6Wq5M86fauEXEc+X5dfuag/HXMAALSfa9uFxTnH7QJ0lPt6n9Oi1cX7xb6gJuVXan38TenkWy9j
	4Y3G6ikQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYiwF-002RWs-DA; Thu, 15 Sep 2022 07:05:31 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYioP-002KWL-Im; Thu, 15 Sep 2022 06:57:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663225010; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ehPnzbvvznPAATqgIdoYPe9uBLvUR+z7YQFXY3VJXxe5YjgULocelK8YbsbR9H7aQkF1JK7ZC2doS6oB6v9rVQR3Qg/xidtUh4rmTJa/k0xdlKL6oNzH/2eiTnszVwyggVGc1v/z619I1uji3Nx9E0+6mrecKVxnKwyMmPfPp8I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663225010; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Sk44jnot7uocJ4arpLBcXWdU4CoMjGzCainAQsmuR8w=; 
	b=gNWC6R9qgN+Rbfhzrx/y76P7jgPqypybPsUzKQuLw70QY1XB0PQRRc0ncWO5ysJQv84q82S3mqu/BzbqLwyjHIHiWyO0FzQjzO2jOh+yhQ3JrVMVqaJEDzjMYtb3bKMwC7o8NRqF95RCyTyEbDyVxSW3cjHcjN3g1V46rIwAVbI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663225010;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=Sk44jnot7uocJ4arpLBcXWdU4CoMjGzCainAQsmuR8w=;
	b=AbTuLrbc/qnVwI2zMprNbk+fyhKlwKdG1IMs8l98deHvgWKTjiQLPZv8Yrwzt/t9
	QQtzQmICz8d4HSCVqnhvJ48ouXAODqFTN8XpqpU6ZqGV8lhPbx5JJFEwr2xEPka0G8o
	pNS0agLgxYXVgll+lKmXfMx/9iNM1WO46qkORpgU=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663225009736593.0930673821944; Wed, 14 Sep 2022 23:56:49 -0700 (PDT)
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
Subject: [PATCH v2 net-next 08/10] mips: dts: ralink: mt7621: change mt7530 switch address
Date: Thu, 15 Sep 2022 09:55:40 +0300
Message-Id: <20220915065542.13150-9-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220915065542.13150-1-arinc.unal@arinc9.com>
References: <20220915065542.13150-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_235725_727891_1EA47140 
X-CRM114-Status: GOOD (  12.55  )
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
index 3d4a8e4bd4f8..7900760212c9 100644
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


