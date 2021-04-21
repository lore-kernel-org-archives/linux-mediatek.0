Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1925EC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 00:12:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 603366141C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 00:12:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 603366141C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EwzHQzHgD/iGxHxjMRhyZp9rIApecUdy3JmVuLYHdDA=; b=LaIAWb/1gVqhpcOfqq2KSRm8K
	EWaGTi2sqQjnA2/n8c45HiQ79WzsAHMgexd11aZDlCTeLOXAiptVoWTxb6erYP2ASqGNRxB9ztVLI
	qXxpxKPXejiYEt8rKFRHYVxNo6UReTGcCkxBfV+jfDRKpaPT2IUOn0nzDzywnVnKRZev0Qs1EYds7
	eCrg5YPpHyeZoe92peCgpqGJCGh1rSzSgoxoQSgDwkPJFgdOgsUEsJ8yB+rcjb2h0A2NTUVkYME5o
	FTlcQGBTLXgJrdQaS+oFavBPakMv0+K4eJT0LZLjXgFWGxh/ExwI6AD8Te7oClDG8jQiWh7e+usTK
	Az2oKf6xQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ0TG-00DJX7-Rx; Wed, 21 Apr 2021 00:11:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ0T1-00DJVu-IL
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 00:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Nr8WfPTD0ymzHIbs2kjYSoWUK3mdmT/dSasQxodVNi4=; b=KEFf/+KDqXR3WGN7OS5fsNLiN/
 ABDFzP5rO4BK/sGDpWGPF/2oPNUy9ycz4ONsjlBJYPwAU36d4DfmgpdPD0xWTJr+MY5i/gm+IwlaB
 S8GQhTihtmYJyyOmNgVnxoOEAHZ9R+axBbTL27F166wuGYyTdUSsYsN7q/nhyO3qeFIv4lSo/OUby
 PMq7zx7f/jGi3t+ZK1kQ7WZbiRszcoGXXzyQCUenlRY6ugosR3v2fpyXNcI6VjBjt6jiy/2L5VCOG
 Z8tRhwle10pRBFEA3pmiXOyKmk1OJEGuJFrC7k6cvi+owWZeyGkX0WnEUPkcOZKmifBecsfc3ZhuD
 cVpW/PeQ==;
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ0Sw-00CUq8-FW
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 00:11:42 +0000
Received: by mail-ua1-x930.google.com with SMTP id g24so1565666uak.11
 for <linux-mediatek@lists.infradead.org>; Tue, 20 Apr 2021 17:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Nr8WfPTD0ymzHIbs2kjYSoWUK3mdmT/dSasQxodVNi4=;
 b=GI0ovTiZqm8iMDijT4AKKjtlbOiJDgwVXdcalz+E7xX62mEZJ37VWi/mWslqbVug/r
 HTOUNI+5vJnyoE73eJbkyqOggquJwm2Loj79niLY//q6M1JrIAk+Mn3llXaADlbTjTxk
 gXyqJcylyjURRI7oYreUxNV7uQgdWHUO/ZYeE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Nr8WfPTD0ymzHIbs2kjYSoWUK3mdmT/dSasQxodVNi4=;
 b=pZuBpsCoIVbSfaXxDgWYkMyMZ6e3uagm5yzK4z1bDtL5LxskSFWVPu276/SobFqB7C
 i2DnCZCFEtZTWDiC8r2rhzD4LKZrzAVFuuRlHWYJTjhGyFlS2FSqPj3bw6nzoAWHMQjM
 glt7WRaCUs9ttAroLWcgjyG9K6uswtZBFhcSUN5XktQu0byLP7ApGPLcJU5O0R+Kr2g2
 JSkIRYFAeKl9CzF6JXdJ75AB86CCWlmSvPqERfHKzRFm4R6FawxITn0nBy7V0w1r+ioJ
 Gia93GM+2u6a9PmwbxnUaTP384Rj19BN8MkTMtZ/i0L87BeUfGj0z+ubqTBRamOhERF9
 5WMw==
X-Gm-Message-State: AOAM531s/YVvWTiip1fQJLWX/EIiwVfltRZ5NCVPTkAOXrRToLdakgBF
 5kLtMqTUz1HSL/H7X/QKcIaZRBsT+R9zhHMQTXhKzw==
