Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1863C10F1A
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 May 2024 10:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoPWoPxoQZpguOdRekj+oRD5CmQ9pq1FvJuYO01mGTQ=; b=u8XGdzdGa54pCSaOlscmbgNNhn
	WQ8DU9YLeyojAETqB31dpD+qG5IeM8Ydx0nDGSOrBS7FN0QefAGh+ac/K2IJdbQFEC6KdcF8RhNLi
	61LwLTKJ8y1VOTND9lnn8WckzSbm+0xAMauM0NEh5WbEt8BBPac7s9h7v/7qA0a94lEnfU3gqPdZ/
	6cMoC38hs4J0FIfObgMkBUDljV0/WNqo5bsVy1JAm9+yV4MLg2NA4HQ9FqIsgyvGhaZLhVO4Nhp/T
	Q8/RjZjih/oypJRBDo6LnXEFqR1R8vVzbWWF/nKHCKyeF7sA0aKvHtRfxRDQoOKlkKTq6Oac1rQcJ
	C4T7+6TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s513M-000000017n8-1ZPm;
	Thu, 09 May 2024 10:31:08 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s513F-000000017lo-1nNK;
	Thu, 09 May 2024 10:31:06 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout2.routing.net (Postfix) with ESMTP id 0A7DA60437;
	Thu,  9 May 2024 10:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1715250653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UoPWoPxoQZpguOdRekj+oRD5CmQ9pq1FvJuYO01mGTQ=;
	b=bF1VDIHl+3ov8Fih1IRzr5Q0+eDUa2ekkDs7yHYqQKVhaVl9yr1LZ6KhyeKcXBgj5+Y3b+
	nB17Jn5cSYxJPg9JX/dSVFRpZiSrFARmRt0McwvwsBw/wBgGyAxi6OlXDsppqz/HD8Xhe9
	mGfFBV4HAz89Z1XiPyuOHfWfAw/kQcU=
Received: from [127.0.0.1] (fttx-pool-217.61.150.116.bambit.de [217.61.150.116])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id B6F7080319;
	Thu,  9 May 2024 10:30:51 +0000 (UTC)
Date: Thu, 09 May 2024 12:30:51 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <frank-w@public-files.de>
CC: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Eric Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Tianling Shen <cnsztl@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_Aw=3A_Re=3A_=5BRFC_v1_5/5=5D_arm64=3A_dts=3A_med?=
 =?US-ASCII?Q?iatek=3A_Add_mt7986_based_Bananapi_R3_Mini?=
User-Agent: K-9 Mail for Android
In-Reply-To: <a9980df7-7d65-4818-8dd3-b056ba5ac566@collabora.com>
References: <20240505164549.65644-1-linux@fw-web.de> <20240505164549.65644-6-linux@fw-web.de> <a4099612-a4ae-4211-9674-c7053d2a995a@collabora.com> <3E013BA7-0264-4AC3-B677-BDD16B1F8D90@public-files.de> <a18a10e5-42e1-4302-b9f3-43c6174e2cf9@collabora.com> <trinity-2158d675-7049-4432-b925-6ace44401aa0-1715192732273@3c-app-gmx-bs02> <a9980df7-7d65-4818-8dd3-b056ba5ac566@collabora.com>
Message-ID: <7859DAB9-107F-432D-AA3D-0F54AE0E30D5@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 3e72358f-e0af-4587-a1ce-e7f27fcbf48b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_033101_873195_88FEE0BA 
X-CRM114-Status: GOOD (  19.68  )
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

Am 9=2E Mai 2024 12:10:59 MESZ schrieb AngeloGioacchino Del Regno <angelogi=
oacchino=2Edelregno@collabora=2Ecom>:
>Il 08/05/24 20:25, Frank Wunderlich ha scritto:
>> Hi
>>=20
>>> Gesendet: Dienstag, 07=2E Mai 2024 um 15:35 Uhr
>>> Von: "AngeloGioacchino Del Regno" <angelogioacchino=2Edelregno@collabo=
ra=2Ecom>
>>>=20
>>> Il 06/05/24 18:00, Frank Wunderlich ha scritto:
>>=20
>>>>>> +	fan: pwm-fan {
>>>>>> +		compatible =3D "pwm-fan";
>>>>>> +		#cooling-cells =3D <2>;
>>>>>> +		/* cooling level (0, 1, 2) - pwm inverted */
>>>>>> +		cooling-levels =3D <255 96 0>;
>>>>>=20
>>>>> Did you try to actually invert the PWM?
>>>>>=20
>>>>> Look for PWM_POLARITY_INVERTED ;-)
>>>>=20
>>>> Mtk pwm driver does not support it
>>>>=20
>>>> https://elixir=2Ebootlin=2Ecom/linux/latest/source/drivers/pwm/pwm-me=
diatek=2Ec#L211
>>>>=20
>>>=20
>>> You're right, sorry - I confused the general purpose PWM controller wi=
th the
>>> rather specific DISP_PWM controller (which does support polarity inver=
sion)=2E
>>>=20
>>> It's good - but I'd appreciate if you can please add a comment stating=
 that
