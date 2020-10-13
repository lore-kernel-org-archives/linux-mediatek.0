Return-Path: <SRS0=564r=DU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B089CC43457
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 03:47:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 45ED8206ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Oct 2020 03:47:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cIG4ARjI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TUy1/e/8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 45ED8206ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7xHHgNHnZU8iJ81ZYgM9rGpVqqcovYlpda/pcL95zwc=; b=cIG4ARjIHNPtosNpuTZBJbOvh
	06fIPIALbHU9Lpa40aFzc4Y8n9ps/dFdFFoFtWyGfbOfJlHfagzTGsYqFFlMpl+8OL+bYhAR1K6LV
	2ILPhU2eE5nQkdb9Lh6k8+YOC+mtS8WvcTTDE9BKIFXN//5sL19Gp7gN03AkgPYTlKM23nTGTfWL2
	vJFTWUjidQxyZYoHGcelW8+MgeevcRv/Cv5xsZL+RrXdFmT5yaybF0temyjdrh+pqenAWtexqi3qp
	bkWCk+qi0VFK+ScjibvDJHPvALkW2kzv8tAL5dpldr3pOKDQIB269QdS4cdbtFTSN3E3P/TlwYO2r
	KBakBsvOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSBHO-0005eY-FT; Tue, 13 Oct 2020 03:47:14 +0000
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSBHK-0005dG-7i
 for linux-mediatek@lists.infradead.org; Tue, 13 Oct 2020 03:47:11 +0000
Received: by mail-wr1-x443.google.com with SMTP id b8so8955969wrn.0
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Oct 2020 20:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ndqNqzRXOPPB0ogWDEyLlyUsAwARJUaefBSahD5nDa4=;
 b=TUy1/e/8zdrtz/TDD9ZlkK4/DfeGPgRUa3QeDaYfeh4G1LHFulpMmCsbTwbGSEyBQK
 lAu8jh7FoG6cHbwFJSQeIx9iXkCE/ueGwcI2MrlJUnM/ojvgJ0zqYcQCHh3lZGIzQahy
 ZyzDEyzFbz4onJYf00FLDHv5UWWR6DCw8+OeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ndqNqzRXOPPB0ogWDEyLlyUsAwARJUaefBSahD5nDa4=;
 b=U+suYKrsG9g1vSiPBA3mqHTp53+c3sOArSxKqos4PwwqWXlE0ou3+sI8AGt5C+Hecs
 s7yDk0itvD6oU0O6FwTOchfSC+dm5krR5yDcyYBymgwF4kNHoZ2lnEb/6gs6ry6tGyzR
 uZt0zMfQMedeCf4pjUkW4DY8MIFA6mDsq71QImtkahsRHhS8+F/IId5Nk/4rM3kJ9wbK
 PYo/ZTdnFcgd/QDjaLJBzBF7YaLLgVe/S1rpvTPdm7oIxd/Z9gifVA8rzuApJuW8hvle
 89En1NXzkZ1dezYpakvwsaWiaFOnZEdZtg/VB+EMN93IkOnCa95s7vLfrujXQ2Qim0nJ
 VHkw==
X-Gm-Message-State: AOAM531r+uFxpxTuaphG+Z9lQjNhLoQ2LkXOcUF2O5EXh4RxaAbfitXv
 IC/ufnUmm1oF/wua+0yDGxRHnKmEn/+pkyfIQ6+fGg==
X-Google-Smtp-Source: ABdhPJxLXiwL7qf220DKfHJQfoYxQlufVps95HZ1MB4kZujN6DOUdk3utBGFAuRuLvV4U9gUnbWpUWxLmoiRUK7RRoY=
X-Received: by 2002:a5d:6a43:: with SMTP id t3mr34196747wrw.426.1602560826699; 
 Mon, 12 Oct 2020 20:47:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200914080619.4178587-1-cychiang@chromium.org>
 <20200914080619.4178587-3-cychiang@chromium.org>
 <20200914174812.GA4125843@bogus>
 <CAFv8NwLb4zKqc8BbRq5_B4PnGR+BAMZa2RpB0qjLez921j-diA@mail.gmail.com>
In-Reply-To: <CAFv8NwLb4zKqc8BbRq5_B4PnGR+BAMZa2RpB0qjLez921j-diA@mail.gmail.com>
From: Cheng-yi Chiang <cychiang@chromium.org>
Date: Tue, 13 Oct 2020 11:46:40 +0800
Message-ID: <CAFv8Nw+6YQnbQGYHRYua9pH-bdb2jSOXiTpf9Wi9jKjgcEwuoA@mail.gmail.com>
Subject: Re: [PATCH v11 2/3] ASoC: qcom: dt-bindings: Add sc7180 machine
 bindings
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201012_234710_312504_ACA9A846 
X-CRM114-Status: GOOD (  22.30  )
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
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Rohit kumar <rohitkr@codeaurora.org>,
 Patrick Lai <plai@codeaurora.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Andy Gross <agross@kernel.org>, Dylan Reid <dgreid@chromium.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Tzung-Bi Shih <tzungbi@chromium.org>,
 Srinivasa Rao <srivasam@codeaurora.org>, Stephan Gerhold <stephan@gerhold.net>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Doug Anderson <dianders@chromium.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 Srini Kandagatla <srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2020 at 8:44 PM Cheng-yi Chiang <cychiang@chromium.org> wrote:
>
> On Tue, Sep 15, 2020 at 1:48 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, 14 Sep 2020 16:06:18 +0800, Cheng-Yi Chiang wrote:
> > > Add devicetree bindings documentation file for sc7180 sound card.
> > >
> > > Signed-off-by: Cheng-Yi Chiang <cychiang@chromium.org>
> > > ---
> > >  .../bindings/sound/qcom,sc7180.yaml           | 130 ++++++++++++++++++
> > >  1 file changed, 130 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/qcom,sc7180.yaml
> > >
> >
> >
> > Please add Acked-by/Reviewed-by tags when posting new versions. However,
> > there's no need to repost patches *only* to add the tags. The upstream
> > maintainer will do that for acks received on the version they apply.
> >
> > If a tag was not added on purpose, please state why and what changed.
> >
>
> Hi Rob,
> There was a change between v9 and v10 on compatible string so I did
> not add your Reviewed-by.
> Now it is "qcom,sc7180-sndcard-rt5682-m98357-1mic" following Stephan's
> comment in
>
> https://patchwork.kernel.org/comment/23608881/
>
> to make compatible string more specific to board configuration.
> I only add the note to the cover letter. Sorry the cover letter became
> too long to follow.
> I will add the note in patch mail itself for future changes.
> Thanks for taking a look again.


Hi Rob,
Could you please kindly review this patch ?

v11 contains the compatible string  "qcom,sc7180-sndcard-rt5682-m98357-1mic"
following Stephan's suggestion in

"[v9,3/3] ASoC: qcom: sc7180: Add machine driver for sound card registration"
( https://patchwork.kernel.org/patch/11770201/#23608881 )

to specify the combination of components.

Please let me know if this looks good to you.
Thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
