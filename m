Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D935D25042
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Jan 2026 07:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1n52GJUXMp/HKtmkEtsDqFReft0eMQBSrCUNh4f3w4M=; b=1QUMoLkqIM3OxWzQQ7n4868r5Z
	SF5u0zbPCQJpyUxqVxzUmXdeEjOoqKPjGL3aPAqfbVGAy24lj2retDHcRJwfA7HbfiLkQWBHHLGk2
	tXMk81pfL2WICmwRlEU3Yu1+Iy2WUmaMyHylVzyEYrAsAzHPoJjAZ32jET8uLVnXKPt8+ZbiWadxx
	81XSg0NNMGqG82FsNVnOLB6AnrlIiw+sfV/efG7HWTm90H5HZMKUwYdcXogBYC+krSt5ijJuRBap7
	K7WIUrD7jLce0OJNZoqxp5r5l68fzDLcyrh+F0Up56zT4eEoFRa++IMnHIF4gAiXmKG+cfM4IG2j3
	yIOV0uyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCXD-00000004uZ7-0fVG;
	Mon, 12 Jan 2026 07:40:19 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfCXA-00000004uYG-3IqQ
	for linux-mediatek@lists.infradead.org;
	Mon, 12 Jan 2026 07:40:17 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-382fe06aa94so41836661fa.0
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Jan 2026 23:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768203614; x=1768808414; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1n52GJUXMp/HKtmkEtsDqFReft0eMQBSrCUNh4f3w4M=;
        b=VXQI2hAJx1xz6+b12q8OgxZF137mdwJZU8OOJfDGR8masU1p/8IYptVj1m9Gl/oz/3
         GYr2GJpARijcptkTYLkykG1cAkj0eCHMyo754f6VVoMyuZdO4W1X7zqxcSRGkdsCd716
         2xWXchvjR++h1fOr7DId9s4+VDVXfMcTTaTr0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768203614; x=1768808414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1n52GJUXMp/HKtmkEtsDqFReft0eMQBSrCUNh4f3w4M=;
        b=XdmR/6Ucrr354VMfz/saC3+/TV1RY0NuLdGaRLXhL4JQprKYinbFReMZkmVTVj8RVF
         NNDBfqSf6t0yKw43nAO+unPvAGC2vUbDWPYUPQXVgFHMvKzdUf/xKihfAFBcGyf8ZnJt
         CY4sa2MVcB4Ga+6T6m02uR6W62Gh9rHSs+U6VdDyWAaOAEaZ0TaDpkXEupBqzZRsibxU
         8bAHaMS7G/aGqcRe18M5gPPyp58tjHG7KGDsdmdMrpZXHPBeOvEOSIrHBspTg4fSLwgt
         dsrT8KT9+u7MOS+dbRlXZr0pyRVN7x8i0XI9A3P6EmglE17Co66m2jbWDDsYIbdKz4ZW
         bELw==
X-Gm-Message-State: AOJu0Ywo5DP1vu9xjHkNWiOav5vxQ7fGtytqMacGWX36kClzIoIS4BEJ
	e/9rCCKt76vDyUi/9M3dvUzSt8sDOs+V8GoQwv5AUqe/Yp45Wr/HwbrSlu7E0MIh61mJ69lr28L
	Yi3xClZlhWpcLQKvxk+q4mAp2JvAvMo9hlKinadouU0FY3HZcPSdSlg==
X-Gm-Gg: AY/fxX7gKr5ih75RLA3cy8xRw56ptiKKPkfkXQoVITX0CMHtIxnt+hSa3MCo7No2pze
	YgBDmN2at4yLhtnwIVwR2sfPUC9kxyNlmmY17oKrkBVz6O+a/ojuQcUU1e1ZJgSW2B029oqy8/0
	zErl8Fjc53UPrKBlMf8oWcP6/BlYmCVSwhBmMTU2Vg6Krp7tgLESVkv18SotVUmOSslZ8Np1Udf
	D/O3E2Go8E8fKZ1Ttj6/U4+agFxVwQz2UpUFpiou9h1jJ32PNQoQzkzI0taq+VKWAalzVjq9ib6
	xD0vYHmxIJTFxaSYHZDp5Bwx
X-Google-Smtp-Source: AGHT+IHUZT28NEm0pfAfk51zPeTo+Gj4RHUge+kB6DYLCdNVFDgCN4Sz5SqqU/frHG9MN/FkGcGoa1cuyd/52Y4L5JA=
X-Received: by 2002:a05:651c:210f:b0:383:31cb:e3a8 with SMTP id
 38308e7fff4ca-38331cbe654mr19249041fa.40.1768203614432; Sun, 11 Jan 2026
 23:40:14 -0800 (PST)
MIME-Version: 1.0
References: <20260109114747.37189-1-angelogioacchino.delregno@collabora.com> <20260109114747.37189-9-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260109114747.37189-9-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 12 Jan 2026 15:40:03 +0800
X-Gm-Features: AZwV_Qg9LwCLxMIXkGb-DD3-ik3Cc_aZ4i9dLvLfg60QSxVSU71EYiNaKoNhU6g
Message-ID: <CAGXv+5H3YLUahzOKP4qkUq=v9vz-uXv_0uOGSEsTKWgXoyUJ3w@mail.gmail.com>
Subject: Re: [PATCH 08/11] arm64: dts: mediatek: mt8173-elm: Fix dsi0 ports warning
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, matthias.bgg@gmail.com, sjoerd@collabora.com, 
	hsinyi@chromium.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_234016_869436_ED84976C 
X-CRM114-Status: GOOD (  14.87  )
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

On Fri, Jan 9, 2026 at 7:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Since only a single port is present, remove the inner `ports`
> parent node and just declare the single port as `port`.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/bo=
ot/dts/mediatek/mt8173-elm.dtsi
> index 59813fff7833..dc064cdcedb5 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
> @@ -206,11 +206,9 @@ target: trip-point1 {
>
>  &dsi0 {
>         status =3D "okay";
> -       ports {
> -               port {
> -                       dsi0_out: endpoint {
> -                               remote-endpoint =3D <&ps8640_in>;
> -                       };

Nit: while at it you could add a new line here to separate the child node
from the properties, as per the dts coding style.

Either way,

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> +       port {
> +               dsi0_out: endpoint {
> +                       remote-endpoint =3D <&ps8640_in>;
>                 };
>         };
>  };
> --
> 2.52.0
>
>

