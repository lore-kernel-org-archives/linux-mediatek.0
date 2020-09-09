Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDF8C43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 09:24:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 133912145D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 09:24:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SaSetiab";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lgk3l2Qh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 133912145D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yNWHHDcYhzRqRwS48Wy6kXBRNd8ok0Bu6pebdEiZkKw=; b=SaSetiabiy0K0UVJMWW0y9sqt
	knDfJ1Q/nI3oWrBefJL1gfzcx2+SRGKs8SFBwM8gEUCDSzQMqmAWl7NUa9a2bRzeNhoENq4GF5VAM
	A9MaU7gvqMnkN9gHcBig8G5yrGFbrD+DPfIzH7bQ6OPJB/7vrxaQQsbMcw/1y5P4LPeQfnD7fX+b7
	n3fE8oKy5xdFdj2OItv6pjyl0iAudVE19Ond2S52QRS6oScjhWASq6bEJUdRT3rXzdlrDhfdyjZFe
	BaM8wfnQiUW6PZi0oL4l7Z9ZI3GWhDUfQqp66r4FxziYs2A1gQcyUnTaaw736KxiUkFC/zPSFWHwp
	kGBIybcYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFwKv-00053V-Te; Wed, 09 Sep 2020 09:24:17 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFwKr-00051m-Ai
 for linux-mediatek@lists.infradead.org; Wed, 09 Sep 2020 09:24:15 +0000
Received: by mail-wm1-x342.google.com with SMTP id w2so1572999wmi.1
 for <linux-mediatek@lists.infradead.org>; Wed, 09 Sep 2020 02:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AmAjr6xvyauDkIBPHoJreMuavbYPMqoWr9WPQMiNPkg=;
 b=lgk3l2QheCZRIdB/DXYePwXEoUJvYOIpV83Gh1pRZ2BYhkcAj5c3ogzbaLtFuFI9ts
 jpGHnH6HqqegvOnM9Uqug7F1IJiuwk+eek3yWSn2ufF9Y+cYzVYdiFc0zs3ZtTMRf5cM
 XT5LclUiUzG/7eZUxr9lBGgyThOWt8HJEhlvI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AmAjr6xvyauDkIBPHoJreMuavbYPMqoWr9WPQMiNPkg=;
 b=CXYLgwIPihvxVm3irjNW2/N5MT37F2oVA5lTIojv55oK1h00SVnVnd+pNrkvSBeWDr
 ztaUSUnPkwI/w/AB7tlL3woMqSJc0vi+z7g62bqQRTATODSYuSADwo0qI1T3tEuKGjZ6
 CdpASGjW0IiqwNCNmzn7ZQjQfV72B+uC/W40CVSq+PdY5Jz5GYUr6zJdljy4ZlC4rvom
 mdT72l/QGBn3hecXipNfQ0feNh9x0Q+In5aCsNQBohHEWo7zxc+o+7QhjFZzsjXyl4id
 7svpMDQ+WYuqv+452yjHDOCAOcXDWP08K9pi4Cx5pswjbrxMJTP560Yb7MOcrSWJTFKL
 RN3Q==
X-Gm-Message-State: AOAM531GJq0S0v7VmJOWXHO4+MYnwkb7neJkIygetw2nfuoFI+4WADku
 ioYPKpryRJ8PpD7nYI2i+AGFZ1HdYB+W4ja+tYuNJA==
X-Google-Smtp-Source: ABdhPJyCFk+9azkQozj50ygO4Fld+/Ww0XhKIzoSM/wUVfsy/tdWyDVDQ6WSJk0DhWTK8YoZzQXF1zAmuO+KS+gPPFU=
X-Received: by 2002:a7b:c3c8:: with SMTP id t8mr2599038wmj.101.1599643450162; 
 Wed, 09 Sep 2020 02:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <20200907100039.1731457-1-cychiang@chromium.org>
 <20200907100039.1731457-3-cychiang@chromium.org>
 <20200908203357.GA861143@bogus>
In-Reply-To: <20200908203357.GA861143@bogus>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Wed, 9 Sep 2020 17:23:43 +0800
Message-ID: <CAFv8NwLMAkFhVT-ML7QHbnSkqmgh=5SrNSik5eSCTHB1=DGQ0A@mail.gmail.com>
Subject: Re: [PATCH v7 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_052413_408163_17EFECFC 
X-CRM114-Status: GOOD (  24.75  )
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
 Heiko Stuebner <heiko@sntech.de>, Takashi Iwai <tiwai@suse.com>,
 Rohit kumar <rohitkr@codeaurora.org>, Patrick Lai <plai@codeaurora.org>,
 linux-rockchip@lists.infradead.org, Andy Gross <agross@kernel.org>,
 Dylan Reid <dgreid@chromium.org>, Jaroslav Kysela <perex@perex.cz>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Sep 9, 2020 at 4:34 AM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Sep 07, 2020 at 06:00:38PM +0800, Cheng-Yi Chiang wrote:
> > Add devicetree bindings documentation file for sc7180 sound card.
> >
> > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > ---
> >  .../bindings/sound/qcom,sc7180.yaml           | 143 ++++++++++++++++++
> >  1 file changed, 143 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > new file mode 100644
> > index 000000000000..ae809346ca80
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > @@ -0,0 +1,143 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/qcom,sc7180.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Qualcomm Technologies Inc. SC7180 ASoC sound card driver
> > +
> > +maintainers:
> > +  - Rohit kumar <rohitkr@codeaurora.org>
> > +  - Cheng-Yi Chiang <cychiang@chromium.org>
> > +
> > +description:
> > +  This binding describes the SC7180 sound card which uses LPASS for audio.
> > +
> > +properties:
> > +  compatible:
> > +    const: qcom,sc7180-sndcard
> > +
> > +  audio-routing:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description:
> > +      A list of the connections between audio components. Each entry is a
> > +      pair of strings, the first being the connection's sink, the second
> > +      being the connection's source.
> > +
> > +  model:
> > +    $ref: /schemas/types.yaml#/definitions/string
> > +    description: User specified audio sound card name
> > +
> > +  headset-jack:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle of the codec for headset detection
> > +
> > +  hdmi-jack:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle of the codec for hdmi jack detection
>
> You already have links to these devices. Why duplicate it here?
>
> What if you had 2 headsets? This doesn't scale.
>
Hi Rob, thanks for reviewing.
There was some discussion in
https://patchwork.kernel.org/patch/11737905/#23571643 about how to
specify the dailink that has a headset jack.
I would like to pass the information of headset jack and hdmi jack to
the machine driver so the machine driver can call
snd_soc_component_set_jack to set jack when init the corresponding link.
Headset jack and hdmi jack will be treated differently for button and
event type.
Because of this, we can not just set a property "jack" in the link.

As for the 2 headsets case (I guess you mean hp jack and mic jack), on
this board we will not have this use case.
If someone really wants to build hp jack and mic jack on the board
based on this machine driver, we can add two more property hp-jack and
mic-jack to specify that,
as the machine driver will need to know the different jack types
anyway. What do you think ?

Or could you please suggest a proper way to pass such information ?

Thanks!
>
> Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
