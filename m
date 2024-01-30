Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0A0DC47DA9
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jan 2024 03:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vFwOvzgohKdirNbIQVbbIr9nG1jrmQvUigB0XE0d7lE=; b=gM3OO73SteATQ91SC6oOe6YaU3
	tjOp4HGqCdE+TCwVQtTYL2P/OH3xXZpZD+azvR7jpYous1NdFDhRPV2ar5I90o2S1pQHK6eAXaeec
	zpjymOo7xvz5tGxlVfZA+GuSxR9RIaX6fnX5ZlfMIJxjXoxzF4PJpeY4emQgHV9tnh9D9I8ELVnzp
	hyW8nGkl15D2x+rTk3O3ac3zZ/26wx34M5y/sfyO90ptTV2UVeYrOlD7/duHJfDf4Mk/iHdcLAC4v
	yMY8ubRABgrzRJ8DY+y0uKYNx9ue+lrPf2+8/OW2fll+G4RXA6NvZtFix9NzJi9F3TgkFIlOskGpn
	ZkfBVDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUehT-0000000F6nF-1SEj;
	Tue, 30 Jan 2024 03:22:15 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUehQ-0000000F6lS-0UHN
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Jan 2024 03:22:13 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-510221ab3ebso4717159e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jan 2024 19:22:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706584929; x=1707189729; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vFwOvzgohKdirNbIQVbbIr9nG1jrmQvUigB0XE0d7lE=;
        b=bWtZP9/h1rQy0e5gOhxHM5VOtx0U+A4XhHElH646r0cGvAq57St2n3VRZP+wo5xBGT
         VNPSyf3pIyZg4VpR/c3VT24SA2t6MyWZA3IdVLwzb6XLHAYoJF1j+dK6Fk1Qz+B/6+Ih
         hy1coRZcXjrIeeEKBz4JkusncvjNpeeV3U808=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706584929; x=1707189729;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vFwOvzgohKdirNbIQVbbIr9nG1jrmQvUigB0XE0d7lE=;
        b=YmfJBQi+jlYFJYFf5ynMJFdxQdlez1JDwS9rqz9KzWHt5srw5bQl2YCjXgFFxufpC0
         vXn+25R+jkT84OgiDiB+ySURIaBWpO8B8itPMH2pOl62DIhmp3fvMAL5VyLs5lUdfr7o
         qYe2bG4yT8xOVJD5N8cHWsu6DCNoz3zZJTDA4WSJkcq0qqd4Ao3/zSrda+/hoSXcnP7J
         lUNaU/PjRGaDa57tRQDGJqSd/vnOVcNDrD3fmplRDrHgpK4Z/+wvXRjC0tLllCAtnXb1
         5n8OQGBloirrZzfKBui2C/80XBJPbc+l078uh1ah8y/5vquzaMhgm04Vo8LrfuZkW9pG
         a6JA==
X-Gm-Message-State: AOJu0YxBN9ecQ58q07sNkJQ7DRaCrTtx3ILo1PlC2B3sP385LOjobCqA
	aEk85MdbRigtFeugRDc1ourKpG+gw0F6EdlKd/EefMKItCpGd3q6cKwz/y8bD4N1OXBbO4ex8sz
	iQQy0Z4NfvBdEDRa011IJuMxhMDLhAI0bCQ87
X-Google-Smtp-Source: AGHT+IEL+eB3YpLwGh9C//tICADm74yD1KdefrBuKQSDktUlLhN43MqFdTiiqm0CjqgVnyYHjaOuXC+S0wL0bQ0K82Y=
X-Received: by 2002:a05:6512:3054:b0:511:150f:6363 with SMTP id
 b20-20020a056512305400b00511150f6363mr2506060lfb.32.1706584929429; Mon, 29
 Jan 2024 19:22:09 -0800 (PST)
MIME-Version: 1.0
References: <20240126063500.2684087-1-wenst@chromium.org> <20240126063500.2684087-3-wenst@chromium.org>
 <2c37a716-e4bb-4db3-a95f-a40e05b28cad@molgen.mpg.de>
In-Reply-To: <2c37a716-e4bb-4db3-a95f-a40e05b28cad@molgen.mpg.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 30 Jan 2024 11:21:58 +0800
Message-ID: <CAGXv+5H_Rmy1-38xhG48RWW8B9a4K3P0UO=ThUFYjc8T6WT2OA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: mt8183-pico6: Fix bluetooth node
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Marcel Holtmann <marcel@holtmann.org>, Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Sean Wang <sean.wang@mediatek.com>, linux-bluetooth@vger.kernel.org, 
	netdev@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_192212_211761_7BF7963C 
X-CRM114-Status: GOOD (  25.58  )
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

On Tue, Jan 30, 2024 at 12:31=E2=80=AFAM Paul Menzel <pmenzel@molgen.mpg.de=
> wrote:
>
> Dear Chen-Yu,
>
>
> Thank you for your patch.
>
> Am 26.01.24 um 07:34 schrieb Chen-Yu Tsai:
> > Bluetooth is not a random device connected to the MMC/SD controller. It
> > is function 2 of the SDIO device.
> >
> > Fix the address of the bluetooth node. Also fix the node name and drop
> > the label.
>
> Excuse my ignorance: Is this a cosmetic fix or does it fix the device
> somehow?

It's a cosmetic change, since the driver already searches the whole device
tree for the specific compatible string. However it also fixes the device
tree description to match the actual hardware.

> > Fixes: 055ef10ccdd4 ("arm64: dts: mt8183: Add jacuzzi pico/pico6 board"=
)
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > ---
> > Changes since v1:
> > - Collected reviewed-by
> >
> >   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dt=
s b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
> > index a2e74b829320..6a7ae616512d 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
> > +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts
> > @@ -82,7 +82,8 @@ pins-clk {
> >   };
> >
> >   &mmc1 {
> > -     bt_reset: bt-reset {
> > +     bluetooth@2 {
> > +             reg =3D <2>;
>
> To avoid confusion, would it be possible to use sdio as a =E2=80=9Cname=
=E2=80=9D.

Not sure where the confusion is. Bluetooth is the functionality this
SDIO function provides.

ChenYu

>
> >               compatible =3D "mediatek,mt7921s-bluetooth";
> >               pinctrl-names =3D "default";
> >               pinctrl-0 =3D <&bt_pins_reset>;
>
>
> Kind regards,
>
> Paul

