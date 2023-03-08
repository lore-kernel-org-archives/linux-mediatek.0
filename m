Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25E0AC742A7
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Mar 2023 18:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtUE/7DBohqNr7IJ3h/RgLd1gCpyEJMqeBsb1dHhiiw=; b=VcscjW12WtziweZDZSbn0fmZZE
	w8LjI6I/jl1Dddb/nouis0CvsqMX3rzrlMedipTun9idjKUp89ZvLaRmVLoGkf7nFROiL057YPJSS
	sW+iet6bvp9swkaAh1PRKTNPRH6sbtVpJCP5R3K0hg/X1m7GQN9uxuR4Z+eWcBWyuhxmCr0YVSgbv
	RCJ90OgQaP27T0wSryZ7jB/PS/RXu4vWC4CfEEakwkUmTzNzdbTKUMSobsq+631E79Y4kSjSalOQA
	wKqnBZ99qT7WqABghfhWOsoavifE8P+aLyxyZNG9OzWA1vcvmLr+chPQt85IxSpv2cOH4DJUvw4eM
	6ORZ7+Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZyco-006NSv-4s; Wed, 08 Mar 2023 18:34:54 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZycd-006NRY-VK; Wed, 08 Mar 2023 18:34:45 +0000
Received: by mail-ed1-x52d.google.com with SMTP id x3so69373178edb.10;
        Wed, 08 Mar 2023 10:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678300482;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VtUE/7DBohqNr7IJ3h/RgLd1gCpyEJMqeBsb1dHhiiw=;
        b=fHmNlpoMEszeE15zSWXKhmvAq0EDBulLvVk7HYWuPhBWDAN3TUjmkcrisqicYJ3bW/
         20+ijoy3Y/FQhe5M69QbmFhsZihZK7M8h3X6+HDqYB3hqjql8woeHenCG4MUgzzC8A3g
         ejqZNbW1gsV1Gfwit4wm46QaHrrj9hda+JuGS9nqE2CDZIMy6mO5ocOA00kalBh3HmTI
         oLceEemLvRTcQXfAbwysUE0hFZ+sJcvXGxLNk1KkV3kQjTmky04YODCLVdAZiZUGM84K
         kxxvEnQHVsNLf79Po4HmwGO3h5IjsYrZf3L2tNMVKHJ68/DMP2MRkmOny8WjTZ/N8W8H
         Ub9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678300482;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VtUE/7DBohqNr7IJ3h/RgLd1gCpyEJMqeBsb1dHhiiw=;
        b=djXLh/Fhiyb2cnZU98q94YYogQIvakzEQr7p2JXi2naxb3oQZR8yW6mxJcqSfYXeOK
         MZ381bTsMDc3pmXRB6h6fZtlLHyDhVucNEAwGs95WHmLj/DWs6ISnkYswaziLhC76aGI
         egX5R70LvffMYYILqbJO68zvM9cL4JdfXnjc+xbMn4mawj8RSeD0mehjJPpcYwH+H23J
         le2O8oMlZTPJWVZesJvWirzd8NgEq2yxXb1YSGCBlZucwyuoZquAFr7ojPIjzso1uXic
         1+Rh/qsDHsu3yLT61v3vQL3NAqUHDtbvznYd7nLIFZF2/cvOZ5sg0ekYLQCqR8aJJFT0
         djcw==
X-Gm-Message-State: AO0yUKXlhKuR+U8nUxifXidb6P4CukDsg7Gq/yyrr2WnmVK24FJ+6MiA
	p6qAyIekkPishhl5fvkEPNI=
X-Google-Smtp-Source: AK7set+NcA0sgdg4llwz3yGkNz7kStT6sPz/Ru82tgxk1Zl88I1GbZ2ntBhg9IwWQghzRUFE1LELOQ==
X-Received: by 2002:a05:6402:5154:b0:4bd:6b93:1289 with SMTP id n20-20020a056402515400b004bd6b931289mr17146099edd.15.1678300482112;
        Wed, 08 Mar 2023 10:34:42 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:3ab6:1404:fd5c:80ff? ([2a02:168:6806:0:3ab6:1404:fd5c:80ff])
        by smtp.gmail.com with ESMTPSA id q18-20020a170906771200b008cc920469b5sm7922081ejm.18.2023.03.08.10.34.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 10:34:41 -0800 (PST)
