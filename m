Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 447EAC352A1
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Nov 2022 14:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rw2F9BBmZz7hCr2YZL7OfKiCcti+Y/szmYlgYlkB1sE=; b=2Mgw2Iz/UsLNcPAKKwwkPm/D2b
	ZsSaV+k8y8pi4wQqxWuf/DCr+OBVLKy9YdkdVN1J+Ub4eTqKDshX44CZOVoPnz++n1I9spA/q1O/J
	XIYLwptG8544E+ChUA61bLpxbgiUA/yByZdGkcQyIIZoitN6ELg6vOkMjc8CskOqWtBnzA+u12Dyf
	RTm3qPRdt37coA+x+oRnuV9TJtn84RVPT5KUAWtOMluDdwqvIJcB0te7CrUTRMDwcLeZD9OqPHleU
	xJOlwgAgKdYwdm+BAmb6vqrD9mVwCsYIoLhGrjfZlBMOGf46KBpNdjOXq8inucVO3LKRn68G2IAib
	MUq0o7zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0NrU-00Gmli-BU; Wed, 30 Nov 2022 14:14:56 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0Nr7-00GmV4-IQ; Wed, 30 Nov 2022 14:14:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669817569; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JSacKIfuxVnGPNdOvTNL3VXsKQM4qKYAcNyM62uN0wuH9uI7u4LEUiHbLOklN7MsfxHvazieG2u/0J81Px89NKXRwBPqu4Pw6jInhCXzE3rdWRXhdfZaNTzHLSO9lJPkKtwpitvMR3jgZVj/fr12LzFmvrFen8xyh/DxxgNJ+14=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669817569; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=rw2F9BBmZz7hCr2YZL7OfKiCcti+Y/szmYlgYlkB1sE=; 
	b=Qz//DYinXkVfGaASn1n1TLCXq2S9vL1Nmzeni4L4pbkQxUX6o2mfkIOQEpBudE90saz+FnsTnRKRDmS+fdI2X0cjmxoXlNAtqnUhiMpOl52qMuR2sraP/JJbtqDyyJvA3zg+R3KPiIff8pxLZ0GD4b8+VoOj+usjoXQ7TcBh7Zo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669817569;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=rw2F9BBmZz7hCr2YZL7OfKiCcti+Y/szmYlgYlkB1sE=;
	b=Y3UfQeV6t5e6v1+lcSZhghTS0CZxtNhA9fhWhX01/PX+V0q+eUWYHvSIyUBh2gw0
	hVkCpwAY6EqKEk+cLkhndVHFFnyrRhER+VrpqH9ZxtSVnoH+Ecw3yVjk12T2WlQlAT3
	hGUf4H0F/Rx7+ehrD/hI7pNaE5FDByojV/CtfC+c=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1669817565868514.798752313474; Wed, 30 Nov 2022 06:12:45 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Vladimir Oltean <vladimir.oltean@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	soc@kernel.org,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>,
	Hans Ulli Kroll <ulli.kroll@googlemail.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@somainline.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Stefan Agner <stefan@agner.ch>,
	Heiko Stuebner <heiko@sntech.de>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Tim Harvey <tharvey@gateworks.com>,
	Peng Fan <peng.fan@nxp.com>,
	Rasmus Villemoes <rasmus.villemoes@prevas.dk>,
	Frank Wunderlich <frank-w@public-files.de>,
	Michael Riesch <michael.riesch@wolfvision.net>,
	Oleksij Rempel <linux@rempel-privat.de>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-rockchip@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/5] mips: dts: remove label = "cpu" from DSA dt-binding
Date: Wed, 30 Nov 2022 17:10:39 +0300
Message-Id: <20221130141040.32447-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221130141040.32447-1-arinc.unal@arinc9.com>
References: <20221130141040.32447-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221130_061433_686154_03EC30EF 
X-CRM114-Status: GOOD (  12.58  )
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

This is not used by the DSA dt-binding, so remove it from all devicetrees.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/mips/boot/dts/qca/ar9331.dtsi    | 1 -
 arch/mips/boot/dts/ralink/mt7621.dtsi | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/mips/boot/dts/qca/ar9331.dtsi b/arch/mips/boot/dts/qca/ar9331.dtsi
index c4102b280b47..768ac0f869b1 100644
--- a/arch/mips/boot/dts/qca/ar9331.dtsi
+++ b/arch/mips/boot/dts/qca/ar9331.dtsi
@@ -176,7 +176,6 @@ ports {
 
 						switch_port0: port@0 {
 							reg = <0x0>;
-							label = "cpu";
 							ethernet = <&eth1>;
 
 							phy-mode = "gmii";
diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index f3f4c1f26e01..445817cbf376 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -386,7 +386,6 @@ port@4 {
 
 					port@6 {
 						reg = <6>;
-						label = "cpu";
 						ethernet = <&gmac0>;
 						phy-mode = "trgmii";
 
-- 
2.34.1


