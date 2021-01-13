Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8198C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 06:00:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C14523102
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 06:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C14523102
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XpW3/DOAt8D4lSw+sW+86efXkxHzNqhG4X/zRQIMAds=; b=wBdUF9cal9IrCQ7xwT+XgSQNq
	YTrlL0F9tTh5dJAsvDFXd/M8Rk1iGw+cpTTsqg9WZ4uHXXYQRGnY5HtZP1SAAgRm30go8LxOaE/u4
	S8aLHrjvVQHNB+G+lqlTEh9QW3oswIiDSjF9jmfZZNNSWm6ZBaEs4ySSo/3oWeLTkt0W4nu12n8zn
	PVxvz3Y1r/zTjpsN0tILJD+egDr/QrReMZY14oPX7hlJ5yTPH62jhd9MGhRKky35USwJyLW+wkYAY
	tWw77mdW7wMQrMOxHu0JA+D+tNZ1IYYAR8BZUCZn0Z7DCogxXTZPfF+Ct1D/1z2SgdUgMDBGyYjak
	uIo60cwdA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzZC5-0008IA-KU; Wed, 13 Jan 2021 05:59:45 +0000
Received: from mail-ua1-x92d.google.com ([2607:f8b0:4864:20::92d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzZC2-0008Gh-8Z
 for linux-mediatek@lists.infradead.org; Wed, 13 Jan 2021 05:59:43 +0000
Received: by mail-ua1-x92d.google.com with SMTP id g5so334361uak.10
 for <linux-mediatek@lists.infradead.org>; Tue, 12 Jan 2021 21:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uflk09hDM8jdt4VETF4zx5oJUWKH+szab3bAtMaySZM=;
 b=V3XzRVPHSN8FFVcOv8s7cpuEkmtlGkiiHwAJaarEz7yvvOdfJhsgwyKvQTQNg2o7ZL
 V/GK4fj9ALPENfCozfr27V58sVnrLv/ZmwzCHf2X68mFcnMuUdhY46ER2c0BLdYLtUly
 AqfsKcS4XhbLMY3ZWLO+Vk8IPH2OooUGZr9lA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uflk09hDM8jdt4VETF4zx5oJUWKH+szab3bAtMaySZM=;
 b=P2rIOl1GqaGz5U0xR1q6PLWAmNOCCvbx3vdGqIQbP9U8ulIKMTdchD6UMA6amty53g
 KHUPmpgZFYwgwXJQLSalmMBeFtCc0oJtgqZYhcq1Wq9JwplQMhTCjZ7tvn5aActbxrtY
 +vOb9Y93FP4fnNFcLVVy+mCt0ziF7JhG6ps2eLkHEwCWmEl6r7qmDIH1/8a8UB59Q4qa
 d5SvO18poyJIZfoQeo9xrsfw1+wX/iTk1N8x1QTbJ8QA9FyEQSI8nuaucq12JC/3zTpC
 piPV/K48PvJHVIMKXto8xHF0vjkTp7Vs0PyOHhw7Gj/daemQt9qbtFoo3D6x9biB8Q7w
 eZRw==
X-Gm-Message-State: AOAM531CFVNjHM8P3ApzXEnQYOz9Hu8QZW2g2zV5UiOaSlQ0+GGEmNvw
 ChSlsR5K/8+r1mRK9kaZrfdeWKERL28qqlAIiXhU+w==
X-Google-Smtp-Source: ABdhPJxUOJXjPKGrSYhZlqGURvTegd9S+519z9w10z9Cg+aIQfHXMgodScbQmK240/7XPSZwmWdqBfZO5TB6vzygsss=
X-Received: by 2002:ab0:74d2:: with SMTP id f18mr516697uaq.48.1610517577824;
 Tue, 12 Jan 2021 21:59:37 -0800 (PST)
MIME-Version: 1.0
References: <20210108011011.4061575-1-drinkcat@chromium.org>
 <20210108091005.v9.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
 <20210112150726.GA330364@robh.at.kernel.org>
In-Reply-To: <20210112150726.GA330364@robh.at.kernel.org>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 13 Jan 2021 13:59:26 +0800
Message-ID: <CANMq1KAY+KgXGNaVttESfW+1m3Daec6B-GqHgRW0gdFmOGf=qA@mail.gmail.com>
Subject: Re: [PATCH v9 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_005942_400791_F239A613 
X-CRM114-Status: GOOD (  21.57  )
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
Cc: Devicetree List <devicetree@vger.kernel.org>,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>, Fei Shao <fshao@chromium.org>,
 David Airlie <airlied@linux.ie>, lkml <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kristian Kristensen <hoegsberg@chromium.org>,
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Jan 12, 2021 at 11:07 PM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Jan 08, 2021 at 09:10:08AM +0800, Nicolas Boichat wrote:
> > Define a compatible string for the Mali Bifrost GPU found in
> > Mediatek's MT8183 SoCs.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > Reviewed-by: Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
> > ---
> >
> > (no changes since v6)
> >
> > Changes in v6:
> >  - Rebased, actually tested with recent mesa driver.
> >  - No change
> >
> > Changes in v5:
> >  - Rename "2d" power domain to "core2"
> >
> > Changes in v4:
> >  - Add power-domain-names description
> >    (kept Alyssa's reviewed-by as the change is minor)
> >
> > Changes in v3:
> >  - No change
> >
> >  .../bindings/gpu/arm,mali-bifrost.yaml        | 25 +++++++++++++++++++
> >  1 file changed, 25 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > index 184492162e7e..71b613ee5bd7 100644
> > --- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > +++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > @@ -17,6 +17,7 @@ properties:
> >      items:
> >        - enum:
> >            - amlogic,meson-g12a-mali
> > +          - mediatek,mt8183-mali
> >            - realtek,rtd1619-mali
> >            - rockchip,px30-mali
> >        - const: arm,mali-bifrost # Mali Bifrost GPU model/revision is fully discoverable
> > @@ -87,6 +88,30 @@ allOf:
> >      then:
> >        required:
> >          - resets
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          contains:
> > +            const: mediatek,mt8183-mali
> > +    then:
> > +      properties:
> > +        sram-supply: true
>
> This has to be defined at the top-level or there will be an error when
> it is present (due to additionalProperties).
>
> In this if/then you can do:
>
> else:
>   sram-supply: false
>
> to disallow it if not 'mediatek,mt8183-mali'

I see. Thanks Rob, will send a v10.



>
> > +        power-domains:
> > +          description:
> > +            List of phandle and PM domain specifier as documented in
> > +            Documentation/devicetree/bindings/power/power_domain.txt
> > +          minItems: 3
> > +          maxItems: 3
> > +        power-domain-names:
> > +          items:
> > +            - const: core0
> > +            - const: core1
> > +            - const: core2
> > +
> > +      required:
> > +        - sram-supply
> > +        - power-domains
> > +        - power-domains-names
> >
> >  examples:
> >    - |
> > --
> > 2.29.2.729.g45daf8777d-goog
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
