Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 205C3C388F2
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 18:55:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87F2B22244
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 18:55:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3d3Q+SBr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kC1bm7nz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 87F2B22244
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kMjgshQ1OhVxm8IIwFi0H0DkgIllrmQPyHFuke7IZ8U=; b=3d3Q+SBrcqSNOL0zGJwearzYH
	chC53eWiPPXN5cHPAuJ1dZYV3RzE0jBn8HfQUZB+UgMlnaga64Xyt1aiTzn5V09RFM6ptgR2U83pz
	a/buJw0zij0bEfzvMge1ej40V6S6YKIaepK9jYfd86co+p8ISOzM4P7CfhkmSZQgnl9ir1RKWNcph
	cItLzj1SPR8RlRuE/B5sAS2yRLCGzGyt9S+L8BuSWir3CXPWIf3b9k4YzCIN4rDNAnzYkKL0bMQSh
	Kn1HtecBmDIoIWXiPKuZM+zIKP35zcCy+v0ZXRP/Ew0UVmeynt41pJHPC4+UMaoAnmIoNqo3wzoSn
	GwL4K4BuA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUwn0-0005ri-GJ; Tue, 20 Oct 2020 18:55:18 +0000
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUwmv-0005qE-Ut
 for linux-mediatek@lists.infradead.org; Tue, 20 Oct 2020 18:55:15 +0000
Received: by mail-wr1-x441.google.com with SMTP id n15so3538878wrq.2
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Oct 2020 11:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mScZ8ah2UgtXD/hHaoKN6/WZjy3yp0sHiaOHV6wLFW8=;
 b=kC1bm7nzh6+1h/Q0nN45KdnVbW/OI5uUooOLQ2Vs/LpFzRvJnYRUV+JwP0kcW7T4QR
 41jNfWJ2Z9lO48O89PVVflQTzDH60CTncg14/nyfU9FIEeibQS8Vrf68eqVidtcHz3vp
 3lByNPbOMsEb9+VEVy4e6EqFieABTbe7vnr3g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mScZ8ah2UgtXD/hHaoKN6/WZjy3yp0sHiaOHV6wLFW8=;
 b=kO1a+BB/LFsV7Aw0qrC7GvE1sFxMG2l28ptFXMWztA2k3PQZTugoeig5JcAh/OOk48
 wbfigXsil9LJW9rx87E9Yd8iCSZDZZouXjGyMPVVLbrqsDU0Zai1M3CGacufzfmEmtX6
 pIvt6apRZ+Ro7Eo5yQWfZ5L1P+bVmtWuchy6xYT/DWJt5tqt4vYUaeJ1ErkeEQojbOVs
 mX78z/UQCpc5F1sSuw958a+uwhucQNl59lR5MOSlQLHJmM6iXOToaw/31hhmdsH9zI1N
 Qxmb4sT5PKt9bdoTtaq+DuLrQfWcFK7Y7ReAB6GZPTZazIWTTISMJJg499Jl1K8N0Fw4
 5r6w==
X-Gm-Message-State: AOAM533syVTLM4+6TH1xTpD/pqmsNI83GjG5+3TRNHNh5kRoP5iEYFix
 RnVtTh6C7S0rEdyxB8UDLU6tz2lJNQL+pyy1qb8PRg==
X-Google-Smtp-Source: ABdhPJxsMtKaYZKishW1LFkqqTjFYaAFJFl/nN/EX/ADY7U9joK0FSO7QV5LU0tzsLkN7u78bKqbrTQK/Z5k/u4nUP8=
X-Received: by 2002:a5d:49ca:: with SMTP id t10mr5023373wrs.404.1603220112425; 
 Tue, 20 Oct 2020 11:55:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <7bdc0d63-27b1-f99e-c5f8-65f880733d16@linaro.org>
 <CAFv8NwLkvxX2avoLY+4NY5gBv0dQ863hFFiqy7iQOJxH4WenmQ@mail.gmail.com>
 <20201015161251.GF4390@sirena.org.uk>
 <CAFv8NwL1xX=yPGFqQL_mOzAnPTfH0Z0J6ibG1+D32W46Nx0KYQ@mail.gmail.com>
 <20201020143711.GC9448@sirena.org.uk>
 <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
In-Reply-To: <63f1a29c-0758-97b8-ce80-fe43d91630fa@linaro.org>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 21 Oct 2020 02:54:43 +0800
Message-ID: <CAFv8NwJ-+f146Ss9Mk=nEXjm1B--ZwhAgnfx-cTi7DGEKqC1-Q@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_145514_079331_9E4FB229 
X-CRM114-Status: GOOD (  28.72  )
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
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 20, 2020 at 10:55 PM Srinivas Kandagatla
<srinivas.kandagatla@linaro.org> wrote:
>
>
>
> On 20/10/2020 15:37, Mark Brown wrote:
> > I don't understand what "logic scattered in various dtsi files" means,
> > sorry.
> >
> >> Yes, that should work to describe the dailink we are using.
> >> But a more tricky issue is how to do calls like setting PLL in dai startup ops.
> > ...
> >
> >> I think that asking a generic machine driver to do configuration like
> >> this with only a limited interface of device property
> >> might be too much of an ask for the machine driver.
> > Richard was looking at some basic configuration for PLLs.
> >
> >> Would you mind if I simplify the compatible string like Srinivas
> >> suggested, and send a v12?
> >> As for other two kinds of variations that I am aware of:
> >> 1. front mic / rear mic
> >> 2. replace alc5682 with adau7002
> > The CODEC change is going to be described in the DT no matter what -
> > you'll have a reference to the CODEC node but it may make sense if
> > there's enough custom code around it.  For front vs rear mic the
> > simplest thing would just be to not mention which if this is a hardware
> > fixed thing, otherwise a control.
> >
> >> We can set different board names and different compatible strings to
> >> achieve such variation.
> >> So that it would make sense to describe configuration in compatible
> >> strings like you suggested, and also provides UCM a way to distinguish
> >> different boards.
> > I don't recall having suggested distinguishing these things with a
> > compatible string, especially not the microphones.  UCM can already use
> > the display names for the boards to distinguish things.
>
>
> Not with the compatible string!
>
> Currently card name, and long name are exactly same in all Qualcomm
> soundcards, which makes it very difficult to identify how those boards
> re wired up at UCM2 level. So the plan is to properly populate card long
> name with "model" property which can include details on how things are
> wiredup on that board.
>
> --srini

Hi Srini,
Thanks for taking a look.
Let me try to clarify your comments in case there is any misunderstanding.

I understand your request on having different board variations using
different sound card names through model property, and I totally agree
with that.
As for compatible strings, do you insist on having all the board
variations using exactly the same compatible string ?

Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
