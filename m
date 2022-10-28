Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82D7C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 18:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j5EifIBTTA4Q9MeGr5GuWpo/RfwKB+MeKNIB/9GceQo=; b=mVXz2pr0UMk7NDhi/tBMbHMObp
	E8UpnEZVTtHvUlizY2ORRh9mPpN4yXw4jcNAKd7PoqRdMbuQKCEOHB4L9yNf+f7fAYpx97B6mxxHO
	1GKbsGvgn0GE9WVAcmojyuvoZAqEUpz6M1CEG4B0sr1jzh7XXp9m9ym9imo1BQWzUhsN5jrvyMGYe
	QwusqIIZj51YYOq7H/gD/P2D0c57KfPTuv/C4e3aqqFPq3+uWvlNoyHy3nN6bPPmUMYBO6bPjN2bT
	jbegBDVtVsNyu87ondHh//ZafSc5L5lddQgqMHr17fBzdzIi9CyZQ7sIjPr+Lm09yM+DC+fKTJXiE
	myGz5S+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooU4L-001d1G-JO; Fri, 28 Oct 2022 18:27:01 +0000
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooU3y-001cy5-Qn
	for linux-mediatek@lists.infradead.org; Fri, 28 Oct 2022 18:26:41 +0000
Received: by mail-yw1-x1135.google.com with SMTP id 00721157ae682-3321c2a8d4cso54696377b3.5
        for <linux-mediatek@lists.infradead.org>; Fri, 28 Oct 2022 11:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=j5EifIBTTA4Q9MeGr5GuWpo/RfwKB+MeKNIB/9GceQo=;
        b=YUvbU1PpsyUC0xVCXSieAxZ6vYr4VEA8nHXSk5P4lFHIX6oEJWc5mCr/kQzfazyxZD
         GXNWik6tau12kCTYEtG1jEVTFeQ8x2qsmTErDuLDS3JTMIFWDf8nxG1b/6dipQTGLJDZ
         Vmh5w9sxSDqx20AH76/n/mZCllNsxjdto+XjXyH2pLBkhk5AAyNVtb82L74Zrfh8BQ9j
         5I5JyxrW5aKRKrFTZL09I9LT2rrVoBduaQRJ6UoFj7kE4yZFAnImYiKzm68Y07t0xrIr
         GURnBWhN2u0b90BaMv1cNUkOopljZM/G4Od+GmpmM0L+7JizDwTdNnOGIZa1IUmsjlA5
         GcHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j5EifIBTTA4Q9MeGr5GuWpo/RfwKB+MeKNIB/9GceQo=;
        b=3JhE6MHvf/v1VCYXvP7ksCMSK+QwF4ncqGAJEmLjn+Y0I6JlY/N/OoTul77C3GHgH1
         uWXKeOy89D/70JJo4pPl4uUlvwfPUBKcNR0v84KL5qfdiNt36h/pBC/pgb2+8wSC9AF5
         I4tPGLbb/SeM8Un4II+fWokA5SJ9K39CEQRFS1/8YHAq36+zudFb09MT6wp506rT7J0a
         lDJg8j50aM84245XUK8f3k5Okr1BX93A3FGB8+Ao7FKKRVe7bmxu6oCKiqR4BkVZu4U5
         N4dQThBBtsJFhiCe/tVCKzhu4lLs6D/H1PgyMIA9waBpfBVBmEZI2leAeLvwcz8t5cbI
         CmRw==
X-Gm-Message-State: ACrzQf26LJGKKrzjezTKYThjdXpRgFflkL2CvudrYUUDWxBAPMenWZZo
	bxQHyQeszGe0hA2HDBwGXlYxI6mipH8iztQKNi9f4g==
X-Google-Smtp-Source: AMsMyM7UOWyL2Dv6r9TIrvrO+niGjVrF9GXwAEmH7LXG29idxrg8+LTErqg85FMT3mLbPbDQ2bGc6ZQBpNv9Bl1DiMA=
X-Received: by 2002:a81:164b:0:b0:36f:ced7:985f with SMTP id
 72-20020a81164b000000b0036fced7985fmr773896yww.360.1666981597226; Fri, 28 Oct
 2022 11:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221028172215.1471235-1-ajye_huang@compal.corp-partner.google.com>
 <20221028172215.1471235-2-ajye_huang@compal.corp-partner.google.com> <628ac98c-0755-e6f6-e010-f1e772c4b71a@linaro.org>
In-Reply-To: <628ac98c-0755-e6f6-e010-f1e772c4b71a@linaro.org>
From: Ajye Huang <ajye_huang@compal.corp-partner.google.com>
Date: Sat, 29 Oct 2022 02:26:30 +0800
Message-ID: <CALprXBY8FUc_w=JO3bp9m1e=1d5Fcvrou_En1JG8Hx0BYuETKw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for two MICs case
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, 
	linux-mediatek@lists.infradead.org, "chunxu . li" <chunxu.li@mediatek.com>, 
	Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, Jiaxin Yu <jiaxin.yu@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	=?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	alsa-devel@alsa-project.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_112638_885369_6C31BF40 
X-CRM114-Status: GOOD (  11.76  )
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

On Sat, Oct 29, 2022 at 1:58 AM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:


> >
> > +  dmic-gpios:
> > +    maxItems: 1
> > +    description: GPIO for switching between DMICs
>
> Switching how? Enabling? What is the meaning of each GPIO pin value?
>
I think I should add more like an example,
  description: dmic-gpios optional prop for switching between two DMICs.
                    Ex, the GPIO can control a MUX HW component to
                    select dmic clk and data form a Front or Rear dmic.

Do you agree with that or have other suggestions? If do, I will send
the v3 patch for you to check, thanks
> >
> > +        dmic-gpios = <&pio 23 0>;
>
> Use defines for flags.

Yes, you are right, I will change it to
dmic-gpios = <&pio 23 GPIO_ACTIVE_HIGH>;

