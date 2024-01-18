Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B747C47422
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Jan 2024 22:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rBbx+Wt6S1feccAtybOjt8GIthdRGefgaPTWcRnjuIQ=; b=gTyURDQWy0p9tvYj5ctkGcYvqG
	5Mews8svBW5KJny0KYhrC6gjjsP1d9Phq5bMIBpSD3+bEqT7DC92NjCIQPIVxOvWBFpZeCLQqV/je
	tkZQKQTK3j9RWvp2SuYhOEKSR10gMkMZMzFQ6a+HGDvYHHhfI1PU9s09uSdjBhQYrjCQjiCagtk1C
	Vxa9p+D9MElk5zzfT1MXt06j8NYyS0XAe4jeH7UFc1fUEP+398cbJUGrH1rXtETxXSBPclitObXri
	lwcKG9GuuFhsb48MGGQNe4HLhNwbjxheGCcSyiby6P7EkxaJzWMxqZGKnQ4aee2oWc35pDKkmEnkl
	IryOLptw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQaQr-003xW7-0M;
	Thu, 18 Jan 2024 22:00:17 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQaQo-003xUy-0x;
	Thu, 18 Jan 2024 22:00:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1705615201; x=1706220001; i=frank-w@public-files.de;
	bh=wLvsv08eBZtYU7ZaISCpiqBuWqPFTTvXPV3fWg3VUvE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=SNygzZwl8NfRCJswcMPa1qVnqtVMkWjHZFA8tBNg4DXhCdz2eroL9vQ3dbkRQ/Ni
	 aj7x406MCWWHhVcekTs/Ba8hCs6VsigS3bFLa1UwnMyk9lZb7ZHDs6OflttwxQZJ1
	 nvMcMdnSzcOJUDp64TZx7g1ThNYgkiRnReat+IQ/bbSTQiwLese2F6/Yy4n6AfZqu
	 gmhRIf+u9XOcljJqD2OF1TUDfuqTQTlfbriHhNvPkS7AOI+kzGMjt/mwM4/X2Rfu6
	 c1yQPaB5n2/OnV+dJphPqXqt3kLdC6X8XD+PmvnlPO3LY2ljEiGTyAe+HAgqvQqHx
	 Ir5lZe60hBiIPyD3DQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.159.198] ([217.61.159.198]) by web-mail.gmx.net
 (3c-app-gmx-bap21.server.lan [172.19.172.91]) (via HTTP); Thu, 18 Jan 2024
 23:00:00 +0100
MIME-Version: 1.0
Message-ID: <trinity-afc4f48e-65e1-46ee-a78b-1d670cc0f310-1705615200900@3c-app-gmx-bap21>
From: Frank Wunderlich <frank-w@public-files.de>
To: Conor Dooley <conor@kernel.org>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Sam Shih <sam.shih@mediatek.com>, Daniel Golle <daniel@makrotopia.org>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Aw: Re: [PATCH v3 1/2] dt-bindings: reset: mediatek: add MT7988
 reset IDs
Content-Type: text/plain; charset=UTF-8
Date: Thu, 18 Jan 2024 23:00:00 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <20240118-calcium-krypton-3c787b8d1912@spud>
References: <20240117184111.62371-1-linux@fw-web.de>
 <20240117184111.62371-2-linux@fw-web.de>
 <20240118-calcium-krypton-3c787b8d1912@spud>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:i7cKlr7pbBOeeo2MJju4eygi1kMNVyLIp+PFrgFTenIkemr6mJ/6zZ1a/Lg1H9bvFTdMp
 TI7kGYsJ+UQM26RzgcW7nABwCLt3D1kj+LOIj9a0Cq6nZrtefigXaCJBaeV3x/mcPy6KsMB7kXU9
 dM0jDKxM9ibIjtGnclsOb0Mqoog2SEyR9Cko1fqakeMUdslD4rpxVB2ypJfppjPFxuXFdFYGPzQP
 6O3N8pLs7UnnLzru6iS1jFdOxB0t/+rjiqYhxiD96PppyYlpd6CUzg/T4yYBP9pq3BNDAGSOm9e5
 ik=
