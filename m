Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C57F4C7618E
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Apr 2023 18:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=blVk5F8wi1jpNsCC6o8Ei6j9sVKcdv4aLvP/rqf73i4=; b=UVlSzt0ZJ61Qk7
	4j+8poiZjQyUROeOowA0XQX8+5zBI7dQf3lsDWnpu0SojQoZ0a/levn+hZAMtr7WkA8fkvBYxJgpY
	m8mebHrTY6JBekcSeOqwfD3BgkemYlzH5tgrHTMDJWrdATOVVU9ubwv7qDaR9mem2VmuzIimwc9yN
	vgTZXseKD12zjieHFBQ9xkHsRXviDo3hNl/xSDXL7ZYlQ59c5xB56Yx/T6RtbNZYAOcWroxLHjiR2
	rzlhozNJ6NoeKs/Df8NUVPEGDhXbq2cau7hBHzUik5IheaTz5GFvBowSHxgC/JjRC9VYrEKWWpLvE
	hN33lg+M6XeQhVi5JZdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pr0ia-00GyAt-1q;
	Mon, 24 Apr 2023 18:15:16 +0000
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pr0iX-00GyAY-2G
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Apr 2023 18:15:15 +0000
Received: by mail-io1-xd2f.google.com with SMTP id ca18e2360f4ac-763c34315c1so125714339f.3
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 11:15:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1682360110; x=1684952110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blVk5F8wi1jpNsCC6o8Ei6j9sVKcdv4aLvP/rqf73i4=;
        b=Hv6C9zeyJ7FAaoxMJTATINYuKa9zQsaQlTAzWbRmHNWnXWGihxKY6LHruRufkvsuzo
         5NO1FifkUkfHDEWWJPKKBrGcCWT1Fzp+X8pDNEv5dFHzVQwfyShlotWN/zj9Vx0eJr5z
         4Ei9KuT1drUAbMOHwRpzb8ev4T6f+o8CVRc50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682360110; x=1684952110;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blVk5F8wi1jpNsCC6o8Ei6j9sVKcdv4aLvP/rqf73i4=;
        b=Bi6LCbSDQ6Hoh2tAr/99dVlG2CzyLrxWuGGu2NinueAkkd8G12SRRN4m0YOToyeQwf
         jU8gu44w/LyVMjAJxFpAFLoyhhvYf2kLXwNmrJj2/Ub7HOLSdC0CiJC2m0NxGtS+R30O
         6eRGF31JQ+rPgTsQfbQ+Z1vlgaEeQ9bep0HMgOw4nDQiOuORjEkwZax2VNugTazM4CIc
         R8BT3j/pa/st4uS/PqIxisADbk5RAGEGyCgreqMzeY4XE0Lg5CD+PN02MFcSJ9aMMJ5y
         wrOPVVE4VMxaQwGlJvugzTO1d0zZNSl63KaF+3AyejjFJ2KWEVOI84/QV2CVKySpAoiR
         SyaQ==
X-Gm-Message-State: AAQBX9dJeTddAFOBLJv76CxRK0S9wpZgU3aY88P00SWG+3xjUvmji3wF
	ayYBAfYNw+ih0+vSCSK+dC66vKdE75WP8ByccP8=
