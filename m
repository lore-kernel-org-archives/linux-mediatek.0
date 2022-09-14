Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA98ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 09:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cN/vVpd4kMo1dSKFcVUlYwkahGokSNXVTYI2UGNTrT8=; b=icLIUToCzqfDOU8Cv65qfP62Jt
	sV4VLp3tJrr2E5zGwIXEVGZOJ1EiFt1Pt9pkN/oF2yQG5Yba3o83aQudDoAiAHhqs811BDL8BEr6t
	Nn894VZQqWgR0wiAxsPtGme/0kKIfnQLtNjf3GaCiJL0nx0NT09LhJtWZQ1x7N4n3SGuPfccoF7bj
	UQTo+i5l2Dg5SfljQEJNajD+QGcKK5gylrCEMQZZmH/Meh8huNydm6QxdvmlKJGThe3nlse0zwaBc
	zfsjcDBnbv98E0hYJWFhBDqiSnyPKXojeP23DZM2isQ7T7yOx/qU3ri9XtDfAEmxid1iLNIpA/QrF
	yimv4lXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOWW-00E4RL-NE; Wed, 14 Sep 2022 09:17:36 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYOBq-00DlFc-UW; Wed, 14 Sep 2022 08:56:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663145755; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=drNCMGnpaC1O37wVgp0Xcj2fLvoJG6WtISIPFVBgUFu+EfM7j6kmXmKSPDt9tOP7d5W1LG0XWaDQhnB8Zez74AanYcZZ4bhHl09kCF/FUuCJt5/a/DDyHbFV863D+b2Lx6YR7e1EaSeHXywU8IMUF6z8GmTmEb0A4gWrIjfA6V8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663145755; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=cN/vVpd4kMo1dSKFcVUlYwkahGokSNXVTYI2UGNTrT8=; 
	b=S+WXaArXB6gBrMvUlgGZhNILYDWedLz6iofh0M4Uf8E97EI0VP5TlIm7NjRiYlaozIYzWkQuGXE1lzlLPJyKllq4RZaCFGLILkmVOgd7vb2tX1jWjfXlKEz9ydkm/UmI0mHUpk5tLB5mp9cnwEqrKNByu4JQ4juB0ET9A3kR3j4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663145755;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=cN/vVpd4kMo1dSKFcVUlYwkahGokSNXVTYI2UGNTrT8=;
	b=MdOzQnoHOS3Cp0dljo2jMIBss584fLWC2inX5ArH+RWOhjOj1BzvLoaxrcMtdsGz
	yHPd3XapxmBU465Ndd1iBcmr1CO2Kv/U4y6ZoGnWhnd9NQ2PkzHeRdYFTy3zl58dBq5
	oGEoyrvnhfljUy3e9InHFmD0O7Kz4EUERk7tgWds=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663145753702140.0435409651668; Wed, 14 Sep 2022 01:55:53 -0700 (PDT)
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
Subject: [PATCH 09/10] mips: dts: ralink: mt7621: fix external phy on GB-PC2
Date: Wed, 14 Sep 2022 11:54:50 +0300
Message-Id: <20220914085451.11723-10-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220914085451.11723-1-arinc.unal@arinc9.com>
References: <20220914085451.11723-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_015615_069874_F0D38A9C 
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

The address of the external phy on the mdio bus is 5. Update the devicetree
for GB-PC2 accordingly.

Fixes: 5bc148649cf3 ("staging: mt7621-dts: fix GB-PC2 devicetree")
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
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


