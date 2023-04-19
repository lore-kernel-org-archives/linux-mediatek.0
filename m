Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F312AC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 14:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ilxu6Q/jc5aOhDRIt3j6AWcNhm/qlHFPZW+HtjiMVA4=; b=2F40s6uDM8uUxD6wnNGlSk7w3m
	F4pWiXX0wPDnAu4hqOzr44jZNcAaQL5kgY+mrnJS0XDyh38dlfRkcdMQ+7g2lhIhGbbob6mZp5JOW
	rRKrzwxUgdT76YJFc557ATkb1Iw2YTMWNyMdoREybwWkPDPh8EbLA48aOWeECJ75B/4lnFfqlHrhd
	gb6K182FcHEVQ4L5pr7f7jx8YwzQQnekoAyWT+CuROk3NX7ZYydaPI0QIsP+rlIwhcRwLE82s5Bzz
	g2n7kvquhV2GN6Ov+2AqnBCXPN07mHedQIc8EWqEjglcEy95eNvq4oc0LlB46pdrxZJIY6wlHCKau
	XUMl5VQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8xB-005hDU-2o;
	Wed, 19 Apr 2023 14:38:37 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp8x8-005hBe-1u
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Apr 2023 14:38:36 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-54fbee98814so1374997b3.8
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Apr 2023 07:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681915109; x=1684507109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ilxu6Q/jc5aOhDRIt3j6AWcNhm/qlHFPZW+HtjiMVA4=;
        b=Y4Dwi9Qjd7z55btxkOVIzDbrweoWBrZC0tXJKFLazw/HJwdo2SrulBS23eyI1GNc0Y
         vtkcBEBX01QiRtQrv3nvwelmqLNUCSDxDLr9X75fQEaJ3JhNV3WH7C8F6/DXNEhw95cu
         DXpqLmUHa+yl73oQMUtUrbaY+fHJf9vYv7nLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681915109; x=1684507109;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ilxu6Q/jc5aOhDRIt3j6AWcNhm/qlHFPZW+HtjiMVA4=;
        b=dfF3KezNWWv/CYJqRFkKT7/cBU2c1ESZYneD9jdKHyOx89VD0crwDBeTBcXc6yD6o/
         ju2BYnzHP437lGhN8O0SVVZiFPJKeSSWlKlRccxbEUiXqzgy8XfwZINSNg+mMkTPFFly
         +e/sWL8vbk7mBFOGCvLMs5gK6azo9+07/++q2ZZd8dsPvMc2l8zwJOYbYNlvvCXjoIR4
         L3HXoPwtZCj1rbTCFsbDq/urRKZqCTKJ2gzS4qAdQK++CW0Rum+omr2rFN3Inab7lOT1
         7mmabXC7WTx3amLF0Hyy2I+f5AYeEZVrd1OzUocOaq0aU+uNXJNE0EPTVykhQneHaFgn
         B26g==
X-Gm-Message-State: AAQBX9fFx6VAXeNt3IGLYDm7jhJwmSgEQN/bpHo1SvraRBj0w3fnaclK
	LJSdvPN6dldfVh6rheTOqTN9Cl0GS/CZ5d0bqxz5xQ==
X-Google-Smtp-Source: AKy350Z1eYFXlv8QGfwcJyOtsMfmSR/5IqWu1Wwud8MWJzA2qeEv59OAm+7GQxEV66bFxL4Rp2UTUw==
X-Received: by 2002:a0d:eb04:0:b0:552:e5d9:1e6e with SMTP id u4-20020a0deb04000000b00552e5d91e6emr3773803ywe.44.1681915107859;
        Wed, 19 Apr 2023 07:38:27 -0700 (PDT)
Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com. [209.85.219.182])
        by smtp.gmail.com with ESMTPSA id b186-20020a811bc3000000b0054eff15530asm4482772ywb.90.2023.04.19.07.38.26
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 07:38:26 -0700 (PDT)
Received: by mail-yb1-f182.google.com with SMTP id n17so4799583ybq.2
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Apr 2023 07:38:26 -0700 (PDT)
X-Received: by 2002:a25:7687:0:b0:b96:7676:db4a with SMTP id
 r129-20020a257687000000b00b967676db4amr16246ybc.0.1681915105828; Wed, 19 Apr
 2023 07:38:25 -0700 (PDT)
