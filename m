Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7A0C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Dec 2022 15:12:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Alhdrhad58FeMwUE6TiLxWpw8SRt5xRIDB5YqyjCcSk=; b=A1BgqOC0QRHqRqHHaiEuFeEc0v
	NQ77TztZpDqtsXgAztdxSVfjxX2yD7xGsFIaTXHEarwi+XRpurwWY1MBxRkfsQ8fchEKjOLUpDAtY
	N/wSgZf04KDuYCXytz+e1A5JULJmVVRp3g6s0xpGfEg3JRcIknIx71p1bD6zzumNj0CUwbviG8i0/
	DH4Z/TVp4jR88ZPcs+/XudigXHSLEk8cuLKPmjsoC6l6JBnVqvz1aAxoeMXXtJ7QaafuOoPa5XaEs
	L7iBQQq5Uvjye6ZC63sNh1hhq/gkKS8pZHIQnSZVDmtvA1jMHHAvzHSeGCGPXETYkoOCD6V8+O5Mj
	SjkPo+Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAua7-00Gtvb-W4; Thu, 29 Dec 2022 15:12:32 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAuZr-00GtiS-Ke; Thu, 29 Dec 2022 15:12:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1672326708;
	bh=xirCA9c8DIti9Fo5Dwsm15yj3OA0oAtHohoPlTTonIU=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KMIX/nUtp7UuPb7FDZVa9mTDMixLkMDCa6qKzW38+jA8ZFxpGHIgQY/QJdrtk9huW
	 VsDHEBfy7Sf/fs9KPFPVOS/CR+zxVPQJ/4JVjJkdqltlYFjrxPcUokFi+K9hWwKqbl
	 yd81EJbRyXOB906tzY9wRtAPjz21NrRKuEt8oQGo6N2SqjcmAgmKbZmYACF+1Wi3n8
	 GLfFU5dzmtuHBm2ElBs1qOh7RYg3aFMLZslkLE5V0LlX+vEBxQOxKWSEXWIAPNCR+M
	 iz2GWBb9rt1K9i3u0D92v/m6ZgjOXFTEhejJetqM22D05eIi0iP957ng4yIOxDAhc1
	 epSXJkggUUu9Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [80.245.77.213] ([80.245.77.213]) by web-mail.gmx.net
 (3c-app-gmx-bap35.server.lan [172.19.172.105]) (via HTTP); Thu, 29 Dec 2022
 16:11:48 +0100
MIME-Version: 1.0
Message-ID: <trinity-f4c66c53-204d-43c7-90f5-1ecf75e4bbad-1672326708689@3c-app-gmx-bap35>
From: Frank Wunderlich <frank-w@public-files.de>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Kishon Vijay Abraham I <kishon@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, Matthias
 Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, linux-arm-kernel@lists.infradead.org
Subject: Aw: Re: [PATCH v8 5/5] arm64: dts: mt7986: add Bananapi R3
Content-Type: text/plain; charset=UTF-8
Date: Thu, 29 Dec 2022 16:11:48 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <Y62s4+zMm1ECnMlH@makrotopia.org>
References: <20221229145023.55713-1-linux@fw-web.de>
 <20221229145023.55713-6-linux@fw-web.de> <Y62s4+zMm1ECnMlH@makrotopia.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:8Pqig6h4mKzYCwMQwatNyxCbSzbryuniyYILFjvgqWM0ZxKxqzsZwm+y6/oW/Z/QTsv+k
 ieQkbtQiHm64R+MJ7ItH1KnUsWKGNfXoQnJvCrVyOynrgtIYzTC5joEEKHKpx5pxGq2Bdsaf4H8K
 bKUOfsGpgdkFPcwsxxxl5oxL2w8F8fUQlCv0ylMNImDVthL12v4kwRczdHIC6RLnQbax82OSPKai
 eLW8B1ta/kRps7O4cAMMcLs74Bo2fPL3/t84/Htu5kn28KLvXgTGWo/Of1RlAojKYn/kRLIWp0Hx
 xE=
UI-OutboundReport: notjunk:1;M01:P0:RMr5q3HhiPQ=;bJNbwCfCkaGcHV5432yNa9sL2ER
 wiwQWMCCj8a1tzW+cZn91OlSqO3YTG7KjuriWaUChD9LbUvuRNXcR8tZI0YwMkQCyhmAwv2tN
 bMVIT0o1Qi4Hx6P2hJw66uFOFWTjb29SWJ8SxnRmK9bpc+u4y6IZdr+hZb5OLELXBfah4FPiv
 FsDbBT8sNG8TvaFpBY3QOiXUxptrPU8NBY/q7vJCMImSkBehhxu1zPm/DjCgix6FLwlKJUHit
 cMNaykC5mR2hytLBeteVgGqRoAA3cH/n/mdWIEqx0xdERB+GhILY5r+Pe51t8KXGgehFGYNlV
 gwd4MXChtmAPjEyH1Zu7Tt8dA3X00tJbR86cWQUs8oupY876TDFRIq6QzbWWLmzn7Q/1tsb/O
 T92AwuAXwVeNnd0BY+oHIdgAEI5e+2aXjzAGMUmCxb2fmGOlvIBY3f+0It6mM9ldZav0tvJoi
 YoHYRvZVXab05o8Me31Ugq+QP6r20ucXqYS6XhO1ZgsHFR1gtCpxP7V69kyCiRqZeO+93iT/+
 SgyX+q+Abg8l1dk/aa2J1i4DDQOtjwoK/6wPfkaRgK1YxZt4ZNB5WIIyx/Gj9AG6BrSTkxJk8
 yOZ7X0o4gwGxrrq1uL/bMoVuxbWk07zgxh6dPjw30bIc/jDwSTPdu6C/cKoEhtjMaRtwCqmvh
 b4LjCXUd3TL4m3n5FaPeTGvuOEHE3I4EhlQWNfMzVwcsueEesfr85Rw6skF/6Z+N+Bn2FxAxM
 DFEbfWzXJ8M30FDP+OCaJofJKqy5a4QDd8bj+Vgzi57z5QaZ10BjwwJf3nM4huKC7e30NqudZ
 oJ4o7HxDdKO14dX/1BkD4ruQ==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_071216_110308_ABF76BC5 
X-CRM114-Status: GOOD (  13.29  )
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

Hi

> Gesendet: Donnerstag, 29. Dezember 2022 um 16:06 Uhr
> Von: "Daniel Golle" <daniel@makrotopia.org>

> > diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.d=
tso b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dtso
> > new file mode 100644
> > index 000000000000..08af778d8adc
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sd.dtso
> > @@ -0,0 +1,24 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2021 MediaTek Inc.
> > + * Author: Sam.Shih <sam.shih@mediatek.com>
> > + */
> > +
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +/ {
> > +	compatible =3D "bananapi,bpi-r3", "mediatek,mt7986a";
> > +	model =3D "Bananapi BPI-R3 (sdmmc)";
>
> There is another model string here which shouldn't be.

sorry, missed this one, will drop it in next version

@all: anything else i need to change?

regards Frank

