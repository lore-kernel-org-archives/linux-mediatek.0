Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64DDAC61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat, 11 Mar 2023 16:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wTwVrHUwJuxo2nAv8WcWBTbXbikVuPU2S0IixEuBaf4=; b=4twX2Q49Ee9HMB0e/5ruwoKSXv
	t0pF1E126UPcfl3IgHRi9sPA6/xY+xchaKw4yqlDn2eIod/ul29X5gVnudQmA4fxQQV8w7vdzViJq
	jB1tukF6YMb7cCTPQkQE7mnLsMFL/2XhWy4ckFBGKOBOCKvJMLGUZSLeDBo+D9srPkU/smW9Kor9E
	HRtayUjeubFCUKdBdG+jZ0R5y90rCAuSJq7Vyn+Jwh+sjQgpcB5GYJTxW0RaSb5yaUln2I9KuATFL
	+bkecX5godDDhtV1zhRY3ETmLeb7I4CLWfz/5dqCzVzl26PSXEuFTWXOmtZw+Ck/ng0uBIG6dqwZX
	gqG6ZN1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb1oe-000rMc-7v; Sat, 11 Mar 2023 16:11:28 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pb1oS-000rIb-5O; Sat, 11 Mar 2023 16:11:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id h11so7696801wrm.5;
        Sat, 11 Mar 2023 08:11:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678551070;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=wTwVrHUwJuxo2nAv8WcWBTbXbikVuPU2S0IixEuBaf4=;
        b=NjrXETXbZlcsvTNNCs9yzV/6PY+CmmQAxqPMkiNPO7QnMj6ytAX2MO60sgp2paNr9c
         Hj4btjqwVQYF5lLso0uID3MzUxTkZWfLMIEk6fajBsPgnH07UIpVWC04WKT6L+qzzwUq
         2eXh/JXic2jrLs7bRYweE2xFP9A4hvZVloIFsATIbYE4tZvjdNUE217s5/7sS8Ayn3zb
         4y5cNUEUaXO/9Dhavli5sH+hB6hWTXJUzqrvs4t9pQSV8bj/6cuUmzVIvHIr6ii3bG3z
         GHvtgjEuloh0lGRfs2aBA6ScgOF2GeGe5cr4k2ApsqReCT35clKNcoVw3C+8ofih80pf
         cBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678551070;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=wTwVrHUwJuxo2nAv8WcWBTbXbikVuPU2S0IixEuBaf4=;
        b=0nIG8+fMC4VcZRNtVhjtP0Zsp5gjjdTJd71MKb0isvHjKWrmJHYhd/9+SFNQs6V8pe
         QaHCh6YAf7lJ75+0rSfgV2m0FQD+HjUhATj9D5qLldkbLSe5axlZbJFRQDEYoyNrfIec
         uq5xHTSzamL1vcYmEnF0vFoSOR1+lXdVEep+bgzLEZv4h87Pyb9jc51WvJay5EtIwCB5
         c7ZO23HaA7SBVK1It8vV9stOSCbaKnrR191NEobj4owjjubsgeNR5V0ocIaFa2s+we85
         2Qaw+I1V6D5XE9uJUX93HTtzbJLALDk+Cwn52sY/+cDhrkICdsxN9uuoUmjzNcF0ne13
         NoWg==
X-Gm-Message-State: AO0yUKWOmn7ZeExnIk7sMRVwPcXJk/l1fXqd94Dmx3VAIrribySwvohW
	ITcPUzObUSZo71DzkPjNNzw=
X-Google-Smtp-Source: AK7set9VyJg+v0ZGE7y65i5aFyOLU9IOZOR0GJb9hHZKpkI2ykj3H4fHVqW+NtUo6nKqBhqI6frrGw==
X-Received: by 2002:adf:e302:0:b0:2c7:851:c0bf with SMTP id b2-20020adfe302000000b002c70851c0bfmr19781176wrj.0.1678551069607;
        Sat, 11 Mar 2023 08:11:09 -0800 (PST)
Received: from ?IPv6:2a02:168:6806:0:cb1:a328:ee29:2bd6? ([2a02:168:6806:0:cb1:a328:ee29:2bd6])
        by smtp.gmail.com with ESMTPSA id b18-20020a05600010d200b002cea8f07813sm346294wrx.81.2023.03.11.08.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 08:11:09 -0800 (PST)
