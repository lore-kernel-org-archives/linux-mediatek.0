Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC995C4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 13:37:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E8B5D21741
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 13:37:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="f4PpIoXR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TPK9GUXw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E8B5D21741
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Q8Q2R5SOL83lgA1J5zbXXvT4OYymGpTuVVTvcXE1ODw=; b=f4PpIoXRjIB3x8G67pTAvgRgs
	zj9jXb2pL1zzvX5Z2pOhQE1ci7Qz9M5ukARIBpw1toV7GmC3lmhWnrNNxtjYawNjghTxoxLNN4LFc
	BkOENJXKaqpWFiysrSLC826rk59pjK0EGyRST7cK4G3pk4giUYL3esucJ5d37XrKYZKjg8XgrCPSh
	CePjXsNjs4/LQrV4yZP22mkHpUlql+oSDdVv4nVfMxcjmlUC3Uwc83bLJZ+4YfFPIuqYzCM2Yb6SS
	gBswtU2qUVss3WjkZ7A9NuBGgEY1ntnjfsGnFhz+/NT0ne4/gO6eiMkdSICqMsmUDR8nA45Hqg0kk
	UaHMzEaOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUrpa-0002cU-P9; Tue, 20 Oct 2020 13:37:38 +0000
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUrpX-0002bF-Oc
 for linux-mediatek@lists.infradead.org; Tue, 20 Oct 2020 13:37:36 +0000
Received: by mail-wr1-x442.google.com with SMTP id n18so2186112wrs.5
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2020 06:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Dd/4tB1jhfJBU76uhWYvJK/M1Y4WZsbkyJFSG8k8QQo=;
 b=TPK9GUXwppf2mM1kCN3ve/x60CKUztqZ+989Nh8aqFSLGa+l7mbzE/LqA70BHIvGZz
 9t62mD+eV+mTcXERLQfsqGiscvH12E6jUFihaaN9G4Q/H5OP5vn/D7cAcdZLOAKnGAP4
 3CcOZMOSIaLcag5ahYLat4UtdM8iVyx44UW/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Dd/4tB1jhfJBU76uhWYvJK/M1Y4WZsbkyJFSG8k8QQo=;
 b=gXH8YS64tmdNZ3rDy8AohBkYX2obUUc9FatJ6So8Kq5U34hnQPJwVBWA8+X9evqv4D
 SVO5BjWf9gtGXKSzZFRHARRxxHHtu6aXfm6Hd/lg6Cp/NfNLEuG+g1CzjF9GPbmxbSn6
 WJBh4m9Zj54r1Iz7uqNGUt7fvVWoU8PFMhNFqJ7Ywd8U9WKRGr4rZ9rZbjF+tVy3m5qa
 /Tl/ztBGB7GOge9Hrx8wmWUV23nP8eSinvlqJtKLU4RcrDWNurng+4XfPZ3nIwtVaekd
 IanAgjEblSASoBb/sQl6G8dCG3V00M0XdFjiwkmoj9Vwdh48nvWjnLAoPv+f8zpDr8y2
 mkUQ==
X-Gm-Message-State: AOAM531UHpbxMuDnD0cKL69B8biYbD9nxIpNqTcsW+YUZz5j17ZIj0bQ
 bxxqqEr8l0paIYru6u0uQlwHZ5YBc/nrgstSzy80Ug==
X-Google-Smtp-Source: ABdhPJxbiebIvIYWJ8VjSbDQyhf4y6aT7O3DnC5CYOzHre4Bqv+imNt5qgF8Ub9UZZ8/En/AxSVEIthwU9StfwKT0vc=
X-Received: by 2002:adf:cc82:: with SMTP id p2mr3646265wrj.177.1603201052544; 
 Tue, 20 Oct 2020 06:37:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
In-Reply-To: <20201015161251.GF4390@sirena.org.uk>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 20 Oct 2020 21:37:05 +0800
Message-ID: <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_093735_834184_B019AA90 
X-CRM114-Status: GOOD (  34.40  )
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

