Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D041C28D13
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Aug 2022 08:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hsuOaJOBmge09Cin7olc3JuBfQaCCOSp7LdRa+zabU=; b=cgRdlXZkhHrtn+1KbZHVaTKz1A
	JBuGI0I/ki5+QDe6GHcGBwAUbBWV6Lvwml9nuy7douZYeE04zJcf5Kj80u7b0pT53SOQJV+e7mGUU
	4OPhq9zfxwDftPcqlbY7kjM/tYEbH7EQWK9mh5ZwalEv1hqNbqbauS5OsHjJz2zH30/NYUnprxYzk
	kmOICRwemhx7AhpiVIGzZMog8cckRJbXv98cIgnJRHcw0zmlW1x++OI++R0pd/yN0nJMQPMTgRqQ2
	ri1mxbSk+qaEfK+DbqSh9SNimO78DlcQGGqSXyUsBXsYBnSn7fqENzRoBCF9jq67Kjuzcz05X9AIL
	DQ/dXtEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR8AC-00A17P-6k; Thu, 25 Aug 2022 08:24:32 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oR89V-00A0cZ-VL; Thu, 25 Aug 2022 08:23:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1661415806; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Q5J4YnKeemgsGQoJFURutYGnm74hnJNmQ8TUfMTI9+T/phaPrZH0GB+39xA/P3f4UoHQZzaL7DfB3KHhgSFDb9g5EcRxh/eAQsWAULsuyTmACuv7o+Q64owXRq8w57thevKm2WFVJ9/HKRnKkIkvdYNyJa+uNbazZRtDhyv4G7s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1661415806; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=7hsuOaJOBmge09Cin7olc3JuBfQaCCOSp7LdRa+zabU=; 
	b=OBi0baEAMhZdod9JU0GOjClLWPoIWWeu9fqfobGjbvGwqf2znPKiTpjVghFpl1WMG7poKvmSkVeT8zeqrD4gRP5dZZWRHkfoGDCZaXC7bL1eoK7tk8MD5z1zDHAsx8F4+NiDBv6bcYgcY0Ai3kW0BPYB1+3ueQG2Bl5o3ooN5ts=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1661415806;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=7hsuOaJOBmge09Cin7olc3JuBfQaCCOSp7LdRa+zabU=;
	b=VMiy5gHgl3QPUYiwiMc4mQzJkqgQQXqYr+euJanXb4uLNsa3M5xB0+S1dhBERMlv
	LOW3hAS5ZDfhC5j+uknBGUOne9gfDiGXWXv0uvCY8dfcrV9OSKW8kjylGCQXdcY6KHX
	SUynUw7BDOwjDBp/PrXAcrF794KGCbsrT008F0ds=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1661415803390530.7986399471345; Thu, 25 Aug 2022 01:23:23 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	Sander Vanheule <sander@svanheule.net>,
	Daniel Golle <daniel@makrotopia.org>,
	erkin.bozoglu@xeront.com,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 2/6] dt-bindings: net: dsa: mediatek,mt7530: fix description of mediatek,mcm
Date: Thu, 25 Aug 2022 11:22:57 +0300
Message-Id: <20220825082301.409450-3-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220825082301.409450-1-arinc.unal@arinc9.com>
References: <20220825082301.409450-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220825_012350_088678_62A50787 
X-CRM114-Status: GOOD (  11.07  )
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

Fix the description of mediatek,mcm. mediatek,mcm is not used on MT7623NI.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml         | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
index c1dc712706c4..35a3039825bd 100644
--- a/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
+++ b/Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml
@@ -107,9 +107,8 @@ properties:
   mediatek,mcm:
     type: boolean
     description:
-      if defined, indicates that either MT7530 is the part on multi-chip
-      module belong to MT7623A has or the remotely standalone chip as the
-      function MT7623N reference board provided for.
+      Used for MT7621AT, MT7621DAT, MT7621ST and MT7623AI SoCs which the MT7530
+      switch is a part of the multi-chip module.
 
   reset-gpios:
     maxItems: 1
-- 
2.34.1