X-Google-Smtp-Source: AKy350ZARlyGZUcMQGV0qDFyFAXesPRvNGuDCMkQI3kpaGZobQYxT/D/MYf7OBi+EmCT91cxToclLA==
X-Received: by 2002:a5d:9916:0:b0:763:684d:7f11 with SMTP id x22-20020a5d9916000000b00763684d7f11mr6322540iol.5.1682360110225;
        Mon, 24 Apr 2023 11:15:10 -0700 (PDT)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com. [209.85.166.177])
        by smtp.gmail.com with ESMTPSA id f29-20020a02a11d000000b0040b38102b79sm3435192jag.82.2023.04.24.11.15.08
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Apr 2023 11:15:09 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-328cb023b1dso1095115ab.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Apr 2023 11:15:08 -0700 (PDT)
X-Received: by 2002:a05:6e02:1d09:b0:32e:561d:b42d with SMTP id
 i9-20020a056e021d0900b0032e561db42dmr34592ila.16.1682360107716; Mon, 24 Apr
 2023 11:15:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230418124953.3170028-1-fshao@chromium.org> <20230418124953.3170028-2-fshao@chromium.org>
 <ZD8z57MBvcfExJx8@nixie71> <CAC=S1ngBt9DmBobMkQXWhqE1UUxFv2U6iFd42nT=1N7r8+pFUg@mail.gmail.com>
 <CAD=FV=U_i26a8uJYmqYf6PUgmTUgmEB5L2DkVga0zDX_iDcGQg@mail.gmail.com>
 <ZEAGTiGyvynGA9P1@nixie71> <CAD=FV=UB393Z1zhK54Apgr-iRcvgiK0t36jt6-t5-5zz3m8OZQ@mail.gmail.com>
 <CAC=S1nj8VTXOovvianPWDYnsrbek0APD76SBNquFObaw8Vg4BQ@mail.gmail.com> <ZEX4BEVMf6GtvaAP@nixie71>
In-Reply-To: <ZEX4BEVMf6GtvaAP@nixie71>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 24 Apr 2023 11:14:55 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VtrJDVB0gQp-O82V3mgU6MFVMSGrvzh0fRa7sYAt_Pqw@mail.gmail.com>
Message-ID: <CAD=FV=VtrJDVB0gQp-O82V3mgU6MFVMSGrvzh0fRa7sYAt_Pqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: input: goodix: Add powered-in-suspend property
To: Jeff LaBundy <jeff@labundy.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230424_111513_782750_A22DE787 
X-CRM114-Status: GOOD (  28.96  )
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

On Sun, Apr 23, 2023 at 8:31=E2=80=AFPM Jeff LaBundy <jeff@labundy.com> wro=
te:
>
> Back-powering can come in two forms:
>
> 1. The one you've described, which is by far the most common. As you ment=
ion,
> it is not the case here since the issue happens only when we drive the GP=
IO
> low and not high.
>
> 2. Through a forbidden power supply sequence, an input pin of an IC with
> multiple power supplies becomes a weak power supply itself. Grounding the
> GPIO then sinks current into the SoC.
>
> This problem smelled like (2), especially since asserting the GPIO or pow=
ering
> down the supply alleviates the symptom. Most Goodix controllers I've work=
ed
> with have two or more supplies, and the datasheet requires them to be ena=
bled
> or disabled in a specific order.
>
> Based on Fei's feedback, however, this IC does not seem to be one of thos=
e
> since there is reportedly only a single rail. I guess either vdd or vddio=
 is
> tied to a dummy regulator? If so, then perhaps we can scratch this theory=
.

There is one rail provided from the main board, but there can be two
voltage levels involved depending on stuffings on the touchscreen
itself. I talked a bit about this in commit 1d18c1f3b7d9
("dt-bindings: HID: i2c-hid: goodix: Add mainboard-vddio-supply").


> Fair enough, I was simply sketpical that this was the _right_ workaround.
> Were this an issue of only supply A left on yet the IC datasheet requires
> supply B to remain on if supply A is on, I would rather see this solved b=
y
> updating a regulator dts node, trusted FW sequence, etc.

Right. That type of stuff was looked at in detail by two separate
teams, so I don't think this is the issue.


> Thanks for your due diligence; if this really is a silicon issue, then
> the driver should indeed accommodate it.
>
> That being said, the name 'powered-in-suspend' seems a bit conflated. We
> should not be duplicating regulator policy in this driver; the existing
> naming also may cause confusion for other HW configurations that do leave
> vdd and vddio on during suspend, but don't have this problem.
>
> Here, we actually mean to control the behavior of the reset GPIO through
> suspend and therefore something like 'goodix,no-reset-during-suspend' is
> closer to what I understand us to intend to do. I will add more details
> in patch [2/2].

I'd be fine with that name. ...ah, and adding the "goodix," prefix is
a good call.

-Doug

