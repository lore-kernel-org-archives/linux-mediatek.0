Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E1EC6FA8D
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 09:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKLAhyPIS7u1j1ZgI5worLlV8YgMFCXUQ3FS/Nhbktk=; b=uhIfbUeivHL2Vj8uOR3RCYfi9+
	WeHMPF7hvvSVn5tT4vLU3cRitluS/KYNsN28xpDWzy2bjfD9HLIrc45i8FyuX1lgJZh32wDrphBs4
	7TobbYw0tPbuV7DbJ/6wtp/iZmps8xCiyaZ/OEb501sEf3np4RLxLhPPEbJOlkv+i4qJ3olEVQ48Z
	i0JKt8sO9A+UDQ6uOTUCZ4gY2d7b1GBfWv5UMoZ+Zk1ls72LlJgUhQvRbZBjasJbgImH7CEuL2L7w
	X9VZuvMIdYftDNQUr5xtd0eEzWq2nyqRlTEO0kjVMZPHQaju8haXRH3PaTNHLVKbcN7LIbuzyiI/u
	9q0agrZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYORS-00DzHY-1a; Wed, 14 Sep 2022 09:12:22 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOBL-00DkzW-QG; Wed, 14 Sep 2022 08:55:45 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663145726; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ICKDQjUAhOLFVv/HjDOGzmAJz6nF18Dq9PkHoQt4pYdWNPez4NLWFh88k5jwCziRBSRdsCwZLvBnAL1ba/w/b4dxtYZxgPxUD2DkN72aZcjr835MlqGmR7lvXxpI4Ilvt1cm6bzpqsB949WMcBn/PLq0XLGwrp6P4HuwOJ5CiVg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663145726; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=OKLAhyPIS7u1j1ZgI5worLlV8YgMFCXUQ3FS/Nhbktk=; 
	b=X3Z9AKHQasC8oyW2Otbfa5qt27yEtJO0gz4lT/uOUHipUFG59BdIg3PuzUwDbvmhGmAnyX2CwuaOCbrqXimmlR1SChO7VkHcGptDX2SD+uZuBQxt2/jdhnpfRqYqvNp7TvQBn+O0J/vLbQmky0kP+jp+eql/AwtFk8BRupJRumU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663145726;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=OKLAhyPIS7u1j1ZgI5worLlV8YgMFCXUQ3FS/Nhbktk=;
	b=QgbkSiplZPCP5/i+0PAkspRCysqPKZ/m76m0QSaJE6NKg9expeaAspAGyp45rwX+
	2foXHjCVmkXjsRVZezz6xN3Sn4SCILHrL6zjjACJPhOtea88jjf3RH0aVIEFt6t1Teh
	UBGgCG4R29+ZKBBd9VklQd144DIWYMT+0Q4WB/fE=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 16631457251941006.247763449766; Wed, 14 Sep 2022 01:55:25 -0700 (PDT)
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
Subject: [PATCH 04/10] dt-bindings: memory: mt7621: add syscon as compatible string
Date: Wed, 14 Sep 2022 11:54:45 +0300
Message-Id: <20220914085451.11723-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914085451.11723-1-arinc.unal@arinc9.com>
References: <20220914085451.11723-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_015543_975313_C4A2BED4 
X-CRM114-Status: GOOD (  10.64  )
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

Add syscon as a constant string on the compatible property as it's required
for the SoC to work. Update the example accordingly.

Fixes: 5278e4a181ff ("dt-bindings: memory: add binding for Mediatek's MT7621 SDRAM memory controller")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 .../bindings/memory-controllers/mediatek,mt7621-memc.yaml   | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml
index 85e02854f083..6ccdaf99c778 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,mt7621-memc.yaml
@@ -11,7 +11,9 @@ maintainers:
 
 properties:
   compatible:
-    const: mediatek,mt7621-memc
+    items:
+      - const: mediatek,mt7621-memc
+      - const: syscon
 
   reg:
     maxItems: 1
@@ -25,6 +27,6 @@ additionalProperties: false
 examples:
   - |
     memory-controller@5000 {
-        compatible = "mediatek,mt7621-memc";
+        compatible = "mediatek,mt7621-memc", "syscon";
         reg = <0x5000 0x1000>;
     };
-- 
2.34.1


