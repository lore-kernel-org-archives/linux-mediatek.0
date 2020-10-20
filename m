Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31BBC388F2
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 18:52:17 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 31CDE2222D
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 18:52:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="nBmQ7+Oc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dbg1dsuc"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 31CDE2222D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=PI6Iwdf7vygbHtfSzdLauWm9pqr+wLrAH/npFOKFYXU=; b=nBmQ7+OcaJ4hiT4rMJWEXC5XM
	3XDK0NIjQKwwnEoeM0dTeBW+W5vmv8ct9qEWWl4wTkXokeSKyo/mpUMr6FcqpmR7moXFzvjIlcvTM
	ts9q/rOWH2FWTJvdeqUhQgvFt3KRxhYLRgQ442lALqlNrLkRC6MWw1uDBoW+NSCQ7hGw0DmRG4W4H
	OjcYZPFtw+EjpenQ95XOo/RSopDnO5WeqlBKKHreIHPMehqVqnQfxlw1KGg11pBnxp+seexo1GL/o
	Uwd8/oyS2KbTGL8sbLtYknKAyqLNR/edepDYXLQ8GbTq7cgKMbWAyG4dllLrgsvpu9IHr1Zllp/i/
	OHTXElbBA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUwjv-0005T9-Vt; Tue, 20 Oct 2020 18:52:08 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUwjr-0005Rs-VI
 for linux-mediatek@lists.infradead.org; Tue, 20 Oct 2020 18:52:05 +0000
Received: by mail-wr1-x441.google.com with SMTP id g12so3494267wrp.10
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2020 11:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jYFdycc4cemOIaYFUQzd2hjpOFiC6YIkhXB4IeoEDOc=;
 b=dbg1dsucJfSwBHh00T6Mc9TxIy2cA3D0xo1Vm098iBuTl3wM9obmhlk2Rgw+3Fe9DE
 lhn/KcJI0CzGJ6oaNtkW3L2DYRWLDfMqxzbcRxS7Ipt1zizebN8Dh7Zxgafe7FBS9DOS
 DhU2QoyTkvFT2KdsWGAohFct9ghNqDtSzxfoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jYFdycc4cemOIaYFUQzd2hjpOFiC6YIkhXB4IeoEDOc=;
 b=pPAsA0GUQS2J0dsmAovMVIRc+5hhYlXMe8hB1z1LHbko0d0mcElauT1psSQjPPfpCx
 2NhveK+SPRjb38GMY/nUMxhdTfTYOV6HtLr28LR4RxsjAYgvhgSd/W1yAsNF2z5u3XtA
 0SxcHlqN+AV+IwCbGoCQuICtYtHgbBTAcm50qrebnBuNQZKR38YzX9WJmNn/3OStN2HH
 mOW8/+9Uutv7N57CUuhKOIS3YNmP5Y/dyIehStUqAIf7kRpf+tkvAsSJceK076EIjcxE
 HFyWCZ+tkG6mdlGkv7pFmPZRWhVfepHHlcyyxWLcVaKU7Ha9LMJrCIEaGq7CF0CpfwHP
 BVSQ==
X-Gm-Message-State: AOAM5314axcLkSEfem7yQLthdWjfvQra0d9j2wVUSGbgAUAuh4DiiiMg
 nhjixfWmQKq/SYzXyvKlAOpr2VcTQu3wZz91BiapkQ==
X-Google-Smtp-Source: ABdhPJzwG1O5oS9ghCKoJUxg59+XPLW7h0AAeoCd9EgHF2nhb1cMfI/IvqKJePI2HX9vcvnVxX2frJft2ThKtBNDJrA=
X-Received: by 2002:a5d:4001:: with SMTP id n1mr5162648wrp.426.1603219922351; 
 Tue, 20 Oct 2020 11:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
 <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk>