MIME-Version: 1.0
References: <20230418124953.3170028-1-fshao@chromium.org> <20230418124953.3170028-2-fshao@chromium.org>
 <ZD8z57MBvcfExJx8@nixie71> <CAC=S1ngBt9DmBobMkQXWhqE1UUxFv2U6iFd42nT=1N7r8+pFUg@mail.gmail.com>
In-Reply-To: <CAC=S1ngBt9DmBobMkQXWhqE1UUxFv2U6iFd42nT=1N7r8+pFUg@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Apr 2023 07:38:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U_i26a8uJYmqYf6PUgmTUgmEB5L2DkVga0zDX_iDcGQg@mail.gmail.com>
Message-ID: <CAD=FV=U_i26a8uJYmqYf6PUgmTUgmEB5L2DkVga0zDX_iDcGQg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: goodix: Add powered-in-suspend property
To: Fei Shao <fshao@chromium.org>
Cc: Jeff LaBundy <jeff@labundy.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-mediatek <linux-mediatek@lists.infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_073834_628429_8CB8E11F 
X-CRM114-Status: GOOD (  34.94  )
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

Hi,

On Wed, Apr 19, 2023 at 3:44=E2=80=AFAM Fei Shao <fshao@chromium.org> wrote=
:
>
> Hi Jeff,
>
> On Wed, Apr 19, 2023 at 8:21=E2=80=AFAM Jeff LaBundy <jeff@labundy.com> w=
rote:
> >
> > Hi Fei,
> >
> > On Tue, Apr 18, 2023 at 08:49:51PM +0800, Fei Shao wrote:
> > > We observed that on Chromebook device Steelix, if Goodix GT7375P
> > > touchscreen is powered in suspend (because, for example, it connects =
to
> > > an always-on regulator) and with the reset GPIO asserted, it will
> > > introduce about 14mW power leakage.
> > >
> > > This property is used to indicate that the touchscreen is powered in
> > > suspend. If it's set, the driver will stop asserting the reset GPIO i=
n
> > > power-down, and it will do it in power-up instead to ensure that the
> > > state is always reset after resuming.
> > >
> > > Signed-off-by: Fei Shao <fshao@chromium.org>
> > > ---
> >
> > This is an interesting problem; were you able to root-cause why the sil=
icon
> > exhibits this behavior? Simply asserting reset should not cause it to d=
raw
> > additional power, let alone 14 mW. This almost sounds like a back-power=
ing
> > problem during suspend.
> >
> There was a fix for this behavior before so I didn't dig into it on
> the silicon side.
> I can ask internally and see if we can have Goodix to confirm this is
> a known HW erratum.

Certainly it doesn't hurt to check, but it's not really that shocking
to me that asserting reset could cause a power draw on some hardware.
Reset puts hardware into a default state and that's not necessarily
low power. I guess ideally hardware would act like it's "off" when
reset is asserted and then then init to the default state on the edge
as reset was deasserted, but I not all hardware is designed in an
ideal way.


> > If this is truly expected behavior, is it sufficient to use the always_=
on
> > constraint of the relevant regulator(s) to make this decision as oppose=
d to
> > introducing a new property?
> >
> That sounds good to me. IIUC, for the existing designs, the boards
> that would set this property would also exclusively set
> `regulator-always-on` in their supply, so that should suffice.
> Let me revise the patch. Thanks!

Yeah, I thought about this too and talked about it in my original
reply. It doesn't handle the shared-rail case, but then again neither
does ${SUBJECT} patch. ...then I guess the only argument against it is
my argument that the regulator could be marked "always-on" in the
device tree but still turned off by an external entity (PMIC or EC) in
S3. In theory this should be specified by
"regulator-state-(standby|mem|disk)", but I could believe it being
tricky to figure out (what if a parent regulator gets turned off
automatically but the child isn't explicit?). Specifically, if a
regulator is always-on but somehow gets shut off in suspend then we
_do_ want to assert reset (active low) during suspend, otherwise we'll
have a power leak through the reset GPIO... :-P

...so I guess I'll continue to assert that I don't think peeking at
the regulator's "always-on" property is the best way to go. If
everyone else disagrees with me then I won't stand in the way, but IMO
the extra property like Fei's patch adds is better.

[1] https://lore.kernel.org/r/CAD=3DFV=3DV8ZN3969RrPu2-zZYoEE=3DLDxpi8K_E8E=
ziiDpGOSsq1w@mail.gmail.com