X-Google-Smtp-Source: ABdhPJxUAnIDoIjMJ4cqmCiIvJa73yvdSkT6+oLpfc5i3QoBtmDV3PFojekJpmrhUyBafr5ivJ6qVjyvOPNT7jFjNAk=
X-Received: by 2002:ab0:380e:: with SMTP id x14mr15131536uav.27.1618963895533; 
 Tue, 20 Apr 2021 17:11:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210126011759.1605641-1-drinkcat@chromium.org>
 <20210126091747.v11.1.Ie74d3355761aab202d4825ac6f66d990bba0130e@changeid>
 <CAL_Jsq+gWm+94zF1XN2KiRYgAZewiDkCk5B5bhLB=M+-HbD=fA@mail.gmail.com>
In-Reply-To: <CAL_Jsq+gWm+94zF1XN2KiRYgAZewiDkCk5B5bhLB=M+-HbD=fA@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Wed, 21 Apr 2021 08:11:24 +0800
Message-ID: <CANMq1KCNMx4hS02ZFd0NSOwvw3Xaqm13v8aHO6UMP5Nn3_uX-Q@mail.gmail.com>
Subject: Re: [PATCH v11 1/4] dt-bindings: gpu: mali-bifrost: Add Mediatek
 MT8183
To: Rob Herring <robh@kernel.org>
Cc: Steven Price <steven.price@arm.com>, 
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Fei Shao <fshao@chromium.org>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, 
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 Boris Brezillon <boris.brezillon@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 Devicetree List <devicetree@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_171138_526074_5896AF05 
X-CRM114-Status: GOOD (  21.72  )
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

On Tue, Apr 20, 2021 at 9:01 PM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Jan 25, 2021 at 7:18 PM Nicolas Boichat <drinkcat@chromium.org> wrote:
> >
> > Define a compatible string for the Mali Bifrost GPU found in
> > Mediatek's MT8183 SoCs.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@chromium.org>
> > ---
> >
> > Changes in v11:
> >  - binding: power-domain-names not power-domainS-names
> >
> > Changes in v10:
> >  - Fix the binding to make sure sram-supply property can be provided.
> >
> > Changes in v9: None
> > Changes in v8: None
> > Changes in v7: None
> > Changes in v6:
> >  - Rebased, actually tested with recent mesa driver.
> >
> > Changes in v5:
> >  - Rename "2d" power domain to "core2"
> >
> > Changes in v4:
> >  - Add power-domain-names description
> >    (kept Alyssa's reviewed-by as the change is minor)
> >
> > Changes in v3: None
> > Changes in v2: None
> >
> >  .../bindings/gpu/arm,mali-bifrost.yaml        | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
> > index 184492162e7e..3e758f88e2cd 100644
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
> > @@ -41,6 +42,8 @@ properties:
> >
> >    mali-supply: true
> >
> > +  sram-supply: true
> > +
> >    operating-points-v2: true
> >
> >    power-domains:
> > @@ -87,6 +90,31 @@ allOf:
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
> > +        power-domains:
> > +          description:
> > +            List of phandle and PM domain specifier as documented in
> > +            Documentation/devicetree/bindings/power/power_domain.txt
> > +          minItems: 3
> > +          maxItems: 3
>
> This won't work because the top level schema restricts this to 1. The
> top level needs to say:
>
> power-domains:
>   minItems: 1
>   maxItems: 3
>
> And you need just 'minItems: 3' here and 'maxItems: 1' in the else clause.
>
> And drop the description. That's every 'power-domains' property.
>
> > +        power-domain-names:
> > +          items:
> > +            - const: core0
> > +            - const: core1
> > +            - const: core2
>
> Blank line

Thanks, hopefully all fixed in v12.

> > +      required:
> > +        - sram-supply
> > +        - power-domains
> > +        - power-domain-names
> > +    else:
> > +      properties:
> > +        sram-supply: false
> >
> >  examples:
> >    - |
> > --
> > 2.30.0.280.ga3ce27912f-goog
> >

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
