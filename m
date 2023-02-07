Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 900DAC636D6
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 12:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApmrVm6tRTWmcvPkqdY8eGT+huIWmyIFr1iTI4pqiVo=; b=Hp1SIuoTf72MptxwkkunbHqpFj
	Yxw7M9g10tyTrKdsFVPaQai1ttrjsrBA+ollwNIfULqf4u7aCuD0zA4RL9LoWXw6jjbm637kVXsLl
	vhKTlKFCpBmwdqXB1FSt3GaC4DEYZCDxesQt0vGYbfktWs6gZl1mCp4mXxgyVT9fBZP4jnlQXxYq0
	zyUgC4UicFCYWMMLayab2At1eXbwRHZuPwBYfzEmrjxsWTHotRk7y4JcxXpMLHfShszVhJqC2F52m
	re5vQ1FxlApsOO7Cc6r2hYPOjWdDpt+tGcvVZ25o0o65YwQXLIOHOI8s+mBZ7LwarwJ1BPiWdyrix
	fbd4WObA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPMqL-00C3PU-Ue; Tue, 07 Feb 2023 12:13:01 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPMqI-00C3OQ-HE
	for linux-mediatek@lists.infradead.org; Tue, 07 Feb 2023 12:13:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1675771928;
	bh=SZ69qIin1bOhcHFHX74qsjeogSVMDRGBQzd0Cfhbs2E=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aThNGe0oN9xWnJyHr7GmeaUAcFgS91VHwl3T4h6Bh5LX2gFUMzsOaliBZPtELWzWu
	 3JmiYNBBbPDGOzd4cWpTbu8JgX+2ayddP/XXDnBMSdtpA1yCGZUkPJ/DaMuMl4pYUi
	 jf4Cyb2kLI9QRiblEb++hArVvoFRE84yuHXO6ljvBpi/SBYOqfQpJ0Tg9GFoZW9S2c
	 NoVnWie2tTsuF3ZpmYlW75PN6K68svmpp22rqULWLrmcgZs8EFmZWA31u5HiRcDXOw
	 MFJli+T+9k6wXLONIsxHZJ/wuNc7MERLHVO/HZCZelDVKlwkJa6EyrrCPxcXtWBxPO
	 wnU6MF+Wj46nQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.159.155] ([217.61.159.155]) by web-mail.gmx.net
 (3c-app-gmx-bap02.server.lan [172.19.172.72]) (via HTTP); Tue, 7 Feb 2023
 13:12:08 +0100
MIME-Version: 1.0
Message-ID: <trinity-808b2619-4325-4d03-b2f5-1a7bc27d42ea-1675771928390@3c-app-gmx-bap02>
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>, Ryder
 Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub
 Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Aw: Re: [PATCH] dt-bindings: mt76: add active-low property to led
Content-Type: text/plain; charset=UTF-8
Date: Tue, 7 Feb 2023 13:12:08 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <fe3673d9-b921-c445-0f5f-a6bc824e8582@linaro.org>
References: <20230207102501.11418-1-linux@fw-web.de>
 <fe3673d9-b921-c445-0f5f-a6bc824e8582@linaro.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:+4vKtr2ePMdUPyHJjXQx8kjAst9kx6vKtoEZ0xKiTT993WQMGKiXQ7eai7/oGn6SLz9nI
 ExIu7cc+kU3n1HPesxF6zHZqoD5uSYv30WVUhVvbh4whPGhV1ClwgCBYqTPR72g31ap06OVSWIuS
 kUhgkM/shASAqUFcQMHCf1yopvlNodRCkHi1GjXiTfn2XD2HV+1w6HQ4fSmXYeRaajB/sv3vXklv
 3fRlFtg0JVx4PchdKiX+uLoeEA5pW9+LCRNBGAys0H0frB9UAALUBht9ZxjXFjmLLb45w8iazMo2
 S8=
