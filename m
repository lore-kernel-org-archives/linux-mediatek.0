Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68B8BD44D6F
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Nov 2024 14:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ns1m01mlBn0TEXlYPEz7IqH4BJxD81zb8MxCwYwjObU=; b=lfIKtdZRIwGpGDxZtRscCfCFtK
	La8DOHh8rwP5E3DrTDmEvYxVduyimGP50mq3XS3v9jOZS3tXXKJNWGT/rVm5cXSKhxpa6dA/mfUFF
	AtedKcomch9Gj3cynSfDMVy2pQZxHu3uDHYWmzSpAv+hhqZtBEL8bHwS9l/Tjj8qkIZzSOKbTuAG4
	273EKQHrF6CzSzDUztzmpSozkUq+866c8Rxyr6/KvJH/EzSKiDChPRx0Loz41CVoWfvxtqsejcz84
	kbGex3VhSzP3HFGt6chXQXtwz1/7CNxmSPk/ZVp3nRUAaSvui9plb0/lihcdQyyWpk24Vx+pKCtjz
	661Ja+WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gan-00000003WYu-1JnD;
	Wed, 06 Nov 2024 14:01:05 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gLo-00000003TKs-15k1
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Nov 2024 13:45:37 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2fb5014e2daso61863421fa.0
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Nov 2024 05:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730900733; x=1731505533; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ns1m01mlBn0TEXlYPEz7IqH4BJxD81zb8MxCwYwjObU=;
        b=XwbLveN0Vrx97pwYOwNKDv/VdAAqqsAnK3vFVU3tt3KVyjH1Xf5LJ0WRuqH4z0okv9
         Yf174qeee2SFZIy0lQ33qG/4dHgQJdFXKIe/MmqVfzVK8irtutGkmB8At5CN3znpSD4c
         7dnvdEch/pnRBfepKkJZ3zZR1y8S7Av84c75V/k4/4Wbvg2EZUHsqrK8eUSND+0Lu5GC
         q2Lx7p5UzLmNHLZO+3T1PD3KeR65jPP3a2/aZ0tFiD9j+OgCHEG+HEBGig9zx5BUEPdd
         vsrdHzO+ZpBX/HXaLRIhWj31kgMQlyxSbN2Mt/yt2iTJuo6oc+BNJnBLcDrcousLhvVU
         Om9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900733; x=1731505533;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ns1m01mlBn0TEXlYPEz7IqH4BJxD81zb8MxCwYwjObU=;
        b=gWjcRTh/+ANKla8BVqOl0L5RcOBfVSpCptQ2YOtMPN6vEZwfxLBEYpPNw6ZDu1VLqL
         bjtMw5Tqjkym+XneklxGIudilpQicl7r+UY0qYVM6HnMRJtydKDT0MMexmS01XPPT9hc
         WnkQMjCruvArt7sTgVhk/wf0SYLDpqDEO0Edfu6DBxGAqcXLrtVUyKZ6p7/TSNIUj+hZ
         jtsu3wq0YqsVwdlDLvcmoYSDJ8/g3FPLNZFt5ldG62OmZRMx0abIeTjivstuYAhMZEF9
         JRgdPvQHINhxXNsvmxDGcfI0nx2KnKj1DauG4vuKoqmXI5ndR+0DOqW+75QMjyPyvcl6
         KXcA==
X-Forwarded-Encrypted: i=1; AJvYcCUQ37hLDgHGZKa5ISMzCPAxLi3q2eXA/U9UUeilXIfWsqO0oUbvSe2fRRHiMftF7gtEY3xozDVAJ3Eg//bGSg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz8Lc+20v2qyp9i+rANE3qUjodJw9C3ihnKBI2995rNyDKoN90
	TSWHrwsGNJEAK/C+EolXNnpO3ny4SHreWfp7X95zlbrOmUcSv+dJUFVKmIZsbtX+ckg8oaaaeeM
	xdE2rGO9/GtpWHzZ5aGROZMJ6Z/vJjZ9IU50VUQ==