On Fri, Oct 16, 2020 at 12:13 AM Mark Brown <broonie@kernel.org> wrote:
>
> On Thu, Oct 15, 2020 at 03:59:26PM +0800, Cheng-yi Chiang wrote:
> > On Tue, Oct 13, 2020 at 6:36 PM Srinivas Kandagatla
>
> > > > +properties:
> > > > +  compatible:
> > > > +    const: qcom,sc7180-sndcard-rt5682-m98357-1mic
>
> > > This information can come from the dai link description itself, why
> > > should compatible string have this information?
>
> > I think dailink description is not enough to specify everything
> > machine driver needs to know.
> > E.g. there is a variation where there are front mic and rear mic. We
> > need to tell the machine driver about it so
> > it can create proper widget, route, and controls.
>
> That sounds like something that could be better described with
> properties (including for example the existing bindings used for setting
> up things like analogue outputs and DAPM routes)?
>

Hi Mark, thank you for the comments.

May I know your suggestion on Ajye's patch "ASoC: qcom: sc7180: Modify
machine driver for 2mic" ?

https://lore.kernel.org/r/20200928063744.525700-3-ajye_huang@compal.corp-partner.google.com

I think adding code in the machine driver makes the intent straightforward.
If we want the machine driver to be fully configurable,
we can always add more code to handle properties like gpio, route,
widget (mux, text selection) passed in from the device tree.
But I feel that we don't need a machine driver to be that configurable
from the device tree.
I think having the logic scattered in various dtsi files and relying
on manual inspection to understand the usage would be less
maintainable than only exposing needed property like gpio.
Especially in the complicated case where we need to create a mux
widget with callback toggling the gpio like this:

+static const char * const dmic_mux_text[] = {
+       "Front Mic",
+       "Rear Mic",
+};
+
+static SOC_ENUM_SINGLE_DECL(sc7180_dmic_enum,
+                           SND_SOC_NOPM, 0, dmic_mux_text);
+
+static const struct snd_kcontrol_new sc7180_dmic_mux_control =
+       SOC_DAPM_ENUM_EXT("DMIC Select Mux", sc7180_dmic_enum,
+                         dmic_get, dmic_set);
+
+SND_SOC_DAPM_MUX("Dmic Mux", SND_SOC_NOPM, 0, 0, &sc7180_dmic_mux_control),

Passing all the logic along with the callback of dmic_get, dmic_set
from the device tree would be too hard to maintain.

> > The codec combination also matters. There will be a variation where
> > rt5682 is replaced with adau7002 for dmic.
> > Although machine driver can derive some information by looking at dailink,
> > I think specifying it explicitly in the compatible string is easier to
> > tell what machine driver should do, e.g.
> > setting PLL related to rt5682 or not.
>
> These feel more like things that fit with compatible, though please take
> a look at Morimoto-san's (CCed) work on generic sound cards for more
> complex devices:
>
>    https://lore.kernel.org/alsa-devel/87imbeybq5.wl-kuninori.morimoto.gx@renesas.com/
>
> This is not yet implemented but it'd be good to make sure that the
> Qualcomm systems can be handled too in future.

Yes, that should work to describe the dailink we are using.
But a more tricky issue is how to do calls like setting PLL in dai startup ops.

                /* Configure PLL1 for codec */
                ret = snd_soc_dai_set_pll(codec_dai, 0, RT5682_PLL1_S_MCLK,
                                          DEFAULT_MCLK_RATE, RT5682_PLL1_FREQ);

I think that asking a generic machine driver to do configuration like
this with only a limited interface of device property
might be too much of an ask for the machine driver.

>
> > You can see widget, route, controls are used according to the configuration.
> > The alternative approach is to check whether "dmic-gpio" property
> > exists to decide adding these stuff or not.
> > But it makes the intent less easier to understand.
>
> OTOH if you have lots of compatibles then it can get hard to work out
> exactly which one corresponds to a given board.

Totally agree. Glad we have only three variations up to now.

Would you mind if I simplify the compatible string like Srinivas
suggested, and send a v12?

As for other two kinds of variations that I am aware of:

1. front mic / rear mic
2. replace alc5682 with adau7002

We can set different board names and different compatible strings to
achieve such variation.
So that it would make sense to describe configuration in compatible
strings like you suggested, and also provides UCM a way to distinguish
different boards.
What do you think ?

Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
