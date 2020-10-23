Return-Path: <SRS0=bV6b=D6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AFA7C55179
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 07:56:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84ADA2177B
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Oct 2020 07:56:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IQTf1WId";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CVl+ZUvJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84ADA2177B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3OGuZYHrJ3/LuQ3jfWNCJWo6IR+ZDCgTWH8sz+unpNs=; b=IQTf1WIdNov1tLlPj4ZuBJaLn
	s5MhYWTDkYbabU1eacVWZlQp2aNnczjeGH6ZTVFaXzgRgU1lZ0l0KqlPKPLG6lvz+ia5/SHckg90A
	dS3BvnZ3ztHgBOjvXm8nPwXbfxsaLEEqA6i0lYFpwZFpa8eqIrEraW+Jguysj+K92aWc1tQamaxjc
	hGRvZYWzT0ZciN4EhHO88aX87hixr7OXWqlRagaiuozLqNyB4w1VeHK/FYT7AXYte1wd9UaEK+LHQ
	kzrr62+Z9U3xm3ZlCE917dXzXsLrV6yIXwNJJP67uLu879HXyM//vhkY9iJ33B61JXcxecRqk7dqF
	EeoMZHNLA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVrvo-00067z-FY; Fri, 23 Oct 2020 07:56:12 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVrvf-00064C-Fe
 for linux-mediatek@lists.infradead.org; Fri, 23 Oct 2020 07:56:06 +0000
Received: by mail-wr1-x444.google.com with SMTP id b8so739695wrn.0
 for <linux-mediatek@lists.infradead.org>; Fri, 23 Oct 2020 00:56:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/SNcQNTo06eYbWggxW6UOAFjPQ1H0tu2qDw1XijNeRw=;
 b=CVl+ZUvJNSTelmJgD2DdCIA/kwY4nJMHESm/5iLIkcQJXVj2rijeq3MuB8Zsz5zx/T
 VahW0LE5kLAYZmr0iD9M7kSzSNf/C93dJqTZt/+xXU4TukOpH/8L/GuA/HXY6OnHfGZh
 m3QSbS6iZXqxC4LY9xvfNEs5aWu6Bio7vR7eI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/SNcQNTo06eYbWggxW6UOAFjPQ1H0tu2qDw1XijNeRw=;
 b=mC0gx1eJAa0IyTf6EJw9KpgRsqlbwok5KY1ex2EMiGa4rVSXTVqD/1xglA/cDOVLYz
 pzAZ15w482WBGhHpk9xflLZ1WHE16tIcfuk79KJKVF0RZILRMCnc4jLVk4i/Oje3fkUQ
 hUOl78H7PhwsqbqtMFwsEDBHVFQySojjSlVYUhMoZhIYiLiOQilTVkx34L2lAdDNjmAU
 P1rsfsJ0N74MlKRBKttcmX6XX+8dLAhZdG05GkD9IG9GCjY+r9L278KHTvznmQuGpxIT
 CsyTWMkT9Q6pwJNtwoQCD4G7S3b2p/hu7mrnFDgDu68DXOfxcnVzxVyng7cb7ZQFnKtr
 NAvg==
X-Gm-Message-State: AOAM532ckgj3/QoMdROT8UU0tg8kEcOzfDuWdEKTQLk5AmEYKaR9XNd3
 fx+eQHlZzaEqxuQsKW7Zb0d0mX+WHfzgOnyO6CIVSQ==
X-Google-Smtp-Source: ABdhPJxZFORJ4Tr+SkfBVztLuJ/zgKr93fxZsXD5FewSFQ1f0hvr0ngms9GSLXN0Q5h10kUYApcqSbjs7tAIZIGMzGg=
X-Received: by 2002:adf:f78d:: with SMTP id q13mr1183396wrp.258.1603439761801; 
 Fri, 23 Oct 2020 00:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
 <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk>
 <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
 <CAFv8NwJ-+f146Ss9Mk=nEXjm1B--ZwhAgnfx-cTi7DGEKqC1-Q@mail.gmail.com>
 <e876421c-dfeb-e853-1b65-53a786e9bcf9@linaro.org>
 <20201021123913.GD4497@sirena.org.uk>
 <CA+Px+wV-uoODRQTZqv7RuyOUoGBoh5GnT2h4iW9mJGRL=UFfgQ@mail.gmail.com>
 <14e7db29-4825-6e9d-22a0-5121bb7006e2@linaro.org>
