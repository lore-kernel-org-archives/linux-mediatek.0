Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC882ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 06:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K5BfTIRS/uzjapSA0CGencqLQiXw0hhwfkmWhjUWHr0=; b=0F7ms7YHvFzAFBEeHCqduRiMdk
	5Dhtej7rU8wJqAcYlr8cw7ILr5kBN6kSfbhgRcSVoL0g93sG+Fwfrt99RDmzbdJLYlTxxqO224dmm
	icB9yDp375nRCKOMMRiBP9dEq+FVgryViY920e4S3UqyzFJ8E54smJtFaG3gInabmhWRI0DT6DBj3
	L5ctEIMskpt0FjeN+tLGgNHd4ti9j1/TxhAVVeF6b21zV5ADSfk94oGe4RK7P9Hs0zPikZ0X4vHvO
	hb6xNo3hlX0gdlZNBxV8Suzpb1zwAoNsys+cHet3UnWMuQtoimlKzEDR2IfbRk0T6FRllchbBYXuJ
	8hoL/36Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYinj-002K01-1O; Thu, 15 Sep 2022 06:56:43 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYinP-002Jdb-I2; Thu, 15 Sep 2022 06:56:24 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663224962; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=MoDgS5foiCHXLUgL/Pedsx5l4jOCDvpemYWtz3Ad88Syhv+LOevxg3H0mlTPZCJY8ap+egh+q4HUiNjLBdyRlc8jHaZgsUr3tSdG2/MvySJKeHLQZDFUFJnSMqYy+2afi1FvdAgmjDmLHhCXa9SppUvq7Vz4uqCBaNpnwn2Uag8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663224962; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=K5BfTIRS/uzjapSA0CGencqLQiXw0hhwfkmWhjUWHr0=; 
	b=RNfdN8esifxwhzlBNDz68VD6mDvG/AxauiUqjMUvpSJrFXxGjJlYY8YuJmmLgcxMBYBWctAz63qaV/s/LXaX3oF2geMG/hFujQx5vm2YXw6jOfySV23tMxbhP3IObNP5sQFhSzbLBtoROh+jgiV/42mX0P4f0ES2hX7+lbWZg6E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663224962;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=K5BfTIRS/uzjapSA0CGencqLQiXw0hhwfkmWhjUWHr0=;
	b=Ha7FDaqbehGtlPSe85J6vkXLL6atx8/gIUqL0/1izCrzQHMahoXlLutZ5SXbLX2d
	VzmNHpqc06YkmIQQ6ptUPDAoU6oyttbTruzMtoXaT5FjMQQL2OK9Rd8fVymV/05efMv
	077SpxdXnSTs2NVEJz6cAGKKW/vq2pbBlMJ4/Qd8=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663224961195339.069538977928; Wed, 14 Sep 2022 23:56:01 -0700 (PDT)
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
Subject: [PATCH v2 net-next 00/10] dt-bindings and mt7621 devicetree changes
Date: Thu, 15 Sep 2022 09:55:32 +0300
Message-Id: <20220915065542.13150-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_235623_692665_D3C8DC69 
X-CRM114-Status: UNSURE (   7.54  )
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

Hello there!

This patch series removes old MediaTek bindings, improves mediatek,mt7530
and mt7621 memory controller bindings and improves mt7621 DTs.

v2:
- Change memory controller node name to syscon on the schema example.
- Keep cpu compatible string and syscon on the memory controller node.
- Add Rob and Sergio's tags.

Arınç ÜNAL (10):
  dt-bindings: net: drop old mediatek bindings
  dt-bindings: net: dsa: mediatek,mt7530: change mt7530 switch address
  dt-bindings: net: dsa: mediatek,mt7530: expand gpio-controller
    description
  dt-bindings: memory: mt7621: add syscon as compatible string
  mips: dts: ralink: mt7621: fix some dtc warnings
  mips: dts: ralink: mt7621: remove interrupt-parent from switch node
  mips: dts: ralink: mt7621: change phy-mode of gmac1 to rgmii
  mips: dts: ralink: mt7621: change mt7530 switch address
  mips: dts: ralink: mt7621: fix external phy on GB-PC2
  mips: dts: ralink: mt7621: add GB-PC2 LEDs

 .../mediatek,mt7621-memc.yaml                   |  8 ++-
 .../bindings/net/dsa/mediatek,mt7530.yaml       | 34 ++++++-----
 .../bindings/net/mediatek,mt7620-gsw.txt        | 24 --------
 .../bindings/net/ralink,rt2880-net.txt          | 59 --------------------
 .../bindings/net/ralink,rt3050-esw.txt          | 30 ----------
 .../boot/dts/ralink/mt7621-gnubee-gb-pc1.dts    |  8 +--
 .../boot/dts/ralink/mt7621-gnubee-gb-pc2.dts    | 50 +++++++++++++----
 arch/mips/boot/dts/ralink/mt7621.dtsi           | 33 +++++------
 8 files changed, 80 insertions(+), 166 deletions(-)



