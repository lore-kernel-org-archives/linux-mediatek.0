Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C70BC54EE9
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 13:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sk44jnot7uocJ4arpLBcXWdU4CoMjGzCainAQsmuR8w=; b=UT1P42LbuzqMEjcARDGrl2WgKZ
	EAN5Lf0uMj8SrC1/qHHnS5QFgjozFD+AlDiu4poX4hHNm6Jru1ryHMIuAPl2t7Ae2IrF7ZPdKg+9n
	3QGmGQkFBGRPPSNh/pVKVuf1LyElcY/CkFwW05gsOh8QF+rvDR/3I9hx2oFt49Q8GBSxTP6SLMCZg
	OBW+p9d4EoN+pw1mRk0NbwV3qiyBhHQcyKnOfE/GR3pKW2w8R7CHe8VIBpW//rBJ2yK2aIxmO981N
	Oyw4aOPsfUrBjXvUeNPJs88Z3MekatiTokTRCfTEJXUcfytRpzRPdMvmwb2ytERE2hO2yItF3WP6f
	j4if5/YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZudV-00Gd9p-PW; Sun, 18 Sep 2022 13:47:05 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZuZP-00GZRr-RC; Sun, 18 Sep 2022 13:42:53 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663508538; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nGcW+J7cUl4Npm7YylRYVaY3x4tmLfXLCiDmXgrD+BTVs7jiUqFCMLu4KOk1qAcvcIhL11nHer5DxIHmSGsGPtELImuHWBKfGUYV7JbmblLKYMXltIS46CVmRTefzmkRCNMbqEFjo8Z9gn/Nu+pGWcnO958DjGyNldx2AzDCbfg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663508538; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=Sk44jnot7uocJ4arpLBcXWdU4CoMjGzCainAQsmuR8w=; 
	b=DYez03mXmCqDDj/u6CGPeakJaFNwIuXUGabjpp8k8q5xpGFWiFRvs+FN/1EH/gJKdfeOT81v77yHoszmRdgayhBic+CL6v3KrPmArmJplNlPQ1kvBWVEKQdBkAJyf4OC87uw7CLJh6yGxifYU4CrYan9ayY1bkoEz1HWObDXJc0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663508538;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=Sk44jnot7uocJ4arpLBcXWdU4CoMjGzCainAQsmuR8w=;
	b=EEP8sUuGCCt0h+GgcCvIr7ye+zABBtJ5LF9oJzskblPhpAIM6rYbbo+S6J4mbWAG
	Y3qgQq86EjPZZ0gjzMGBKvlPTv5m4E1DJrIcaCNY6MA79hM4NPYqojCUTofKXgwgUgs
	SvYWeyUQjT1xX19++IQ33AcufY9mK7YE23bQUsK8=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663508536708451.20108562227756; Sun, 18 Sep 2022 06:42:16 -0700 (PDT)
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
Subject: [PATCH v3 net-next 08/10] mips: dts: ralink: mt7621: change mt7530 switch address
Date: Sun, 18 Sep 2022 16:41:16 +0300
Message-Id: <20220918134118.554813-9-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220918134118.554813-1-arinc.unal@arinc9.com>
References: <20220918134118.554813-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_064252_006521_EBD8F933 
X-CRM114-Status: GOOD (  12.32  )
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


