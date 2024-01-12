Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED224C4707C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 07:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9CpLoCr6SU3NVlZhezQBUSxWV8XqfLhTOBbyUhiTFb0=; b=LGpxHCl2ns/pleXc+mW6o5RFi6
	p3++GwcqMQDyYvyVMc9OAVkJgG+bV5qCmhF2WDNqhjmrKKN+Xy1aNxURQe5fzBs9Lpjj0KGbxD3FE
	wkA1xsvfsNNHOjqXDSwJwhDYpqFWnlq3mqa+Ywa3+2uzwRpl62QncvWbgay0oxIzpgZwMpR+BxJNu
	Jek/Md59p8mHpvjnq/mk+1nPF5ZhJTTMjMN2g+/6zOZRKbdVNHqBjveUC8BQiyqnqSyAN2/3Vfbl3
	ahkSbXnu6xO7hIltiUsC5CWPZV1hTttCd0VFHzcf6WPPnH8YgydIIhtiStzFL1vS6XXhYxBHXR+Yo
	ce/iwwPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOBgV-0023Ht-2U;
	Fri, 12 Jan 2024 07:10:31 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOBgS-0023H9-00
	for linux-mediatek@lists.infradead.org;
	Fri, 12 Jan 2024 07:10:29 +0000
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2ccec119587so74282761fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Jan 2024 23:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1705043424; x=1705648224; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CpLoCr6SU3NVlZhezQBUSxWV8XqfLhTOBbyUhiTFb0=;
        b=CgXAVQXH7/4ZfrGAorhvKOztWezjYxQxAjy77tG6HGmXo1iyO0s/4oMofblWyLgBdw
         zgMG4pn/2XGd1KbEgmFYV2hgM5eHjfzOALzAJuAxVvQQqbAM9PGU05KMvw45O/Ne8Z2f
         B6vGImrG13kqHdhlmeof5zfcHBSgsljXyOTB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705043424; x=1705648224;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9CpLoCr6SU3NVlZhezQBUSxWV8XqfLhTOBbyUhiTFb0=;
        b=QlvnqTB2GaCXWNNqnodY7gp4wCSu8tGeLQAOOeSbDBgA5g/Za55crDuXTjNFmcl31Z
         G0iTXRk2JrG24Md5OEUwvo1TMO4oYWOm7XuOgNZAkrzqtmDk7Pg1Vo6hLL/96GUhgn7e
         UGX7/JwQeh9+2cUsUfzO/bdjh5GSEMMl5v8bQcpk7Y607eiRpmii62SUIZJtLsgzAuCa
         rarDmBQQ/OFdcmnTxAmUHeIBNU85fcT2JAvmrEWPIaJYkQfQDFQennaCqvmm3klqgrs2
         EZE9N653a85Z1UaUdeyWX9AztxkPFJGHogplnLjfXFhKRCjLhnP+nYB0iotsVtkTau50
         S3VA==
X-Gm-Message-State: AOJu0YzEb+rD3G5YQQEoM1lDwweYvxRG82/6Ocoll/y4njNzsOM4PcxD
	CBEzEloN3wsEqkaf867Jtk7p17PxvSINUJIrATCO6GW3mkQO
X-Google-Smtp-Source: AGHT+IHlsWzk7VBDrxQbPuwhEzOa8RrYAxu50cHzpD/G4LoHP/3wdiV0QT/8BgrvtuTGNBulNk5QS1QaSxP0kKJsgCE=
X-Received: by 2002:a05:651c:170c:b0:2cc:a66d:3356 with SMTP id
 be12-20020a05651c170c00b002cca66d3356mr424298ljb.11.1705043423754; Thu, 11
 Jan 2024 23:10:23 -0800 (PST)
MIME-Version: 1.0
References: <20240111195335.871096-1-nfraprado@collabora.com>
In-Reply-To: <20240111195335.871096-1-nfraprado@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 12 Jan 2024 15:10:12 +0800
Message-ID: <CAGXv+5FKHX482+QjYP=jWKWz2HD=Af6x9Cahi+fc4EKNmM-MMQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mt8183: juniper: Remove CrosEC base detection node
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, kernel@collabora.com, 
	Conor Dooley <conor+dt@kernel.org>, Enric Balletbo i Serra <eballetbo@kernel.org>, 
	Ikjoon Jang <ikjn@chromium.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_231028_083898_D74F3073 
X-CRM114-Status: GOOD (  20.16  )
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

On Fri, Jan 12, 2024 at 3:55=E2=80=AFAM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> The cbas node is used to describe base detection functionality in the
> ChromeOS EC, which is used for units that have a detachable keyboard and
> thus rely on this functionality to switch between tablet and laptop
> mode.
>
> The juniper-sku16 machine is a convertible, meaning the keyboard can be
> flipped but not detached. The detection for the keyboard getting
> flipped is handled by the driver bound to the keyboard-controller
> node in the EC.

We could do this for the whole jacuzzi family, which are all clamshell
or convertibles.

ChenYu

> Since there is no base detection in this machine, and the device backed
> by this node fails to probe and goes unused, delete the node from the
> DT.
>
> Fixes: 4fa8492d1e5b ("arm64: dts: mt8183: add cbas node under cros_ec")
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
>
> ---
>
>  .../boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dts   | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sk=
u16.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.d=
ts
> index 8ac6bf5b17f9..8096ca215258 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-juniper-sku16.dts
> @@ -13,3 +13,6 @@ / {
>         compatible =3D "google,juniper-sku16", "google,juniper", "mediate=
k,mt8183";
>  };
>
> +&cros_ec {
> +       /delete-node/ cbas;
> +};
> --
> 2.43.0
>
>

