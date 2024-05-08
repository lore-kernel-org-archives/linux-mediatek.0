Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20342C25B4F
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 May 2024 18:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8wpwOVnWMbAEATDi6P7jxqoYe5/Zc9mCOeyjYqVImqI=; b=QToDHXqXU/FVYaD0xnGUsRi/AG
	JdFXEVX+M+6SVa3LARUCaOvdnnlRd+rQev06yYl+KzNWTevdFNZgCoQiOte+IkX1C0/Ky4+1XX5dn
	QYXKJrC0T7ykb849C7h9MKsLTBj3oREXOTHFi2FyLeMDZ1L6TLiELKueL+c1loNH5HQVGyNZplITR
	5m0d4vc0/HKFuU/136tBcTTff8FmfoqXi5pHvFO3Gbls5mluN29iDKKhBlMVzicgbs1xaFj9rQ078
	JNQE8TN8phRA+elpppu2Ij6GCgIFkWoCmaiVemxmRXbYQEDnpZPlDYkIq7rOPqKa9UcLFqwycGIN9
	4USHpOEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4lzP-0000000GWZV-07QX;
	Wed, 08 May 2024 18:26:03 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4lzH-0000000GWW2-0np9;
	Wed, 08 May 2024 18:26:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1715192732; x=1715797532; i=frank-w@public-files.de;
	bh=8wpwOVnWMbAEATDi6P7jxqoYe5/Zc9mCOeyjYqVImqI=;
	h=X-UI-Sender-Class:MIME-Version:Message-ID:From:To:Cc:Subject:
	 Content-Type:Date:In-Reply-To:References:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=YWqiOAZWPMaeNYhFjc7Dl91wHa3AoK/8ndnZhRXkks2a7xnBfaEL9mEFdBx2ZHvj
	 JF/BZvyGwnIQMqn/egivRa0xiSszgIhV9GVlTtXZlayE/ynpiAiEMqmiCktvL0IuP
	 QsWt5iYLDWIJ6OfXkJBkBLTYIHiiW9txd4oHJC8tdiqalLyJEmVcZxLBEs3PbiorY
	 nesZV3RKHBG0l3sYb/XQ0sB0BqqPsELRfKJ1giH+40euQ6PB2ABrGD6wEYxhNfod4
	 qX4oQj6baDxpCoH5L2Ak5WdLKfvuqWmsTcW+uIO4i14Yef4QcPssu08ibZaLuec7O
	 3va0pl4li7gEnTjbJw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.153.232] ([217.61.153.232]) by web-mail.gmx.net
 (3c-app-gmx-bs02.server.lan [172.19.170.51]) (via HTTP); Wed, 8 May 2024
 20:25:32 +0200
MIME-Version: 1.0
Message-ID: <trinity-2158d675-7049-4432-b925-6ace44401aa0-1715192732273@3c-app-gmx-bs02>
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones
 <lee@kernel.org>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>, Eric
 Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tianling Shen <cnsztl@gmail.com>
Subject: Aw: Re: [RFC v1 5/5] arm64: dts: mediatek: Add mt7986 based
 Bananapi R3 Mini
Content-Type: text/plain; charset=UTF-8
Date: Wed, 8 May 2024 20:25:32 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <a18a10e5-42e1-4302-b9f3-43c6174e2cf9@collabora.com>
References: <20240505164549.65644-1-linux@fw-web.de>
 <20240505164549.65644-6-linux@fw-web.de>
 <a4099612-a4ae-4211-9674-c7053d2a995a@collabora.com>
 <3E013BA7-0264-4AC3-B677-BDD16B1F8D90@public-files.de>
 <a18a10e5-42e1-4302-b9f3-43c6174e2cf9@collabora.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:/xOfloKHQgJmPgkc9fdvkCETd9KNf9I5dIewtuJxvNKD4cUM1xpAut+kcghfLa+0aHrjb
 kbd8cMSSRy0luf9H6RS1ic2JJEi1PO8E7Dr5edqyFkNa20wM8C45JFfO8Y8qo7SIUkz8f9AIEKmO
 ixvdAAYadRvtf7kdI4G8IwXZhdrkvHMskTAkpJgRhNYwipdg1o7tMuOU+Xmo1HllZVjaMrCIm0MV
 UYIX+aSs2gQhZBVYmubf2wb4EoTzURk6Y+M/otxM51V11Oq2shRoJIrGIqB4CyocCLik6bUloCIO
 j4=
