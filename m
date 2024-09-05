Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52E02CD5BCB
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Sep 2024 15:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DCkjd5aRXE77wTFecBrQlqKGiGvnECId8mwviesTQiQ=; b=dkdOC+rlXEoA3nyess8FWVhdpE
	a1F/D5rS7fXvUELoiJ9+CFThhK0oYs9vVVYBqUs/mQEXZiFYQVsvUuz7pvUGgojueTXJGOsLBLREQ
	/ey+3emfCw2iL0V0DEzt6q9OdU7Jctp1Hutcxa0EdvItnOpg7KgPRKbHnqtsbLRr1VhtbR41+n8PI
	7+LfztWLfzP7jNRWPwnLOfidfpZLpcpUE73ckWaL8q3Bj8mCfgpSyD0MfWrar+Xw9iFWWuwqs51RO
	xiKnQQtOCxGGdyna6RLNGDy0wAKwbAtFml0AczKWhAh5C+L8Y+ceNYhLkvtKrkqPsR1adNDx6ISK8
	ncctKqzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smEaX-00000008yOi-20xC;
	Thu, 05 Sep 2024 15:40:01 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smEaU-00000008yNi-0DZ2
	for linux-mediatek@lists.infradead.org;
	Thu, 05 Sep 2024 15:39:59 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5c25554ec1eso1069827a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 05 Sep 2024 08:39:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725550795; x=1726155595; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DCkjd5aRXE77wTFecBrQlqKGiGvnECId8mwviesTQiQ=;
        b=KOPDlBGmV7Qcs76fGFDpiF4LFFNpbI/tA0O5tXWLxIS0OrhcXM4BlX9iwfGbXp8NYF
         sv+uTzguRBpX3pAPezoVwreJ1SiHokZFnn42EVWcY4A8RUORFzb3dRDEcoJYVxi6pIDT
         EN5o6gVKhHskVM4zjVd30yFmGCWS0lX0ST6JKEWvhKklevD95V7gthQ9U1tIWLOO6dVR
         U4O1M2ZU73Q5pktlO+w/kZWBvvvdu7dhlqUR149n/P4Do9QbTL7mN3d+h2TTnH6zSCUH
         6NIhbhBb/J8xK4BID7xqgUg0zc7ahdVDKBVrZTvsUf4cIshC/fsYMkUuOFP0zP9uZFWc
         JOtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725550795; x=1726155595;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DCkjd5aRXE77wTFecBrQlqKGiGvnECId8mwviesTQiQ=;
        b=MfyOeYGK5rn6950I+7ShE0Kmivus6MypU90wzGIrnQyU5yjTaRTTs/l70zWIX9eaX9
         n63YWLCiERd3U2SXGigb5PxcE1AXz0YoTDPrCPN0tMDKuZvj/Y0wJCYrgZ2p+aGYNWhf
         NJSn+C+IVGVCicv6aG0YgKxROzGiNiijHHMfH0sW+O1jb8xVErUsI5HioXZ2xfnCzqgC
         tCPVdMEIgO5F8UPt1bPQsaTpN2VG9Z6Xw7wdmMIZC34PypAvHuMJjCwgglZl0hKcDiU8
         aCBGSuvpdBx/9NEd5FY0nWRA2ukQMyriT+1xJI1qExdNSE70LanD503Zivpf2rt8Tv7L
         YDmg==
X-Forwarded-Encrypted: i=1; AJvYcCVyoVcFCiZip2Pueysun1MrbjHM6YMwQyoFKjBRLQgJ1VLe1U+5AyihJFIy4+jc437oZoQ+yyhHjxfrcX59+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YxejFfqTRCyeUtIUWQa2idO8J+XLcic/uffOgryvZqWQLTEYFiw
	FFml6NG+cFWvfP41HS/j6PkkcF6FyVhMYRep5/Ld+oTp99u+0l0r3TS9KKU5GuE=
X-Google-Smtp-Source: AGHT+IFRAW1z6DKEHOmqApoikHOpDiIceOIq97SzaMQ4yjqsbOsT+Hzh1euIiYVWcaR+nXNdRuDAkA==
X-Received: by 2002:a05:6402:2750:b0:5c2:4cbe:abfc with SMTP id 4fb4d7f45d1cf-5c24cbeb2f2mr11708577a12.2.1725550795189;
        Thu, 05 Sep 2024 08:39:55 -0700 (PDT)