In-Reply-To: <14e7db29-4825-6e9d-22a0-5121bb7006e2@linaro.org>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Fri, 23 Oct 2020 15:55:35 +0800
Message-ID: <CAFv8Nw+zigiF0cbuk8t+4inf_X6twh+2zyyXchRTXASM4V_xBQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201023_035603_670217_0C0D9846 
X-CRM114-Status: GOOD (  26.65  )
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
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Patrick Lai <plai@codeaurora.org>, Tzung-Bi Shih <tzungbi@google.com>,
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
 xuyuqing@huaqin.corp-partner.google.com,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sorry for resending this mail.
I forgot to use plain text mode in the previous mail.
On Thu, Oct 22, 2020 at 6:12 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 22/10/2020 04:29, Tzung-Bi Shih wrote:
> > Hi, sorry for jumping into your discussion but I am trying to
> > summarize them to make sure we are on the same page.  Pardon me to
> > manually copy-and-paste partial sentences to quote.
> >
> > ACK:
> > - Don't expose DAI connections in compatible strings.
> > - Use "model" DT property to make the card more UCM2-friendly.
> > - Expose new DT properties to distinguish different DMIC models.
> >
> > NACK:
> > - All the board variations using exactly the same compatible string.
> > => This is less realistic.  Although the CODECS information can be
> > retrieved from DT, it is inevitable to have some custom code for each
> > CODEC.
> >
> > Per Mark's words:
> >> a different CODEC is something that often justifies a separate compatible
> > I think we should use different compatible strings for new CODECS
> > combinations.  And we should try to reuse the machine driver if they
> > share the most code.  In the worst case, introduce a new machine
> > driver for the new CODECS combinations.
> >
> > - Srinivas's suggestion to set driver_name.
> > e.g. card->driver_name = "SM8250";
> > => This sounds like a new DT property should be parsed in
> > sound/soc/qcom/common.c.  For example: "qcom,family"?  But as we do
> > less care about UCM2 for now, I would prefer to just leave it as is.
> >
> No, you can just hardcode this driver_name in your machine driver rather
> than getting it from DT, this is how everyone does!.
> So need of adding anything to common.c
>
ACK
> The thing that I suggested to add to common.c is setting card->long_name
> from "model" property.
>

NACK
I found that I don't need to set card->long_name in common.c because
soc-core.c already sets longname using card->name if
card->long_name is NULL.

        soc_setup_card_name(card->snd_card->longname,
                            card->long_name, card->name, 0);

So we can leave common.c as it is and still get long name.

> >
> > I would expect the following variants in DTS (just for example):
> >
> > sound {
> >    compatible = "qcom,sc7180-trogdor";
> Make sure that vendor name is correct here, am not sure if trogdor is
> qcom board or Google own board!
ACK
I should use "google,sc7180-trogdor" because google is the vendor.
>
> >    model = "sc7180-rt5682-max98357a-1mic";
> > }
> >
> > sound {
> >    compatible = "qcom,sc7180-trogdor";
> >    model = "sc7180-rt5682-max98357a-2mic";
> >    dmic-gpio = ...
> > }
> >
> > sound {
> >    compatible = "qcom,sc7180-pompom";
> >    model = "sc7180-adau7002-max98357a";
> > }
> >
> >
> > Please correct me if there is any misunderstanding.
>
> Looks good to me!
> thanks for doing this!
Thank you. I will collect the discussion result to send a v12, and
sync with variant board partners to submit following machine driver
changes.
We will make sure future projects follow this approach
>
> --srini
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
