Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFFEAC79FA0
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jan 2026 07:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fqzY4iNsINolRoiuSHq4WTtx5oWDWFvmNdTLgX48a8Q=; b=HzHfIfEs7az+fqsosHuXUXE45s
	UdRGZLtHDiaa2Hg3H8QHw7EiD6K9z8+nw+xcDnV+nDyQU/kZJkq4j1cEmTQ/0L4TDAoTOsvrSSUji
	4fDTlSOfW+UFEBFSylRw3FxmPDS3+szPb/1K4OcrlT2Oji1eMGsgFqq0ZBgpPtyAdXyBkgwIUvKmQ
	UInMs4bFsynb9UT8pMh1qsnVQt41+5PSLJN2d85scSYRRQ0JaLfO6h4xlYs3wsnDn4Q+e1Tbz3QhN
	vpSiIBHTMPOZUyy1XaiJr60n5rKJTMj0huQeJjwGs4dR9trwIfXgm4SbIwJ3GAjOgzqpy0uW1fPZZ
	P6qs1udg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1Yv-0000000CWGQ-1Jt5;
	Tue, 06 Jan 2026 07:33:05 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd1Ys-0000000CWFH-0ZiC
	for linux-mediatek@lists.infradead.org;
	Tue, 06 Jan 2026 07:33:03 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-59583505988so1064044e87.1
        for <linux-mediatek@lists.infradead.org>; Mon, 05 Jan 2026 23:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767684779; x=1768289579; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fqzY4iNsINolRoiuSHq4WTtx5oWDWFvmNdTLgX48a8Q=;
        b=H8wJxEVkNPGICTw062yV83Un/vUWEn1iGfWO8UL106Icir5NRsPDrrbeJz0mONdUIL
         8HJkTE2vBUKlfKvBq0XgoeBquXm75Anq0jPSqZC98USe4+6RoB8HLTi0DWgu78sC8NU6
         U4gfj0urGIC9dHlvn43X5SF6joJgcra9rT3YM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767684779; x=1768289579;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fqzY4iNsINolRoiuSHq4WTtx5oWDWFvmNdTLgX48a8Q=;
        b=X+NOl4PwOhPRi7+Ly1mChNMyBWCs7vefG4Bygv26Hi/1ZeY4h9m8X0orFEJNoBwAdP
         odsNqJgUGltsz+ijQLElm+0xSyPwW2rMu+Kp75J5OyIaAaD2ykJ1zgoPv17WnPSu/l3M
         TIuVlY3kloWVYMVdRbpyOamseWKjitzBBhsfhJtoLP4krLUjtfUmZTzz/rQ/Wutc2Vkn
         dpylK16njs6Ni7ja+D7kUeXmvpOvdhxLxfNPRBJDidSgNyoG/yVqET2M9tF4BSK9G144
         GB9VQTcORrNl5oNO0Lf8H+zH9CAha9wRByywdYUjruTaXy+L3Q6/xHOF50vSqDzZq7yg
         9PHw==
X-Forwarded-Encrypted: i=1; AJvYcCUl1CgVAZYyBweaMl9UUzFjgQ9Kko3D3My6VfNBuJTA9JubO50lFXNVsTI7ULTLrbjCsjM+tCzDXzGPT4f+pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzejQC/K7KNGeTmQPmdhpoCkmSzQkIOB2BHdy0OSQLESgyrTVvT
	MUqrZqaziQdv9N5xcpCF0Xhl2NmHrurFZEjgfH1wKX0s2quhVrouSV5VcXqF/pfuMp6JFj8Dzv7
	Muh43WxZAUSTchn5Au144dVXpUnmc4JD6vLDOu7z+
