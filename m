Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BEEC6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 08:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V8YLT0UnqpNi70lcfgxzgtqlJHlXNg/RRy71f8KnOqk=; b=NuS935gIpIr+Xlt/Csj8vAyh2Y
	M70CaooceOAvgxy8cLfKPIgXOKItVKrQ5gRpQt3oT1kAzIJMJTBLOnnLInZZ1tnJ25yJU+FuH3Bdk
	UZkA/cKHO1hGhh2ITqaFFCRXV0ao/sWbhVhuDTi6y5/qqeMI4YHQhDP9HAL1X7+0yDhYdcoTroGeZ
	QwM7Fx1nVlc9GKIDouHwy8hbRufU6xRWiKcNe71dANzWbS4Yqt/8re8yGBxj1XDEmPyYgeJoupN/4
	aZPuf1iN1mdcjwizYinoD83w2As862U8Ou/g6tFo2cfB+v4AKvbnvfpzAUdZpLbKqgo+mwyrp841V
	3WPG72rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prE8g-000YEZ-08;
	Tue, 25 Apr 2023 08:35:06 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prE8Y-000Y8k-14
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Apr 2023 08:35:03 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5051abd03a7so8053017a12.2
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 01:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682411696; x=1685003696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V8YLT0UnqpNi70lcfgxzgtqlJHlXNg/RRy71f8KnOqk=;
        b=PIo9Y2l7ySzRWf4ElHDwGrVNhiJjaKop46hMvkg/AIu96nJAE2BER9LarKqol+RBgP
         uN1jlV3ymft+bKn6Gs9wzs/hhFteJEdLc1/qvsubkSJByL1UVP6moi8KErw3bmzAcEGW
         xuHFYEqwZtjH8Fi288v1GPbyJ3gzk7Wof/sDM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682411696; x=1685003696;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V8YLT0UnqpNi70lcfgxzgtqlJHlXNg/RRy71f8KnOqk=;
        b=H7ZSOBy/fe80RXzcd1hq9mdUxr8Rxfcpn600/bsSQf3wtSi0EsXaqyYJpjMJv3pjdk
         grzDxSf4cCr5nnmnvAorEa9zfinl1QZ09/yiQ6lyG8kU4d5nJhU3ggHOGHMhtUU/bSaZ
         4a6iemOk+dAV1phfWhdtbCpr+awUWgj8v/cWQgLfH66fozu6cV8DJt+dxTjfAZLD5xpf
         Ow6RxDcWD7j1g4LrLIi5kWIneQRbAza7VKkMzVRvAyhwnsuz02+2XcHab7Sycgh1+Uue
         6jf/DWs3ec7EUi/S1iyKpvcYvRwmOA4/QRU1rct6CmUPbxbEJD7blWmXCAKyVOebWr4l
         O/sg==
X-Gm-Message-State: AAQBX9c+In87iUl3TAzEXlNolpHXJS2dAY8Yi08w0pi9eyl1bwVEtmCX
	v3RzDV72I7O4MqlIAoWPQbgUV3x2FI3P+/7rPMLf1A==
X-Google-Smtp-Source: AKy350bYFFQpH9uBgZydaNDfl5zSI1h0+0qneshXBpQUgOZoVi3ve1VdcLM6U8MAj+Dm+KlNyre6Vw==
X-Received: by 2002:a05:6402:419:b0:509:c1c2:373e with SMTP id q25-20020a056402041900b00509c1c2373emr10112380edv.8.1682411696098;
        Tue, 25 Apr 2023 01:34:56 -0700 (PDT)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com. [209.85.128.44])
        by smtp.gmail.com with ESMTPSA id by14-20020a0564021b0e00b0050844e1c98fsm5469820edb.82.2023.04.25.01.34.54
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 01:34:54 -0700 (PDT)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-3f1950f5628so41786425e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Apr 2023 01:34:54 -0700 (PDT)
X-Received: by 2002:a5d:428d:0:b0:2fa:c982:dd6a with SMTP id
 k13-20020a5d428d000000b002fac982dd6amr11970067wrq.64.1682411693905; Tue, 25
 Apr 2023 01:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230418124953.3170028-1-fshao@chromium.org> <20230418124953.3170028-2-fshao@chromium.org>
 <ZD8z57MBvcfExJx8@nixie71> <CAC=S1ngBt9DmBobMkQXWhqE1UUxFv2U6iFd42nT=1N7r8+pFUg@mail.gmail.com>
 <CAD=FV=U_i26a8uJYmqYf6PUgmTUgmEB5L2DkVga0zDX_iDcGQg@mail.gmail.com>
 <ZEAGTiGyvynGA9P1@nixie71> <CAD=FV=UB393Z1zhK54Apgr-iRcvgiK0t36jt6-t5-5zz3m8OZQ@mail.gmail.com>
 <CAC=S1nj8VTXOovvianPWDYnsrbek0APD76SBNquFObaw8Vg4BQ@mail.gmail.com>
 <ZEX4BEVMf6GtvaAP@nixie71> <CAD=FV=VtrJDVB0gQp-O82V3mgU6MFVMSGrvzh0fRa7sYAt_Pqw@mail.gmail.com>
