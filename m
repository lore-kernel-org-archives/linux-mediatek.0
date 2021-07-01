Return-Path: <SRS0=jcdg=LZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92724C11F64
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 08:17:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C93461480
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Jul 2021 08:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C93461480
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e6Uixu/C4PhbhrGFiWvu2tcrmTTD/iFmXN4KCkF48JQ=; b=IruqBZDv2fbNP+
	g0fzUP2CvIV06jFa5JxcDUBvD5quGT0oQTXE3KFKDe/cN9ZKIfuXPlk+APfuZ4vCzB8rT+IBeHgPN
	gF+fvAVR+nn4LnGfhBAhugwej36NX0IecE6oE13uucjQkw/lBukbw5C1YeMIbukPXsZa9DHdDKmAe
	Bpsu/x4wzAfn7K+EgDQL36ZAudBQWJR9n/EO21fKWdwJ7WM+8/yAFa5mkC/nRDb2BuDicgJE/A7ZV
	Lz1N3ssihXeBDf7tEOcT07sVBjdpvblsCyk+uKUlBDjytBhnyBWumcX25Sd9Q0b+PocI4ZPNoz4cY
	PMQEbZkC+issWreHlRrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lyrt1-00GVDE-1G; Thu, 01 Jul 2021 08:17:27 +0000
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lyrsx-00GVBv-Nn
 for linux-mediatek@lists.infradead.org; Thu, 01 Jul 2021 08:17:25 +0000
Received: by mail-il1-x12b.google.com with SMTP id o10so5584835ils.6
 for <linux-mediatek@lists.infradead.org>; Thu, 01 Jul 2021 01:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZPJEazgT8i7Ze/1+I4QL68xCucF/zfMT9D/43T7Sq7I=;
 b=eIuw41F0BAJ8wZkYA7NmWG/a8NvDrb5h9iqkfqcjmpGkl/23FMw8J7Ddj9eVatEvys
 AoP58ePyZW3f0WQGlVP7tZ+GTN1aMpG5o6+yWSvSyM6xCrylQ4c2APXO+83w5VAPBAam
 D3eJF2DxiH9OAojoqbOikr6m89a2MkLHFh8SM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZPJEazgT8i7Ze/1+I4QL68xCucF/zfMT9D/43T7Sq7I=;
 b=hxWNK03Ly5efJAVCkt2J5YFCJrY7z1VbASw3ZwZo0RO5uEBr6kOkIngaOV7gTAskOd
 K6gvHjU2/KrL0zcgA/P42O8KVTOWLpBAyCCpklwLPQ7g3WdXIG0kuY8IE+QiQkyxJpIb
 sgiHETSugPcrMz+aVSrou82ucafPB+XdIK7pShwUGZg3WWQ5/NCjcEDjbTBAI8o8ITEE
 5jQtGgjjkCIdtl/pQsOcnkmYy11wVD1iguL1BvWI9uJ3y9Jl8GqRudn7ea+rzkDE/AWA
 XnA/Fk2NYXzOIQfN3DJhPYA5ow6wIgFYxKGEagK4DRXztPVL3ih/tmlpLbuzMidmC76C
 3msA==
X-Gm-Message-State: AOAM532nlZDy9oRFqpaQGudHcGbR6YxBicjf4tnZ82rSQV010Y2I2nss
 wLUHlnZIBwC00gZ11YsUtm/MnKcyuSspZiD5VKKpJA==
X-Google-Smtp-Source: ABdhPJwmnKoA/8qGsvpQQRjfODUVGXnl9M4fCr7IxwXSfSMzbjrRBsW5KWu1USnvrPEASRrj8N2+BmSLssdrm+61XM8=
X-Received: by 2002:a92:7b07:: with SMTP id w7mr29093529ilc.308.1625127441220; 
 Thu, 01 Jul 2021 01:17:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210701065439.2527790-1-hsinyi@chromium.org>
 <CAGXv+5GNkqHOxv9zXoa3yLh5_FXGUARqXd82W00CBTnHS_BFPw@mail.gmail.com>
In-Reply-To: <CAGXv+5GNkqHOxv9zXoa3yLh5_FXGUARqXd82W00CBTnHS_BFPw@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 1 Jul 2021 16:16:55 +0800
Message-ID: <CAJMQK-gsJRwBGg7DBwWbozpmj-oZ1RsETQtwarRpeFkk2qjGJQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: mediatek: Fix fallback behavior for
 bias_set_combo
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 zhiyong.tao@mediatek.com, Matthias Brugger <matthias.bgg@gmail.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-gpio@vger.kernel.org, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, lkml <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210701_011723_856124_014EA2D9 
X-CRM114-Status: GOOD (  27.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 1, 2021 at 3:21 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Thu, Jul 1, 2021 at 2:55 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Some pin doesn't support PUPD register, if it fails and fallbacks with
> > bias_set_combo case, it will call mtk_pinconf_bias_set_pupd_r1_r0() to
> > modify the PUPD pin again.
> >
> > Since the general bias set are either PU/PD or PULLSEL/PULLEN, try
> > bias_set or bias_set_rev1 for this fallback case.
> >
> > Fixes: 81bd1579b43e ("pinctrl: mediatek: Fix fallback call path")
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > index 5b3b048725cc8..0cdff487836fa 100644
> > --- a/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common-v2.c
> > @@ -926,9 +926,12 @@ int mtk_pinconf_adv_pull_set(struct mtk_pinctrl *hw,
> >                         if (err)
> >                                 return err;
> >                 } else if (hw->soc->bias_set_combo) {
> > -                       err = hw->soc->bias_set_combo(hw, desc, pullup, arg);
> > -                       if (err)
> > -                               return err;
> > +                       err = mtk_pinconf_bias_set_rev1(hw, desc, pullup);
> > +                       if (err) {
> > +                               err = mtk_pinconf_bias_set(hw, desc, pullup);
> > +                               if (err)
> > +                                       return err;
>
> You don't need to nest this. If mtk_pinconf_bias_set_rev1() succeeds,
> err would be 0 and the following if blocks would all be skipped. So:
>
> err = mtk_pinconf_bias_set_rev1();
> if (err)
>         err = mtk_pinconf_bias_set();
> if (err)
>         return err;
>
> Moreover, maybe you should rework the test for hw->soc->bias_set_combo,
> as it is no longer relevant to the code within the if block?
>

Thanks for the comments. It's addressed in v2.

We can try PU/PD and PULLSEL/PULLEN even for pins that don't support
them (eg. mt6797). They will return -ENOTSUPP in
mtk_hw_pin_field_lookup() so won't break current testing logic.

>
> ChenYu
>
> > +                       }
> >                 } else {
> >                         return -ENOTSUPP;
> >                 }
> > --
> > 2.32.0.93.g670b81a890-goog
> >
> >
> > _______________________________________________
> > Linux-mediatek mailing list
> > Linux-mediatek@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