X-Gm-Gg: AY/fxX7Ze93V6W4l8Q5JVVeVrq2JpNxma1sEP7lNR2yiwP6Wb2+zXw5mcSyJreQh9DT
	8epFfOShYHbcteybyGK1p3d2qz1Qhl5C1WGqJ+ZOY9tzkSpUVfuhaplytYGV3oPUN80eyQ7M3CQ
	MOgKbqai5nAYuiJXu3aSiW2gXmP0IfJRJOHVvnjTgWi8Xhs5gzXv1m+r3AmgMwi4dJGkOCLJqoc
	7TBhizN3Xy/c7pUx+hu5FnCx0/JjZXboRzQVyTHf3jB3mE5Cyf+Pblvj+fnWHYR3NydADZEVfcK
	Yq//r0+YN/xsUMAkV8MRM8PJ8A==
X-Google-Smtp-Source: AGHT+IEAoJiu1UH67YXklgc9uvuOf1qJleDiwyIXSrIHeshyOtNKWRsImtZQBp/VYi3lIcNm+2tmz26j0NyKZvubb0Y=
X-Received: by 2002:a05:6512:3e08:b0:59b:67cf:ac0c with SMTP id
 2adb3069b0e04-59b67cfac63mr326251e87.17.1767684779427; Mon, 05 Jan 2026
 23:32:59 -0800 (PST)
MIME-Version: 1.0
References: <20251206-mt8183-display-graph-v1-1-a30e54481f28@abscue.de>
In-Reply-To: <20251206-mt8183-display-graph-v1-1-a30e54481f28@abscue.de>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 6 Jan 2026 15:32:48 +0800
X-Gm-Features: AQt7F2oScs1nPo40H3ZrV8FDmqy_y-OidGavDVEUMs49HzaB-TFtZc3H2BO4VmE
Message-ID: <CAGXv+5EXA5GF6+-_+SnqU1=Rq3Cv4_Uq+xHD55TO2CBtYans_A@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8183: Add missing endpoint IDs to
 display graph
To: =?UTF-8?Q?Otto_Pfl=C3=BCger?= <otto.pflueger@abscue.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Evans Jahja <evansjahja13@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_233302_319592_AAD14438 
X-CRM114-Status: GOOD (  15.41  )
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

On Sun, Dec 7, 2025 at 1:54=E2=80=AFAM Otto Pfl=C3=BCger <otto.pflueger@abs=
cue.de> wrote:
>
> The endpoint IDs in the display graph are expected to match the
> associated display path number, i.e. all endpoints connected to
> mmsys_ep_main must have reg =3D <0> and all endpoints connected to
> mmsys_ep_ext must have reg =3D <1>.
>
> Add the missing ID to all endpoints in the display graph, based on
> mt8365.dtsi as an existing example that does this correctly.
>
> Fixes: e72d63fa0563 ("arm64: dts: mediatek: mt8183: Migrate to display co=
ntroller OF graph")
> Reported-by: Evans Jahja <evansjahja13@gmail.com>
> Closes: https://lore.kernel.org/linux-mediatek/CAAq5pW9o3itC0G16LnJO7KMAQ=
_XoqXUpB=3DcuJ_7e3-H11zKd5Q@mail.gmail.com/
> Signed-off-by: Otto Pfl=C3=BCger <otto.pflueger@abscue.de>

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Restores the display on my MT8183 Juniper device to normal.

> ---
>  arch/arm64/boot/dts/mediatek/mt8183.dtsi | 122 +++++++++++++++++++++++++=
------
>  1 file changed, 98 insertions(+), 24 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8183.dtsi
> index 4e20a8f2eb25803057955401a7737c7f029a1424..0c73043c67fd01147179e8f9b=
065684f67749ec2 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
> @@ -1754,15 +1754,21 @@ ports {
>                                 #size-cells =3D <0>;
>
>                                 port@0 {
> +                                       #address-cells =3D <1>;
> +                                       #size-cells =3D <0>;
>                                         reg =3D <0>;

"reg" (and "compatible") properties should come before all other ones,
as documented in the device tree coding style. This applies to all the
additions in this patch.


ChenYu