UI-OutboundReport: notjunk:1;M01:P0:mmBOuEib9cM=;Tw4zuQm8GkQB3y9mHlDqvBj6pZx
 21YW6gdUBoTUn9pWWZZ1pRw91UVMm77D/oLRkUpmSeRXRE8322PK8anAOxv7S4R0zBYi4RSWJ
 fTFXpWp6shuJz9gxq9KuTxjCq5MSks9pt8g+UeSgRtdlgDRYDgmxdJbLfNZ3MNq6NCUkTZPxU
 zWF+dxgjiQDwk0n977Bmgnop0lI0rUC1KrAU2niFS+beo+Z7cESKsgqz4u195ShcMrmfdTtgW
 H47rdF6L3yhNBhvvWMwF0iQ5Kv+3WJixLJJV9i0kZRsaxhoq5QTJf+rwqEpuM7C2qChkLb07i
 twW0intWb6XaWKjiLvnUr7aehXKtFOguXka7AfoRauEc9RAdz5IJWbRqVjlvA8ZuK2jcPXroc
 H6fhT2rNPIneL91LAPJyEpAHVMiQ3esC2lLsAP4fngyBfDN8We+c8zWtJHUdBOncI3uPBhVzU
 aEupQ5h91DCJkhT+tm8F6XMqTQSWDtV////+OFAjJQTDCd+Xt2EVG5XvNoQoy4Ds7g8IukGuh
 YvdEuPLFbIDxt6wJkKM14BzC7gdjgO+H62Ggm72xx2owuTBllQ66/PXE2LcSp3jA1fNfq7Y47
 MxBmNg3Si9CZarNcAZYG5/+C9Ut8JsgxVLBmp7DABj9qwS9qfgITzQ3Z0Iq1PuoZkRYrY+Zql
 kNwtgPDDiy3/VKQCAQnEDqokNILxAzhb91Hykr2LfJFnKvXccMW8NBKKH8DHUqs=
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_112555_729662_33BC2160 
X-CRM114-Status: GOOD (  20.94  )
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

> Gesendet: Dienstag, 07. Mai 2024 um 15:35 Uhr
> Von: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.c=
om>
>
> Il 06/05/24 18:00, Frank Wunderlich ha scritto:

> >>> +	fan: pwm-fan {
> >>> +		compatible =3D "pwm-fan";
> >>> +		#cooling-cells =3D <2>;
> >>> +		/* cooling level (0, 1, 2) - pwm inverted */
> >>> +		cooling-levels =3D <255 96 0>;
> >>
> >> Did you try to actually invert the PWM?
> >>
> >> Look for PWM_POLARITY_INVERTED ;-)
> >
> > Mtk pwm driver does not support it
> >
> > https://elixir.bootlin.com/linux/latest/source/drivers/pwm/pwm-mediate=
k.c#L211
> >
>
> You're right, sorry - I confused the general purpose PWM controller with=
 the
> rather specific DISP_PWM controller (which does support polarity inversi=
on).
>
> It's good - but I'd appreciate if you can please add a comment stating t=
hat
> the PWM values are inverted in SW because the controller does *not* supp=
ort
> polarity inversion... so that next time someone looks at this will immed=
iately
> understand what's going on and why :-)

so i would change comment like this:

		/* cooling level (0, 1, 2)
		 * signal is inverted on board
		 * mtk pwm driver does not support
		 * PWM_POLARITY_INVERTED */

> >>> +		pwms =3D <&pwm 0 10000>;
> >>> +		status =3D "okay";
> >>> +	};
> >>> +
> >>> +	phy14: ethernet-phy@14 {
...
> >>> +		interrupts-extended =3D <&pio 48 IRQ_TYPE_EDGE_FALLING>;
> >>> +		reset-gpios =3D <&pio 49 GPIO_ACTIVE_LOW>;
> >>> +		reset-assert-us =3D <10000>;
> >>> +		reset-deassert-us =3D <20000>;
> >>> +		phy-mode =3D "2500base-x";
> >>> +		full-duplex;
> >>> +		pause;
> >>> +		airoha,pnswap-rx;
> >>> +
> >>> +		leds {
> >>> +			#address-cells =3D <1>;
> >>> +			#size-cells =3D <0>;
> >>> +
> >>> +			led@0 { /* en8811_a_gpio5 */
> >>> +				reg =3D <0>;
> >>> +				color =3D <LED_COLOR_ID_YELLOW>;
> >>> +				function =3D LED_FUNCTION_LAN;
> >>> +				function-enumerator =3D <1>;
> >>
> >> Why aren't you simply using a label?
> >
> > You mean the comment? I can add it of course like for regulators.
> >
>
> I mean in place of the function-enumerator... that's practically used to
> distinguish between instances, it's not too common to see it, and usuall=
y
> "label" replaces exactly that - just that, instead of a different number=
,
> it gets a different name with no (usually) meaningless numbers :-)

as far as i understand using label also makes "function" property useless,=
 after discussing
this with eric i would drop both on all 4 places by labels like these:

label =3D "yellow-lan";
label =3D "green-lan";
...

not sure if we should drop color property too...

> >>> +				default-state =3D "keep";
> >>> +				linux,default-trigger =3D "netdev";
> >>> +			};
> >>> +			led@1 { /* en8811_a_gpio4 */
> >>> +				reg =3D <1>;
> >>> +				color =3D <LED_COLOR_ID_GREEN>;
> >>> +				function =3D LED_FUNCTION_LAN;
> >>> +				function-enumerator =3D <2>;
> >>> +				default-state =3D "keep";
> >>> +				linux,default-trigger =3D "netdev";
> >>> +			};
> >>> +		};
> >>> +	};
> >>> +
> >>> +	phy15: ethernet-phy@15 {
> >>> +		reg =3D <15>;
> >>
> >> Same here.
> >>
> >> Cheers,
> >> Angelo

regards Frank

