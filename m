Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B83CC54EE9
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 13:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O2yms1NUcTx1ATzzwCxouyoVgYhixhkktLfolcgVszw=; b=aNuBWpWbet7KKoqBUEakLtbi99
	0thfSvrJI0v+JwW7fTxCg9hAX5NgeW+0sEAMpK58ad7+/2GMN2QP4Va9vNDONqaht3wK/wy/HrSmC
	EgpQXW0Tm3xFn5fCqjemTBtnte6pmIVZ1wsSbIMFFrZ9Y+P9eUPXpkst1DcbbMYeh0jrlSpPC3KrV
	MkJjGtP6cUMaMVJk0OQOgAUYDJbrCgE9JGp8/IsIlgQ5KUkC1bC0Ud32vTOniZH1CxW53IzgWs09y
	4lykk2CtT7w79iRELRDVvJVes7gadwwxu/RZFHNz4+LTQYHKfwxxh695S7iUWysjlXrfMwWpDGN2c
	GR5KSNKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZuba-00GbQ1-Tz; Sun, 18 Sep 2022 13:45:06 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZuZ4-00GZA1-1d; Sun, 18 Sep 2022 13:42:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663508532; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y8lz5OSHnvWNMv/9SNeKDxokC1miZ+UMFh1opkM1PlIdL7lOhCC0W2K/oWL1XByaXkz8JNx5huM0jxiA8sfgVAETv3+Rg7h3mbo1Du015zZnVhJaVshzFuF8lsRKaHWnTCsre4B4L/X3E3XQ2N7trORfsy9HA4SY0wQJ3cYnNcg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663508532; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=O2yms1NUcTx1ATzzwCxouyoVgYhixhkktLfolcgVszw=; 
	b=ApOOLLKL68rq1GfsTE7LsTjYM2y37Yj9GDUR/7/jGuXEZ/AkLmv2cJ9RYUetiJ0IUCeRp54RJbo7u2b6tJQcSQJ8gBf/xCEVakXc1DvMr7eWKfg52WVoBGA1QQhzCHsoryEiyZgu9LOCBVm9Fr36Bouxz+OvNzxCWn6baamWizg=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663508532;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=O2yms1NUcTx1ATzzwCxouyoVgYhixhkktLfolcgVszw=;
	b=Gk8SSgQNrZq9Gd3JYdK6s8MMpM9KeJFYeciVvf9QtXeUMcw7kEGuwHfgJtNWNYZO
	/Itv2ge+6i7BunFYEbW2SKlExa7IhjNTZTInJVY9zc9Rqv0Q2//ZE4e8tqncaBxYluv
	kd1+ASXwwDm/UtNf+3iRwhnop4eabHfxewXbCOcw=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663508530679320.3713107847668; Sun, 18 Sep 2022 06:42:10 -0700 (PDT)
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
Subject: [PATCH v3 net-next 07/10] mips: dts: ralink: mt7621: change phy-mode of gmac1 to rgmii
Date: Sun, 18 Sep 2022 16:41:15 +0300
Message-Id: <20220918134118.554813-8-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220918134118.554813-1-arinc.unal@arinc9.com>
References: <20220918134118.554813-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_064230_164771_83225463 
X-CRM114-Status: GOOD (  11.01  )
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
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index c0529e939a31..3d4a8e4bd4f8 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -333,7 +333,7 @@ gmac1: mac@1 {
 			compatible = "mediatek,eth-mac";
 			reg = <1>;
 			status = "disabled";
-			phy-mode = "rgmii-rxid";
+			phy-mode = "rgmii";
 		};
 
 		mdio: mdio-bus {
-- 
2.34.1


