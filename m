Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF01DECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 09:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4ALxyq+RBO+GV4tDQQ/4ssUEgJ4SrRXCbUkyXnabqQ=; b=ZW5eXl+hxe9kwzBuKSCTtGXOhB
	Ti8f67WWDczQDzZV0lZNf83TxLjdP0hzyCvT/7DXYyI8VMncyfv5hU0rbvPllbo8fG6TsBNdOfjEk
	PLj3ky0I/N/wr8rsPYEMOKop0GD5sZdng2KPBeuLIFpt17zsrOFX9cVZeYDPzWPbnlkGc7EhMwVRg
	n7PMJzKnsJ4reQPkcQ08umVZao9W8VYeV8I14AxKhP9OXMgjWUKU5THU7bh4L7qEmM3KGYKjxo9rP
	LJycCU1Wkp9FW9nD229D9OB0kZvcMKBlmDHI8zI6qFVncjS0gjQ5wuna+uX3wzwLqV1m+e+gzqJqi
	ymlrOgaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOUq-00E2eq-C3; Wed, 14 Sep 2022 09:15:52 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOBf-00DlBy-MU; Wed, 14 Sep 2022 08:56:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663145743; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GjnD/y1nylC/ssjzFpVpPgdfXJVt4IOmCh4dphXfnj1utdaw0Y5tZeUvKcrkoWrnzqtUibI/Z6DQwrNPZCPGHbvaN9XGc86T4cFIkAWjFXiWPyaR9x8R4n3xkKYD9rJ6/4//9APerL8OAL7gJDZwfqrUUUYyYBTw+Ni1EtB6rcE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663145743; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=R4ALxyq+RBO+GV4tDQQ/4ssUEgJ4SrRXCbUkyXnabqQ=; 
	b=ZzI6c/QZK60dvXNtj+mJtMSP5z4Rl4zsYvPDN7MZo/slVfN4cCXcT0VkeIyUpwzn8PR+EMpIQhUTjI4ruzv+6rHvnLP6UnzHQ/eg0FxCvRVWT4nNWTpEHlt89rgg630T3bOj1UeqDs99UhLrMqD8x2L3bOIKTClutF2COiAU2k8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663145743;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=R4ALxyq+RBO+GV4tDQQ/4ssUEgJ4SrRXCbUkyXnabqQ=;
	b=VPs+Zc6RO2GsjBVWKHAqCOqXgRK8rB77QUJ289Xy0zX7RZhXSdVqAE7EPTI9iGKd
	dfO8w//p0+cgI+FKhViuOr2FcwElL5zCRdQsfIIKK20EhWEmK+LP9kE0hQ9D9jHiupW
	p0+W9Iaz/80cLz8eLrvuf3G1eAg4EbPtQ7WVywaI=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663145742438887.9640433477236; Wed, 14 Sep 2022 01:55:42 -0700 (PDT)
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
Subject: [PATCH 07/10] mips: dts: ralink: mt7621: change phy-mode of gmac1 to rgmii
Date: Wed, 14 Sep 2022 11:54:48 +0300
Message-Id: <20220914085451.11723-8-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914085451.11723-1-arinc.unal@arinc9.com>
References: <20220914085451.11723-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_015603_928284_FB36EDEF 
X-CRM114-Status: GOOD (  11.32  )
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

Change phy-mode of gmac1 to rgmii on mt7621.dtsi. Same code path is
followed for delayed rgmii and rgmii phy-mode on mtk_eth_soc.c.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index e9203fec3fdf..50799bb1cc5d 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -331,7 +331,7 @@ gmac1: mac@1 {
 			compatible = "mediatek,eth-mac";
 			reg = <1>;
 			status = "disabled";
-			phy-mode = "rgmii-rxid";
+			phy-mode = "rgmii";
 		};
 
 		mdio: mdio-bus {
-- 
2.34.1


