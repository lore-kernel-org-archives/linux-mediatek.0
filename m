Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E1ADCEF148
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 10:21:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKvX1hYx9ajM3nXc0rIUifJtaNFZ8Y/Ptkap6z3Rx6k=; b=iOq3McQYeQ9fjjBYK1iMtWxQpt
	GDHILjeJggn804npkxEbcQoqZl9txj30Y1KhgvtV+ocQlLwrMhDECMEnvEMXNEHH64Jcl9TolDQ7W
	JkxNB7dGgApDxmpYMZykyY4MiOqdASjZmbaqF4mpFkAIDaOwQ4d+k4D5gRdYU4lg6nsgAjp1Djt30
	OEdfVjYXoY0iV5RetR1o6cESOFMRixhNV0Rp0LRtz3scfsZa46R3yBZCbEvEfBXtAK3cGCQANetLw
	EhZVMQzmi1hBeHp33n5TuEPzB3c/fyx5fENd9DjF3h/QfTQozWA5TgYEvmqH4TzktgI4vwBnZ8wIT
	PUbBPr7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy7LB-00000005RHA-0ks4;
	Tue, 08 Oct 2024 10:21:17 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy7JT-00000005Qys-36rR
	for linux-mediatek@lists.infradead.org;
	Tue, 08 Oct 2024 10:19:33 +0000
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-5398a26b64fso5303649e87.3
        for <linux-mediatek@lists.infradead.org>; Tue, 08 Oct 2024 03:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728382770; x=1728987570; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TKvX1hYx9ajM3nXc0rIUifJtaNFZ8Y/Ptkap6z3Rx6k=;
        b=iOGiwdVY0lT22ygh0yebmSllCcLymEu7sr3VO3NbodetH7GGt9MpRw6Uk6IvpB/Chg
         OKLqJ0C/MPvRRjPv3/Bc2V7HqAuJfhQnj98FBr9lCulJ5OtlvtPZafgDQrNisq/T2lkP
         Hbw+dEzM8JXr1VVBzPLFtBSaFg57Q3Dfae3NI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728382770; x=1728987570;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TKvX1hYx9ajM3nXc0rIUifJtaNFZ8Y/Ptkap6z3Rx6k=;
        b=cZRIKVyd0c4i63rHHf7P7k9a5UYffWJxw+Z1t21/kaVEsW/gLJWrq8n4bLjgm+35LJ
         cx00UIiSHw7Kal9ezu/e29WIOJ/K22EVGxOK4P4jsaYGyP7UYVcKQGwDYMQLnJozNnS/
         qNDIK2sS0p8mOwUK52LrLCYPAka9JvvjF3fE6rbQhFkVIgn9AdRx5ZBX9GgDUrx6Shgc
         CUaf/zSuzSU+pGyPEDlodBSaoRw8oKWB8KsTUEpoF+trwHHyuHf7/+RNwkrZFdC0cAFE
         KHkj0eSXnAhnAR5r2CCsTbHIfCwccjWAr+qUGPQTdi9KXDTWIyTx4E6wjwPV0+FkiYKF
         JHlQ==
X-Forwarded-Encrypted: i=1; AJvYcCV286AYhATB7WkDLdrOgfwMrxJQrOy9GLZ/+LqYEb6Ep73r7pXIWt/rDEwd8CXWd8vsNtFPZcdk4SGnYBhaFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwcH8JiMlMoLtqdmg0O8WyBgHIY2QH/SzFjjTxA02BD71i6yUZV
	OXEdTWqKGHfiVG5UYUyzIpDbMH6ASSzVS1sPzKb0mynXjN6o9FcbiNduNKTCKem44NUVsW8EP/r
	Erm9uy9S8GNW6nuOIsZS6k3Dxm/Q2C51O8WEK
X-Google-Smtp-Source: AGHT+IFJoapQyWXTBDWi7i6BA55pCB5dNb51Vflj21gDcWvKovhXowTlQiGaddCXCS59Hji0UirIv7xWQ1Sxn4CKUcU=
X-Received: by 2002:a05:6512:1193:b0:536:a68e:86f0 with SMTP id
 2adb3069b0e04-539ab88c48dmr7579835e87.27.1728382769452; Tue, 08 Oct 2024
 03:19:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241008082051.4002438-1-wenst@chromium.org> <eab4ef1e-f63f-4561-b429-6dc3d7485871@collabora.com>
In-Reply-To: <eab4ef1e-f63f-4561-b429-6dc3d7485871@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 8 Oct 2024 18:19:18 +0800
Message-ID: <CAGXv+5Emb5b5m8i3MCJXS3fRND04B89v9s1x7JNk4aNj6U7yoA@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-elm-hana: Add vdd-supply to
 second source trackpad
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_031931_806952_5A1F0CB9 
X-CRM114-Status: GOOD (  24.67  )
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

On Tue, Oct 8, 2024 at 4:47=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 08/10/24 10:20, Chen-Yu Tsai ha scritto:
> > The Hana device has a second source option trackpad, but it is missing
> > its regulator supply. It only works because the regulator is marked as
> > always-on.
> >
> > Add the regulator supply, and the required post-power-on delay.
> >
> > Fixes: 689b937bedde ("arm64: dts: mediatek: add mt8173 elm and hana boa=
rd")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi | 6 ++++++
> >   1 file changed, 6 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi b/arch/a=
rm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> > index 8d1cbc92bce3..e03474702cad 100644
> > --- a/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> > +++ b/arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi
> > @@ -49,6 +49,12 @@ trackpad2: trackpad@2c {
> >               interrupts-extended =3D <&pio 117 IRQ_TYPE_LEVEL_LOW>;
> >               reg =3D <0x2c>;
> >               hid-descr-addr =3D <0x0020>;
> > +             /*
> > +              * The supply is always on. Adding the delay here
> > +              * needlessly delays the readiness of the trackpad.
>
> I'd say, let's be nice in this comment and let's explain the whole situat=
ion:
>
> The trackpad needs a post power on delay of 100ms but, at the time
> of writing, the power supply for it on this board is set as always-on,
> so we don't add that to avoid useless delays in the readiness of this dev=
ice.
>
>
> ...or....
>
> The trackpad needs a post power on delay of 100ms but the power supply fo=
r
> it on this board is always-on (and will always be), so we don't add delay=
s
> to avoid impacting on the time required for readiness of this device.
>
> > +              */
> > +             /* post-power-on-delay-ms =3D <100>; */
>
> Then you can remove this commented out property ;-)
>
> P.S.: Just to be clear, what I dislike is to see a property that is comme=
nted out.

Got it. Will rewrite. :D

ChenYu