Received: from localhost (p200300f65f01db004d6a46a6454a1385.dip0.t-ipconnect.de. [2003:f6:5f01:db00:4d6a:46a6:454a:1385])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3cc544a33sm1349974a12.24.2024.09.05.08.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Sep 2024 08:39:54 -0700 (PDT)
Date: Thu, 5 Sep 2024 17:39:52 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Benjamin Larsson <benjamin.larsson@genexis.eu>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Lee Jones <lee@kernel.org>, linux-mediatek@lists.infradead.org, 
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, ansuelsmth@gmail.com, linux-pwm@vger.kernel.org
Subject: Re: [PATCH v3 5/5] pwm: airoha: Add support for EN7581 SoC
Message-ID: <64zfjgmc2dutmsukg2bxhb44k3wu2y7tt3h26hej7d4fx5nc7z@5zvo3hsucipc>
References: <20240831-en7581-pinctrl-v3-0-98eebfb4da66@kernel.org>
 <20240831-en7581-pinctrl-v3-5-98eebfb4da66@kernel.org>
 <yfqmlca6cnhrghpo5s6tml36tngmekcfbyjakxs7or7wtap3ka@7qlrxjowo4ou>
 <d9298199-fe10-4b28-8e28-dc252bd6832c@genexis.eu>
 <t2f5kockuvfi66qqumda6jxf5a4c4zf35ld5ainsnksavkchyj@kdueaqlhjoar>
 <b7e44fb2-6cf6-4530-a271-9e1730d4f431@genexis.eu>
 <xmlta4za6malgthd6cmt5fcipxgyzwmqwxqdg5e4qahcuqzcrt@eidsf6mexrkz>
 <a0a14b57-cc4e-43ef-984f-fb405949b41d@genexis.eu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4ikk7wbgmsrnb7sr"
Content-Disposition: inline
In-Reply-To: <a0a14b57-cc4e-43ef-984f-fb405949b41d@genexis.eu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240905_083958_114611_5B32ECBC 
X-CRM114-Status: GOOD (  20.68  )
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


--4ikk7wbgmsrnb7sr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Benjamin,

On Thu, Sep 05, 2024 at 02:18:41PM +0200, Benjamin Larsson wrote:
> On 2024-09-05 11:30, Uwe Kleine-K=F6nig wrote:
> > 1 second long pulses with a period size of 1 second, so a constant high
> > signal?
>=20
> Hi, I think I was unclear. The SoC documentation is not that detailed. Bu=
t I
> think I understand how it works now.
>=20
> One register contains the minimum duration (d_min). And then there is one=
 8
> bit register for the signal low period (lp) and then another 8bit register
> for the high period (hp). Per my understanding a change of polarity is th=
en
> just a swap of lp and hp.

that doesn't sound right.

A "normal" waveform with period =3D 10 ns and duty_cycle =3D 2 ns looks as
follows:

   _         _         _
  / \_______/ \_______/ \_______/=20
  ^         ^         ^         ^

assuming a monospace font that's 1 char per ns, the ^ marking the period
start.

Ignoring scaling, your hardware needs to have hp =3D 2 and lp =3D 8. If you
switch that (assuming you mean switching in the same way as I do) to hp
=3D 8 and lp =3D 2, you get:

   _______   _______   _______
  /       \_/       \_/       \_/
  ^         ^         ^         ^

which is still a "normal" polarity output as a period starts with the
active part.

I admit that's a bit artificial, because the waveform for

	period =3D 10 ns
	duty_cycle =3D 2 ns
	polarity =3D inversed

looks as follows:

     _______   _______   _______
  \_/       \_/       \_/       \_/
  ^         ^         ^         ^

which isn't any different from the 2nd waveform above if you ignore the
period start markers (which are not observable apart from the moments
where you reconfigure the output).

However it matters if you have a chip with >1 output that are not
independent.

> The period is d_min * (lp + hp) and duty_cycle (on time) is then d_min*hp
> (per my understanding of the linux api). This means that there can be
> different settings that result in the same pwm signal (if you double d_min
> and halving lp and hp the signal should be the same).

Sounds correct.

> This means that when requesting a period and duty cycle you need to search
> through the configuration space to find the optimal value.

Or restrict yourself consistently to something simpler than a exhaustive
search through the complete configuration space.

> MvH

(BTW, I had to research the meaning of MvH. In case someone else doesn't
know it: It's the usual abbreviation for "Med v=E4nliga h=E4lsningar" in
Sweden or "Med vennlig hilsen" in Norway; both meaning "With friendly
greetings".)

Best regards
Uwe

--4ikk7wbgmsrnb7sr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmbZ0L0ACgkQj4D7WH0S
/k5w+ggAhG/7cx2AC8jLk85B+JBlhL2wJdDDlAagB0gHc/M5PrmMLmMzMI0RoXJA
k3N0WNIK7uipsz8wWQLP8TKSzHS5Q94UE+6J7l1rTZX9iev8fuLDuRPV2pB3TtXo
o0b4P3QQDlB/Fo+WHBGijmr9EtYDbFwxYDDkZ+bg5P4+XmAIRRHEBy4QyP133+i1
1KBlJbVlqYNgh9UKqVo7+CZkmADApYkFskMjJeFS/rEtYfWbqRRijU31stgEaR1A
RhsNH6wnCOsTidBctYbl1QZ1iTnPhHElZKIqYOU2j6Ysrq4mBunVZSv9WZ2PDR55
IW/+aoHhp58nBftvSM+AO2NIWPC82Q==
=rwIW
-----END PGP SIGNATURE-----

--4ikk7wbgmsrnb7sr--