>>> the PWM values are inverted in SW because the controller does *not* su=
pport
>>> polarity inversion=2E=2E=2E so that next time someone looks at this wi=
ll immediately
>>> understand what's going on and why :-)
>>=20
>> so i would change comment like this:
>>=20
>> 		/* cooling level (0, 1, 2)
>> 		 * signal is inverted on board
>> 		 * mtk pwm driver does not support
>> 		 * PWM_POLARITY_INVERTED */
>>=20
>
>There you go:
>
>/*
> * The signal is inverted on this board and the general purpose
> * PWM HW IP in this SoC does not support polarity inversion=2E
> */
>/* Cooling level < 0  1  2> */
>cooling-levels =3D <255 96 0>;

Thanks for clearing structure of the comment,but imho actually it is a dri=
ver issue (for all mtk SoC)=2E Not sure it is really a hardware limitation=
=2E So i would change this to "=2E=2E=2E and the PWM driver does not suppor=
t polarity inversion=2E"

>>>>>> +		pwms =3D <&pwm 0 10000>;
>>>>>> +		status =3D "okay";
>>>>>> +	};
>>>>>> +
>>>>>> +	phy14: ethernet-phy@14 {
>> =2E=2E=2E
>>>>>> +		interrupts-extended =3D <&pio 48 IRQ_TYPE_EDGE_FALLING>;
>>>>>> +		reset-gpios =3D <&pio 49 GPIO_ACTIVE_LOW>;
>>>>>> +		reset-assert-us =3D <10000>;
>>>>>> +		reset-deassert-us =3D <20000>;
>>>>>> +		phy-mode =3D "2500base-x";
>>>>>> +		full-duplex;
>>>>>> +		pause;
>>>>>> +		airoha,pnswap-rx;
>>>>>> +
>>>>>> +		leds {
>>>>>> +			#address-cells =3D <1>;
>>>>>> +			#size-cells =3D <0>;
>>>>>> +
>>>>>> +			led@0 { /* en8811_a_gpio5 */
>>>>>> +				reg =3D <0>;
>>>>>> +				color =3D <LED_COLOR_ID_YELLOW>;
>>>>>> +				function =3D LED_FUNCTION_LAN;
>>>>>> +				function-enumerator =3D <1>;
>>>>>=20
>>>>> Why aren't you simply using a label?
>>>>=20
>>>> You mean the comment? I can add it of course like for regulators=2E
>>>>=20
>>>=20
>>> I mean in place of the function-enumerator=2E=2E=2E that's practically=
 used to
>>> distinguish between instances, it's not too common to see it, and usua=
lly
>>> "label" replaces exactly that - just that, instead of a different numb=
er,
>>> it gets a different name with no (usually) meaningless numbers :-)
>>=20
>> as far as i understand using label also makes "function" property usele=
ss, after discussing
>> this with eric i would drop both on all 4 places by labels like these:
>>=20
>> label =3D "yellow-lan";
>> label =3D "green-lan";
>> =2E=2E=2E
>>=20
>> not sure if we should drop color property too=2E=2E=2E
>>=20
>
>I'm looking at the leds binding (leds/common=2Eyaml) right now=2E
>
>My suggestion of using 'label' was actually wrong - and your devicetree w=
as
>actually right!!! (apart from the default-trigger that may not work)
>
>Infact, the documentation says, in brief:
>
>- function-enumerator is ignored if label is present
>- function doesn't say that gets ignored
>- color doesn't say that gets ignored
>- label says:
>  - If not present -> get string from node name
>  - function-enumerator ignored
>  - This property is deprecated
>
>=2E=2E=2Ebut the 'label' binding does not say 'deprecated: true', which i=
s something
>that must be fixed!

Ok,i can try to add the property to binding (independ of this series)=2E I=
mho label was cleaner than function and function-enumerator=2E=2E=2E

>So, I'm sorry for the confusion, the noise and the useless loss of time a=
round
>this - you can keep the LED nodes as they are, and that's a lesson for th=
e future
>me reviewing another node like this one=2E

Don't worry, we are all humas=2E=2E=2Ei missed looking in linux-next for t=
he other binding-patches=2E

>P=2ES=2E: This shouldn't have been a RFC, as the patches are more than RF=
C quality!!!

I sent it as RFC because i had not expected to be merged before next is cl=
osed=2E

>Cheers,
>Angelo
>
>>>>>> +				default-state =3D "keep";
>>>>>> +				linux,default-trigger =3D "netdev";
>>>>>> +			};
>>>>>> +			led@1 { /* en8811_a_gpio4 */
>>>>>> +				reg =3D <1>;
>>>>>> +				color =3D <LED_COLOR_ID_GREEN>;
>>>>>> +				function =3D LED_FUNCTION_LAN;
>>>>>> +				function-enumerator =3D <2>;
>>>>>> +				default-state =3D "keep";
>>>>>> +				linux,default-trigger =3D "netdev";
>>>>>> +			};
>>>>>> +		};
>>>>>> +	};
>>>>>> +
>>>>>> +	phy15: ethernet-phy@15 {
>>>>>> +		reg =3D <15>;


regards Frank

