Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D293EC25B50
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Jan 2023 20:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5YvsubmY8tgaR4DoiSQWtSTX5lD/XiceQv1q0csqgsg=; b=Y5bINv0OxPCU2u
	TSJkK85Vi2/lGvCzSVEnswVCN4neGbbs7kAwTDMOQfBd2KPWxYbjbN/szXlPjUoJ7roL+rg6OuDon
	im7xj9GSoxKKEcumGew1UWW/oubGdhuCbhNzv85lBAR8DeSCPBvpDOhempxW9pnHfxdXN8zsvR/c0
	yxGSFX/MCkvLA5wiBurZVfvj9bL1UDO6bgan4UZg9dEv784lO0Razo4ZkHnwyTd4LBdpz0WTkFTgf
	Dy6HwFJ9ValJh/ShxyCfUWBLUL/2XKOyTnalLCmGqMqiEzD4Lv8Bxv0DHCYDgCDU0CBD0QS6e8D7m
	O8xpbDo0B9QmNh71YM2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyOk-00CLO6-A5; Fri, 20 Jan 2023 20:54:06 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIyOd-00CLJb-6y; Fri, 20 Jan 2023 20:54:00 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1674248035; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SUCoACN7Px4/FNgrHahnYY8C0yCAX5tR6idgwqoXKzMHWnCHIROC/tKeTMcu4QSREIH7GY6WxDwODPFuPI0K09jnVkdTt+FYDwNlzY9Dtyd0jpBYBt5vDVDbxz+dca77dd6M28rfFv4PZf5Rx1zXcdRPkXSHMD4ror5TS2H8dXk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1674248035; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=5YvsubmY8tgaR4DoiSQWtSTX5lD/XiceQv1q0csqgsg=; 
	b=WZu7hbBZYXRdyHb4Aazjfv0CSrSp15CVYySpp5Mw5XHDMxy9OIj6WiRLYK3RbK7sOW1xmmQ5zM5ZyMaJ8Pd1wjqlgXfqAF4Anbs/s5ev1ZYnNeKdtXxatEkYqqFhZLWCPbILd9pISQ7LEXvAXseusmcN6s0+dtuQtsnJYRerB6s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1674248035;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=5YvsubmY8tgaR4DoiSQWtSTX5lD/XiceQv1q0csqgsg=;
	b=Pnk0k7ZlvCO8Ggm8ie0d77RIn30aY9BgDkjtUCHKjk47ObjcPdRQRJClxc40+qtf
	95ClAfhNR2JdyuwjuSfgxajG+093Lqz9JRBWeoxE89zd4zUExrBgC1giY/02JmyAMib
	7dWfP6PrEH48CHsY8SU7yw4olg10JPBpnsVM8CuI=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1674248033074652.0041030895701; Fri, 20 Jan 2023 12:53:53 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 4/5] arm: dts: mt7623: mux phy0 on Bananapi BPI-R2
Date: Fri, 20 Jan 2023 23:53:17 +0300
Message-Id: <20230120205318.519493-5-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120205318.519493-1-arinc.unal@arinc9.com>
References: <20230120205318.519493-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_125359_358560_65FCC8EC 
X-CRM114-Status: UNSURE (   9.92  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Mux the MT7530 switch's phy0 to gmac5 which is wired to the SoC's gmac1.
This achieves 2 Gbps total bandwidth to the CPU using the second RGMII.

Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
index 94174cb2b7e1..28051136c4e2 100644
--- a/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
+++ b/arch/arm/boot/dts/mt7623n-bananapi-bpi-r2.dts
@@ -184,10 +184,19 @@ fixed-link {
 		};
 	};
 
+	gmac1: mac@1 {
+		status = "okay";
+		phy-handle = <&ethphy0>;
+	};
+
 	mdio: mdio-bus {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		ethphy0: ethernet-phy@0 {
+			reg = <0>;
+		};
+
 		switch@1f {
 			compatible = "mediatek,mt7530";
 			reg = <0x1f>;
@@ -199,11 +208,6 @@ ports {
 				#address-cells = <1>;
 				#size-cells = <0>;
 
-				port@0 {
-					reg = <0>;
-					label = "wan";
-				};
-
 				port@1 {
 					reg = <1>;
 					label = "lan0";
-- 
2.37.2