Message-ID: <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
Subject: Re: [PATCH net-next v2 4/6] net: mdio: scan bus based on bus
 capabilities for C22 and C45
From: Klaus Kudielka <klaus.kudielka@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Michael Walle <michael@walle.cc>, Heiner Kallweit
 <hkallweit1@gmail.com>,  Russell King <linux@armlinux.org.uk>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Felix Fietkau
 <nbd@nbd.name>, John Crispin <john@phrozen.org>,  Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 UNGLinuxDriver@microchip.com, Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,  Jose Abreu
 <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joel
 Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 netdev@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,  linux-aspeed@lists.ozlabs.org,
 Jesse Brandeburg <jesse.brandeburg@intel.com>
Date: Wed, 08 Mar 2023 19:34:40 +0100
In-Reply-To: <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
References: 	<20230116-net-next-remove-probe-capabilities-v2-0-15513b05e1f4@walle.cc>
	 <20230116-net-next-remove-probe-capabilities-v2-4-15513b05e1f4@walle.cc>
	 <449bde236c08d5ab5e54abd73b645d8b29955894.camel@gmail.com>
	 <100c439a-2a4d-4cb2-96f2-5bf273e2121a@lunn.ch>
	 <712bc92ca6d576f33f63f1e9c2edf0030b10d3ae.camel@gmail.com>
	 <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
	 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
	 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_103444_032066_8CAA0097 
X-CRM114-Status: GOOD (  18.52  )
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

On Tue, 2023-03-07 at 21:35 +0100, Andrew Lunn wrote:
> > Summary: Still 4 calls to mdio_bus_scan_c22, but also *2* calls to mdio=
_bus_scan_c45, approx. 190*100 reads by the switch driver
>=20
> Those calls to mdio_bus_scan_c45 are caused by 743a19e38d02 net: dsa:
> mv88e6xxx: Separate C22 and C45 transactions.

Well, yes and no. I understand orion mdio is MDIOBUS_NO_CAP
and therefore the c45 scan is *not* called until 1a136ca2e0
net: mdio: scan bus based on bus capabilities for C22 and C45.
Which is the behaviour I see.
(I needed a close look at the conditions in the if statements
that were removed then)


> The only part of a c45 scan which is not linear is
> mv88e6xxx_g2_smi_phy_wait() which is implemented by
> mv88e6xxx_wait_mask(). That loops reading a register waiting for a bit
> to change. Maybe print out the value of i, and see if it is looping
> more times for C45 than C22?

Here the debug code

diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/c=
hip.c
index 0a5d6c7bb1..23816cad41 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -90,6 +90,7 @@ int mv88e6xxx_wait_mask(struct mv88e6xxx_chip *chip, int =
addr, int reg,
 	u16 data;
 	int err;
 	int i;
+	static unsigned wait_count =3D 0, loop_count =3D 0;
=20
 	/* There's no bus specific operation to wait for a mask. Even
 	 * if the initial poll takes longer than 50ms, always do at
@@ -100,8 +101,13 @@ int mv88e6xxx_wait_mask(struct mv88e6xxx_chip *chip, i=
nt addr, int reg,
 		if (err)
 			return err;
=20
-		if ((data & mask) =3D=3D val)
+		if ((data & mask) =3D=3D val) {
+			wait_count++;
+			loop_count +=3D i;
+			if (wait_count % 10 =3D=3D 0)
+				dev_warn(chip->dev, "wait_count %u, loop_count %u\n", wait_count, loop=
_count);
 			return 0;
+		}
=20
 		if (i < 2)
 			cpu_relax();
diff --git a/drivers/net/phy/mdio_bus.c b/drivers/net/phy/mdio_bus.c
index 5b2f48c09a..19fde21cae 100644
--- a/drivers/net/phy/mdio_bus.c
+++ b/drivers/net/phy/mdio_bus.c
@@ -569,6 +569,7 @@ static int mdiobus_scan_bus_c22(struct mii_bus *bus)
 {
 	int i;
=20
+	dev_warn(&bus->dev, "*** mdiobus_scan_bus_c22 call ***\n");
 	for (i =3D 0; i < PHY_MAX_ADDR; i++) {
 		if ((bus->phy_mask & BIT(i)) =3D=3D 0) {
 			struct phy_device *phydev;
@@ -578,6 +579,7 @@ static int mdiobus_scan_bus_c22(struct mii_bus *bus)
 				return PTR_ERR(phydev);
 		}
 	}
+	dev_warn(&bus->dev, "*** mdiobus_scan_bus_c22 return ***\n");
 	return 0;
 }
=20
@@ -585,6 +587,7 @@ static int mdiobus_scan_bus_c45(struct mii_bus *bus)
 {
 	int i;
=20
+	dev_warn(&bus->dev, "*** mdiobus_scan_bus_c45 call ***\n");
 	for (i =3D 0; i < PHY_MAX_ADDR; i++) {
 		if ((bus->phy_mask & BIT(i)) =3D=3D 0) {
 			struct phy_device *phydev;
@@ -598,6 +601,7 @@ static int mdiobus_scan_bus_c45(struct mii_bus *bus)
 				return PTR_ERR(phydev);
 		}
 	}
+	dev_warn(&bus->dev, "*** mdiobus_scan_bus_c45 return ***\n");
 	return 0;
 }
=20


And here the trimmed results from boot @ 1a136ca2e0, plus debug code.

It's not only the looping during the mv88e6xxx_wait_mask calls, but
also the sheer amount of mv88e6xxx_wait_mask calls during the c45 scans.
(c22: ~0.1 sec & ~150 calls, c45: 2.3-2.5 sec & ~4800 calls)


[    0.195215] mdio_bus fixed-0: *** mdiobus_scan_bus_c22 call ***
[    0.195221] mdio_bus fixed-0: *** mdiobus_scan_bus_c22 return ***
[    0.195617] mdio_bus f1072004.mdio-mii: *** mdiobus_scan_bus_c22 call **=
*
[    0.195623] mdio_bus f1072004.mdio-mii: *** mdiobus_scan_bus_c22 return =
***
[    0.202583] mv88e6085 f1072004.mdio-mii:10: switch 0x1760 detected: Marv=
ell 88E6176, revision 1
[    0.212708] mdio_bus mv88e6xxx-0: *** mdiobus_scan_bus_c22 call ***
[    0.222200] mv88e6085 f1072004.mdio-mii:10: wait_count 10, loop_count 3
........
[    0.315724] mv88e6085 f1072004.mdio-mii:10: wait_count 150, loop_count 7=
6
[    0.315908] mdio_bus mv88e6xxx-0: *** mdiobus_scan_bus_c22 return ***
[    0.315913] mdio_bus mv88e6xxx-0: *** mdiobus_scan_bus_c45 call ***
[    0.321095] mv88e6085 f1072004.mdio-mii:10: wait_count 160, loop_count 8=
3
........
[    2.610380] mv88e6085 f1072004.mdio-mii:10: wait_count 4980, loop_count =
1571
[    2.613258] mdio_bus mv88e6xxx-0: *** mdiobus_scan_bus_c45 return ***
[    2.755785] mv88e6085 f1072004.mdio-mii:10: switch 0x1760 detected: Marv=
ell 88E6176, revision 1
[    2.766047] mdio_bus mv88e6xxx-1: *** mdiobus_scan_bus_c22 call ***
[    2.766960] mv88e6085 f1072004.mdio-mii:10: wait_count 4990, loop_count =
1574
........
[    2.867107] mv88e6085 f1072004.mdio-mii:10: wait_count 5130, loop_count =
1645
[    2.869938] mdio_bus mv88e6xxx-1: *** mdiobus_scan_bus_c22 return ***
[    2.869943] mdio_bus mv88e6xxx-1: *** mdiobus_scan_bus_c45 call ***
[    2.871556] mv88e6085 f1072004.mdio-mii:10: wait_count 5140, loop_count =
1649
........
[    5.371710] mv88e6085 f1072004.mdio-mii:10: wait_count 9970, loop_count =
4282
[    5.373332] mdio_bus mv88e6xxx-1: *** mdiobus_scan_bus_c45 return ***




Best regards, Klaus

