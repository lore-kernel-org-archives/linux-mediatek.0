Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E1EEC61DA4
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Mar 2023 08:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pvx2PL8LGDK3W8+E79pZBCoBzTKmBaY+LVdR8n5TD/g=; b=saEKjdqYfvrbzyKsqz7dSTlIzt
	N+TCASUX9h9mYivuiqI7jml8J0D4SRN0mBRmUG8l9WbI5AXXP9Ho3o++xZNwF2x9r954CL96clOhf
	7A72UytZymdZWs8Mb3lshmgqWKfJN9DauGbwcwSKr/F7gNANJL9gxkeWNklOldD9YeCN9FUgpXTvr
	NFI9RaAhDEoBH89VNQkek3Ex4cyFWZ9mGWM0NLZG09btJbQmZipa/Z6ECecLAkFxOBkh/zoE4FnCp
	omP8doo6EDaZvbUFcQ5iYhWbyurUWzaXe72kg/d1MVAI0HIt9SJJ43S/Sh+cnYWoEU/Fz70PHDAbx
	xs2B2URg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcMEJ-00Ckzh-2D;
	Wed, 15 Mar 2023 08:11:27 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcMEF-00CkyC-1K
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Mar 2023 08:11:25 +0000
Received: by mail-yb1-xb36.google.com with SMTP id y5so2044193ybu.3
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Mar 2023 01:11:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1678867882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pvx2PL8LGDK3W8+E79pZBCoBzTKmBaY+LVdR8n5TD/g=;
        b=MADLCMC7roVI8wwfAlxv6wEFm5zfJjNwB3x2CYtI/1xlOad5kMNBsm+9wMB1y2vb/o
         426UTDd7tLaZlGxGEGQB3jyu+LNU4kQqXlnpSD+KWHAjH+q+iFRib6Q0dD4YXaiFRA9F
         QJkGlLx0mO6VNDaY7KeG+RLoj94r8PqDhp5SHTCBLH5VUzQwtcN+F+pJcUSpGDj7Mpjh
         1sPr3i+6R1l53pYS2+ib2V2t6wEj0Y9G72h6mYJtyVwBjDOXecFbWxOtIRf1FwKzNMzM
         PgFzBGDqHoyXvW9VlzHbIo5zLl0wM5Z7Y8/oAoa/DrA2ApWE4tGM9BTkxkT72lfvtcPy
         4LmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678867882;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pvx2PL8LGDK3W8+E79pZBCoBzTKmBaY+LVdR8n5TD/g=;
        b=DKZILCWVwFJSbBO6zJ8foYTFYfLJ5Q0Be4xylIWLyOymYgoJEhNNz4OGLYvklVM5bc
         EdpupohIkbiFCe+IcaQ1xNRkrnMBW9OaXgQ6ZVDk2uxtyNmxiWsrxGX46/1H6vyUjfOn
         U07oK2apwz7C16Su++UlNPviwSj5BLxLdqiJ6NUq8ljI1EWZESAGxAI82/1fRsD6zddZ
         mBmLyvwxqoS+nGXbDYXw+MB2xrggeKFBb67s3v87I8+BEflwfDsQhxDPXFgebn31+vI5
         aAVFSFoIG75MWD8FCgslGo1NqJqNL4Yo/OTUPr+wk0tjczWjm5Mav6uXr2R+YyRJPz7K
         5qvQ==
X-Gm-Message-State: AO0yUKVAKoPjXjYfg/Akltqw9va66r9/v6PiR/g+OcxojxdYJO1f5teH
	d4ejdRE4Cq3g2pqg34Ck5H6AC8KqNQ0xO6FPkM17fw==
X-Google-Smtp-Source: AK7set9A2zYI6pMRgNbXuK7nABMIl97HViLafw5PcRY262FGkwm8Z05z1Fr8by8LQaDAAqC5HXIwCelI1ertWu8vEmg=
X-Received: by 2002:a25:8d89:0:b0:b33:531b:3dd4 with SMTP id
 o9-20020a258d89000000b00b33531b3dd4mr8108839ybl.1.1678867882064; Wed, 15 Mar
 2023 01:11:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230203-evk-board-support-v2-0-6ec7cdb10ccf@baylibre.com>
 <20230203-evk-board-support-v2-3-6ec7cdb10ccf@baylibre.com>
 <3b7c6f28-57bd-33de-5531-8c4eae8cf6eb@linaro.org> <6e08d78f-ef4c-b228-f7d2-d63767ea87b8@collabora.com>
 <62ed2988-2347-9fd9-82f9-6dcc9ae75808@collabora.com>
In-Reply-To: <62ed2988-2347-9fd9-82f9-6dcc9ae75808@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Wed, 15 Mar 2023 09:11:11 +0100
Message-ID: <CAFGrd9rZxwtxx5f8Gp35-5152EPGiyEdZjps1Mhn5bL6QfufnA@mail.gmail.com>
Subject: Re: [PATCH v2 03/18] dt-bindings: pinctrl: mediatek,mt8365-pinctrl:
 add drive strength property
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Zhiyong Tao <zhiyong.tao@mediatek.com>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linus.walleij@linaro.org>, 
	=?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Chaotian Jing <chaotian.jing@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
	Wenbin Mei <wenbin.mei@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	linux-mmc@vger.kernel.org, Alexandre Bailon <abailon@baylibre.com>, 
	devicetree@vger.kernel.org, Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, Fabien Parent <fparent@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_011123_450932_56B126EB 
X-CRM114-Status: GOOD (  13.25  )
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

Le ven. 10 mars 2023 =C3=A0 10:49, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> a =C3=A9crit :
>
> Il 10/03/23 10:46, AngeloGioacchino Del Regno ha scritto:
> >
> > Anyway, Alexandre: can you please perform a cleanup to the MT8365 pinct=
rl binding?

Yes I can ! :D
Should I do it directly in this patch series or (I prefer) in a new one ?

> > The cleanup means you're setting mediatek,drive-strength-adv as depreca=
ted and
> > adding the right properties (...and possibly changing the devicetrees t=
o use it).
> >
> > For more information, you can look at commit history for the (unfortuna=
tely, named
> > incorrectly) MT8195 pinctrl documentation: bindings/pinctrl/pinctrl-mt8=
195.yaml
> > where we performed the same cleanup that I'm asking you to do, except w=
e didn't
> > have to set any property as deprecated because there was *no devicetree=
 upstream*
> > that was actually using that property (hence not an ABI breakage).

Thanks for the information, that helps.

Regards,
Alex