In-Reply-To: <CAD=FV=VtrJDVB0gQp-O82V3mgU6MFVMSGrvzh0fRa7sYAt_Pqw@mail.gmail.com>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 25 Apr 2023 16:34:16 +0800
X-Gmail-Original-Message-ID: <CAC=S1nhFNq_kK5zJCWQiGBuJbDXiC8BstJ5BT7pi5O8hLDQSfA@mail.gmail.com>
Message-ID: <CAC=S1nhFNq_kK5zJCWQiGBuJbDXiC8BstJ5BT7pi5O8hLDQSfA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: goodix: Add powered-in-suspend property
To: Doug Anderson <dianders@chromium.org>
Cc: Jeff LaBundy <jeff@labundy.com>, Benjamin Tissoires <benjamin.tissoires@redhat.com>, 
	Rob Herring <robh+dt@kernel.org>, linux-mediatek <linux-mediatek@lists.infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_013458_404597_4B6BCE42 
X-CRM114-Status: GOOD (  37.23  )
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

On Tue, Apr 25, 2023 at 2:15=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Sun, Apr 23, 2023 at 8:31=E2=80=AFPM Jeff LaBundy <jeff@labundy.com> w=
rote:
> >
> > Back-powering can come in two forms:
> >
> > 1. The one you've described, which is by far the most common. As you me=
ntion,
> > it is not the case here since the issue happens only when we drive the =
GPIO
> > low and not high.
> >
> > 2. Through a forbidden power supply sequence, an input pin of an IC wit=
h
> > multiple power supplies becomes a weak power supply itself. Grounding t=
he
> > GPIO then sinks current into the SoC.
> >
> > This problem smelled like (2), especially since asserting the GPIO or p=
owering
> > down the supply alleviates the symptom. Most Goodix controllers I've wo=
rked
> > with have two or more supplies, and the datasheet requires them to be e=
nabled
> > or disabled in a specific order.
> >
> > Based on Fei's feedback, however, this IC does not seem to be one of th=
ose
> > since there is reportedly only a single rail. I guess either vdd or vdd=
io is
> > tied to a dummy regulator? If so, then perhaps we can scratch this theo=
ry.
>
> There is one rail provided from the main board, but there can be two
> voltage levels involved depending on stuffings on the touchscreen
> itself. I talked a bit about this in commit 1d18c1f3b7d9
> ("dt-bindings: HID: i2c-hid: goodix: Add mainboard-vddio-supply").
>
>
> > Fair enough, I was simply sketpical that this was the _right_ workaroun=
d.
> > Were this an issue of only supply A left on yet the IC datasheet requir=
es
> > supply B to remain on if supply A is on, I would rather see this solved=
 by
> > updating a regulator dts node, trusted FW sequence, etc.
>
> Right. That type of stuff was looked at in detail by two separate
> teams, so I don't think this is the issue.
>
>
> > Thanks for your due diligence; if this really is a silicon issue, then
> > the driver should indeed accommodate it.
> >
> > That being said, the name 'powered-in-suspend' seems a bit conflated. W=
e
> > should not be duplicating regulator policy in this driver; the existing
> > naming also may cause confusion for other HW configurations that do lea=
ve
> > vdd and vddio on during suspend, but don't have this problem.
> >
> > Here, we actually mean to control the behavior of the reset GPIO throug=
h
> > suspend and therefore something like 'goodix,no-reset-during-suspend' i=
s
> > closer to what I understand us to intend to do. I will add more details
> > in patch [2/2].
>
> I'd be fine with that name. ...ah, and adding the "goodix," prefix is
> a good call.
>
> -Doug

That sounds good to me, too. I'll update the name in the next patch.

Regards,
Fei

