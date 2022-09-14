Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F38CDECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLYBPygnnLliGka60fg9i7wMdcBY+h75qIvfjVPo2mU=; b=PurRNrMwpRhvi2GnbFYxsF7oiu
	dvQmT1u0oJ70e6HKp38ej+vVmQCS74Wo+BVrO/xor6iHroDGc57kvjbCrr27E1abXVuMcOTkVPY+X
	cXXPjsxADK+1mxGR8t+IWlZ0z7nhcd3Ns8mbvNXHJd2zkqflG38wEAWBp92KSlrZRyHTq6vnqi/tk
	qWt19JcZ/zjQAeVC+S5SoO9S4Ag6BQqO88xxgE2mrNZsBtZRSbxTuOiKDGKWd8XfYU/js2ou5IXbU
	Okc82rfr+lS48zFJamBukJKMxN2h4Pu9fy4O7DIDbBpezdp8ly6MEw/5kRcxxMMCQLsc2RONEAimu
	RZAmplQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYORP-00DzC8-2e; Wed, 14 Sep 2022 09:12:19 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOBH-00Dkxc-Er; Wed, 14 Sep 2022 08:55:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663145720; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=agcuuF3mWDPU110LEP0IFmUH9nGR+C2iIgWwzM2wWCMZERVpiWXz6VLzjUessI3mNube8XYZoUnIkAJA7CY/IzAKBqDlZElD+py3qcIUAKTPQcpzp3hP+/kmBHlFQK1tZv8c5xdhzeocfNQ9qBoiZISvA4u8idtSWOqXUAOlgGc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663145720; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=wLYBPygnnLliGka60fg9i7wMdcBY+h75qIvfjVPo2mU=; 
	b=gpiJzQjAkZqcNt2oArpK+gsFedt42w82O/FZxK8ZiqU9uZJsMKUx0d93aNXAicmtccoWoLpQ24h/eJrbotGga22G5klxw2xCOWRk+rRTp+rjx56jHp8uIMCDP9G8c4CvyW4ePrTJ2C1ao7gjBVxsFwJEoeKk4mSU0R/vbvTWar4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663145720;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=wLYBPygnnLliGka60fg9i7wMdcBY+h75qIvfjVPo2mU=;
	b=TEJhvi81a/KYLbwu0kFzkKEIfiekXzyiG4bPDssqGEQCB0k/3odwkaKonzPxPejv
	22hh3n/txeb2QuAbBYAKPpucdPdYtEXaTK1Nm5mItnNF4EUiOwBPgvgZSxlXlayUFIW
	Hhu7tJzL/vpPplrPaLP0MqkPLSwgZ4bw9oX/llew=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663145719219338.22706013659763; Wed, 14 Sep 2022 01:55:19 -0700 (PDT)
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
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH 03/10] dt-bindings: net: dsa: mediatek,mt7530: expand gpio-controller description
Date: Wed, 14 Sep 2022 11:54:44 +0300
Message-Id: <20220914085451.11723-4-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914085451.11723-1-arinc.unal@arinc9.com>
References: <20220914085451.11723-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_015539_710418_728D03F1 
X-CRM114-Status: GOOD (  10.08  )
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

Expand the description of the gpio-controller property to include the
controllable pins of the MT7530 switch.

The gpio-controller property is only used for the MT7530 switch. Therefore,
invalidate it for the MT7531 switch.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml   | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index 2c73d13adf14..3ec4fffec780 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -104,7 +104,14 @@ properties:
   gpio-controller:
     type: boolean
     description:
-      If defined, MT7530's LED controller will run on GPIO mode.
+      If defined, LED controller of the MT7530 switch will run on GPIO mode.
+
+      There are 15 controllable pins.
+      port 0 LED 0..2 as GPIO 0..2
+      port 1 LED 0..2 as GPIO 3..5
+      port 2 LED 0..2 as GPIO 6..8
+      port 3 LED 0..2 as GPIO 9..11
+      port 4 LED 0..2 as GPIO 12..14
 
   "#interrupt-cells":
     const: 1
@@ -272,6 +279,7 @@ allOf:
     then:
       $ref: "#/$defs/mt7531-dsa-port"
       properties:
+        gpio-controller: false
         mediatek,mcm: false
 
   - if:
-- 
2.34.1


