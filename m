Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E9BCC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 04:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B35ZTE2adzguA+KA+PCVmrFGgSP+8khovmRbpkdhlpk=; b=BOAhVLKHjirK8wEF/9Gw+J8j8r
	MhEBwo16cAmvYEIHGv0Bhizgim7eI5n9ijNua0jeTvo9q0wx42nBH/OA1bPCnw6OGdZbovKsPjg+v
	QI62XRS+ZgbQ71B5wLUlFPPYHUGivVEu2gdljndqwOGLNUD6QyjwlYHPQ3MMVDMEhfoXZ7wJ6l6S1
	Txc19Tc/8hNrhSLlS2WMJU/Je5lr8kSQlo1WLFj3TgfgrRKIpTt4fy6YqLWrq6LCpYwHDYJiexIbr
	k3yOBOvOTW7QpJrgHCIHnahviubljue9dGDrO8n2JLYMTfRnbcz82irDHBaCe8ew9luALU91vHuR3
	hpt7NGOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGBmr-007HYP-Bj; Tue, 26 Jul 2022 04:03:13 +0000
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGBmf-007HSK-6Q
	for linux-mediatek@lists.infradead.org; Tue, 26 Jul 2022 04:03:02 +0000
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-31f41584236so21581327b3.5
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Jul 2022 21:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B35ZTE2adzguA+KA+PCVmrFGgSP+8khovmRbpkdhlpk=;
        b=iCdcCg7dM7MrFzki/3KEbQYMzTmQgc9+qWJAZrNU8ELqn0bE3XgMEc1d2okpbiVLZ+
         6GDIDf1M6474U1hs605YAbEATDzljM+GguLrWnC/0MReW8WUUI/rjOo2uG1R4JD4nwmd
         dQFWCaW1ru1zC9yXCYQ8og8B/ViW4imjyb9yE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B35ZTE2adzguA+KA+PCVmrFGgSP+8khovmRbpkdhlpk=;
        b=Mx8UcVC5eiMgdidbLIrOcmZWj9IEbNrZmQG/wglAu9ITR6jRyE7DCg3TIiCLOIRIoF
         UA3Uq+59faSAjOi7yTeCogBo9VAT/NQMCZnDs6hNNsKhIUY2OE+BFq6cfacyNMLg80U6
         1x3dMlt2j9Osb8LbeSzWzXs0fLqq+Ege8wyVmEJPL8yIjkwoFTsHvbYqQQmZCTCLzLl5
         VLokLVVuKkcjSGnKNlWavvg4m9QXBIgGD8Z/sD1JjqfVAiSKQlQijfc73V1kzwwNZwle
         PuhCwq1o3aQiiHCXo+D5l5hem5FbrDQX3YvGtTycM4HQ5R/zlwbvw1lEp/0EP5wm6Kqn
         CDOg==
X-Gm-Message-State: AJIora8eNRLDgVdtxVgK1OjO1nODml/3DeJBrcOO/2uepy1aSaxWk+f6
	yl+OFnsQPzevhjob8sLiDIIZWZQ7WBANzEHZGFvxoA==
X-Google-Smtp-Source: AGRyM1vmWMY8rCSkbeemY4WorPmrRFiCRux9K2cC6nnBK7+bevjeA5pxMFdDx99a/rivPkSWyE2mHoHOJfMxvnIXARo=
X-Received: by 2002:a0d:d90f:0:b0:31e:5401:8533 with SMTP id
 b15-20020a0dd90f000000b0031e54018533mr28793ywe.167.1658808178849; Mon, 25 Jul
 2022 21:02:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220721145017.918102-1-angelogioacchino.delregno@collabora.com>
 <20220721145017.918102-7-angelogioacchino.delregno@collabora.com>
 <CAGXv+5E+6aCz3dxsfCqZAOkcmqDp0YWngsv-OZ23NDYhuZSfHw@mail.gmail.com> <f3027153-860f-7ffc-b4a0-ff2a43100cf4@collabora.com>
In-Reply-To: <f3027153-860f-7ffc-b4a0-ff2a43100cf4@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Tue, 26 Jul 2022 12:02:48 +0800
Message-ID: <CAGXv+5EkQ_CmhHGTkJ4DfmRUZnKw3XaJ0qUvQHG8=qxXPUPY9w@mail.gmail.com>
Subject: Re: [PATCH v2 6/8] arm64: dts: mediatek: cherry: Enable DSP, audio
 codec and sound card
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_210301_240909_339CE578 
X-CRM114-Status: GOOD (  20.25  )
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

On Mon, Jul 25, 2022 at 6:49 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 25/07/22 12:44, Chen-Yu Tsai ha scritto:
> > On Thu, Jul 21, 2022 at 10:53 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> All machines of the Cherry platform have a working DSP (integrated
> >> into the MT8195 SoC), and audio support, some with a different audio
> >> codec: specifically, some using Realtek's RT5682I and some RT5682S.
> >>
> >> Write a configuration for all the audio bits to enable functionality.
> >
> > I think we're still missing some code for SOF that implements the
> > machine_select() callback, plus the firmware has to be fetched from
> > the ChromeOS rootfs.
> >
> > It might make sense to have SOF disabled for now. Removing the adsp
> > reference and the overriding dai-link entry from the sound node
> > should do the trick.
> >
>
> Uhm... I think that we should either have audio, with DSP, or not have it
> at all... the userspace configurations will differ, so we'd end up with
> two different confs of which one will get unused and cluttering the ucm2
> conf git.

You're right. I haven't even figured out which ones to pull in.

> At this point, I think that the most sensible option is to either omit
> this commit, or keep audio disabled until the machine_select() callback
> gets in...

Agreed.

ChenYu

