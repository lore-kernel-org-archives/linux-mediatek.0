Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6361BC77B73
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Apr 2023 15:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDmw3DOKheKrCuqTG4/mWuNaV4eeLzuLIRCba3L2HpA=; b=FeV/6+p6T40rZV
	gTUEg2iVuKtDYS5muFQhGRfCQwXLA7t/vUltwOD8PXgC1r/wTOJDDRepBHJ+cQi03v4GPOTflcZAc
	CYAnbbNdBd2uZ3hxg3cui9sFL6AiPzaaxoxeD+S4JFxrTuVbgp7PGcUDxxCjKHrI9pbajbuK1paLo
	/Z5pZSfn/62TVpEh8S3JWsuMXmmmJCNQF8IzWCFwd70ycBteB3KfRTi+jDzUQLyy5AAjt8UVjg8PA
	Z0EmEowR69EgHYe8KqBo3BKzQair5G+AdUnZLcPZxG67z9ZTgueKSP4qomrxYOvlWAi4dB4vFptvG
	bHscJLNqDFkFbRss0HhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp9wW-005ngh-0L;
	Wed, 19 Apr 2023 15:42:00 +0000
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp9wT-005ng1-2E
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Apr 2023 15:41:59 +0000
Received: by mail-yb1-xb2e.google.com with SMTP id u13so9707ybu.5
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Apr 2023 08:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681918914; x=1684510914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDmw3DOKheKrCuqTG4/mWuNaV4eeLzuLIRCba3L2HpA=;
        b=Gg4RxpZah5di/iSrLdpwdRSIfMGRBV8IwJrAL27K41P1YYxGVvfDhdppRnNISJOHEz
         BuOB4GDq3zr9tDF6toTO7ihF7X/1r5pavBAcxjOPg4mOu6ZYYZJsTVcX23pubT7ghAa5
         vMquJjdHstncLI7p6ZHZpcen6I+w/xTe2YlkQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681918914; x=1684510914;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QDmw3DOKheKrCuqTG4/mWuNaV4eeLzuLIRCba3L2HpA=;
        b=bj15k7UxJXNE/JWuxq8L7lD0m7Azy91zVMy4QQFr+3r2OS2cDUrUvsHFVWciSKAeF5
         OP686vG0GPyo3t0FnPJ9t/CSRTJxGG/9lNh3KzTcLwNTT410Q/A2nBmPZZVLN7RGPFL4
         B41lviBmfCX+3bLViX2AzfcQjKxThh4H9pmxW2K3nXb9tB05Ms8H3mvDHBKZZFu78BlB
         Rtor7KYQwgbvDMjWEglUbMWZH1QvtxtbzzwX4/QSLazZHn1pwm8JqhfDZeGthKIX/cH0
         HLVPDtQvqFaWJTP194H2DmKfT3SaMlXZ5grQQPyDNGpsD2u8yXCK+bwhYajKreQRkYR0
         w3mA==
X-Gm-Message-State: AAQBX9dDdyB1fIz9/Spmmme3IDnK4dpg6Kv8StyCFhq6I9eOE6iRqVdG
	TrFMpmn1AAgoXzs0cdClyxrrVUNkKRRblJnHlXu/8w==
X-Google-Smtp-Source: AKy350ZjNmGzCtXyWoucDRv4j/X9GfWyL7QGNOK116IN2lxFsTMOKICu7XkJO7xvPdSxymJbdqc0qA==
X-Received: by 2002:a25:b00c:0:b0:b95:431c:6c62 with SMTP id q12-20020a25b00c000000b00b95431c6c62mr110378ybf.48.1681918913774;
        Wed, 19 Apr 2023 08:41:53 -0700 (PDT)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id 22-20020a810b16000000b0054fae5ed408sm4554793ywl.45.2023.04.19.08.41.52
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Apr 2023 08:41:52 -0700 (PDT)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-54fa9da5e5bso5644957b3.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Apr 2023 08:41:52 -0700 (PDT)
X-Received: by 2002:a81:ae55:0:b0:545:5f92:f7ee with SMTP id
 g21-20020a81ae55000000b005455f92f7eemr2300152ywk.2.1681918912183; Wed, 19 Apr
 2023 08:41:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230418124953.3170028-1-fshao@chromium.org> <20230418124953.3170028-2-fshao@chromium.org>
 <ZD8z57MBvcfExJx8@nixie71> <CAC=S1ngBt9DmBobMkQXWhqE1UUxFv2U6iFd42nT=1N7r8+pFUg@mail.gmail.com>
 <CAD=FV=U_i26a8uJYmqYf6PUgmTUgmEB5L2DkVga0zDX_iDcGQg@mail.gmail.com> <ZEAGTiGyvynGA9P1@nixie71>
