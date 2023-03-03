Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94C9CC64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 06:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A7cWEU8HBpDT1/6MmuaACtH+747N38odJNoAvMZIW4s=; b=RzmgWZYPBtjv0x
	XQV5s7bqTYlq2ISPw4DwYbxq5AWehdItgQkfZWE6AZXIVzDgFUfpIiEg64QilbA8TRJsD11Mevg4X
	a0KnsBc/q3xLZchwyhuuSlhgZZ9ck/vHGyHIFIqH5eHqhHKZZ4QuohShREsujqWgTB3bARCmUwgie
	x5e8FV9yALehuvHrGmDIBMrhV/bjuNWETI/u9zQDqtQxmx21Vnup7YyzjBjvFiTAQ1cRzcR0NR7Wz
	JlckbPbQd3POAfI0IwqoKlQCNBNTDRj7wVjSU1B7/lV+ZucrIUzATfZWgLc8+bZR0fv6UUdUxH+e7
	bXlhMiWQIl//LmFW7f8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXyWf-004yEs-Ou; Fri, 03 Mar 2023 06:04:17 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXyWd-004yDF-6D; Fri, 03 Mar 2023 06:04:16 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-1720433ba75so1926730fac.5;
        Thu, 02 Mar 2023 22:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677823453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A7cWEU8HBpDT1/6MmuaACtH+747N38odJNoAvMZIW4s=;
        b=lntsTFtRjMy1nyd93DsrcqZAzV1bTRlQHP6iITP0XPKXdojIbqW5WNueotKkBSnlO1
         80GjhDWuJwU0kI4AoB5HDXIdABnrWkEXkZL0m80SQBAOYzlSt9gZPZfGsovAuTAg1dSv
         O80SIUoNzhr3fZn0Ze6PMjEmkF1jzyakq6wNA5BNEnaqvBKrGzkW6ovipE7nERBTTjVX
         Zc0BgNzchzDiJOsXQA2zcvVN20R463vvQP5nUzS3CeconZyFIe2bCxBXEWEeRkjzW8Ml
         TABoP40WtnVJzBVkSa9Bs8CBrpB5R3nLop5JAtix+6JH2dB5YFErtQhbfD5kTF7rfjzz
         FZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677823453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A7cWEU8HBpDT1/6MmuaACtH+747N38odJNoAvMZIW4s=;
        b=8NdDj+yG5Vj6md47+NzW/ksvM7tqa/jTGy48wB70rsXql/8XgVL+9cDCcFINfqUzHi
         h/66g0CxyuKKlCtYRMgnWUHcFmlCHIanYx/bxjP0oSxlWGTi343oAuKXadhyzNVronZP
         GpUmSyk7LdAYEVVLDZCRT1rCJKvo3Z7mWNPzXWoqevTzd1IdoNACQXDrwqlWC4xrbgVJ
         gPjKqKo1g4YR93aee2B52tUOWnnyGVK0IFlijOruKhGbry1A58OqycrsdYtpGZF3DfnH
         z1yk7KTckA9a6/QDrX8jguA6wfbTwKZLPyMK5bzyr4VvP5aoe4z5b2zpzOfhRED9frys
         8Hjg==
X-Gm-Message-State: AO0yUKWNZFMg2/Nj/1t5WIEkx+c2ZYKY1rLjtCly3r39BNWIYgiA7483
	fgZvSAe3VbidechlakwR2fCAdOgFK7qgZ0TXPSc=
X-Google-Smtp-Source: AK7set8poKz9lmsr4x7Pzww0rh+JcHA/O5B1fvAZHniZfyEHHNU5hGFb/a4ovY5xGj1iTGUZoY9D+1fIUZNTHc0x+J8=
X-Received: by 2002:a05:6870:8c2f:b0:176:45a7:1ec0 with SMTP id
 ec47-20020a0568708c2f00b0017645a71ec0mr252872oab.2.1677823453219; Thu, 02 Mar
 2023 22:04:13 -0800 (PST)
MIME-Version: 1.0
References: <20230303002850.51858-1-arinc.unal@arinc9.com> <20230303002850.51858-5-arinc.unal@arinc9.com>
 <CAMhs-H9qVE0Z23Z3J8D1voo5UaKZrjUYU=7V=oRMd8=vVGASAg@mail.gmail.com>
In-Reply-To: <CAMhs-H9qVE0Z23Z3J8D1voo5UaKZrjUYU=7V=oRMd8=vVGASAg@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 3 Mar 2023 07:04:01 +0100
Message-ID: <CAMhs-H9kPMsaMHJx703qSS4fxZh_KyGib+VKf9DfP0s085O3Mg@mail.gmail.com>
Subject: Re: [PATCH 04/20] pinctrl: ralink: mt7620: split out to mt76x8
To: arinc9.unal@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_220415_271307_AC7D997F 
X-CRM114-Status: GOOD (  12.81  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, William Dean <williamsukatube@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 3, 2023 at 7:03 AM Sergio Paracuellos
<sergio.paracuellos@gmail.com> wrote:
>
> On Fri, Mar 3, 2023 at 1:30 AM <arinc9.unal@gmail.com> wrote:
> >
> > From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> >
> > Split the driver out to pinctrl-mt76x8.c. Remove including the unnecess=
ary
> > headers since is_mt76x8() is not being used anymore.
> >
> > Introduce a new compatible string to be able to document the pin muxing
> > information properly.
> >
> > Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> > ---
> >  drivers/pinctrl/ralink/Kconfig          |   5 +
> >  drivers/pinctrl/ralink/Makefile         |   1 +
> >  drivers/pinctrl/ralink/pinctrl-mt7620.c | 257 +--------------------
> >  drivers/pinctrl/ralink/pinctrl-mt76x8.c | 283 ++++++++++++++++++++++++
> >  4 files changed, 290 insertions(+), 256 deletions(-)
> >  create mode 100644 drivers/pinctrl/ralink/pinctrl-mt76x8.c

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

