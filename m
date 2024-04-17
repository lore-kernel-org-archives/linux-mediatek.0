Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0C3BC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 16:20:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=taaoAprv/l78nPfrpJUaaECkLiisEqHYV1iSW1K7qDE=; b=V51GqQ93K68tV5GAopojnxqcgc
	hRA+5yq5rJtQHS27xUvZK6bZMUW1kD79sqDfUe6XuBY8yLpOvHx+cQDIWy/5JVwF3dIi4IW+e4AB8
	2TiJrGAJWsSl6J4HIxxbuq2b2kZgq/wZcNPVy/WZ4J2l6ZaFimzmDoLzaBvQFLhWoFkvJPLnG2vZX
	1D02mTRq9FwfDEbSGh5dYs6Z0XqUyxqh/TTcbt+yVpHmUXdFQE8QVfZrUZfykxYUlEnCGnZhjcPIV
	iatXahyRbPhTE5OeUNr/Vw2Td0sb0lPDdGt1eHvyS69zMMRKiwxib90CFYzTz0lYZfvMaLlfuMUT4
	+CERbZgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx80z-0000000Gmjx-1tQo;
	Wed, 17 Apr 2024 16:20:05 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx80p-0000000Gme9-3p3k
	for linux-mediatek@lists.infradead.org;
	Wed, 17 Apr 2024 16:19:57 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-5aa241232faso4973480eaf.0
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 09:19:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713370793; x=1713975593; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=taaoAprv/l78nPfrpJUaaECkLiisEqHYV1iSW1K7qDE=;
        b=Os905m/5ens8WyuLx89D/3JofMAQGAcBaJElDpqKM0lA7hTZTC7TNco3KP2qM/o+xK
         7CfRc4v+nIgPIq90617cFul905eCDoMhmD70hZqECSHhySV7Djh7B49jwzdXXpNTehua
         smmKZ7iuP9Dl3zGf1TK38+WUL75URZMwcSgZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713370793; x=1713975593;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=taaoAprv/l78nPfrpJUaaECkLiisEqHYV1iSW1K7qDE=;
        b=krX6pZyOLyyjMvR6x+uy7uSASiH33psvMMtF3c/BIGrFktWQHPI9nAKvsocostWrn0
         GEQqEdn8Rq2NOUDvHc38B9SJkTXJxG/oiVaOXv/6lMyIGC+djNYOgdaxsbH1rI51Kzg+
         y6np1AxowMhMCGv+AwymPmhkHnFm8dSODkiZ3DOXwSNrr2aETDh/kMlnopCyoQnGG8OF
         i5/Bqa14l5mxN2saLiRS6s1AmNn91I6jvTE1tMkaJfUYxXZV/pDtRCb6oMm4L6V3watZ
         2EmwjhpYpBXprUBep8Ovs9aGzuM8ar8sczHxlOAZ5M4fkFJj7QxVf9mZKwKSZ4muoQWu
         n3UA==
X-Forwarded-Encrypted: i=1; AJvYcCW3IexEb9H+961OQF7XjgvlyS2FC2HuX8W9F0P4GkdyV0LSjsK9QJNIdJWbmJ+750WA8yvfaHP5iZDge0OhYZpokGfbNPwxEOpgugC4T5OtthPp
X-Gm-Message-State: AOJu0Yz/PgVpMMOEwQSfd8jK+AYGyF61IFqARkmNGBTQpHHf499FKCos
	+YF62w/MahPKlNas3MqW2nNcTO2Tp5+2Hmg7tcBVCPD9YFmKbTEMbUvCC1jn56848Z2dD6YZs5g
	lMw==
X-Google-Smtp-Source: AGHT+IHRV/vl5/j8eKD0NOwbwvPAfVmdKZrslYkQtnBVysvbXsbvAQGl4ndRY+wyT8+idmIY24mK3g==
X-Received: by 2002:a4a:c5:0:b0:5ac:9f22:2686 with SMTP id 188-20020a4a00c5000000b005ac9f222686mr90457ooh.5.1713370792749;
        Wed, 17 Apr 2024 09:19:52 -0700 (PDT)
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com. [209.85.210.41])
        by smtp.gmail.com with ESMTPSA id dk5-20020a4aee85000000b005a4799f5428sm3111683oob.21.2024.04.17.09.19.52
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Apr 2024 09:19:52 -0700 (PDT)
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-6eb6b9e1808so2499459a34.3
        for <linux-mediatek@lists.infradead.org>; Wed, 17 Apr 2024 09:19:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUaY/eLcTMn0fNYlfATYRb5AGgR8hpAUxfuXO+O69avGPk8C46aXkjBvCMREejifu+4v6dyIKyXapTTo/sSUIQr6GNGltGX43m89kN8Q08QB0Gi
