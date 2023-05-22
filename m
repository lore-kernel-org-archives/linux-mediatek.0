Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE31C7EE26
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 May 2023 08:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJE87Et1+i7od+AUi+yEibwB8gDZBBZCoiwY+GJCKSY=; b=ZyUQrQYCuE++1YSqUiUwoYOfxZ
	PqtSCtFtU0qCsQtZQdGi+0qm9eEGOUXyLmiwl/jozOmJWBaiCxhlhVuflvWdjGMrW0/4WkyfhC23/
	SEvL05FHrNEq4w2k3OwdOt482K4U2A3qYczffgGrqCZreJIRpKpNK4IQmOyXG/5M+KhZ2L+iECuwG
	P/iW18fwpFDV8viMFd7zXfmMjMWSaueVyhMDlhpHaV/Jvkkx0YZ5ln8aeCmsqV0vKFvrLbczZj90B
	5XuVjim0a3xxoJcvlk7TubmvA0wFs+gxYs9rX6tnCwVuYksTxAeD4bHejnEHChaNld4EzmMPYbkH4
	HvmmNHUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q10sN-005kIJ-2l;
	Mon, 22 May 2023 08:26:43 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q10sK-005kHq-1N;
	Mon, 22 May 2023 08:26:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1684743994; i=frank-w@public-files.de;
	bh=iJE87Et1+i7od+AUi+yEibwB8gDZBBZCoiwY+GJCKSY=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=em9IA7mS7pr2vumrK+0oMJMvK07ADhacGr30BSJsNtI+fDq25r1mJK5LxI6efwajq
	 0WoOTa+p+JA8IWNJnr4b+OqSDImMLjQkiG6aju6NHcmP9vE+GZRorBupJxY2rBouEm
	 OjLz+kJIf0M1ZxYOZF66ylFjV/8kqzTbdCUL9uCIKwlP3ojg+ZFZbRbSm8tXBNhxgk
	 4uvx8LjCirBN0GwUbhaWhwTCOyG5l3FdPFN+k1TpF1jg4uqvZVp9wgW1yGx8I9s0KW
	 HtdtzBZD3OmRQnIZjQxOjems8QI4bI+z7R2A0eo2BuxsklQkqc4cZRBv7hI/mxeBft
	 hQj68PagPeeDg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.155.92] ([217.61.155.92]) by web-mail.gmx.net
 (3c-app-gmx-bs66.server.lan [172.19.170.210]) (via HTTP); Mon, 22 May 2023
 10:26:34 +0200
MIME-Version: 1.0
Message-ID: <trinity-8c109262-658a-4a4e-a807-1cd8f640fdc4-1684743994291@3c-app-gmx-bs66>
From: Frank Wunderlich <frank-w@public-files.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Aw: Re: [PATCH] arm64: dts: mt7986: set Wifi Leds low-active for
 BPI-R3
Content-Type: text/plain; charset=UTF-8
Date: Mon, 22 May 2023 10:26:34 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <3a43ce55-ff6a-0cd2-b020-d5fefe8aca0a@collabora.com>
References: <20230205174833.107050-1-linux@fw-web.de>
 <8f04f2b5-320e-50d4-9517-6dac989f63b3@gmail.com>
 <3a43ce55-ff6a-0cd2-b020-d5fefe8aca0a@collabora.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:9HKDyGxPRL9Yhd/YC7Z3n+yXLC68nN9emK2ktuC8U6wz6JHq56A8NcXUWqIQtzljYirmE
 gke/KKu6xKmuIy327JL63asHMmvpMEO4fWrg02un03Uc60bWUWEI5bjAK1np8wIsqNfqhKVE1AVG
 haO2zutpvCHnfRBh3vMCtmd8ZMw7cjPkXcUGn8YbRrzV3kAbyMHDcw4NjhoIAmx/Tytb9xV+jNId
 L6vivZs5VbqUEvWRfCZI4QNAMfrbE+55bauLGtR6Q1Tf35Tlqjn9hyOOL1MnmXwfX0sa9Zr73tPN
 Hw=