X-Google-Smtp-Source: AGHT+IHvynIL7AAsGHjP0xg8VCy9NFb8IBkKD896d3DxIuwUkQ972HHVN3qYlfPKYVhD5LyxxH0ykk/nP4raab/ulSQ=
X-Received: by 2002:a05:651c:19ab:b0:2ef:243b:6dce with SMTP id
 38308e7fff4ca-2fedb770dfdmr103418931fa.10.1730900733100; Wed, 06 Nov 2024
 05:45:33 -0800 (PST)
MIME-Version: 1.0
References: <20241023-en7581-pinctrl-v9-0-afb0cbcab0ec@kernel.org>
 <20241023-en7581-pinctrl-v9-4-afb0cbcab0ec@kernel.org> <173088099542.3237297.18018729158887853624.b4-ty@kernel.org>
 <ZyssJpR7xwbMzUsm@lore-desk> <20241106110046.GR1807686@google.com>
In-Reply-To: <20241106110046.GR1807686@google.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 6 Nov 2024 14:45:21 +0100
Message-ID: <CACRpkdbf4Pb+n-F-K-JaUvytwCGUHHh8d2rYP4A9KgVTzqSnGw@mail.gmail.com>
Subject: Re: (subset) [PATCH v9 4/6] dt-bindings: mfd: Add support for Airoha
 EN7581 GPIO System Controller
To: Lee Jones <lee@kernel.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	upstream@airoha.com, benjamin.larsson@genexis.eu, ansuelsmth@gmail.com, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_054536_334342_45ED6016 
X-CRM114-Status: GOOD (  16.16  )
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

On Wed, Nov 6, 2024 at 12:00=E2=80=AFPM Lee Jones <lee@kernel.org> wrote:
> On Wed, 06 Nov 2024, Lorenzo Bianconi wrote:
>
> > On Nov 06, Lee Jones wrote:
> > > On Wed, 23 Oct 2024 01:20:04 +0200, Lorenzo Bianconi wrote:
> > > > Add support for Airoha EN7581 GPIO System Controller which provide =
a
> > > > register map for controlling the GPIO, pinctrl and PWM of the SoC v=
ia
> > > > dedicated pinctrl and pwm child nodes.
> > > >
> > > >
> > >
> > > Applied, thanks!
> > >
> > > [4/6] dt-bindings: mfd: Add support for Airoha EN7581 GPIO System Con=
troller
> > >       commit: f49f37f3cfe1482d4dc77d26f3e8c38eab630d52
> > >
> > > --
> > > Lee Jones [=E6=9D=8E=E7=90=BC=E6=96=AF]
> > >
> >
> > Hi Lee,
> >
> > according to my understanding this patch has been already applied by Li=
nus
> > here:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.gi=
t/commit/?h=3Ddevel&id=3D50dedb1eb1e6755ccab55f6140916c2d192be765
>
> An interesting choice.  Linus?

Yes I suggested that I merge patches 1-5 on oct 29 and applied the
day after:
https://lore.kernel.org/linux-gpio/CACRpkdYshPusdA7bDW2y8H_wp-Fm3N-YCsY1_Qn=
=3DdZqRiFy12w@mail.gmail.com/

It's because the bindings are dependent on each other, this one patch has:

+  pinctrl:
+    type: object
+    $ref: /schemas/pinctrl/airoha,en7581-pinctrl.yaml
+    description:
+      Child node definition for EN7581 Pin controller
+
+  pwm:
+    type: object
+    $ref: /schemas/pwm/airoha,en7581-pwm.yaml
+    description:
+      Child node definition for EN7581 PWM controller

Those refs will explode unless the two others are merged at the same
time.

Usually we merge the whole shebang through MFD but this one felt
different because there is no actual MFD driver, just using simple-mfd.

In hindsight I should probs not have been so trigger happy and give
some more time for this to settle... Merge window stress I guess. :/

It's fine to apply textually identical patches to two trees though as
git will sort
that out so technically it's no big deal, you can keep it applied if you
want.

Yours,
Linus Walleij