UI-OutboundReport: notjunk:1;M01:P0:MvbBDhuOXcc=;48R3pzi9pbTRbbvz53aZgp+LQH9
 JOc/6fcqxIWF0aacjcgq8+IJ3jRjhxIhdwMJnFr5Y1pr5pUZdjZF0h9ti8ekdXI2fFBVTrkfW
 mn3s/vPiBScFlXx5NiahBjaoqTVuwJcnY1BZ/ICTCv14lpPkOcQrru29OFvaO5RQhWevVhgmc
 lCc1+g3erJ87M7oCsS4KeX6VImQhNVzzY4IEeexbbBgilKn+v6OZD8Bz6RSPa7Kxg/e950lZ5
 H3WFPHzE3hmhVK7DyBQfpHce3NoM5xoqn5N5sNb0uXeNGr1ZfARJli3idt2NTVrjvVS5Q9yem
 6QeHUf4hDD20a+WIfjkLP05zkztHPsF3twaH4Yvs8Qk5fT9FxGjdeaZWW7EhuEfIGBYDLRK0A
 2S8f3L3NwhLd1pdPANh1VdF6+8YdYos+mxk2kQdx5e52JuhsqJkF9oOrPLRp6K//z3e6OpSuk
 a1Ah/srrTOOfg+NWTZDAddu+8nJqP0FN955ZdGB44eg8Mdx7fKPsATkb0hFpxfb0GP+VPsU1R
 eQVLd9LB1hIn7ApvSNTcekZuiYBosX6krL7xejrcr7jLH9ZbNYwDeoFSyZ3ifPRCFT2QVQyKo
 vX2OhyE7j3sm1eYajY4dvPexarxpENtj8vWh/8kK6xtlu/2L5CULkazncboYqY9A5txcoepYf
 pRuN5Bro41Gc6vRSjePZb4+ItkcreGKv3FY0RzCtD8hBvFAUGExarBMZDPcMtGAGch4AXSGxN
 IJrmehVPbNbg42Jcu/na4jMWveY8HHJpr9s3018sdPYkBfxmP69+A58CmpVlptFrvBqhkl3ZU
 EshiDhaI48OoE50v+9COOxsg==
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_041258_978267_FDF70DF6 
X-CRM114-Status: GOOD (  20.52  )
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

> Gesendet: Dienstag, 07. Februar 2023 um 11:40 Uhr
> Von: "Krzysztof Kozlowski" <krzysztof.kozlowski@linaro.org>
> On 07/02/2023 11:25, Frank Wunderlich wrote:
> > From: Frank Wunderlich <frank-w@public-files.de>
> >
> > LEDs can be in low-active mode, so add dt property for it.
> >
> > Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> > ---
> >  .../devicetree/bindings/net/wireless/mediatek,mt76.yaml      | 5 ++++=
+
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,m=
t76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.ya=
ml
> > index f0c78f994491..212508672979 100644
> > --- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yam=
l
> > +++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yam=
l
> > @@ -112,6 +112,11 @@ properties:
> >      $ref: /schemas/leds/common.yaml#
> >      additionalProperties: false
> >      properties:
> > +      led-active-low:
> > +        description:
> > +          LED is enabled with ground signal.
>
> What does it mean? You set voltage of regulator to 0? Or you set GPIO as
> 0? If the latter, it's not the property of LED...

basicly it is a gpio-led mapped into the mt76 driver, but not passing gpio=
 itself in this property (like gpio-led does).
This gpio is set to 0 signal (gnd) to let the led go on ;) so imho it is a=
 led-property, but below the wifi-node as
the trigger comes from mt76 hardware, not an external (soc) gpio controlle=
r.

mt76 driver supports it already like i post change here:

https://patchwork.kernel.org/project/linux-mediatek/patch/20230205174833.1=
07050-1-linux@fw-web.de/

only needed the binding for it.

> Best regards,
> Krzysztof
>
>