In-Reply-To: <20201020143711.GC9448@sirena.org.uk>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 21 Oct 2020 02:51:33 +0800
Message-ID: <CAFv8NwKuLjLeM1KLeV8Br2TZC8L7DO6KWHL=pXvhAUV5+wSBPg@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_145204_031417_5E3DD423 
X-CRM114-Status: GOOD (  40.38  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Taniya Das <tdas@codeaurora.org>,
 "moderated list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..."
 <alsa-devel@alsa-project.org>, Banajit Goswami <bgoswami@codeaurora.org>,
 Heiko Stuebner <heiko@sntech.de>,
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
 Takashi Iwai <tiwai@suse.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Ajye Huang <ajye_huang@compal.corp-partner.google.com>,
 Patrick Lai <plai@codeaurora.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 Jaroslav Kysela <perex@perex.cz>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 20, 2020 at 10:37 PM Mark Brown <broonie@kernel.org> wrote:
>
> On Tue, Oct 20, 2020 at 09:37:05PM +0800, Cheng-yi Chiang wrote:
>
> > May I know your suggestion on Ajye's patch "ASoC: qcom: sc7180: Modify
> > machine driver for 2mic" ?
>
> > https://lore.kernel.org/r/20200928063744.525700-3-ajye_huang@compal.corp-partner.google.com
>
> > I think adding code in the machine driver makes the intent straightforward.
> > If we want the machine driver to be fully configurable,
> > we can always add more code to handle properties like gpio, route,
> > widget (mux, text selection) passed in from the device tree.
>
> If the device has both front and rear mics and only one can be active at
> once that seems obvious and sensible.  If the devices only have one of
> these then this seems like a bad idea.
>

trogdor board: only front mic.
pompom board: having both front mic and rear mic. Only one of them
will be used at a time. It is toggled by mixer control backed by a
gpio.

My proposed solution: instead of using compatible strings, expose only
dmic-gpio property.
When the machine driver sees this property, it uses the dapm widgets
and controls created in the machine driver.

> > But I feel that we don't need a machine driver to be that configurable
> > from the device tree.
> > I think having the logic scattered in various dtsi files and relying
> > on manual inspection to understand the usage would be less
> > maintainable than only exposing needed property like gpio.
> > Especially in the complicated case where we need to create a mux
> > widget with callback toggling the gpio like this:
>
> I don't understand what "logic scattered in various dtsi files" means,
> sorry.
>
I mean I don't want to use device property to pass in widget name,
type, text and callbacks.
Let me give an example:

- Board trogdor uses front mic, rt5682, and max98357a.
- Board pompom is based on board trogdor, but it has front mic and rear mic.
If we somehow managed to add the code to pass in widget, route, type,
text, and callbacks needed for dmic control, we will need to put a
bunch of properties in trogdor-pompom.dtsi file.
- Board ABC is based on trogdor as well, and it has front mic and rear
mic, but with a different speaker amp.

To use widget, route, type, text and callbacks for front mic and rear
mic, in trogdor-ABC.dtsi file we would copy some properties used in
trogdor-pompom.dtsi file. To support the different combination of
codec, we would need some modification of the route and widget.

Now the support of front mic and rear mic switch is scattered in
trogdor-ABC.dtsi and trogdor-pompom.dtsi files.
For example, when we change the code to parse or build the widget and
route, we need to fix both trogdor-pompom.dtsi and trogdor-ABC.dtsi.

Alternatively, if we only expose dmic-gpio property and put
surrounding code in the machine driver, we can use this dmic-gpio
property, plus the sound card name to identify the needed widget and
route.

> > Yes, that should work to describe the dailink we are using.
> > But a more tricky issue is how to do calls like setting PLL in dai startup ops.
>
> ...
>
> > I think that asking a generic machine driver to do configuration like
> > this with only a limited interface of device property
> > might be too much of an ask for the machine driver.
>
> Richard was looking at some basic configuration for PLLs.

That sounds promising. If we don't need to include the codec driver
header file explicitly, that can make machine drivers simpler.
Maybe for most of the simple cases we don't even need a dedicated
machine driver.

>
> > Would you mind if I simplify the compatible string like Srinivas
> > suggested, and send a v12?
>
> > As for other two kinds of variations that I am aware of:
>
> > 1. front mic / rear mic
> > 2. replace alc5682 with adau7002
>
> The CODEC change is going to be described in the DT no matter what -
> you'll have a reference to the CODEC node but it may make sense if
> there's enough custom code around it.  For front vs rear mic the
> simplest thing would just be to not mention which if this is a hardware
> fixed thing, otherwise a control.
>

Would you suggest checking whether the codec node is a rt5682 node,
and call required PLL calls accordingly ?

"For front vs rear mic the simplest thing would just be to not mention
which if this is a hardware fixed thing, otherwise a control."
Sorry I am not sure if I understand this correctly. Please correct me
if I am wrong.

- For default case having 1 mic: not mention this at all
- For front mic / rear mic case: see gpio property and use an
additional control.

> > We can set different board names and different compatible strings to
> > achieve such variation.
> > So that it would make sense to describe configuration in compatible
> > strings like you suggested, and also provides UCM a way to distinguish
> > different boards.
>
> I don't recall having suggested distinguishing these things with a
> compatible string, especially not the microphones.  UCM can already use
> the display names for the boards to distinguish things.

My apology that I made the wrong interpretation when I read your reply
"These feel more like things that fit with compatible" regarding
replacing alc5682 with adau7002. Please let me know which one solution
you prefer:
-  deriving this information from codec node
-  deriving this information from different sound card name

Thanks so much!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
