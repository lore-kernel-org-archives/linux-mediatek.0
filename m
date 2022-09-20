Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E806AC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Sep 2022 17:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTenQONxyrR2NLUejYhZ1v1RTmEl+bc+QPc+o+Ooz3M=; b=dkwvl+dMbl3YfzRiKq3sY40pzA
	Phu01T4nDYtLIdFvSxMdKoFAUCj4bv0KGjA7DVsjBaS4/5jEg40a4ved/40EZhnS72sB69x8E3HI1
	V4+Iz+3i7tZaqnMozBhn/mbixGL8IJP8icMbeyiqkBkRLJFwu3eJzZ8Ytk8lyqHYrVMU4miMR12mQ
	PzVLGurK4t9lg1XPLOLq90jDk4pPmVwhT+vwnrxAy5NHDkXPU/fQeVn79ggJ+NFoHGAoGDZgt9qNL
	fcd4GKEHZ721hK+IR3OvdVDhJbgWmtA/KOLii2vGbEDs69CjLVQqPE+YGSawd2AU3F3eX5vYGUF2A
	+zAD5ryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oah3f-005SnI-Fx; Tue, 20 Sep 2022 17:29:19 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oah1y-005RhH-5e; Tue, 20 Sep 2022 17:27:35 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663694831; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mWrbfMCj1fqji88vIWZITlHYhOlTWCiWVOkgFXCAfe3DKPlhM+huQTnOh2a3ay7lWysr8xyJv4m0w4puvjBi5w+Dr7jrBqZhKe4Afdnii2V0eOir5sr4oVm6oHVAyfgt5m8bAAhDOxizvbXYmIr2m/NaEvyEyxNYw39hmnt/6pc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663694831; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=JTenQONxyrR2NLUejYhZ1v1RTmEl+bc+QPc+o+Ooz3M=; 
	b=ndASbSLEchua3LPZxGYpAIbsHL3dsY8hKc0F2L6ABk+9mt1mwXHtHnq5bAiNmfqULCJ6ApTnu1/R2DcEXE/bcpnYXwqYqh6BnHP4Eff4XjfvjKqqq31wYpDnlKLF13qeeOAjCHNSWN05nvWlMufZsHKIRFGY+6MpthSEe1YmpfQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663694831;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=JTenQONxyrR2NLUejYhZ1v1RTmEl+bc+QPc+o+Ooz3M=;
	b=AgA0oCcbzbMtOOHD/eepEV2l56jX+xDofBOuu/2TYoXp2Z3CCDvqqSX6GwmHufVd
	OL8LfQSe0mhleoSfAAyS0aJ50kvVPCpCEAZJ6PDV8aT2Bv4aWPX8gEsi85PvG/Cnt8e
	PFvTkq7YxgH5B2ogSGrwmJMvUYgA3nZphtihVWQQ=
Received: from arinc9-Xeront.fusolab.local (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 166369483125052.3963724468872; Tue, 20 Sep 2022 10:27:11 -0700 (PDT)
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
Subject: [PATCH v4 net-next 06/10] mips: dts: ralink: mt7621: remove interrupt-parent from switch node
Date: Tue, 20 Sep 2022 20:25:52 +0300
Message-Id: <20220920172556.16557-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920172556.16557-1-arinc.unal@arinc9.com>
References: <20220920172556.16557-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_102734_477296_7E63A2F5 
X-CRM114-Status: UNSURE (   9.24  )
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

The interrupt-parent property is inherited from the ethernet node as it's a
parent node of the switch node. Therefore, remove the unnecessary
interrupt-parent property from the switch node.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index 7cef1273796d..bcedb84e1618 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -348,7 +348,6 @@ switch0: switch@0 {
 				reset-names = "mcm";
 				interrupt-controller;
 				#interrupt-cells = <1>;
-				interrupt-parent = <&gic>;
 				interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
 
 				ports {
-- 
2.34.1


