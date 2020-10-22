Return-Path: <SRS0=jz23=D5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04DB3C55179
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 03:30:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7C7822173E
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Oct 2020 03:30:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UiIDeuG7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="QmKzFiaH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7C7822173E
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E1wKAu3EiralWCSp/vcj3gvAbmXigsboQrE2nTzp/V0=; b=UiIDeuG7DYiSVvVO4yGqguTPc
	Sul8vLFIfFXlWuSmpsmAKXp4A/4T0m7Ddj3IPAl2A+VzsipUmu/TSrJRgX/tqeuMz+UhHcVaVekDJ
	PP5LlPhm90W/2Q1emytS+eGzB0vxC8IJ2n/qHfiBidnLgaqL8pIyEUE1iWzdH4LKZXXwVdiR4OZZ9
	z2EP9myHvr23Rf5mESQT+jXwv+KM/XDvN19D0xk4woFy6oJ4RcpNcKEFGLahySllV4tmKwxN1JDT7
	bfotrPr/smlTxnKbO8Y3jF6q+4NJmzJmEsgkUEB2V+6eXRivMdS5lYl/dTvlNnHTLiYeyS5bt3RE6
	pdZEDrsLg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kVRIL-0005k0-Um; Thu, 22 Oct 2020 03:29:42 +0000
Received: from mail-io1-xd44.google.com ([2607:f8b0:4864:20::d44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kVRII-0005iU-HL
 for linux-mediatek@lists.infradead.org; Thu, 22 Oct 2020 03:29:39 +0000
Received: by mail-io1-xd44.google.com with SMTP id r9so68039ioo.7
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Oct 2020 20:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IMFKi57vTn4WORdntFjLONbVhz/S8EeuoMU/ru37Fjk=;
 b=QmKzFiaHxS37kWhYqOevmJSha395OemOg2KLsjigL/6YgPyC0cWSkaDr+ffKa61vPU
 GXX3dfuhinc3Qluqg/LcYmWn/uxtlNOgkwHIV8z5wVdWNaIK/qBYmvkfpKFr6uIPXDuS
 AfhJpRPcSFHBisu+853OTgVeFr30qYIhwo146On5XcIrt6UvkDzAOUc8b9oPP4LHY+aP
 mcF96p2cmiAaoW59NhLHswwH2t/U88kQXPZ09XztB41AQUXax5V0J3N4+8uTmW9J5nLp
 gvtykGqSZeSnzrM85+VdZrTtv1zRS7Q7rVERJrrNJBtv0PRbYLmliKduECch9kebV8vo
 8yGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IMFKi57vTn4WORdntFjLONbVhz/S8EeuoMU/ru37Fjk=;
 b=BMSGnbJI0/nhyD53yYIhPR0sWADT71ov9unldh2yW2IUvhkMwx78mORiE5/rM8OoHJ
 0bOEJKJqdvmXCeqSL6pPUsK9OewE80laQKtbr6b3laaZxVNhMlNrKOAoymtK4//BM7KV
 7kABxIOUezTBtl216o2YBvRPC8Ws4fYQxXBub159NDLjIINz0i0DMbX5MffcT8rSeUdo
 IDWm70Qszvy9DOcvfYIGk2xyWe/FzZDoE1RsY7u/85GfakskpwA7EWYz6S7AjuQTw0Pw
 /KygpXVujCciOGX8T94BNr7/gVvOrRGW9usZ+60cc5CbkFXDAJIbPgQ1i/ZfzDy62xMB
 XC1A==
X-Gm-Message-State: AOAM5330ImBQziQKcb+5Fadp5wGw5Wns+EOj3eDK+4GCMEMVPj1WgCfm
 aj6vuvr2L1hbCjTc7PHf8oNmoZz0/gMteezwBk8JqQ==
X-Google-Smtp-Source: ABdhPJxMauPqYM6FB9F47HpfghenbvywgGSYzCRS3yrWm7U0RrqNphhFJ8ty4CuavT4aU+0YJFuGRFcGD/Y9+5aVe7A=
X-Received: by 2002:a5d:9f0e:: with SMTP id q14mr438269iot.185.1603337374464; 
 Wed, 21 Oct 2020 20:29:34 -0700 (PDT)
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
In-Reply-To: <20201021123913.GD4497@sirena.org.uk>
From: Tzung-Bi Shih <tzungbi@google.com>
Date: Thu, 22 Oct 2020 11:29:23 +0800
Message-ID: <CA+Px+wV-uoODRQTZqv7RuyOUoGBoh5GnT2h4iW9mJGRL=UFfgQ@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Mark Brown <broonie@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201021_232938_627595_F48213A6 
X-CRM114-Status: GOOD (  11.83  )
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
 Cheng-yi Chiang <cychiang@chromium.org>, Patrick Lai <plai@codeaurora.org>,
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

Hi, sorry for jumping into your discussion but I am trying to
summarize them to make sure we are on the same page.  Pardon me to
manually copy-and-paste partial sentences to quote.

ACK:
- Don't expose DAI connections in compatible strings.
- Use "model" DT property to make the card more UCM2-friendly.
- Expose new DT properties to distinguish different DMIC models.

NACK:
- All the board variations using exactly the same compatible string.
=> This is less realistic.  Although the CODECS information can be
retrieved from DT, it is inevitable to have some custom code for each
CODEC.

Per Mark's words:
> a different CODEC is something that often justifies a separate compatible
I think we should use different compatible strings for new CODECS
combinations.  And we should try to reuse the machine driver if they
share the most code.  In the worst case, introduce a new machine
driver for the new CODECS combinations.

- Srinivas's suggestion to set driver_name.
e.g. card->driver_name = "SM8250";
=> This sounds like a new DT property should be parsed in
sound/soc/qcom/common.c.  For example: "qcom,family"?  But as we do
less care about UCM2 for now, I would prefer to just leave it as is.


I would expect the following variants in DTS (just for example):

sound {
  compatible = "qcom,sc7180-trogdor";
  model = "sc7180-rt5682-max98357a-1mic";
}

sound {
  compatible = "qcom,sc7180-trogdor";
  model = "sc7180-rt5682-max98357a-2mic";
  dmic-gpio = ...
}

sound {
  compatible = "qcom,sc7180-pompom";
  model = "sc7180-adau7002-max98357a";
}


Please correct me if there is any misunderstanding.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
