Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC08DC04A68
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Jul 2022 20:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6cegGklwMN8G/EK3L6ajLxFxmA8JR/v85vtwkffWMww=; b=SCDal/6fTJ9UH/ol8i8e8rctuc
	pYCLEIlkchR9i90+O6bc9UmSHxW20wph98T60xiYYN7exGAZjRxGa9F5JhxHOCnVgKw1jttPytLpV
	r282cKS9UOh1gML0YdheAo9ZQ35peR9aUEuyyi56y4LqRImxR+Uz8SdqthwVW1Z5Yh5jRRMwUST67
	y2uyFHBb/Jzhp6dtyFJCBIWXHv3K4zKRVpZ3IMCU7B2B3DPYfYczv1q+DTNLnILGQS/HYCH1ubbsf
	Btyr9org9j6eZwrlC38EHMKn9aBSVbmzQSZXgfK5p90AKJjREsBn+zv8zUtBa9WwsSylmw/zMexIW
	GjyCTaZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGnhY-00HYcV-L8; Wed, 27 Jul 2022 20:32:16 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGnhD-00HYMZ-N8; Wed, 27 Jul 2022 20:31:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1658953873;
	bh=6cegGklwMN8G/EK3L6ajLxFxmA8JR/v85vtwkffWMww=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CwJ4xHtVxy9J5c/slCbc9JvCrWKYAsKvdZfBoF9xVxfJxj0VMlfB6xAXS7YxRmsUM
	 PDumPMvlaNqzvx2q5jf4RkdrCeLG1OM+tnGB4oEqOF/tlMnAgq2sPf2ACTmsNBRywB
	 blcMv8DJDxJWcg/sN4Lfg7hCBLeABDqjk9tqpvaY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.155.189] ([217.61.155.189]) by web-mail.gmx.net
 (3c-app-gmx-bs42.server.lan [172.19.170.94]) (via HTTP); Wed, 27 Jul 2022
 22:31:13 +0200
MIME-Version: 1.0
Message-ID: <trinity-96b64414-7b29-4886-b309-48fc9f108959-1658953872981@3c-app-gmx-bs42>
From: Frank Wunderlich <frank-w@public-files.de>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Luiz Angelo
 Daros de Luca <luizluca@gmail.com>, Sander Vanheule <sander@svanheule.net>,
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, Daniel Golle
 <daniel@makrotopia.org>, erkin.bozoglu@xeront.com, Sergio Paracuellos
 <sergio.paracuellos@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: Aw: [RFC PATCH net-next] dt-bindings: net: dsa: mediatek,mt7530:
 completely rework binding
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 Jul 2022 22:31:13 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <20220726122406.31043-1-arinc.unal@arinc9.com>
References: <20220726122406.31043-1-arinc.unal@arinc9.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:2SCSIFa9qDIxiGlO6/J12e1r5kj8WpzZq8CaGp3EH1FDBTB/Zd42SDKO7cKqmHqOw4L9d
 tUQCJxaAASNxBfcLOB9WuFIH7h316jwbh7nsC3aMNtjgQb4AertNWPW8mMveK3gOWDh7l5oIeEmH
 p15ux5hOX+BSmAUo95QOtlvr/d0pmMjeZ4ZG7uTkJfDCrO+NNpdVvNFde23ax6hmXuyIERN0D1zD
 aIokREl3zb1PurqUsXvf0HJb8wM6/vFgPfhJGYie4gWZe8X63g/eeHjiGHRt++gqsF1xxnudgup3
 Ts=
X-UI-Out-Filterresults: notjunk:1;V03:K0:5q6bngrjAHQ=:h2eOVPO5MfSejV/TG/wNgV
 hGp99wen7FNY6GZ1t/so1OQBm8rIRbIDc9wDNrYt+yfw65+YQQ5tW2xQWP8sTVmo57DvpH//k
 d7jbo+5q0XNWqp6gG9YDL/WJgQ32f/Z9ufUNxXZQsOraoMfXc+IZvVtb3wawktWk6vYZknPwm
 opSrJ9dvygiWjp/evzApHuKNRdhdaxbo690MgJ9azVXCoKk9vDwRpPK6DMl9teJL7SwejaWOr
 9SQUuq5iB9eydFT9vFNK2kZpAtTEHZ5YI7YLOYlkunoyfUXOFftsL1L9BrnZXn9pS+8N8l5V3
 kUa+4hgzVB9zfijMYrAFzhQgJI8ANSbW70JBwTZOEyNm/YzXc9atNPYPouUybe15xEg+axL2+
 BSqRmpVC+1H0e9h4RRS04MMQKyljErAasx4CglvrO+p+Olgzqywq8TmOtAhtB9PRrltkyWH52
 8U6eolvfNl7QT8esur9ILdj5sZXOayoPUBnYXNroku6RmcLNWo78YGT1K/5YfGdrVohpDnp6x
 HFwjQe8QHaQdKoQDvGW/CMJc1KJ2TineNxzDH3yGuj9TNoaSe+KnJMqSemZHqL50/S63BYC18
 O0m722erANOhEy6/XiCeBlVUzL01HAEQiNuiFjaPbJclC/4I5XMQ+55lm62Osgko/DHO0wplT
 W6Mp9wRL3cHbgvw//8i22BMJaxIDBVGoNtxLstz1amdpQJPwK9vw05UzrPB900uOt2DXeDEl2
 fIDyg7Q4FWCq8EBtLZJu5UcncMOhOwkQG9TogufLtQpnxVcdRnUpO1xFhtkGsWHn6BPvhEndI
 NhgtWGX
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220727_133156_252183_9DA20061 
X-CRM114-Status: GOOD (  14.65  )
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


> Gesendet: Dienstag, 26=2E Juli 2022 um 14:24 Uhr
> Von: "Ar=C4=B1n=C3=A7 =C3=9CNAL" <arinc=2Eunal@arinc9=2Ecom>

Hi,=20

> To Frank:
> Let me know if MII bindings for port 5 and 6 on MT7531 are okay=2E

I ack krzysztof, that the change is really huge and it is hard to understa=
nd what exactly is changed and why=2E So please split=2E I have converted=
=20
it to yaml, but not have changed the logic itself=2E I guess you know the =
switch better than me=2E

> Does your recent patch for MT7531 make it possible to set any port for C=
PU,
> including user ports? For now, I put a rule to restrict CPU ports to 5 a=
nd
> 6, as described on the description of dsa port reg property=2E

i only know that port 5 and 6 are possible, not about the other ports=2E A=
fair there was a check if port 5 or 6 (followed by available modes
like rgmii, trgmii or sgmii) and then allow cpu-port-mode else allow only =
user-port mode=2E Had not changed this, so currently only these 2
ports can be used as CPU=2E

> I suppose your patch does not bring support for using MT7530's port 5 as
> CPU port=2E We could try this on a BPI-R2=2E Device schematics show that
> MT7530's GMII pins are wired to GMAC1 of MT7623NI to work as RGMII=2E

my patches (and the version from Vladimir that was merged) only solves the=
 Problem that CPU-Port was fixed to 6 before=2E I tested Patches on r2=20
(mt7530) and r64 too (mt7531) that they do not break anything=2E But i hav=
e not disabled port 6 (maybe i had to do so for a port5-only mode), only
enabled port 5 too and run iperf3 over a vlan-aware bridge between wan-por=
t and port 5=2E

> Ar=C4=B1n=C3=A7

regards Frank

