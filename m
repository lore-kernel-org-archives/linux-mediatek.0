Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D5CBD5E145
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Nov 2024 08:21:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j4o7fhe2V5dd+UE3dA/uAT0KHoDiGtLUhf89NGPnqv0=; b=wNzBcaMF6dRV6Wk+EUWNhkP+zN
	Y2YSw8R3UHXf84jolrAYoubS6yyEF23X054WpUZh/U9gTMzvFjy1DLVrqFyqDGt8ch9jUvW9ELSqU
	RoGTwb2G8jet4BoHkYuBXtMeRyGFOw++Z9fYH01P9S3n5Fl9900MGRDUS77TNCRggdrtLQ5d3Qdoq
	SjwkQ0+i3PwpnmQlm9ci+s4yeGT+RQfs1UR6S58nahCus7ZEaWYXXQZqRRPDleySR6RfzI/ib7l+x
	SKG9AZODSTSoHxG+Bq6AMQEC6NHG1VPflh8Oqg/9fEV3Tux7oN77t3kGUSZInJ+iMKcBBxcL8g7bP
	2zNQCeWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KFA-00000009kkE-0FyP;
	Fri, 08 Nov 2024 08:21:24 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9KF6-00000009ki2-2zlm
	for linux-mediatek@lists.infradead.org;
	Fri, 08 Nov 2024 08:21:22 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-539e63c8678so2008848e87.0
        for <linux-mediatek@lists.infradead.org>; Fri, 08 Nov 2024 00:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731054079; x=1731658879; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j4o7fhe2V5dd+UE3dA/uAT0KHoDiGtLUhf89NGPnqv0=;
        b=klAy5QbfeqBXjPH6Qqr/MKNeH1/NG6EgxcJixLLrQESzRhox/NMiPNU3abhR3d0IZT
         dLnWX6T7qPPZBc+XFoLREIBrNW/UaC0lZddNHEoiR2zqHyM1WQAnMekC9/u3BPInn0NX
         +8zQWc+9h9mVRiBKarmxqn46w3TLJ4ZY7+pUs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731054079; x=1731658879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j4o7fhe2V5dd+UE3dA/uAT0KHoDiGtLUhf89NGPnqv0=;
        b=LpCjmr+cfIe/ltAKxgul6Z/pdHHfq0ER4xhTqjq9cClcNDH+lmEWvh+LTpCJ+6dKJN
         Yx9TH9eIKQ4Al45Kh/+L5tsB6Ns+JQ4YZ+GyYGhyZSmMBDcu4YJUEIfqO39tpLllSOdD
         mZN3+pjBOHYEq9OnO6Qeu5U4YYYgermkt5Cve+nMU9MniqR+e6w21kZbjaCTq3iAirB1
         eloAeIr6rkZIcWpLW0kj9V+ZLEy2N5rfk8NeR+tpuNuAinB5R+e9Hai0nX5X4FEcfjFa
         of3jvRDptq65jg3k1gHOgwNFb2NxPiSD33BpPi3cFRz7bgA5dAL1v+06C+gOSEXZQwoY
         Mw4w==
X-Forwarded-Encrypted: i=1; AJvYcCWKONLUEfaqw4TtH5lAwmb39VSltq8sK0WnZbF84hLI3aXzOzGTs9VFjN7iRB44Jvo9CgAm3WT869oTQfcBJg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7rUp67kEnkU6QgQ8AtdJPrv3Tkcg8pT4V9JmlHTGkDCwahSBP
	07hsRD+qV5E+rMJlyjTDsv0utPb4JYl+92koQVOuNRph7D9qr5I/4HdVEHdE3x2b4Vy+JyzyMk0
	G9iORBFXaTegTC6Zs+AU2UMG713IJdbklO6e+
X-Google-Smtp-Source: AGHT+IE2S4gjvQOpSK8kJaaKxLV5rdskh4etefXYjl17eLQ1scFoBJFDNNCqeEcFChM7or3BIVTeHmM7tSYZlf0ID34=
X-Received: by 2002:a05:6512:ac3:b0:539:e513:1f66 with SMTP id
 2adb3069b0e04-53d862fe1cfmr903159e87.37.1731054078864; Fri, 08 Nov 2024
 00:21:18 -0800 (PST)
MIME-Version: 1.0
References: <20241108-lvts-v1-1-eee339c6ca20@chromium.org>
In-Reply-To: <20241108-lvts-v1-1-eee339c6ca20@chromium.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 8 Nov 2024 16:21:07 +0800
Message-ID: <CAGXv+5EOcg0pQxj=iOn_ff8-t6pyGKwemA9mdn=VCpxg6Uzt+g@mail.gmail.com>
Subject: Re: [PATCH] thermal/drivers/mediatek/lvts_thermal: Switch to IMMEDIATE_MODE
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241108_002120_774469_3BCE6C92 
X-CRM114-Status: GOOD (  14.44  )
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

On Fri, Nov 8, 2024 at 2:51=E2=80=AFPM Hsin-Te Yuan <yuanhsinte@chromium.or=
g> wrote:
>
> Currently, MT8192 cannot suspend with FILTERED_MODE. Switch to
> IMMEDIATE_MODE will fix this.
>

Probably should have a Fixes tag.

Also, Nicolas previously reported that the threshold interrupts don't
work with the immediate mode [1], which is why filtered mode was used
in the final version.


ChenYu

[1] https://lore.kernel.org/linux-mediatek/37680c5e-e61c-410b-b48d-82991420=
0e4a@notapiano/

> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
> ---
>  drivers/thermal/mediatek/lvts_thermal.c | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/me=
diatek/lvts_thermal.c
> index 1997e91bb3be94a3059db619238aa5787edc7675..daad52f14fc03d0c4131f2ffd=
f3eb6b49a4a43d0 100644
> --- a/drivers/thermal/mediatek/lvts_thermal.c
> +++ b/drivers/thermal/mediatek/lvts_thermal.c
> @@ -1541,7 +1541,6 @@ static const struct lvts_ctrl_data mt8192_lvts_mcu_=
data_ctrl[] =3D {
>                 },
>                 VALID_SENSOR_MAP(1, 1, 0, 0),
>                 .offset =3D 0x0,
> -               .mode =3D LVTS_MSR_FILTERED_MODE,
>         },
>         {
>                 .lvts_sensor =3D {
> @@ -1552,7 +1551,6 @@ static const struct lvts_ctrl_data mt8192_lvts_mcu_=
data_ctrl[] =3D {
>                 },
>                 VALID_SENSOR_MAP(1, 1, 0, 0),
>                 .offset =3D 0x100,
> -               .mode =3D LVTS_MSR_FILTERED_MODE,
>         },
>         {
>                 .lvts_sensor =3D {
> @@ -1567,7 +1565,6 @@ static const struct lvts_ctrl_data mt8192_lvts_mcu_=
data_ctrl[] =3D {
>                 },
>                 VALID_SENSOR_MAP(1, 1, 1, 1),
>                 .offset =3D 0x200,
> -               .mode =3D LVTS_MSR_FILTERED_MODE,
>         }
>  };
>
>
> ---
> base-commit: 906bd684e4b1e517dd424a354744c5b0aebef8af
> change-id: 20241108-lvts-f7beb36efc59
>
> Best regards,
> --
> Hsin-Te Yuan <yuanhsinte@chromium.org>
>
>

