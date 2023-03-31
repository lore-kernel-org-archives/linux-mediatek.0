Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57873C6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 12:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Erj+LpG9U9tgf75fYxXUx/4AP5Lrz3YtH2NJWnrUADc=; b=A/+WQbIMFLmuMjQSfFdD15LKLo
	HvQuMPVgYMo+6nDCfIHud3ZD2hCbtofKBCEnGF8IbBmbq1FhPt7phelJ7mrYXfVUkm+yRxNSFb0RN
	DOxIGSmHluK6KWHzo/f5AAiBNhiTgQOqbtSqdPh5RT9cij84+eUj9IYuhAl26PTYkMxdLHhbpOPan
	VGHiwcmF4GPjA/arzdZ3MjHARy6MimoTIwZ+PpAMyeh6D1nqt/ZT8hZGJmrs3kvnPcYYK1XJHnx9U
	+sPhgx61v3hCJ3wUDk230JTOsvcPXD1ARX6fXLYMmjmpH0GLFQHYpdMo4p1L05jTNDcTpcbzP7Ip4
	msaZd2Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piDn9-007G6w-2f;
	Fri, 31 Mar 2023 12:23:39 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piDn3-007G4J-3B
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Mar 2023 12:23:36 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-545e907790fso295633987b3.3
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Mar 2023 05:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680265413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Erj+LpG9U9tgf75fYxXUx/4AP5Lrz3YtH2NJWnrUADc=;
        b=6PPQNQ38F2taYSfQU9v2DEAamsnh/Lbnu/amvdM8KrjKWByBjQNFRumzgQ6bFTIVcg
         oqM5cD5GzvtXrq4QKgf0QR24wLthmKi0vHGjsw7wNe07GZf/AhV6wtCJUS2GRKa0Dkm9
         ogGQtK1Pk3rw0HafvOpbT74mY8725/u7lOPfbjAFImHmsYNBQ8RthlKUhiV6qC5Zt8VK
         azNKQnT7w+QKvkD1bLLpQvJ0w7Q28641njy0RIuooeWVVJvGVyRnUJxVXHIysYuHG4Yi
         PcFfn6mUu+gLGO67975HLvFAQRxLXxZefnMgkFzwdKxaeJZERKx0YzsJbzsVX2r/R/D2
         gbcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680265413;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Erj+LpG9U9tgf75fYxXUx/4AP5Lrz3YtH2NJWnrUADc=;
        b=jf8/BCTEJcX1joone5Oft1BgS1SW9DQggk5pbgMJ6WEJ83GpN2hiOLJJB7KMSNtb2V
         3IChTEkhyZ+UPVoEw1J5VZz5sNQ9gtIW2Dmedlo0YVvn1VSUeDc96mbMqe3doqkhkC9O
         R3077T+D+67Q1l4NtVmOBCcdFeyG1gjHUmiNo7QwwZf83SpGkzPUB4+F6gyiOGhEYESH
         SOOWgVzvGWgug5SmHotRlBYpwHBEkmvqhtih+9KOwCefUpyPy2tEETD9TTXDc4XArWBR
         q7Nu50bGlTysJKiToD4X079z2iGxHj4/AbXCz1A4xREN01G+dYp7UwrZT6pWKhkcucdr
         FThA==
X-Gm-Message-State: AAQBX9eerb1MuIxUIazW9fp7Zp5djJtJsS5mkqi1Cwhx12eusPaoypVs
	yefsqRbfvaZE7oBXM9xcTGjzTsy6dgj/LDeFRyWdBg==
X-Google-Smtp-Source: AKy350aL53ZPqA6HfapR1wIrwTkgdBrTNV+3+AGc+bH/1duJuWV8Tg9mBbJRl2WjZvPtf0iLrGSnfzJ9TL0IQ2zu33o=
X-Received: by 2002:a81:ad5d:0:b0:540:e744:13ae with SMTP id
 l29-20020a81ad5d000000b00540e74413aemr12502859ywk.3.1680265413041; Fri, 31
 Mar 2023 05:23:33 -0700 (PDT)
MIME-Version: 1.0
References: <20221122-mt8365-i2c-support-v6-0-e1009c8afd53@baylibre.com>
 <20221122-mt8365-i2c-support-v6-2-e1009c8afd53@baylibre.com>
 <945d8a82-80b3-8ae2-3b2a-7011621ad8d9@collabora.com> <c654905d-a8c8-fafb-b8c5-2992b7cac0d8@gmail.com>
In-Reply-To: <c654905d-a8c8-fafb-b8c5-2992b7cac0d8@gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 31 Mar 2023 14:23:21 +0200
Message-ID: <CAFGrd9oi9UAAXw_jUN=4wGN0GeMbSsOWa6ceBYSDxf0YikHFPQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] arm64: dts: mediatek: enable i2c0 for mt8365-evk board
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Qii Wang <qii.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-i2c@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Fabien Parent <fparent@baylibre.com>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_052334_990502_C860160C 
X-CRM114-Status: GOOD (  14.32  )
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

Thanks Angelo and Matthis for your time !

Alex

Le jeu. 30 mars 2023 =C3=A0 19:14, Matthias Brugger
<matthias.bgg@gmail.com> a =C3=A9crit :
>
>
>
> On 28/03/2023 12:04, AngeloGioacchino Del Regno wrote:
> > Il 28/03/23 11:04, Alexandre Mergnat ha scritto:
> >> Enable the I2C0 bus provides communication with:
> >> - The integrated RT9466 Switching Battery Charger.
> >> - The integrated MT6691 LP4X buck for VDDQ.
> >> - The integrated MT6691 LP4X buck for VDD2.
> >> - The pin header, to plug external I2C devices.
> >>
> >> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> >> ---
> >>   arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 15 +++++++++++++++
> >>   1 file changed, 15 insertions(+)
> >>
> >> diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> >> b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> >> index 4683704ea235..adc79ba14b33 100644
> >> --- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> >> +++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
> >> @@ -87,6 +87,13 @@ optee_reserved: optee@43200000 {
> >>       };
> >>   };
> >> +&i2c0 {
> >> +    clock-frequency =3D <100000>;
> >> +    pinctrl-0 =3D <&i2c0_pins>;
> >> +    pinctrl-names =3D "default";
> >> +    status =3D "okay";
> >> +};
> >> +
> >>   &pio {
> >>       gpio_keys: gpio-keys-pins {
> >>           pins {
> >> @@ -96,6 +103,14 @@ pins {
> >>           };
> >>       };
> >> +    i2c0_pins: i2c0-pins {
> >> +        pins {
> >> +            bias-pull-up;
> >
> > I prefer seeing pinmux first, any other properties last....
> > If Matthias can please fix that while applying...
> >
>
> Done and queued the whole series.
>
> Thanks!
> Matthias
>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> >
> >

