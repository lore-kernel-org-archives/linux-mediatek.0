Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADB2C79FB7
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2026 21:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMS1hbLMg1gsIduehGePlq8QcJPEKyefk4+J94QrxTY=; b=4ZRJIsIkKeQSGkQvQ80+1BNz/r
	d3B0kB8ZobpWglOpi6VFVfqY0tmqpXWOqHyM7AQzfQ2sZxwk5mmnWAvsGsMaLWBw3qH32Y8jU//8G
	LWbgzjZ5cCXvfebGjBehl0n02BIILVvSlQNU0OkHsP9ga5usEqUroYkuXXmCQJjE9hdCqG7git/F+
	0Z0P2SK8G5dUDweSOdWxYW1sB2YQU02PYCkqlSdkREHQTxmcBAi/ryDkku9MX9W+Q2+32sSQ4QMan
	/xSjBCO8UN0zJK1GKW2X1sph/Ms1ql9bVNtpVbE0EBGoGN2ZJpPATToVad178iDl8aaw3jv3vKHtS
	Yd4eQepg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Pwb-0000000Ctfm-02HF;
	Wed, 09 Sep 2026 21:35:01 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4PwX-0000000Cter-2sH0
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Sep 2026 21:34:59 +0000
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-c15e2dab83eso1121319166b.1
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2026 14:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788989696; x=1789594496; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sMS1hbLMg1gsIduehGePlq8QcJPEKyefk4+J94QrxTY=;
        b=dNnjDAiza9qLopMkHW+xr6FW4oCXi/r/+6xU34ibKG/aa6oKs9Q9D+WI0zKxV1ZNJr
         mqnLD8HWTkpwkif6SuXo3ed/xm4+do365JCUfkaO6sKgT6jAb6tguFTAvgSc11cC7o3q
         fLLBjHO4adhbvJM4A7WVSLbYZLsheGanALSSU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788989696; x=1789594496;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sMS1hbLMg1gsIduehGePlq8QcJPEKyefk4+J94QrxTY=;
        b=LwUKfH0mYhsMlDja6C7Rm11GMenaoQnIPahDDEqY+iwHAsuDkOqv3fsNXu93kOxwfp
         5uVIAG2JiGFDfDw5Se6ivxFiej1Fc3ulGxCHOzTskiyiPXxcISSEI6rTerkk59O1IJtc
         ZLEKxXiBqrMVM8V8oepwbH3kKoyQ9AP9Cbkn+La2Fnaj52Vgjn5+L7vGPX/X1aTZHwls
         v31abvDIkMCMpS7DA3wANQYCJn15HdM4VRHy+Hm44plapXgYnOttNzLus9Ucx2w/emX9
         Js/sGYOgC+I1PunLZrjg+Gz039+/8+nn7OlLnnPxvOKzkkAptrZbe1Cbmg9gCsYRmtL6
         XJlw==
X-Forwarded-Encrypted: i=1; AKwUvBzCDHGpUXZXGKAN9G9E3X+hV2B9jOkg63EEt5/v3JnyXHZ7oa7jQ0HkCOIKqpsBjOHeX7jjUlDd+S5pIYML2Q==@lists.infradead.org
X-Gm-Message-State: AFuF++nD5OuV6xHFZuqCVBU890Sg+jq5QmlYrje5VHie2nJ7Hp6qJSMg
	TmfJeqm4zzE7g9sfA231wQ3afREEsZSzp0nEe/M/W9sMbAgK0d1lm8HmxUXCa4ioSgfdZ79+hwg
	BS7mZ+A==
X-Gm-Gg: AYBFou0D/KVCaWep90+n6dXi+Bn1h6m/JmbJigtbwUmA37/OTslmt08Bn960cKvL3dX
	JsswzSJbe4WBwWKtE6xZ0rUifsDTFTde41/16JQTaZvGtzfmuW98w8p33AX94u5IW+Ur2dexQu3
	1Ajcj8zD5OqbnGL6uvAaq+dnuoA2ThmEH/WHax8bY13dSX0BJhcIF1atupX9IgqtmcHijbLWU64
	KaMz8I/ay5agB912InAg+sWWtMXIgJFwo9aOEmsy4uUokSwW0sGUB9jYsePEgjq2jNex0FBE4Hs
	TwOz6bxy8ClJCn6OTsncC+L9tSgZW3vT1keIhc6DZlI4pr1aKZA0SQXQJ7xn+HcwRyeIw/3Kh0Y
	crBjgWkmdkGnt2eiz/LiRqyn5cIqyna6t2cWVDEQYZa91TmNYu/3Ny3sA1s+EJCh3/F3D3TZRxV
	T4ZKUJgXpNe4BI+sVpgEwPP21xM7MMS416+Ui4EApSIh3TjoLhtGXnCayA241d1BVIUR2PVTE5L
	YFdYevUuv8Tn0iluAfhYLzt/8UC4CpHEOa1fQ==
