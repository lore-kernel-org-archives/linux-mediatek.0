Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B320C77B7A
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 19:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtYzXAXeeNKykjIC6M7yJXXgCuPRoWwM64ZY3vwKseo=; b=Nx8BT8eJqLiFMW9YXDZhfBAn0Q
	wNm3LSsyX9UmvUjAdi0vd5N5aTYJAHZAdgDLbyHqh3q8wuOXVc77JmmJ7BFUuAf1UZ5oD/sKSfHgd
	hIuhHoyffjiXfU0VUI7P8fAn6GHgk4paaAB8L5Ui9DJ3koL8ADdnGfsR9lzKZi0rAv3Cg6mWzRe5i
	TRG7PQB3pHfNh4fyxBw8UMQiLzbIc7XKEHglPzFR33hNmxzi0yMEShLloHkY5wZZCPFMMW0SEV0mC
	4Zg55YxeaH6uI7qzXXml3E0Xq+YQ+EyZSdhj20EY0PlzcTkEE2ku8C10rehnCJP9XyP/ap+1xdSj1
	vILFCBiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2dTV-003iYH-0E;
	Fri, 26 May 2023 19:51:45 +0000
Received: from mail-io1-xd36.google.com ([2607:f8b0:4864:20::d36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2dTR-003iVc-1K
	for linux-mediatek@lists.infradead.org;
	Fri, 26 May 2023 19:51:42 +0000
Received: by mail-io1-xd36.google.com with SMTP id ca18e2360f4ac-777094e3d7bso18971139f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 26 May 2023 12:51:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685130697; x=1687722697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtYzXAXeeNKykjIC6M7yJXXgCuPRoWwM64ZY3vwKseo=;
        b=krrqjwzG0OD+yq/+F1IXnoT3w/i5wc3gnTF+joEnO72SMkKoReQHp+SZAyx0MVRFf/
         QBLWlyR8PUAVM5TAEZ0oE7MM/3O3lxX/JgNOnwaBU22kKS+skkUD3ZWkEcly9esiMLTI
         tCcupEPW+JUN+2aME/0mjDR5QqBxWso9OF/jQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685130697; x=1687722697;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dtYzXAXeeNKykjIC6M7yJXXgCuPRoWwM64ZY3vwKseo=;
        b=ZlE+LDSVVHsU2Oc9mMoCK2+YYyuQOXec78xXOvXtds2NHMjCCL0VapaguATJlPFr6U
         qOVrceEMUq1J/IeF60yrhstjxVavZkJoFXI7n6wk/7kRvC4TmsSoKP/l5riqfbhztDdp
         0D4eum94HEzckpSBlTkkh/O1vzb+sTt6zvFlsi6CFvdHEa3xMEd7RXjI82RIUYiMBPoq
         k6bmYNoxDcXJUbmHhbT+Coy8HMAtyDKZ1XXSWxFSZI2pQ86pb8fksZLpYLysgXHQJ2G7
         QPXGU9SEn0CurJZeDk9+tCr1dPaulsQzyXtL0I9BmWQ3PVYZCg3ZNsDF3Q0RLjBEIi36
         9DhQ==
X-Gm-Message-State: AC+VfDxpk87GO2sclFZTXxp9/uystXUOgYMd8gP9n0XkWkG3eECcJCsn
	KOLzkUsTS+g8EW04b+vvji5OnxAOviaYkLYBBwE=
X-Google-Smtp-Source: ACHHUZ6H2hNBladg0KTajOXGemhF1l4ZLPWv1o1kUt79t5RJw9YAgMNoH9RIbfdrqWPE6cJKuZKd4w==
X-Received: by 2002:a6b:650b:0:b0:717:ce6a:188a with SMTP id z11-20020a6b650b000000b00717ce6a188amr1660231iob.18.1685130697048;
        Fri, 26 May 2023 12:51:37 -0700 (PDT)
Received: from mail-il1-f180.google.com (mail-il1-f180.google.com. [209.85.166.180])
        by smtp.gmail.com with ESMTPSA id g20-20020a02cd14000000b0040f8d42c110sm1277925jaq.95.2023.05.26.12.51.35
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 May 2023 12:51:36 -0700 (PDT)
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-33b0848c04aso4355ab.1
        for <linux-mediatek@lists.infradead.org>; Fri, 26 May 2023 12:51:35 -0700 (PDT)
X-Received: by 2002:a92:ca0a:0:b0:331:2623:c5f4 with SMTP id
 j10-20020a92ca0a000000b003312623c5f4mr30715ils.1.1685130695437; Fri, 26 May
 2023 12:51:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230526100801.16310-1-uwu@icenowy.me> <CAD=FV=UxrFVZXn+dtgamttTVopWMSVbxYsHCGG_tS+3OTXbHiw@mail.gmail.com>
 <0803e9037a8a2ce96fdad6ec209991dcda2a30ca.camel@icenowy.me>
In-Reply-To: <0803e9037a8a2ce96fdad6ec209991dcda2a30ca.camel@icenowy.me>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 26 May 2023 12:51:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WS5i4RYknEaOi+4448UASh9kNncU4mwnawqKPr7yGXRg@mail.gmail.com>
Message-ID: <CAD=FV=WS5i4RYknEaOi+4448UASh9kNncU4mwnawqKPr7yGXRg@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-elm: remove panel model
 number in DT
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Pin-yen Lin <treapking@chromium.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230526_125141_450142_2A7385BB 
X-CRM114-Status: GOOD (  44.82  )
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

On Fri, May 26, 2023 at 8:33=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> wrot=
e:
>
> =E5=9C=A8 2023-05-26=E6=98=9F=E6=9C=9F=E4=BA=94=E7=9A=84 07:24 -0700=EF=
=BC=8CDoug Anderson=E5=86=99=E9=81=93=EF=BC=9A
> > Hi,
> >
> > On Fri, May 26, 2023 at 3:09=E2=80=AFAM Icenowy Zheng <uwu@icenowy.me> =
wrote:
> > >
> > > Currently a specific panel number is used in the Elm DTSI, which is
> > > corresponded to a 12" panel. However, according to the official
> > > Chrome
> > > OS devices document, Elm refers to Acer Chromebook R13, which, as
> > > the
> > > name specifies, uses a 13.3" panel, which comes with EDID
> > > information.
> > >
> > > As the kernel currently prioritizes the hardcoded timing parameters
> > > matched with the panel number compatible, a wrong timing will be
> > > applied
> > > to the 13.3" panel on Acer Chromebook R13, which leads to blank
> > > display.
> > >
> > > Because the Elm DTSI is shared with Hana board, and Hana
> > > corresponds to
> > > multiple devices from 11" to 14", a certain panel model number
> > > shouldn't
> > > be present, and driving the panel according to its EDID information
> > > is
> > > necessary.
> > >
> > > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > > ---
> > >  arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > We went through a bunch of back-and-forth here but in the end in the
> > ChromeOS tree we have "edp-panel" as the "compatible" here in the
> > ChromeOS 5.15 tree and this makes sense.
>
> I only have Elm, so I am curious that do all Hana's only rely on panel
> EDID to use different displays?
>
> BTW The Chrome OS document say that Elm and Hana are both board based
> on Oak baseboard, should the DTSI be renamed mt8173-oak.dtsi, and still
> let mt8173-elm.dts include it and then set model information?

I wasn't deeply involved in mt8173, so I'll let treapking@ comment. I
think he's done some research here recently.


> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >
> > ...in theory one would wish for a "Fixes" tag, but I think in
> > previous
> > discussions it was decided that it was too complicated. Hardcoding
> > the
> > other compatible string has always been technically wrong, but I
> > guess
> > it worked at some point in time. The more correct way (as you're
> > doing
> > here) needs the DP AUX bus support and the generic eDP panels, both
> > of
> > which are significantly newer than the elm dts. So I guess leaving no
> > "Fixes" tag is OK, or perhaps you could do the somewhat weak:
>
> Well I remembered when I was developing the support for Pine64
> Pinebook, which is also an ARM64 laptop with an eDP panel (via a DPI-
> eDP bridge, ANX6345). At first I didn't use any panel node in the DT,
> and the kernel maintainers argued to the bridge that seems to be
> connected to nothing (because DP is a discoverable port), and
> fortunately 2 Pinebook SKUs (11.6" and 14") is finally reduced to one,
> and it's then possible to hardcode a panel model in the Pinebook DT.
> According to my memory, the need to specify the panel is to properly
> handle eDP panel power up timing, because it's not a very standard
> thing. (Well, in my memory, when I was testing that code, on a
> (engineering sample) 14" Pinebook, the EDID timing overrided the
> hardcoded 11.6" timing and it properly works, the 14" panel is 1366x768
> but the 11.6" panel is 1920x1080.)
>
> (BTW when I checked the DT of Olimex TERES-I, which uses the same DPI-
> eDP bridge, it is still in the status of a dangling bridge, and of
> course it works ;-) )

Before the generic eDP panel support, several devices worked according
to the "little white lie" theory. They would pick some arbitrary panel
to put in the DT because they had to, but then that panel would just
be used for the power up / power down timing and everything else would
be overridden. This was obviously not a great situation to be in, and
so we had many discussions on the mailing list about how to do better.
The end result was the generic edp-panel support.

With eDP panel support, you still need to add the timings for your
specific panel, but it was realized that in _most_ cases we could
power up the panel enough to read the "panel ID" and then we could use
that to lookup the timings. In the few cases where we needed a little
extra help (if HPD is broken or not connected), the DP folks agreed to
allow a few properties to specify it. :-) Hopefully today all new code
uses the general panel-edp.

-Doug