UI-OutboundReport: notjunk:1;M01:P0:nkS8x8yAfKQ=;kSUXqTCb3/4/ThFRC1fkJbE5Lj0
 JqlFM5l+gGaUOCIzXJFAzpsLXYE9n+6G61AncanneZVhTXBtBXMY5+giQzBn+lZ3wTC7NAtc/
 aEoX/iMnavtG2vN0Uz0wffiXHVpYS14osm1YzhKqJ2lFDCGoBecVjyEcquA/MftA2PyvF6+Wj
 gWAd7dJEQjX1hXTl9DGx49FAIYf4oRZ8Q97LasaQPMYoGKYgD3UGyxYkE3GdES1qFvNRdfK2M
 Q7xIyEsc6+pn/XPV44K4pw6k7jNMBkdIEyQza3S6Ik7SYnqvxDya2MYn/B034VeLxrEuFTkc4
 zz0q55gIl7tABo4LSDLdg0W0VlZjez+htY3uKnnMjvCVzn5krGhu1kfwtIFlN3tJSgb/++CQo
 JvpG8gV3ygRU0ERo4Nh8H+JUnMuc8WNzt95ePbmBMj2NuhDXYoAZS4WrgGUPkVdiY97OUeXVg
 TZTtkBZFfsGRaoH6w0g0CRu3xN46xHVAqzyHu0Ijk0TkRGfD5RSd7ASBt07RkkTi7hmAK7eeA
 IXluMp+xFxlODO4Zmi4m8U0ROd5aE8qPZpMkVrAr+tyQrqMAzc6vqUodcK+pnYW6tppMMAMuF
 RIPNBtmlxwfjGApcmOSPFRHYTl+m4rrUitrr7Y+1cdElAeRNNE5nwH1VoHN2FruhKwBDG/ZEM
 QN5ajdXtlG0XqLtNiuobJKYgK4ekM7T022s4y0q5ofZ+35waxijEiMt/HY79lbQWIGZN2WESZ
 fZxT9tAZABj13wcFbVQTBCgcKg0Mxq+a4GCE+yu6vxbxX+rBJ+01ml3di5KUwk7d6zFPQTiuo
 /TPCo3uqpygDqyXJt830RbFg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_012640_950434_8A1294AF 
X-CRM114-Status: GOOD (  15.92  )
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

> Gesendet: Dienstag, 07=2E Februar 2023 um 17:17 Uhr
> Von: "AngeloGioacchino Del Regno" <angelogioacchino=2Edelregno@collabora=
=2Ecom>
> Il 06/02/23 21:20, Matthias Brugger ha scritto:
> >=20
> >=20
> > On 05/02/2023 18:48, Frank Wunderlich wrote:
> >> From: Frank Wunderlich <frank-w@public-files=2Ede>
> >>
> >> Leds for Wifi are low-active, so add property to devicetree=2E
> >>
> >> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
> >> ---
> >> =C2=A0 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3=2Edts | 4=
 ++++
> >> =C2=A0 1 file changed, 4 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3=2Ed=
ts=20
> >> b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3=2Edts
> >> index 33bd6febc160=2E=2E2b028141f1f7 100644
> >> --- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3=2Edts
> >> +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3=2Edts
> >> @@ -446,5 +446,9 @@ &wifi {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-names =3D "default", "dbdc";
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-0 =3D <&wf_2g_5g_pins>, <&wf_l=
ed_pins>;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pinctrl-1 =3D <&wf_dbdc_pins>, <&wf_le=
d_pins>;
> >> +
> >> +=C2=A0=C2=A0=C2=A0 led {
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 led-active-low;
> >> +=C2=A0=C2=A0=C2=A0 };
> >=20
> > The binding is missing this property also the driver implements it=2E =
Could you=20
> > please update the bindind description properly?
> > Thanks
> > Matthias
>=20
>=20
> After and only after [1] is picked,
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino=2Edelregno@col=
labora=2Ecom>
>=20
> [1]:=20
> https://patchwork=2Ekernel=2Eorg/project/linux-mediatek/patch/2023020713=
3504=2E21826-1-linux@fw-web=2Ede/

Hi Matthias,

Can you take this patch into your tree? binding is already merged

https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/linux=2Egit/t=
ree/Documentation/devicetree/bindings/net/wireless/mediatek,mt76=2Eyaml#n11=
4

regards Frank


