Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEFDC07CB1
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 03:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VlaRJlvg6SkH3iVCCMUur0uADxqCqngF5eSxepb74eo=; b=GVrKozSdUHbvFHRCab+3A8KbtL
	YNa8kdjX8XwJ0u/lhJEg2IZR9Dmv6SzBbjhXTKj3PkYmsULg+Ms7bS2DB/QGxtgLvFHVQd5RLRekv
	GyGxhhePCs9LGGhHFhpsX8HS9Ixrp+BGbrXmg+UFrlMhUZcixm8b9cYmTmRO9M4MvUUgNdZd9L9N0
	cMOjuWhkHwfoVw6oSSMGeZmr0+yjhLQfANxaNOqp1iVbQszzdSFtMKkXzwMOC67dEp5hs88IHSwJV
	bOtjXzXVBSIAo/901YENJpGY7vTPbPirEnpmTcLDuY2kt9xYbpEjBKQwewpAaK9rYZdRiYYNvTpwb
	hSQChRpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7RyK-0017co-05;
	Mon, 27 Nov 2023 03:07:44 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7RyG-0017Za-2G
	for linux-mediatek@lists.infradead.org;
	Mon, 27 Nov 2023 03:07:42 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2c873cf9f74so47615781fa.0
        for <linux-mediatek@lists.infradead.org>; Sun, 26 Nov 2023 19:07:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1701054459; x=1701659259; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VlaRJlvg6SkH3iVCCMUur0uADxqCqngF5eSxepb74eo=;
        b=UuMtswU+5DYxJjCSxf293iIW0fEVlatRasZFMvZHuwXc1b21VQCh58FP3NAoTnUm81
         suIu8q2P2dro0ZYABFdsZQxmHEraYW7ojOqBOtlN/RehrOtjPwzZv7tm5yRUjZpBR2hp
         P9LmOkYP5MqmlJj9fytJEaGWScUFCI0ATltfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701054459; x=1701659259;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VlaRJlvg6SkH3iVCCMUur0uADxqCqngF5eSxepb74eo=;
        b=ouKabFOMOXpcizN4cPwa6NZl8eI1cpceX7T3+OtRupyt0SI1ZYQJE8oplPlMmodqfh
         /KFNvrYIwxh6Whoc90E+T7BKJ3Su2X/4OK9ykrzSZDQWryxcSbvChVarYmuKNswvCE3l
         CAlwbMtD5Faw2mNHAmD1c1IbZgyPCVcsuQ2TvDQGkU9GS7lne+qJ10uhIiB8qO8vEu3a
         z8tnaOqFUFS903YQYzpQ633x90w+Aj/YpvPq7HcZYpdwJZxR7KOeXbqakcdyxvxcMmrp
         D4JyauZynxrD4Z9zntjm9viN+T2tqz7SZCoqOUcymaR83phEmuC0ZJrBb7uoFRWOW985
         oNbQ==
X-Gm-Message-State: AOJu0Yx+1br1XYSz7ylBLa0HtVYyCQ8WQOp+ZjhUmNlYAZeolgteRNi3
	yVUTdjNcCBwJJ0mZBoKF0ETP+Y5uJjGfxBVsDnOKfA==
X-Google-Smtp-Source: AGHT+IF6iA8pXDpSmsO5bEY3xSd26XCL631sAXkpfn6+jD0thwzCwvWTVnjzWxDvI99Qtb6aAqinHNpBcziXbA/wSss=
X-Received: by 2002:ac2:4c48:0:b0:507:b7db:1deb with SMTP id
 o8-20020ac24c48000000b00507b7db1debmr8091073lfk.38.1701054458668; Sun, 26 Nov
 2023 19:07:38 -0800 (PST)
MIME-Version: 1.0
References: <20230913084457.1638690-1-wenst@chromium.org>
In-Reply-To: <20230913084457.1638690-1-wenst@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 27 Nov 2023 11:07:27 +0800
Message-ID: <CAGXv+5E5BWzMP981Agn01XVAO=KC5CE04oOi8xWwx=DT=N61dw@mail.gmail.com>
Subject: Re: [PATCH v3] arm64: dts: mediatek: mt6358: Merge ldo_vcn33_* regulators
To: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_190740_736852_67167F91 
X-CRM114-Status: GOOD (  20.26  )
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

Hi Matthias, Angelo,

On Wed, Sep 13, 2023 at 4:45=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The ldo_vcn33_bt and ldo_vcn33_wifi regulators are actually the same
> regulator, having the same voltage setting and output pin. There are
> simply two enable bits that are ORed together to enable the regulator.
>
> Having two regulators representing the same output pin is misleading
> from a design matching standpoint, and also error-prone in driver
> implementations.
>
> Now that the bindings have these two merged, merge them in the device
> tree as well. Neither vcn33 regulators are referenced in upstream
> device trees. As far as hardware designs go, none of the Chromebooks
> using MT8183 w/ MT6358 use this output.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>

Please remember to queue this up. All the driver changes were merged in
the last cycle.

ChenYu

> ---
> This was part of the series "regulator: mt6358: Remove bogus regulators
> and improvements". Since the driver parts related to this patch have all
> been picked up, so I'm sending this separately.
>
>  arch/arm64/boot/dts/mediatek/mt6358.dtsi | 11 ++---------
>  1 file changed, 2 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt6358.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt6358.dtsi
> index 96ba8490b629..ad5e4022e06d 100644
> --- a/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt6358.dtsi
> @@ -292,15 +292,8 @@ mt6358_vrf18_reg: ldo_vrf18 {
>                                 regulator-enable-ramp-delay =3D <120>;
>                         };
>
> -                       mt6358_vcn33_bt_reg: ldo_vcn33_bt {
> -                               regulator-name =3D "vcn33_bt";
> -                               regulator-min-microvolt =3D <3300000>;
> -                               regulator-max-microvolt =3D <3500000>;
> -                               regulator-enable-ramp-delay =3D <270>;
> -                       };
> -
> -                       mt6358_vcn33_wifi_reg: ldo_vcn33_wifi {
> -                               regulator-name =3D "vcn33_wifi";
> +                       mt6358_vcn33_reg: ldo_vcn33 {
> +                               regulator-name =3D "vcn33";
>                                 regulator-min-microvolt =3D <3300000>;
>                                 regulator-max-microvolt =3D <3500000>;
>                                 regulator-enable-ramp-delay =3D <270>;
> --
> 2.42.0.283.g2d96d420d3-goog
>

