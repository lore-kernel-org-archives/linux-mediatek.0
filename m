Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1875C77B78
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 14:19:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zST2ogY5xFX7piRNXStlaVQvyezkCUdzLc+A/+WCH/0=; b=Gy+F3IUP7GoZ7R2EViHnCeJMmJ
	cXjf3v7SH9MOXoRT6qKtROeirGyvTGRS2tsNOSwnLJVort4NXLoEwoH33kLOuBGP4Ri1cyYxSIa/q
	NTveBx22ki42K8zbgVIMX0O9tuRXHjpI9eGgQpo6WbW+c1QlYbMDZfXI7LBjiRAGXeoZRLZv4d5gT
	kSZabpJmiJOa6OgpPouVxNheqLeXgfgpAlu3KeCmTGB4KXpWeEguOXhBjskrTm7WneiH+at0Iabef
	+lTYbPskJaQGvYLHzruoGaM4WQGV+WdwrC2E85FaPfJtNDSle267rBcyL+FXzZT0VE54gdgAhQeTR
	wmUqnuzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pomAZ-002PO0-1B;
	Tue, 18 Apr 2023 14:18:55 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pomAW-002PMy-1P
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Apr 2023 14:18:53 +0000
Received: by mail-ej1-x62d.google.com with SMTP id dm2so73736754ejc.8
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Apr 2023 07:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1681827527; x=1684419527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zST2ogY5xFX7piRNXStlaVQvyezkCUdzLc+A/+WCH/0=;
        b=BygM/wM5k1MV5OG0uIeGXhl1I4Y8uM9RBcI23wGX2dXSi9Gd0VZELJJkozAjvziOIe
         iXFp32fIzPuKr9Yb8XA7sAaYznKrdWVvCNnPGBIfnuCnwx2I3UPM1SrpEiH8MwDcKsqv
         csUptvD/Ce7lo1Z8QTcggfoEcm8xeOXs9acrQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681827527; x=1684419527;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zST2ogY5xFX7piRNXStlaVQvyezkCUdzLc+A/+WCH/0=;
        b=ZKdbTW44zEFN57tWVHRhmp1ggZJ1nAeVumlX1gED18uHk8vcBZ9Y4BPD6EdXKYWCFR
         d6K7054/7zUQtwXH2/dCc5JL0N0N74V0lnOekyfYELmtM/tYtCZqLLsSsIKOMrjZnbhY
         9VbRAtRBODu/MkM+JJFj9B45QUAwIsPda5n+rn0gznypLAqlmTbLY6HNzqeeoO//sBVm
         ysxceei3g9eNX49qCY+1cSn6wkc1xLqAPYNSMomdLNMtcJO1zQUZdtGjny/wGTwVy9L7
         z/wDr+T96LyOKCFGR/iyxq/Tcnu96eOq+LDv0NnKSuzlsGRPQ9aGBMF5nND+96wHlz5f
         P5tQ==
X-Gm-Message-State: AAQBX9eAZya8/wY8Yr2pHsrWsTpWdXMBvEVPO1ZtcSRaEtb+OcPKn4oC
	dtHnrX267d31QjD1zQhv7upIlfMEnMDMD7HXt2enSw==
X-Google-Smtp-Source: AKy350bNmhZw8emLJsU1fDSOk/NWScGojbaAkrZ0lnv/inF82VxH7gsOHDv18Y9c/K9jZLyg0demcA==
X-Received: by 2002:a17:906:3ac7:b0:94a:5819:5a24 with SMTP id z7-20020a1709063ac700b0094a58195a24mr12402082ejd.18.1681827527091;
        Tue, 18 Apr 2023 07:18:47 -0700 (PDT)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com. [209.85.128.48])
        by smtp.gmail.com with ESMTPSA id t16-20020a170906269000b00932ba722482sm8278954ejc.149.2023.04.18.07.18.44
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 07:18:45 -0700 (PDT)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3f173af6712so15612735e9.1
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Apr 2023 07:18:44 -0700 (PDT)
X-Received: by 2002:adf:e803:0:b0:2fa:d7ac:6462 with SMTP id
 o3-20020adfe803000000b002fad7ac6462mr485497wrm.11.1681827524446; Tue, 18 Apr
 2023 07:18:44 -0700 (PDT)
MIME-Version: 1.0
References: <20230418124953.3170028-1-fshao@chromium.org> <20230418124953.3170028-2-fshao@chromium.org>
In-Reply-To: <20230418124953.3170028-2-fshao@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 18 Apr 2023 07:18:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=V8ZN3969RrPu2-zZYoEE=LDxpi8K_E8EziiDpGOSsq1w@mail.gmail.com>
Message-ID: <CAD=FV=V8ZN3969RrPu2-zZYoEE=LDxpi8K_E8EziiDpGOSsq1w@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: goodix: Add powered-in-suspend property
To: Fei Shao <fshao@chromium.org>
Cc: Benjamin Tissoires <benjamin.tissoires@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, devicetree@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_071852_501451_BDF166B6 
X-CRM114-Status: GOOD (  29.47  )
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

On Tue, Apr 18, 2023 at 5:50=E2=80=AFAM Fei Shao <fshao@chromium.org> wrote=
:
>
> We observed that on Chromebook device Steelix, if Goodix GT7375P
> touchscreen is powered in suspend (because, for example, it connects to
> an always-on regulator) and with the reset GPIO asserted, it will
> introduce about 14mW power leakage.
>
> This property is used to indicate that the touchscreen is powered in
> suspend. If it's set, the driver will stop asserting the reset GPIO in
> power-down, and it will do it in power-up instead to ensure that the
> state is always reset after resuming.
>
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
>
>  Documentation/devicetree/bindings/input/goodix,gt7375p.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml =
b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> index ce18d7dadae2..942acb286d77 100644
> --- a/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> +++ b/Documentation/devicetree/bindings/input/goodix,gt7375p.yaml
> @@ -43,6 +43,12 @@ properties:
>        itself as long as it allows the main board to make signals compati=
ble
>        with what the touchscreen is expecting for its IO rails.
>
> +  powered-in-suspend:
> +    description:
> +      This indicates that the touchscreen is powered in suspend, so the =
driver
> +      will not assert the reset GPIO in power-down to prevent power leak=
age.
> +    type: boolean

This seems OK to me. The overall idea is that if we ever turn off the
power to the touchscreen we have to assert reset (active low) before
doing so, but we don't want to hold reset if we're not actually going
to turn the power off because it causes the touchscreen to go into a
high power state. This gets complicated if the power rail is always-on
or shared with another device.

Alternatives I could think of:

1. In the OS, monitor the regulator and see when it's about to go off
and then assert reset. This is what I tried to do in previous patches
but it got too messy in Linux. It also wasn't perfect since it's
(theoretically) possible for a regulator to turn off outside of the
scope of the OS (some PMICs will auto turn off rails when the main
processor says it's off).

2. In the OS, peek to see if our regulator is marked "always on". This
doesn't handle the shared rail case, of course. Also, regulators that
are "always on" from the OS perspective could still (theoretically)
get turned off at suspend time by the PMIC.

3. Don't even hook up the reset line and just leave the touchscreen
out of reset all the time. This has the disadvantage that we can't
reset the touchscreen if it gets into a bad state, which could be even
more important if the touchscreen is on an always-on or shared rail.


Given the above, the solution in ${SUBJECT} patch seems reasonable.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

