Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29B37C3DA59
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jul 2024 08:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXprlyHr46bmF7ruMUWhQiYhStrhQKFzfO5a5WBJEkU=; b=YmM/5c1QoX3RGi4xvEgb3XzMj1
	VjCFiLTR3+xDo8505diz4W6+eiH2eVGlSAC7ApoMQm19ceUpqyw2J7q8dkhPGBkk4592pGnSQEkuG
	dOWsRtskbp2sREtnxNGBQp014xvt/iOhQRsEesS6D8/+v2+QDzVGg7f2qR9FEx0L5x3GNb6b/1WBH
	mgeGDxLwGweiVytfoR+76+HUI4doQQPZqeoREt7Y+f1vhTpyk8W9yJMzphs/Qd/A0YIv55kRXD/3m
	iUuRCD4sZq8KFmYrKV3vU81jKe4zxx9uxILMP+iDQFVCmr98m5XHKtX90Su8l4qEx/S9BLI8Bl9zg
	KXWBr/Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTdzL-00000009nbj-1FYz;
	Tue, 16 Jul 2024 08:56:47 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTdzH-00000009naF-3lUO
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jul 2024 08:56:45 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2eee1384e0aso32410311fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jul 2024 01:56:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1721120201; x=1721725001; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXprlyHr46bmF7ruMUWhQiYhStrhQKFzfO5a5WBJEkU=;
        b=ScND9QPf5L2CtgsnbsrUFz7OH+i/MrkpqaPPwfGg8X0Q/KwUD0MR3SbBkP6pvpYbAb
         YIfTt9DVrsS3TvkzV614jCPaHa2uGt9VT+pytoCiyc+AKKHz3Tunz16IhoOJjqnL310s
         a96EIq4aQN9HATqVIhGPP9faZMfSoWPjGSewo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721120201; x=1721725001;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rXprlyHr46bmF7ruMUWhQiYhStrhQKFzfO5a5WBJEkU=;
        b=U1UQInF2xdryLBNADLtWPA6cXD2Xf3deJZEovOmKeNhblcS75YDXkbwubuLufj2NBa
         EwDY4tkd2WWE9xAMjnXPtfgO39LuhADxWYdRN3F9iYaoOND3o5CaWBA5zpXX/OpvA+22
         ocXiL5ZFil1AxMM4I69p9psM/bixeuoHgAjP3NXc29/GtPr+XEyRVCbC2P9cpNI8spDj
         pv2ZeHh5iR3BUyXpjm5lw5zcOt2W77PbpMJnI+fapgMLaFS303G9Qqv4eCx8PgJNMmke
         1BIbSr9Xoitjq8+emSwq0w1ijsPUp/NlLXSA7tJLV3xv8WyDYewVXSmAHRgcFXqn51yK
         1EQg==
X-Forwarded-Encrypted: i=1; AJvYcCUqRbxxgqy2ONEzQs+VRwVRw12l/aFthfIgogqA8qd4lOUNbPTj9wvmsh/AzyUxSFLxI5FeuKtWyeUO8S7SdXWTJb4IclydX6jxmG/zREtNFACb
X-Gm-Message-State: AOJu0YzVTEDgkJoMeJSuk6nXnLMqohAQ0FpmOyfw3tgSrbP0f8rgfMvO
	4+XAQGPorAphafz04Pri/PLx/z2aHNc2sp8P9ECjb4vMO0zYIcDCAmQY4mFZl8AGWGxZlQX8buI
	tW4zfFp0N8As9lng2JHmAivP+8MtsPHP/03lI
X-Google-Smtp-Source: AGHT+IFOZD4OsAPa2Bctjcjq/xHuvKjPdnaXt584JGD+IHrW84XXJpnxyXAfVMsVyPA31dCb/ZrU6JiMiZw+X7LhjfY=
X-Received: by 2002:a2e:9e97:0:b0:2ec:500c:b2e1 with SMTP id
 38308e7fff4ca-2eef415bc24mr9244161fa.5.1721120201390; Tue, 16 Jul 2024
 01:56:41 -0700 (PDT)
MIME-Version: 1.0
References: <20240715-cros-backlight-dt-probe-v1-1-0b5afe64c94b@collabora.com>
In-Reply-To: <20240715-cros-backlight-dt-probe-v1-1-0b5afe64c94b@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 16 Jul 2024 16:56:30 +0800
Message-ID: <CAGXv+5F=sRPi7sQrxyzM7t5gbZYzOE1oymxeJEvmkCtPT6QHTQ@mail.gmail.com>
Subject: Re: [PATCH RFC] arm64: dts: mediatek: mt8195-cherry: Remove
 keyboard-backlight node
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_015643_943734_E7CFEBC3 
X-CRM114-Status: GOOD (  26.28  )
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

On Tue, Jul 16, 2024 at 12:13=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> Commit 970c3a6b7aa3 ("mfd: cros_ec: Register keyboard backlight
> subdevice") introduced support for detecting keyboard backlight
> fuctionality through communication with the ChromeOS EC. This means that
> the DT node is no longer used. Remove the unneeded node.
>
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
> Different CrosEC FW versions could potentially not support discovering
> the keyboard backlight functionality, but I've tested both a recent
>
>   tomato_v2.0.23149-099cd3e539 tomato_15699.72.0 2024-01-03
>
> and an old
>
>   tomato_v2.0.10686-234e646fd8 tomato_14268.0.0 2021-10-07
>
> version on mt8195-cherry-tomato and on both relying only on the
> discoverability works. I've tested on both tomato-r2 and tomato-r3. I
> have not tested on dojo, however, as I don't have access to it.

I grabbed one from our warehouse and this works as explained. So,

Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Note that there's actually one SKU family for Dojo that doesn't have
the keyboard backlight, which I haven't tested yet. It also needs
a new device tree to describe the slightly different keyboard layout.

> My motivation to remove the node is because the DT kselftest expects DT
> nodes that can match to a driver to be probed, and with the "breaking"
> commit, the DT node goes unprobed which results in a failure:
>
>   not ok 225 /soc/spi@1100a000/ec@0/keyboard-backlight
>
> I can also solve this in a different way, by adding this driver to the
> ignore list of the test. But this solution seemed better as the DT
> isn't meant to describe devices that can be discovered at run time
> anyway.

I think this makes sense.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi b/arch/arm64=
/boot/dts/mediatek/mt8195-cherry.dtsi
> index fe5400e17b0f..20dfa18c9dda 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi
> @@ -1228,10 +1228,6 @@ cros_ec: ec@0 {
>                 spi-max-frequency =3D <3000000>;
>                 wakeup-source;
>
> -               keyboard-backlight {
> -                       compatible =3D "google,cros-kbd-led-backlight";
> -               };
> -
>                 i2c_tunnel: i2c-tunnel {
>                         compatible =3D "google,cros-ec-i2c-tunnel";
>                         google,remote-bus =3D <0>;
>
> ---
> base-commit: 91e3b24eb7d297d9d99030800ed96944b8652eaf
> change-id: 20240715-cros-backlight-dt-probe-7754a832ad60
>
> Best regards,
> --
> N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
>