UI-OutboundReport: notjunk:1;M01:P0:Gzu+rTj6VvA=;AFUqbzs2KLld0OIuq1bzMhSKPgl
 Kd7wJWth+9/ff1+bN2OyVvlJR0rjHQ7GcdSOu5Gg2jgh331Cni4J64RQFLkLC/EaHwzxmS2Uz
 XL44FMFv8vE4oCmSOzKtD24Nr1ISiK9JraRdcY5PZPfIDv122vBbvsk3DHmEjbM+q9fjkMb+q
 YmREoZ5tY3k9jH3P9QMpN3UYxARaUzCezNsWzSsRDitvRXFPI9fyn9SYTqT9tRfC1Uh9cnCyW
 m6plg3l/HV2u/4ItKFKwD/yX8o6kNWsy6th/2u0qO4+EDzy7hMz96zo4kkzFTzjzPdATfYYG/
 CcQ65Cxeo/Q3IDz/NmtvkpGq7/d+hIR3pNHpweLsy50DWTic+PHXlQ+wc4c3JxdIY/+eJgar9
 9dSDWS6xBkRSUzCX26dPWzEowUPPaKtAPl0kkQY9BLoXZmlM1LuzV3oHW0TpGiPXsVR6bPWw+
 nhxlc2CGClYR2an6957v3MOMdYtqbNnanhl79XeoEMFIqgqHYiDPrO834OqDPg4AM6b6qIVF1
 WR7gsIYRWrdXsS+lhb/FHdIOt+wwG8hBHQ6ihMBrnrUSgm8xTWHEJM+v6a4U3ZQYLeQPEUJn7
 omzxu8D1RDFlLgxRO9viMu0N/xh0Qr9W2niMCedv4y4VEjFJMhxK+ygXRKjwzastXE3TYNJea
 WlA+RXaGs7BDFDEXjBV1DJDzATdgGqXq8AnOW9CtWyrrirW9TJpTV0IRbj6No/L8d5pqf01oj
 E8+0bhGoBMcdz8f6cL6gqxMCoGGAH1tVzG9IlVljibVUcGPRy8IhPXyxK5yFok+EerEmSq2tL
 b5i84Et/qC1kETeXvhxKK7ew==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_140014_723624_6813873B 
X-CRM114-Status: GOOD (  19.23  )
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

> Gesendet: Donnerstag, 18. Januar 2024 um 17:49 Uhr
> Von: "Conor Dooley" <conor@kernel.org>
> On Wed, Jan 17, 2024 at 07:41:10PM +0100, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > Add reset constants for using as index in driver and dts.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> > v3:
> > - add pcie reset id as suggested by angelo
> >
> > v2:
> >  - add missing commit message and SoB
> >  - change value of infrareset to 0
> > ---
> >  include/dt-bindings/reset/mediatek,mt7988-resets.h | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/incl=
ude/dt-bindings/reset/mediatek,mt7988-resets.h
> > index 493301971367..0eb152889a89 100644
> > --- a/include/dt-bindings/reset/mediatek,mt7988-resets.h
> > +++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
> > @@ -10,4 +10,10 @@
> >  /* ETHWARP resets */
> >  #define MT7988_ETHWARP_RST_SWITCH		0
> >
> > +/* INFRA resets */
> > +#define MT7988_INFRA_RST0_PEXTP_MAC_SWRST	0
> > +#define MT7988_INFRA_RST1_THERM_CTRL_SWRST	1
>
> These are just "random" numbers, why not continue the numbering from the
> ETHWARP?

i can do...basicly these consts are used in DTS and driver only as index.

@angelo what do you think? I though also in leaving some space to allow gr=
ouping RST0 and RST1
when more consts are added, else the numbers are mixed up.

so e.g. let RST0 start at 20 and RST1 at 40 (or even higher, because RST0 =
and RST1 can have up to 32 resets).
That will allow adding more reset constants between my values and having r=
aising numbers.

regards Frank