X-Received: by 2002:a17:907:d01:b0:c26:19de:9138 with SMTP id a640c23a62f3a-c2619dea192mr1376044066b.43.1788989695748;
        Wed, 09 Sep 2026 14:34:55 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c262ccca940sm666976566b.18.2026.09.09.14.34.54
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 14:34:54 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso52155115e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2026 14:34:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxT0cPsUWdLUA72TYOmujHgNfzW5JUqqpYYX7xqRMPeYOLDddY33Uo5KOS5OVq6B20CHhb5vDngp0j6YTH7/Q==@lists.infradead.org
X-Received: by 2002:a05:600d:640e:20b0:49c:fc6e:a3e1 with SMTP id
 5b1f17b1804b1-49cfc6ea77dmr253931435e9.32.1788989693915; Wed, 09 Sep 2026
 14:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20260908013843.368364-1-justin.yeh@mediatek.com>
In-Reply-To: <20260908013843.368364-1-justin.yeh@mediatek.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 9 Sep 2026 14:34:41 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Ui1XYRXb6ZqmAgWqF3TZaAcGqfsV6KodqPbk-sGqHdaQ@mail.gmail.com>
X-Gm-Features: AcwNN1UfpgY7Rw4Gy4MtVJB0f5LgowF3gCGJtAAU-5vzKs2VDiX_yyNNYapd3c4
Message-ID: <CAD=FV=Ui1XYRXb6ZqmAgWqF3TZaAcGqfsV6KodqPbk-sGqHdaQ@mail.gmail.com>
Subject: Re: [PATCH v2] HID: i2c-hid: Unfollow the panel on shutdown
To: Justin Yeh <justin.yeh@mediatek.com>
Cc: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Maxime Ripard <mripard@kernel.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_143458_577841_D212F198 
X-CRM114-Status: GOOD (  26.06  )
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

Hi,

On Mon, Sep 7, 2026 at 6:38=E2=80=AFPM Justin Yeh <justin.yeh@mediatek.com>=
 wrote:
>
> i2c_hid_core_shutdown() sends SET_POWER(SLEEP) even for panel followers,
> but nothing in device_shutdown() guarantees whether the panel, and hence
> our own power, is still on by the time we get there.
>
> Do what i2c_hid_core_remove() does and just unfollow the panel.
> drm_panel_remove_follower() calls panel_unpreparing() only while the
> panel is still prepared, which powers us down properly; if it is already
> unprepared no transfer is attempted at all. On MT8196 the panel is
> unprepared long before us, so this also drops the ~2s i2c bus timeout
> from every reboot.
>
> Fixes: 96a37bfd232a ("HID: i2c-hid: Support being a panel follower")
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Justin Yeh <justin.yeh@mediatek.com>
> ---
> Changes in v2:
> - Unfollow the panel instead of just skipping SET_POWER, so we no longer
>   depend on the panel having been unprepared before us (Doug).
> - Link to v1: https://lore.kernel.org/all/20260904035009.4114363-1-justin=
.yeh@mediatek.com/
> ---
>  drivers/hid/i2c-hid/i2c-hid-core.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hid/i2c-hid/i2c-hid-core.c b/drivers/hid/i2c-hid/i2c=
-hid-core.c
> index 0ff07fdab442..c7e46004f513 100644
> --- a/drivers/hid/i2c-hid/i2c-hid-core.c
> +++ b/drivers/hid/i2c-hid/i2c-hid-core.c
> @@ -1355,7 +1355,16 @@ void i2c_hid_core_shutdown(struct i2c_client *clie=
nt)
>  {
>         struct i2c_hid *ihid =3D i2c_get_clientdata(client);
>
> -       i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);
> +       /*
> +        * Like in i2c_hid_core_remove(): if we're a follower, the act of
> +        * unfollowing will cause us to be powered down. Otherwise we nee=
d to
> +        * manually do it.
> +        */
> +       if (ihid->is_panel_follower)
> +               drm_panel_remove_follower(&ihid->panel_follower);
> +       else
> +               i2c_hid_set_power(ihid, I2C_HID_PWR_SLEEP);

This seems right to me. One note is for panel followers if the panel
_hasn't_ been powered off by now, the drm_panel_remove_follower() call
will cause "i2c_hid_core_suspend(ihid, true)" to be called. That does
quite a bit more than just "i2c_hid_set_power(ihid,
I2C_HID_PWR_SLEEP)". ...but I think that's fine. I would expect most
systems would be powering off the panel at shutdown time anyway.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

