Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D041E7717D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Dec 2024 10:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C/OBIbUmmLhH6ku2Q4LAkA6a0Sfj3H64xsbU21U06po=; b=PH4DoStjdZbL99
	fR4Sfz8Da4mjHTQw8jqFtu9pNlXXIEoRXKuAwV8jQnnCI1eucQ875RwM2Ia8VE8flclVJP7MATibU
	uZeyAkXEU4DPjoYCecEKgN+9bgnEp5jtHgDll7KzWwIChoMj+J9Nm0aJQZ1F68hhW+W31DQgANAzO
	wUuQfZg2D8Vpqy8sH7bYfKXdcX5EOlta7jZguJe7tw0JGxIJz5C8VxBWSZGwpNAF7bUX7qp8CibBL
	P36wJ0LKuOSKHwJ/xOOvxZoM/nswApJjchnEyhGGKDoPukvSw5xM7bZKesX0s2/0wQvbUu/CNBXKl
	3ptwQThX/ZodPm2SaTKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2ue-00000003Q9Y-497p;
	Fri, 13 Dec 2024 10:28:48 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2tX-00000003PvT-1ELT
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Dec 2024 10:27:41 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3eb9bbcc936so782957b6e.0
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Dec 2024 02:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734085658; x=1734690458; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/OBIbUmmLhH6ku2Q4LAkA6a0Sfj3H64xsbU21U06po=;
        b=PmaR0jZjsrSbOw0zLITqAKkFTTA/G8MGa1bjrFyAApJyBWSmRQ4mzkh8TbA7OVVBoc
         Qwtp7cG9g+1QRY1tpi/NgfpdLrZnUa0a4EFsXXGUG3H+hMW1ldYRzsXje04wl300vBhS
         TSlF8GjL8U8CghGg2JSUG/SvIQKDNT/Z3ND84=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734085658; x=1734690458;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C/OBIbUmmLhH6ku2Q4LAkA6a0Sfj3H64xsbU21U06po=;
        b=GAyebgEszajZH18BIW3Hm6w+AvgNzFgod9Fhx3nl44GugkwX3UqQHfNUt0fWkIY8x2
         tYQX2LuwLJTayUPO/U5YHAKy3F8WY3bpAdRE43rPB2FKlR0ZmqJVMvwWA5DwIAl2siIn
         1uRRnKYMtXLUlGVXMZy5uVX+t1utAfsymuVudo1cYfSTGrhsGnsKQBBEIa4Qvvmw7WVy
         PPthsYn5PgxqAWFr5XPr3D5IzOLwiADkXxosIhz5EidewP7fL5vIKfAbUq58zuH5HRa0
         9X2MP/+4R/30huWBkEzCwBGAX+Fz5i96kx5fTzAH0UCWYmtKTdg91MaW1PxkF8MXCNdT
         YRtA==
X-Forwarded-Encrypted: i=1; AJvYcCUboq6dFCVoG2kv2UJAQqDeCyx68y88Ta0F4++zZ3s9fUCsBV1eTQSJI/Rnse+Qo+Vg0NXIzliRGxmCtFM8eA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQw6gAtUrECNSyx94p8uObxiaYklSWdi24IttY5s311+pcDt+p
	u4jw7xnfyr3WJ8q4L7mhKykDqz2p+dH1uEcQ6uQrbHEDKHl3x2wG5cw2rVGf12Bxt1w7QcnnvLq
	qKtzItXkYcD2GiI3tqCm5gVgB6R64Cba4Uzva
X-Gm-Gg: ASbGncvb9CksqMHSNDLlfm1Dej7le2S9SYRH8iRqZrlrB5T7MpnSysPl0Lv8w+ADEoW
	FgnH0Azup8qtvFx+VXb7YpNxyjwYm644XGvpmLwMTdUhiixc8lw/hyUfYqSsLZpK7
X-Google-Smtp-Source: AGHT+IESbjIDYq8Dv7WLZv3lnv+V/UUSCvVg2kJFhXxDh3T+YFv70IgQ6Vlt7dxY7YDS3GWUp1Xn0M9xXxcOalecsrs=
X-Received: by 2002:a05:6808:3447:b0:3ea:5be6:a68a with SMTP id
 5614622812f47-3eba68640b4mr591582b6e.15.1734085658025; Fri, 13 Dec 2024
 02:27:38 -0800 (PST)
MIME-Version: 1.0
References: <20241213095044.23757-1-jason-jh.lin@mediatek.com> <20241213095044.23757-4-jason-jh.lin@mediatek.com>
In-Reply-To: <20241213095044.23757-4-jason-jh.lin@mediatek.com>
From: Pin-yen Lin <treapking@chromium.org>
Date: Fri, 13 Dec 2024 18:27:27 +0800
Message-ID: <CAEXTbpfOv876s3NLTO3oMTtVi_BwBtgb-816Gt5ZjKMjTZZKQg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] dts: arm64: mediatek: mt8195: Remove MT8183
 compatible for OVL
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_022739_354116_C4579B17 
X-CRM114-Status: GOOD (  15.10  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Rob Herring <robh@kernel.org>, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jason,

On Fri, Dec 13, 2024 at 5:50=E2=80=AFPM Jason-JH.Lin <jason-jh.lin@mediatek=
.com> wrote:
>
> The OVL hardware capabilities have changed starting from MT8195,
> making the MT8183 compatible no longer applicable.
> Therefore, it is necessary to remove the MT8183 compatible for OVL.

Similar to patch 2/3, we need a:

Fixes: b852ee68fd72 ("arm64: dts: mt8195: Add display node for vdosys0")

>
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8195.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8195.dtsi
> index ade685ed2190..137ee8929e01 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
> @@ -3138,7 +3138,7 @@ larb20: larb@1b010000 {
>                 };
>
>                 ovl0: ovl@1c000000 {
> -                       compatible =3D "mediatek,mt8195-disp-ovl", "media=
tek,mt8183-disp-ovl";
> +                       compatible =3D "mediatek,mt8195-disp-ovl";
>                         reg =3D <0 0x1c000000 0 0x1000>;
>                         interrupts =3D <GIC_SPI 636 IRQ_TYPE_LEVEL_HIGH 0=
>;
>                         power-domains =3D <&spm MT8195_POWER_DOMAIN_VDOSY=
S0>;
> --
> 2.43.0
>

Regards,
Pin-yen

