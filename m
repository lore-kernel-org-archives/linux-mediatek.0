Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50003C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 20:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qNAYYOzoBD0tz7Gx6g2ETc8+WpdvKaWtxtRdQSbnkqg=; b=qa4wFFwInIGcqV
	DKGhyJ0/ihBuQNJOW0OhEKDY5zQ8mOjjObIwJYemKKsfRb9VOxGNMKQmU2pKhU5ivzgqjk7Gof09D
	1fZGYGgnhxUYsphLTjTYSA1zZ2yoWyhW0i+2s5GM9z6Xc3uBYjJkuavWQonH4yQdmOCApn7+69dE0
	l+cqPHtbcZ4sVUA3L7mB7PRbdnKpb9BLKX6A8PnU8jzlGlOug2F4ytF+6G+9polkTHvzXsspk2M8Z
	sufrZKMbC9UWrVUrS5PGHV+m5Aho8j2Xlcdq+j+4pZuGjxT34PSQFvrzWTmf9dzzGr3MQx/9iAqvw
	YB8evsbE/NvT2hU4pMHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkX2d-00CSVt-Gs; Fri, 29 Apr 2022 20:16:39 +0000
Received: from mail-oa1-f41.google.com ([209.85.160.41])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkX2a-00CSUZ-F5; Fri, 29 Apr 2022 20:16:38 +0000
Received: by mail-oa1-f41.google.com with SMTP id
 586e51a60fabf-e2442907a1so9207938fac.8; 
 Fri, 29 Apr 2022 13:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=tiOACVbwh67uqkrg+v7LDtn9Slnv0D8m91bpuKh0Ev0=;
 b=aLs2oYoRC6djT4w6iYhZNimaX2oggIXx2cQ5/rPNIYtGy60OeAzle41VOxSY/3W2ls
 9rumjAkV6E8ZU+rGOv6R4laz7BiUNZfihaFuBLzg+/+hUQv7TI2BVB+GU62DuzelqLOS
 yoLDnbWsvAnlwaOogBvm4ThV+DSDYkplLNWO8/eWyrCVeh6CqYrKelx6K7oize0j7Nzy
 tAQV5ZHbCRynC4V2UjNnRoFMB2cXtcumqMdBafr3sAwRINqoqB8Wxkb9Fic2ByufJLWe
 9NNF+GvjvWqkAjARwNVJgTeRpJebINNmYINQF7zi9Qx1OUhMsp8OEE8hu1tjyi3Xp841
 BdCg==
X-Gm-Message-State: AOAM530LueIxBa10N7b9tHIYo1vQUPNjUP/TrBQVS4UYd6fGtplbEqG1
 scyyeMRnhUbjyQ+SNZpLag==
X-Google-Smtp-Source: ABdhPJw2gDKOW+0tcM8RQuwAxxtSJfYernX60ZZrMMDRUED6g9kqv7Imhf1an1clOEIvD5i6uHJTWA==
X-Received: by 2002:a05:6870:e245:b0:de:9321:9ea3 with SMTP id
 d5-20020a056870e24500b000de93219ea3mr480183oac.79.1651263395259; 
 Fri, 29 Apr 2022 13:16:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 i13-20020a54408d000000b00325cda1ffb9sm67047oii.56.2022.04.29.13.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 13:16:34 -0700 (PDT)
Received: (nullmailer pid 2793009 invoked by uid 1000);
 Fri, 29 Apr 2022 20:16:33 -0000
Date: Fri, 29 Apr 2022 15:16:33 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, angelogioacchino.delregno@collabora.com,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, tzungbi@google.com,
 linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
 matthias.bgg@gmail.com, aaronyu@google.com, julianbraha@gmail.com,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [v4 16/18] dt-bindings: mediatek: mt8186: add
 mt8186-mt6366-da7219-max98357 document
Message-ID: <YmxHoXfpmC2XxReg@robh.at.kernel.org>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <20220428093355.16172-17-jiaxin.yu@mediatek.com>
 <YmqlNV31FrcAyuN9@robh.at.kernel.org>
 <5e400f7ccb3b208a033e2ad8f220331851ff9c7e.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e400f7ccb3b208a033e2ad8f220331851ff9c7e.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_131636_541507_5ACFE2DD 
X-CRM114-Status: GOOD (  21.79  )
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

On Fri, Apr 29, 2022 at 05:40:02PM +0800, Jiaxin Yu wrote:
> On Thu, 2022-04-28 at 09:31 -0500, Rob Herring wrote:
> > On Thu, Apr 28, 2022 at 05:33:53PM +0800, Jiaxin Yu wrote:
> > > Add document for mt8186 board with mt6366, da7219 and max98357.
> > > 
> > > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > > ---
> > >  .../sound/mt8186-mt6366-da7219-max98357.yaml  | 71
> > > +++++++++++++++++++
> > >  1 file changed, 71 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/mt8186-
> > > mt6366-da7219-max98357.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-
> > > da7219-max98357.yaml
> > > b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-
> > > max98357.yaml
> > > new file mode 100644
> > > index 000000000000..55e8649f2aea
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-
> > > max98357.yaml
> > > @@ -0,0 +1,71 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: 
> > > http://devicetree.org/schemas/sound/mt8186-mt6366-da7219-max98357.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Mediatek MT8186 with MT6366, DA7219 and MAX98357 ASoC sound
> > > card driver
> > > +
> > > +maintainers:
> > > +  - Jiaxin Yu <jiaxin.yu@mediatek.com>
> > > +
> > > +description:
> > > +  This binding describes the MT8186 sound card.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - mediatek,mt8186_mt6366_da7219_max98357_sound
> > 
> > s/_/-/
> > 
> Got it.
> > > +
> > > +  mediatek,platform:
> > > +    $ref: "/schemas/types.yaml#/definitions/phandle"
> > > +    description: The phandle of MT8186 ASoC platform.
> > > +
> > > +  headset-codec:
> > > +    type: object
> > 
> >        additionalProperties: false
> Ditto.
> > 
> > > +    properties:
> > > +      sound-dai:
> > > +        $ref: /schemas/types.yaml#/definitions/phandle
> > 
> > sound-dai already has a type, so drop and define how many entries.
> > 
> Ditto.

No need to reply in agreement. Just trim the email instead.

> > > +    properties:
> > > +      sound-dai:
> > > +        minItems: 2
> > > +        maxItems: 3
> > 
> > If more than 1 entry, then you need to define what each one is and
> > the 
> > order. Just like reg, interrupts, clocks, etc.
> > 
> Hi Rob,
> 
> Should I correct them as below?
> 
> ---
> properties:
>   sound-dai:
>     minItems: 2
>     maxItems: 3
>     items:
>       - items:
>           - description: xxx
>           - description: yyy
>           - description: zzz

Drop the outer 'items'. As-is, you are saying you have 1 entry with 3 
cells (1 phandle + 2 arg cells).

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
