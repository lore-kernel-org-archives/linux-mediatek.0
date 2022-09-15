Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A237ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Sep 2022 07:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WnMkSdF0tA1GdTHDMgmHnwzHooD42TxLI0BpN/jcsQw=; b=tPv0umcdVjedsrY8mzMCWVkQNJ
	vXkUhHQJtLcJRufSwrZxLxrxDYzDBWG1+37bhDWVkOrJFLgCMzNBXbx9glo5jlvAIOFQqGMJrr95k
	vO6gQqPUzTq+zkr0msyrndlLuUNO86pb7VmP9N15d465TBpo3bFFgT8joRSCGYxlOIjN8LgY/ClS8
	nNjPoQg9ieozmtiKh/QQykEVedMEeqD1nwrtcSlX5Uhcb8CK9DK4LXJ8qx6iTEPBd5uI+qv+5pO4B
	6WOVGAOisVA7B6s7l4tZZ3LckdlWNBr91ERs1UK9UEs+HWsLpwTYFKiLZvplBrneNyCBsIqKtO/je
	EiydR35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYiuF-002PnY-JJ; Thu, 15 Sep 2022 07:03:27 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYioG-002KPZ-Q2; Thu, 15 Sep 2022 06:57:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663225016; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TtWO6PLW4SUpFhDMz3hkFFlosX/a721Nj4rS3YGhLVoINHBJNZ1EEF8iKJe0TyJyz3qoGCoy1Ik1hGexqUMS1m/4wN9pQ5INopKOG8K7qlmcWfM7lIuKzBl7OfF4BWW4r6gUSUwkZ+QLx/2v/3WN2KWWb1/fVPAShPZ3Rhs40oo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663225016; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=WnMkSdF0tA1GdTHDMgmHnwzHooD42TxLI0BpN/jcsQw=; 
	b=NdjRD+dSr8uv5jAhQeS4GbkbtA1L+PBteRnvQlx6eMmY7kzGh59Y+Vsm6V+M1BPfMlSOMXo1Mc3iFcyTjA41f4tCbzgXHYYKJixFbwbeCL6//Mxo8S9bVcit/rhOYd0vVr11QPJlnzFw/K+YRcBWZlBbfqwsjJV3/Bi1E2Tun8E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663225016;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=WnMkSdF0tA1GdTHDMgmHnwzHooD42TxLI0BpN/jcsQw=;
	b=fqpaSq1yoQkjf2qCh3uRmN45HiAQk7lMwuO843BE/QH5WXcUDJc8L5a2xx4V5NXL
	Edc/FYZnMWQVyM4f2B7fCr3mWr5gcZTLYstcbfhbJzLtrJjOCksGjr5ejvap71PQDyY
	phM+ESa1q4YswbBtgRYdZYT/Ojpg6ZXLuQ0IvJ/w=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 16632250155511013.2099089559351; Wed, 14 Sep 2022 23:56:55 -0700 (PDT)
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
Subject: [PATCH v2 net-next 09/10] mips: dts: ralink: mt7621: fix external phy on GB-PC2
Date: Thu, 15 Sep 2022 09:55:41 +0300
Message-Id: <20220915065542.13150-10-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220915065542.13150-1-arinc.unal@arinc9.com>
References: <20220915065542.13150-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_235716_987097_6B96702D 
X-CRM114-Status: GOOD (  11.18  )
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

The address of the external phy on the mdio bus is 5. Update the devicetree
for GB-PC2 accordingly.

Fixes: 5bc148649cf3 ("staging: mt7621-dts: fix GB-PC2 devicetree")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
index 2e534ea5bab7..5f52193a4c37 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
@@ -83,12 +83,12 @@ &pcie {
 
 &gmac1 {
 	status = "okay";
-	phy-handle = <&ethphy7>;
+	phy-handle = <&ethphy5>;
 };
 
 &mdio {
-	ethphy7: ethernet-phy@7 {
-		reg = <7>;
+	ethphy5: ethernet-phy@5 {
+		reg = <5>;
 		phy-mode = "rgmii-rxid";
 	};
 };
-- 
2.34.1


