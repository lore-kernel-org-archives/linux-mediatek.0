Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC3FC6FD18
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 10:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZC1F9AUB3Liv54B7ZdgG3WiGq9lyqgr8Df3/jIkfoOU=; b=r0OAhymVRCcayox/ko195nrr+X
	x5llQ29X/0kK9zxn4ElHw2M3viL1VAH2g5A2LwmvbY7/8wS3u565Qxq3CbTNWJMFNx4NcPN2VXfk4
	Db/x3WEcHO26HuNe3vrVmM2iZdfmIpqJriq5rFmgrvDpxLcNzwoOGV/p170TPgNIzRnwo9ntiBJPc
	CUJYfgAdyXqYxGTqa2KpD62jCzSQJF302/9kS7WOcxAnU54Wsuzl2b7QyYdDcJMxxctHXjRHKFUsW
	JUmz+X+Sur72BfYi6zCRfFgPgPGgeoULePowE9RtNfQMy5vkN8yyYEV/eb3ddN/YUJqLA27rH5iIr
	PT5LVBwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5J2-0054qY-1W;
	Wed, 19 Apr 2023 10:44:56 +0000
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5Iz-0054pE-12
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Apr 2023 10:44:54 +0000
Received: by mail-il1-x12c.google.com with SMTP id e9e14a558f8ab-32b437f4607so5165025ab.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Apr 2023 03:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681901090; x=1684493090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZC1F9AUB3Liv54B7ZdgG3WiGq9lyqgr8Df3/jIkfoOU=;
        b=DkzPBN9I5LHhIsDlFpY1hThuwHGBVF2rLOb3SSNH5om9lIwYi8QR+lhZK5wDHD35QZ
         h/bo7dbB7insCGHEs4pfMu+B7EMTB/xVkL38LttW7JheuaN3uHwAdZIW0bwxJWByL/l6
         iFYZyWdf7TeMzDDbSEXN6G5dk3QbKIJQi9elg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681901090; x=1684493090;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZC1F9AUB3Liv54B7ZdgG3WiGq9lyqgr8Df3/jIkfoOU=;
        b=F8H2w+geB0hpkOv1gQi6Qwn/f0ckhKOH6Tq6wIlrfbr3JH0WJJI/17/6+9NewH4w8a
         GAkFoIVGMeP+NGzz2zjXR1OqB1ciG+wfl+0uOfOADsj0TecYxNZ4juXaZjQsLYFJhhbE
         Xzh+3gsVe1n5Cc54ZlY2O1gCUljq+01LvHbfpUjpKWnrhC1AG3Ft7NxkryjeYxQERtRG
         geT+TKmIQyVRgzQzY3xHr9O9sU7PynXH1CoOF1kFKGgRed1K0qgVmBtlaxqMyDBazb2p
         WrvlbWHM9g77g14R31DVHQs9he91xSqgW7CGPpmSfy4uX8DQtnLaWRYfmn0H9A9e2I9s
         OU1A==
X-Gm-Message-State: AAQBX9esU3G1OKzTLo5O7ltMsF3gr5HZZip7wORAK55Wo/UBotRsn/Iw
	Z5WYWHlXu/cDKYxXZKMcIw+G7UQfmmqLd3vVZPj/3ZwH
X-Google-Smtp-Source: AKy350YhPLU/v8Aan9+VDXBuKE3HAPDQtGUFMenKq/fBz1hh1EkbnMOOqwDazSACiokpa44UJh/HlA==
X-Received: by 2002:a92:cb52:0:b0:32b:68e9:9ea7 with SMTP id f18-20020a92cb52000000b0032b68e99ea7mr3429778ilq.11.1681901090058;
        Wed, 19 Apr 2023 03:44:50 -0700 (PDT)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com. [209.85.166.173])
        by smtp.gmail.com with ESMTPSA id p71-20020a02294a000000b0040f6f565d5dsm4580533jap.97.2023.04.19.03.44.48
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 03:44:48 -0700 (PDT)
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-32ac0743030so27417665ab.0
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Apr 2023 03:44:48 -0700 (PDT)
X-Received: by 2002:a92:ced0:0:b0:329:4c5e:15d8 with SMTP id
 z16-20020a92ced0000000b003294c5e15d8mr10421971ilq.2.1681901088205; Wed, 19
 Apr 2023 03:44:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230418124953.3170028-1-fshao@chromium.org> <20230418124953.3170028-2-fshao@chromium.org>
 <ZD8z57MBvcfExJx8@nixie71>
In-Reply-To: <ZD8z57MBvcfExJx8@nixie71>
From: Fei Shao <fshao@chromium.org>
Date: Wed, 19 Apr 2023 18:44:11 +0800
X-Gmail-Original-Message-ID: <CAC=S1ngBt9DmBobMkQXWhqE1UUxFv2U6iFd42nT=1N7r8+pFUg@mail.gmail.com>
Message-ID: <CAC=S1ngBt9DmBobMkQXWhqE1UUxFv2U6iFd42nT=1N7r8+pFUg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: goodix: Add powered-in-suspend property
To: Jeff LaBundy <jeff@labundy.com>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, Douglas Anderson <dianders@chromium.org>, 
	Rob Herring <robh+dt@kernel.org>, linux-mediatek <linux-mediatek@lists.infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_034453_382689_9BBE1408 
X-CRM114-Status: GOOD (  30.79  )
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

Hi Jeff,

On Wed, Apr 19, 2023 at 8:21=E2=80=AFAM Jeff LaBundy <jeff@labundy.com> wro=
te:
>
> Hi Fei,
>
> On Tue, Apr 18, 2023 at 08:49:51PM +0800, Fei Shao wrote:
> > We observed that on Chromebook device Steelix, if Goodix GT7375P
> > touchscreen is powered in suspend (because, for example, it connects to
> > an always-on regulator) and with the reset GPIO asserted, it will
> > introduce about 14mW power leakage.
> >
> > This property is used to indicate that the touchscreen is powered in
> > suspend. If it's set, the driver will stop asserting the reset GPIO in
> > power-down, and it will do it in power-up instead to ensure that the
> > state is always reset after resuming.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
>
> This is an interesting problem; were you able to root-cause why the silic=
on
> exhibits this behavior? Simply asserting reset should not cause it to dra=
w
> additional power, let alone 14 mW. This almost sounds like a back-powerin=
g
> problem during suspend.
>
There was a fix for this behavior before so I didn't dig into it on
the silicon side.
I can ask internally and see if we can have Goodix to confirm this is
a known HW erratum.

> If this is truly expected behavior, is it sufficient to use the always_on
> constraint of the relevant regulator(s) to make this decision as opposed =
to
> introducing a new property?
>
That sounds good to me. IIUC, for the existing designs, the boards
that would set this property would also exclusively set
`regulator-always-on` in their supply, so that should suffice.
Let me revise the patch. Thanks!

Fei
> >
> >  Documentation/devicetree/bindings/input/goodix,gt7375p.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yam=
l b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> > index ce18d7dadae2..942acb286d77 100644
> > --- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> > +++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> > @@ -43,6 +43,12 @@ properties:
> >        itself as long as it allows the main board to make signals compa=
tible
> >        with what the touchscreen is expecting for its IO rails.
> >
> > +  powered-in-suspend:
> > +    description:
> > +      This indicates that the touchscreen is powered in suspend, so th=
e driver
> > +      will not assert the reset GPIO in power-down to prevent power le=
akage.
> > +    type: boolean
> > +
> >  required:
> >    - compatible
> >    - reg
> > --
> > 2.40.0.634.g4ca3ef3211-goog
> >
>
> Kind regards,
> Jeff LaBundy

