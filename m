Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3091C64EC4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 08:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E7QpGfrYtcv5SGcNl5G4v9Xn9QWnRvb8nIvOqr78+os=; b=SR9DgWD4/St4ru
	seRESUw4oFdU0halE0nNzu3MzFhm/xMV7KHZay9m1pFCsiVl4+sAs23VrEPiwb1iwyWVcUFiDe8Ts
	LpaDYyRzgVV5MyEaQ6DbDm98teuBB84OtQOUhOKpkVgTmjyGANV8K+jpYmsVbd6fpaIQG2uN1wMYN
	pT4uuRZTQPAAcN6z8zjR6ygXFZycmRUcmL+jSn0aaOYoklRKZyPftXiBhpgweGa9s5lUH5l8AJ6Ti
	M2ESjlVj+DbV6AYdngkfn1ysSnnl5hm1z80E2NErDkdYxpVRQT3GlHcf0QJUJOzgG4WFqN8MWxt+F
	g8FvJcG7T2/d55O6JMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0RW-005KSj-JE; Fri, 03 Mar 2023 08:07:06 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY0RO-005KRH-7D; Fri, 03 Mar 2023 08:07:05 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-17652f24da7so2155686fac.4;
        Fri, 03 Mar 2023 00:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677830816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E7QpGfrYtcv5SGcNl5G4v9Xn9QWnRvb8nIvOqr78+os=;
        b=k7guXsPHeVoVD+Vbixqv4M6ny4qAnlteCS7f3M/a2QWY9ket+idPpZzazOjWV2xChB
         BM6JK1W8/zLYHqNDb3qfeFY5gw2/BKSJqhcoL59AlX+Mf5dpmvpYCcH0FnYXkDrhGnyG
         oABzxSh7fVn3sAANt/8eywGVPg37mPIC/MK+pQorBKrf6sJROHwznMgt44cyQfsMaFuY
         NxJ5n27phnIZhvv1z3q9cC1JpfLOyYz1W1Fmc44sF9FlCS1nWTyY/+Niy8p9X3XOws1C
         BqOfpWurRWpxgA//uFIjk8m0vaZ63XJ3Uyp3sc8MOLCP5qoTKJjlOhn86d4k3ar4Iebi
         NCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677830816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E7QpGfrYtcv5SGcNl5G4v9Xn9QWnRvb8nIvOqr78+os=;
        b=sCPJmbUJ3BOA7+K1uwgcpmwtrS4ccwsZtHT0DrcH3YYfricts89q+WTKFZpElPxgKo
         o3ZPK/XqRhC74CSJvtYJxnj1edpYn0BSDGJnUVaByZCGWcAf/XwqRYFjLeGPAWEf1yu0
         lhx8sdL695wC1HETRQbEYaZ9t8m1zfIUHN6HQg0j+fAPIM0tPX8wCYMA+8Aa2pfyKQey
         lrGHx+gQY+9/jNsY9fjC2MbVrVPrAlIjAQSr86I86YM6FriaMhY2eNsAjHgSaTjw/rYl
         i7TsA2L9tY0W2l1tGZBFukyoSXJHaPEYQaQRNN/Ieym7hLFhtUmMxfeIKWjnHX9k48rQ
         CCXQ==
X-Gm-Message-State: AO0yUKVFb1czrS/sQ/wIwUsbXW7NBrXG+iaShFvs82oKv5P+D49V5Hy7
	ZSLmv6uPkibsgQhjeJZz1ud2C6V2TehG7cpvI78=
X-Google-Smtp-Source: AK7set//qZ7/g6AGTDdSDk92EyeB6C/kVGk1Ak8YIBBkbU9XgYc6bCZY9NyCH6NF2bQsATm6DpVeTt8gOTYu3yGQd24=
X-Received: by 2002:a05:6870:d346:b0:176:42a5:a544 with SMTP id
 h6-20020a056870d34600b0017642a5a544mr246286oag.2.1677830816060; Fri, 03 Mar
 2023 00:06:56 -0800 (PST)
MIME-Version: 1.0
References: <20230303002850.51858-1-arinc.unal@arinc9.com> <20230303002850.51858-5-arinc.unal@arinc9.com>
 <CAMhs-H9qVE0Z23Z3J8D1voo5UaKZrjUYU=7V=oRMd8=vVGASAg@mail.gmail.com> <b6dae90f-2c2a-3434-9995-527f33533730@arinc9.com>
In-Reply-To: <b6dae90f-2c2a-3434-9995-527f33533730@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 3 Mar 2023 09:06:44 +0100
Message-ID: <CAMhs-H9RhKjkKa3YoXfOjtzJxTth5ZhTPG3aLp7mT_qmZ-3QiQ@mail.gmail.com>
Subject: Re: [PATCH 04/20] pinctrl: ralink: mt7620: split out to mt76x8
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_000658_308287_A67E2CFF 
X-CRM114-Status: GOOD (  13.50  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, William Dean <williamsukatube@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Mar 3, 2023 at 8:53 AM Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9=
.com> wrote:
>
> Empty mail?

It seems it was :). Sorry, something weird happened with my fingers
while typing, I guess...

>
> Ar=C4=B1n=C3=A7
>
> On 3.03.2023 09:03, Sergio Paracuellos wrote:
> > On Fri, Mar 3, 2023 at 1:30 AM <arinc9.unal@gmail.com> wrote:
> >>
> >> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> >>
> >> Split the driver out to pinctrl-mt76x8.c. Remove including the unneces=
sary
> >> headers since is_mt76x8() is not being used anymore.
> >>
> >> Introduce a new compatible string to be able to document the pin muxin=
g
> >> information properly.
> >>
> >> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> >> ---
> >>   drivers/pinctrl/ralink/Kconfig          |   5 +
> >>   drivers/pinctrl/ralink/Makefile         |   1 +
> >>   drivers/pinctrl/ralink/pinctrl-mt7620.c | 257 +--------------------
> >>   drivers/pinctrl/ralink/pinctrl-mt76x8.c | 283 ++++++++++++++++++++++=
++
> >>   4 files changed, 290 insertions(+), 256 deletions(-)
> >>   create mode 100644 drivers/pinctrl/ralink/pinctrl-mt76x8.c