X-Received: by 2002:ad4:4f23:0:b0:69b:5445:6ab0 with SMTP id
 fc3-20020ad44f23000000b0069b54456ab0mr19079283qvb.46.1713370770447; Wed, 17
 Apr 2024 09:19:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240415-fix-cocci-v1-0-477afb23728b@chromium.org>
 <a003494c-a1a9-4fcd-83d8-766a75d6bbb2@moroto.mountain> <20240417155112.GQ12561@pendragon.ideasonboard.com>
In-Reply-To: <20240417155112.GQ12561@pendragon.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Wed, 17 Apr 2024 18:19:14 +0200
X-Gmail-Original-Message-ID: <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com>
Message-ID: <CANiDSCs_qOXkhzuL+cFhpw0hvFMwU0TYyN2B5ZdAStb96TTKFA@mail.gmail.com>
Subject: Re: [PATCH 00/35] media: Fix coccinelle warning/errors
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, 
	Martin Tuma <martin.tuma@digiteqautomotive.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
	Hugues Fruchet <hugues.fruchet@foss.st.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Sowjanya Komatineni <skomatineni@nvidia.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Hans Verkuil <hverkuil@xs4all.nl>, 
	Sergey Kozlov <serjk@netup.ru>, Abylay Ospan <aospan@netup.ru>, 
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Dmitry Osipenko <digetx@gmail.com>, 
	Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, Vikash Garodia <quic_vgarodia@quicinc.com>, 
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konrad.dybcio@linaro.org>, Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
	Sylvain Petinot <sylvain.petinot@foss.st.com>, Jacopo Mondi <jacopo+renesas@jmondi.org>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	=?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
	Pavel Machek <pavel@ucw.cz>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	Oleg Drokin <green@linuxhacker.ru>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_091955_991041_8B8A9A9A 
X-CRM114-Status: GOOD (  29.00  )
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

Hi Laurent

On Wed, 17 Apr 2024 at 17:51, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Tue, Apr 16, 2024 at 11:47:17AM +0300, Dan Carpenter wrote:
> > In my opinion, it's better to just ignore old warnings.
>
> I agree. Whatever checkers we enable, whatever code we test, there will
> always be false positives. A CI system needs to be able to ignore those
> false positives and only warn about new issues.

We already have support for that:
https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/testdata/static?ref_type=heads

But it would be great if those lists were as small as possible:

- If we have a lot of warnings, two error messages can be combined and
will scape the filters
eg:
print(AAAA);
print(BBBB);
> AABBBAAB

- The filters might hide new errors if they are too broad


Most of the patches in this series are simple and make a nicer code:
Eg the non return minmax() ,
Other patches show real integer overflows.

Now that the patches are ready, let's bite the bullet and try to
reduce our technical debt.


Regards!
>
> > When code is new the warnings are going to be mostly correct.  The
> > original author is there and knows what the code does.  Someone has
> > the hardware ready to test any changes.  High value, low burden.
> >
> > When the code is old only the false positives are left.  No one is
> > testing the code.  It's low value, high burden.
> >
> > Plus it puts static checker authors in a difficult place because now
> > people have to work around our mistakes.  It creates animosity.
> >
> > Now we have to hold ourselves to a much higher standard for false
> > positives.  It sounds like I'm complaining and lazy, right?  But Oleg
> > Drokin has told me previously that I spend too much time trying to
> > silence false positives instead of working on new code.  He's has a
> > point which is that actually we have limited amount of time and we have
> > to make choices about what's the most useful thing we can do.
> >
> > So what I do and what the zero day bot does is we look at warnings one
> > time and we re-review old warnings whenever a file is changed.
> >
> > Kernel developers are very good at addressing static checker warnings
> > and fixing the real issues...  People sometimes ask me to create a
> > database of warnings which I have reviewed but the answer is that
> > anything old can be ignored.  As I write this, I've had a thought that
> > instead of a database of false positives maybe we should record a
> > database of real bugs to ensure that the fixes for anything real is
> > applied.
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

