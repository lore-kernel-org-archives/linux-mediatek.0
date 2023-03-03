Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10927C678D4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Mar 2023 06:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yzua8Cl3tTCME8NV0mhnsS8EW+rjsfEa0ZFN10SsFgI=; b=fnpGElNILsScHt
	M0Kzr9b8beY9IAeVSOOc8vFKi67igmqj26fn/dRmcN8xRV2shET1tgTymV41qifkSQGcq9HizpIdn
	Ey/EClmqy8UptOb/g1Ex4wBFVq7jro4YzkuvrmtxZp7BYb5WVOgZocu46b+n5R2bf3+uiAZsKSEUW
	filsUa8maCwPq7+5TuyVlzo/FrnoeZPuFOQsJ4EinfabV6iTyPld4RCWkebks0dT21xGzJGjzw2RS
	gBeb7U90iyJbjpoerBegFgvZ2LH7HINfp/5dyCUCVKUndIbsZuhKshMkjmZkcjMRtTkUjXZcG3nO8
	UHOkoLgi9KIcFEKjhuUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXyU9-004xSU-VL; Fri, 03 Mar 2023 06:01:41 +0000
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXyU7-004xRj-P0; Fri, 03 Mar 2023 06:01:40 +0000
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-17235c8dab9so1906341fac.7;
        Thu, 02 Mar 2023 22:01:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677823297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yzua8Cl3tTCME8NV0mhnsS8EW+rjsfEa0ZFN10SsFgI=;
        b=eQB3BdL0G3eGddPb3oLdFcwtaZIBLTfdPVUPniwQMa5xxFxvJ8BHaiZETRafVsbKNm
         J5/jmq/LD03N6eg3F7fTtYWnZY7M25YDGDfjKR6yhUzShRGAmBX/2I6skcKoYO5T5NmG
         szD6UW2qmjgRW1ZgJHUUM4g/9UCRZ0jx2P+s1BrTUNwA9dcYdMkch/RS05fjI01Eao3f
         HgS6K2uHrfjNZjAn8mzA4I73LuagoM1Ag9a+sCgYC8DrxSZizy92c+BBAZ1HxbF13fwT
         iRb5nW98pW04qu0h+T9NB2R3uUwVPEEdPmXsjGIJOKtGb7Vw5s7fu3iU/jQpZ4qfju9E
         ylyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677823297;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzua8Cl3tTCME8NV0mhnsS8EW+rjsfEa0ZFN10SsFgI=;
        b=sxKjfp+WvMavRr+m5gQZLgwmzSl0U9sRaSkTMlmkHdSueTamT15eymIOTexkhK/YXa
         Bu6uWNCChf3RIbKmtUydLD3UccMx/D3qYTJ8foNLdiJtTSllw+sGc5jfTrryEzCOsW3H
         m9u/7OxTw+bnVKi6HuWOuvVOFLrvndlG3Iw8jvV9JWsGEufuT+4qD+vJRqkviDmIM7Ye
         RXZhzHqfSaJYaGmNYWf+6GL1QE2sUKHY5btIEVD7NCxUzUS+rINgtpH7XjKBu4lnfWna
         5ZgFZIt3ebB+JM8nYy+Su4p+0ySiRwpT4PU5XnW2VvBsJ4NEpZY1+vJ+SQjAp4uONcdj
         8hmA==
X-Gm-Message-State: AO0yUKWZoeP8+7oVgdhofrBHhLmn7yMD7oI8IH/2gEjDIILN+LXe5lL3
	b3qr8+KPOmQ1/nHKA92obTZnbdjlH8LgdIs5x8U=
X-Google-Smtp-Source: AK7set+Hmjz9vN1HtENmntmfhawOBSotKp4hgtaGKlUZ90N9OjYAbSyofATfoSrd9YzuoyrbUtSJk2leiTy4YselH2o=
X-Received: by 2002:a05:6870:d346:b0:176:2168:12a2 with SMTP id
 h6-20020a056870d34600b00176216812a2mr234510oag.2.1677823296922; Thu, 02 Mar
 2023 22:01:36 -0800 (PST)
MIME-Version: 1.0
References: <20230303002850.51858-1-arinc.unal@arinc9.com> <20230303002850.51858-2-arinc.unal@arinc9.com>
In-Reply-To: <20230303002850.51858-2-arinc.unal@arinc9.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 3 Mar 2023 07:01:24 +0100
Message-ID: <CAMhs-H98FoBN+B_A0wgwtmSpgZ93YakEtEL6Yf+KwUyoSzhK5g@mail.gmail.com>
Subject: Re: [PATCH 01/20] pinctrl: ralink: reintroduce ralink,rt2880-pinmux
 compatible string
To: arinc9.unal@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_220139_847067_8C22FE33 
X-CRM114-Status: GOOD (  10.41  )
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

On Fri, Mar 3, 2023 at 1:29 AM <arinc9.unal@gmail.com> wrote:
>
> From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
>
> There have been stable releases with the ralink,rt2880-pinmux compatible
> string included. Having it removed breaks the ABI. Reintroduce it.
>
> Fixes: e5981cd46183 ("pinctrl: ralink: add new compatible strings for eac=
h pinctrl subdriver")
> Signed-off-by: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc.unal@arinc9.com>
> ---
>  drivers/pinctrl/ralink/pinctrl-mt7620.c | 1 +
>  drivers/pinctrl/ralink/pinctrl-mt7621.c | 1 +
>  drivers/pinctrl/ralink/pinctrl-rt2880.c | 1 +
>  drivers/pinctrl/ralink/pinctrl-rt305x.c | 1 +
>  drivers/pinctrl/ralink/pinctrl-rt3883.c | 1 +
>  5 files changed, 5 insertions(+)

Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>

Thanks,
    Sergio Paracuellos