In-Reply-To: <ZEAGTiGyvynGA9P1@nixie71>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 19 Apr 2023 08:41:38 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UB393Z1zhK54Apgr-iRcvgiK0t36jt6-t5-5zz3m8OZQ@mail.gmail.com>
Message-ID: <CAD=FV=UB393Z1zhK54Apgr-iRcvgiK0t36jt6-t5-5zz3m8OZQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: goodix: Add powered-in-suspend property
To: Jeff LaBundy <jeff@labundy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_084157_947267_9D0FAA25 
X-CRM114-Status: GOOD (  48.96  )
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
Cc: devicetree@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, linux-mediatek <linux-mediatek@lists.infradead.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-input@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On Wed, Apr 19, 2023 at 8:18=E2=80=AFAM Jeff LaBundy <jeff@labundy.com> wro=
te:
>
> Hi Doug and Fei,
>
> Thank you for the informative discussion; I can empathize with the pain
> these issues bring.
>
> On Wed, Apr 19, 2023 at 07:38:13AM -0700, Doug Anderson wrote:
> > Hi,
> >
> > On Wed, Apr 19, 2023 at 3:44=E2=80=AFAM Fei Shao <fshao@chromium.org> w=
rote:
> > >
> > > Hi Jeff,
> > >
> > > On Wed, Apr 19, 2023 at 8:21=E2=80=AFAM Jeff LaBundy <jeff@labundy.co=
m> wrote:
> > > >
> > > > Hi Fei,
> > > >
> > > > On Tue, Apr 18, 2023 at 08:49:51PM +0800, Fei Shao wrote:
> > > > > We observed that on Chromebook device Steelix, if Goodix GT7375P
> > > > > touchscreen is powered in suspend (because, for example, it conne=
cts to
> > > > > an always-on regulator) and with the reset GPIO asserted, it will
> > > > > introduce about 14mW power leakage.
> > > > >
> > > > > This property is used to indicate that the touchscreen is powered=
 in
> > > > > suspend. If it's set, the driver will stop asserting the reset GP=
IO in
> > > > > power-down, and it will do it in power-up instead to ensure that =
the
> > > > > state is always reset after resuming.
> > > > >
> > > > > Signed-off-by: Fei Shao <fshao@chromium.org>
> > > > > ---
> > > >
> > > > This is an interesting problem; were you able to root-cause why the=
 silicon
> > > > exhibits this behavior? Simply asserting reset should not cause it =
to draw
> > > > additional power, let alone 14 mW. This almost sounds like a back-p=
owering
> > > > problem during suspend.
> > > >
> > > There was a fix for this behavior before so I didn't dig into it on
> > > the silicon side.
> > > I can ask internally and see if we can have Goodix to confirm this is
> > > a known HW erratum.
> >
> > Certainly it doesn't hurt to check, but it's not really that shocking
> > to me that asserting reset could cause a power draw on some hardware.
> > Reset puts hardware into a default state and that's not necessarily
> > low power. I guess ideally hardware would act like it's "off" when
> > reset is asserted and then then init to the default state on the edge
> > as reset was deasserted, but I not all hardware is designed in an
> > ideal way.
>
> While that is true in theory, I have never, ever seen that to be the case
> when there is not some other underlying problem.
>
> What I have seen, however, is that asserting reset actually causes the GP=
IO
> to sink current from some other supply and through the IC. I loosely susp=
ect
> that if you probe the IC's rails and digital I/O during the failure condi=
tion,
> you may find one of them resting at some mid-rail voltage or diode drop. =
It
> seems you have a similar suspicion.
>
> In that case, it may mean that some other supply in the system should act=
ually
> be kept on, or that supplies are being brought down out of order. In whic=
h
> case, the solution should actually be a patch to the affected platform(s)=
 dts
> and not the mainline driver.

I agree that it's a bandaid, but I'm not hopeful that a better
solution will be found.

Specifically, I'd expect a current leak in the system when you turn a
supply off and then assert a GPIO high. That's when the device can
start backpowering itself from a GPIO. In this case, it's the
opposite. We're keeping the supply on and asserting the (active low)
reset GPIO to cause the higher power draw. In another design it was
confirmed that the power draw went away when we were able to turn the
regulator off (but still keep the active low reset GPIO asserted).
We've also confirmed that power is good if we keep the supply on and
_don't_ assert the reset GPIO. Both of these two experiments provide
some evidence that the system is configured properly and we're not
backpowering something.

I guess I should revise the above, though. I could believe that there
is a current leak but on the touchscreen controller board itself,
which is a black box to us. I have certainly been involved in products
in the past where the default state of the system at reset caused a
minor current leak (I remember an EE telling me that as soon as
software started running I should quickly change the direction of a
GPIO) and it wouldn't shock me if the touchscreen controller board had
a problem like this. If there is a problem like this on the
touchscreen controller board there's not much we can do to workaround
it.

Unfortunately, if the problem ends up needing a hardware change to fix
more correctly (which I suspect it does), our hands are tied a bit.
This is not prototype hardware but is final hardware.

I guess one further note is that, at least on the project I was
involved in that had a similar problem, folks in China did a bunch of
analysis on this and went as far as adding an extra regulator to the
main board schematic to "fix" it. Had the issue just been something
where we were misconfiguing GPIOs or leaving a regulator in the wrong
state then they (probably) would have identified it rather than
spinning the board.

-Doug

