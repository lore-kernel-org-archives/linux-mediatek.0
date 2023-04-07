Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73BF8C6FD1D
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 11:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhp1D4MU620tEuYfWwD9BEmVsWgqQus92qBJwjtxDro=; b=0qnXBBZPPZqWk1UyCf2XUE2N3M
	xuZaj6JZ5eFKpoYm0PgjO0E24Wt0uzqcwBtrEoux/WKUBjCgsEJFAQsMD/k4PMh/bWbLJVFWRe3KU
	7p+VP/2ZPSzuRAB7fAyaWTD6G/bPE+PSks7vNE4P/3njI5VDh/y/9mSwH7gYZw9Q1N2d3TQxFwTgi
	xUXvUQYnuD/rnn9wz0F3ZW77FhY7Fd1sGyxdOzky6+6ELtY7adhflvA+7iOVCNTS3eKI9H1zQtJXV
	DCo4wGqzu+zpMiWxMOGu4E3DZpj0aSdfuAIRR06BME2lDb/3Ij23SFfzrR9WwR87EqwAs6k8xyR/B
	jIkDx5tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkkSZ-00A6y7-0I;
	Fri, 07 Apr 2023 11:40:51 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkkSV-00A6x4-01
	for linux-mediatek@lists.infradead.org;
	Fri, 07 Apr 2023 11:40:49 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-54bfa5e698eso124946547b3.13
        for <linux-mediatek@lists.infradead.org>; Fri, 07 Apr 2023 04:40:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680867643; x=1683459643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bhp1D4MU620tEuYfWwD9BEmVsWgqQus92qBJwjtxDro=;
        b=fFvwxikqEAeHJ1MyF6Mjcy5mzl2OJh63dIxaAB2Eh3YcjM/Owu5lHKJFBUE6cx53n5
         ge0hlhxbz5JCzOGC7sqHExwugQIn4P86tbebsNoAdBAAZk2t+4qGBnT3jA9uveXp3r3L
         bhnpYubAipVh0F7oIPpqBSXO3s1J/fsCFbJYA3V8qR9HtOW6umbqHOrD/IH0kF9hou+9
         Rgcn2cuompVeamLBt3NAPLr1/jiDxRJVX8kZyxeZphYp1Dmme4IHcxzSlWV2WvMAVLUm
         hTBdY3mZ3//C/vmRayZFAwxnXHagHtuuxkHBEuV0mhQCaMg+UxDguJHFP45fw1kaLBiA
         Ukxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680867643; x=1683459643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhp1D4MU620tEuYfWwD9BEmVsWgqQus92qBJwjtxDro=;
        b=eFL7MT+5kZrUtCBYJfDgeolSG7w6crhUqurPq9NLYPNuiBWhcRBn3rfxQsr9zpAaoz
         nVDQzVh0OJbybrOkgn47z0mCFsFVOuohAYBujPFC5RanQ0M7RJ9SSyMNvo7ri6bhLCh3
         1+RpZMBUDEPbo7efPav9iO9pblKR7B7IJIG5CBgpCuYGqSGncsd2D6u7BE6jkJqTVvQC
         xstLJD+kocLJSx/RKRbjVRGHloQsSQOUZcBknYvV4cDU/YDnjP6j5R65jch0gFPlNb27
         8cX0QOD+D7WlgU1c866nGcvGLIJh6KR0tuAwwVsuuYnj21eAg4ve8gyQk0qKRYi67Vv7
         +How==
X-Gm-Message-State: AAQBX9eXqKfIXq4F5S4KJ3jgBhrb6ovLn1/Il8t5F75ea4iylF4YmEbM
	x16hRlFvLsj39eav10Pi6RuLLCEaZ/baOjk/pKnUYQ==
X-Google-Smtp-Source: AKy350YoGyPsHOTAa1wet0tacy28TuEIoDXiA/LQepBDm7Xcz7qo6pPhP3CKaVtCoIyN9Fqb7B2gwVZJiToE8OVA9L8=
X-Received: by 2002:a81:a783:0:b0:545:7143:2940 with SMTP id
 e125-20020a81a783000000b0054571432940mr1022815ywh.0.1680867643596; Fri, 07
 Apr 2023 04:40:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v4-0-5cffe66a38c0@baylibre.com>
 <20230203-evk-board-support-v4-2-5cffe66a38c0@baylibre.com> <CACRpkdYSpMD-V0QNGwtiKCA4KAedYfmFpvdCHWhjST9uTricTg@mail.gmail.com>
In-Reply-To: <CACRpkdYSpMD-V0QNGwtiKCA4KAedYfmFpvdCHWhjST9uTricTg@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Fri, 7 Apr 2023 13:40:32 +0200
Message-ID: <CAFGrd9ox3BftUxPai8WhWgf5UefTwnqnLsdo8kUHMYphB7nOTA@mail.gmail.com>
Subject: Re: [PATCH v4 02/11] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_044047_262976_0FC358DF 
X-CRM114-Status: GOOD (  13.14  )
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

Le mar. 4 avr. 2023 =C3=A0 15:55, Linus Walleij <linus.walleij@linaro.org> =
a =C3=A9crit :
>
> On Fri, Mar 31, 2023 at 7:55=E2=80=AFPM Alexandre Mergnat <amergnat@bayli=
bre.com> wrote:
>
> > This SoC is able to drive the following output current:
> > - 2 mA
> > - 4 mA
> > - 6 mA
> > - 8 mA
> > - 10 mA
> > - 12 mA
> > - 14 mA
> > - 16 mA
> >
> > Then drive-strength property is set with enum to reflect its HW capabil=
ity.
> >
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> > Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>
> This patch does not apply to my devel branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/=
log/?h=3Ddevel
>
> Can you please rebase and resend?

According to your suggestion on the other serie [1], I rebased this
patch and added it to the other serie [2] to simplify the process

Regards,
Alexandre

[1]: https://lore.kernel.org/all/CACRpkdYndXqTXrTakwv1mbvJBs-tG+pjOpLLCgS9c=
rE0aBj0jA@mail.gmail.com/
[2]: https://lore.kernel.org/all/20230327-cleanup-pinctrl-binding-v3-0-6f56=
d5c7a8de@baylibre.com/