Message-ID: <2f64385a350359c5755eb4d2479e2efef7a96216.camel@gmail.com>
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
Date: Sat, 11 Mar 2023 17:11:08 +0100
In-Reply-To: <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
References: <100c439a-2a4d-4cb2-96f2-5bf273e2121a@lunn.ch>
	 <712bc92ca6d576f33f63f1e9c2edf0030b10d3ae.camel@gmail.com>
	 <db6b8a09-b680-4baa-8963-d355ad29eb09@lunn.ch>
	 <0e10aa8492eadb587949d8744b56fccaabbd183b.camel@gmail.com>
	 <72530e86-9ba9-4a01-9cd2-68835ecae7a0@lunn.ch>
	 <09d65e1ee0679e1e74b4f3a5a4c55bd48332f043.camel@gmail.com>
	 <70f5bca0-322c-4bae-b880-742e56365abe@lunn.ch>
	 <10da10caea22a8f5da8f1779df3e13b948e8a363.camel@gmail.com>
	 <4abd56aa-5b9f-4e16-b0ca-11989bb8c764@lunn.ch>
	 <bff0e542b8c04980e9e3af1d3e6bf739c87eb514.camel@gmail.com>
	 <a57a216d-ff5a-46e6-9780-e53772dcefc8@lunn.ch>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230311_081116_226001_29BD0F69 
X-CRM114-Status: GOOD (  15.68  )
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

On Sat, 2023-03-11 at 16:39 +0100, Andrew Lunn wrote:
>=20
> I have one more idea which can speed things up. The scanning of the
> MDIO bus works in two different ways depending on if there is a DT
> node, describing what should be found on the bus. For mv88e6xxx, using
> DT is optional. Some boards do, some don't.
>=20
> If there is a DT node, only the addresses listed in DT are scanned.

Here's the definition of the switch in the Turris Omnia device tree.

	/* Switch MV88E6176 at address 0x10 */
	switch@10 {
		pinctrl-names =3D "default";
		pinctrl-0 =3D <&swint_pins>;
		compatible =3D "marvell,mv88e6085";
		#address-cells =3D <1>;
		#size-cells =3D <0>;

		dsa,member =3D <0 0>;
		reg =3D <0x10>;

		interrupt-parent =3D <&gpio1>;
		interrupts =3D <13 IRQ_TYPE_LEVEL_LOW>;

		ports {
			#address-cells =3D <1>;
			#size-cells =3D <0>;

			ports@0 {
				reg =3D <0>;
				label =3D "lan0";
			};

			ports@1 {
				reg =3D <1>;
				label =3D "lan1";
			};

			ports@2 {
				reg =3D <2>;
				label =3D "lan2";
			};

			ports@3 {
				reg =3D <3>;
				label =3D "lan3";
			};

			ports@4 {
				reg =3D <4>;
				label =3D "lan4";
			};

			ports@5 {
				reg =3D <5>;
				label =3D "cpu";
				ethernet =3D <&eth1>;
				phy-mode =3D "rgmii-id";

				fixed-link {
					speed =3D <1000>;
					full-duplex;
				};
			};

			ports@6 {
				reg =3D <6>;
				label =3D "cpu";
				ethernet =3D <&eth0>;
				phy-mode =3D "rgmii-id";

				fixed-link {
					speed =3D <1000>;
					full-duplex;
				};
			};
		};

>=20
> If there is no DT node, by default, all 32 addresses on the bus are
> scanned. However, DSA makes another assumption. There is a one to one
> mapping between port number and PHY address on the MDIO bus. Port 0
> uses MDIO address 0. Port 7 uses MDIO address 7 etc. If you have an 8
> port switch, there is no point scanning addresses 8 to 31, they will
> never be used.
>=20
> The mdio bus structure has a member phy_mask. This is a bitmap. If bit
> N is set, address N is not scanned. So i suggest you extend
> mv88e6xxx_mdio_register() to set phy_mask based on
> mv88e6xxx_num_ports(chip).
>=20

What you are proposing here would not show any improvement on the
Omnia, as only the 6 ports would be scanned - right?=20

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0Andrew


