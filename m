Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6B25C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Mar 2022 15:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHc3zOHagPcK5J1cuBwzjnE16mKJ7j8/AzU8kLse+dc=; b=uHvBsUhrMA30Nk
	l+eDfclJjoGfHgNIfloArZsYtMGcuDtruzbCoofUVwUwaZILYMlCFkVlRHpTMTn53lEQCYpXWylUe
	CiDpKiW7HCTuTFwR5JEvFI63GUo9sYn0SZBcX7x2EL67hkf3upcIdGyHzGXV5h96EJLgzEZ0I40dq
	VfS2oEpIBWumkW2FKxE/+7T2K5poQV0xjyCwvGJc92WkQcGH71BPx//FED6ZqiBlqjBqDqxvy2pz7
	SpJPPXGFdMugohYJ+DuBeSdL+SCBWWY8kUEUG7BUPd67MjorVORPiJK4ay+fIQsIGNo0DbUS7+42s
	LrrSzPSgwCYJRZwV3mXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWg8z-00BUTF-4f; Tue, 22 Mar 2022 15:09:57 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWg8n-00BURJ-Nu; Tue, 22 Mar 2022 15:09:47 +0000
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-dd9d3e7901so1966495fac.8; 
 Tue, 22 Mar 2022 08:09:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LZrnZENFzHAcyG4z8YXGbb1cPaECVD2LaEEDGj9rfYI=;
 b=uxYon8tjJyp7y67iuTW6B8XqAEaJ582zM1dUloj9v8o3/RYyi1sA8qLzxIla/HWoTc
 jtScxBsJwe8eNfXKqIvz5nupZZX54Zbch5+VW5yZlCkX2jPyeUfB+pSuFe54rG2eh/vv
 g+knwvSljpN11Vsx+URdSEl/8r1qsAKhj5F3vYrgzwzBnd/3ywT5qlvfhmEwt+lSZD5e
 qVLkDz3X6RNLCVSI1V7DmhcQzxGL9NB6Do1/VNG/E0QMtAsXQJxMO0Y+rqPjVjhqXfG6
 Igk3HxLamqTPlg5PDLBmUvkYvGE62w5OFZKygeNwvt6ld8ELgtpLizjcbeBhxYJIpVFr
 u9Ug==
X-Gm-Message-State: AOAM532fxurP20mcdJsUrErvdG9p47OTfSn7iNbpRwMO/zUhLZYDSz8X
 N8UWFmDmURRS7VWjVN3vPkB7K2BuDw==
X-Google-Smtp-Source: ABdhPJxdZIXeGXL5BgfAh0JHUsLAqnvcG4qAGL//HhwVWpYiVL440dU2hgKLJXDQsjMwp3OqJlK5gg==
X-Received: by 2002:a05:6870:4789:b0:dd:e6e0:2471 with SMTP id
 c9-20020a056870478900b000dde6e02471mr1892795oaq.195.1647961338852; 
 Tue, 22 Mar 2022 08:02:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm3141414oih.53.2022.03.22.08.02.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 08:02:17 -0700 (PDT)
Received: (nullmailer pid 2012421 invoked by uid 1000);
 Tue, 22 Mar 2022 15:02:16 -0000
Date: Tue, 22 Mar 2022 10:02:16 -0500
From: Rob Herring <robh@kernel.org>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
Cc: broonie@kernel.org, tzungbi@google.com,
 angelogioacchino.delregno@collabora.com, aaronyu@google.com,
 matthias.bgg@gmail.com, trevor.wu@mediatek.com, linmq006@gmail.com,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [v5 1/4] ASoC: dt-bindings: mt8192-mt6359: add new compatible
 and new properties
Message-ID: <Yjnk+AYb0Eo8ufJA@robh.at.kernel.org>
References: <20220319114111.11496-1-jiaxin.yu@mediatek.com>
 <20220319114111.11496-2-jiaxin.yu@mediatek.com>
 <YjkLVwvxvOKr30qL@robh.at.kernel.org>
 <0e909de12a52ae88633634d868bd5001eef1b830.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0e909de12a52ae88633634d868bd5001eef1b830.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220322_080945_792965_F9451AF8 
X-CRM114-Status: GOOD (  21.25  )
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

On Tue, Mar 22, 2022 at 11:45:24AM +0800, Jiaxin Yu wrote:
> On Mon, 2022-03-21 at 18:33 -0500, Rob Herring wrote:
> > On Sat, Mar 19, 2022 at 07:41:08PM +0800, Jiaxin Yu wrote:
> > > 1. Adds new compatible string "mt8192_mt6359_rt1015p_rt5682s" for
> > > machines
> > > with rt1015p and rt5682s.
> > > 2. Adds new property "mediatek,headset-codec" for getting headset
> > > codecs.
> > > 3. Adds new property "mediatek,speaker-codec" for getting speaker
> > > codecs.
> > > 
> > > Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
> > > ---
> > >  .../sound/mt8192-mt6359-rt1015-rt5682.yaml    | 29
> > > +++++++++++++++++++
> > >  1 file changed, 29 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-
> > > rt1015-rt5682.yaml
> > > b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-
> > > rt5682.yaml
> > > index a781e7aaaa38..aa0476eedd38 100644
> > > --- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-
> > > rt5682.yaml
> > > +++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-
> > > rt5682.yaml
> > > @@ -18,6 +18,7 @@ properties:
> > >      enum:
> > >        - mediatek,mt8192_mt6359_rt1015_rt5682
> > >        - mediatek,mt8192_mt6359_rt1015p_rt5682
> > > +      - mediatek,mt8192_mt6359_rt1015p_rt5682s
> > >  
> > >    mediatek,platform:
> > >      $ref: "/schemas/types.yaml#/definitions/phandle"
> > > @@ -27,6 +28,25 @@ properties:
> > >      $ref: "/schemas/types.yaml#/definitions/phandle"
> > >      description: The phandle of HDMI codec.
> > >  
> > > +patternProperties:
> > > +  "^mediatek,headset-codec$":
> > 
> > Fixed string, not a pattern. Move to 'properties'. Drop the vendor 
> > prefix too.
> > 
> Hi Rob,
> 
> I originally referred to simple-card.yaml and move "xxx.yyy" to the
> patternProperties.
> 
> Such as:
> # use patternProperties to avoid naming "xxx,yyy" issue
> patternProperties:
>   "^simple-audio-card,widgets$":
>     $ref: "#/definitions/widgets"

That was working around an issue and I've now fixed this.

> 
> But your comment is more reasonable. I will move them to 'properties'
> and drop the vendor prefix. Thanks for your review.
> 
> 
> > > +    description: Holds subnode which indicates headset dai.
> > > +    type: object
> > > +    properties:
> > > +      sound-dai:
> > > +        $ref: /schemas/types.yaml#/definitions/phandle-array
> > 
> > Standard property, don't need a type or description. Just how many
> > and 
> > what each one is if more than 1.
> 
> Should I describe them as below?
> 
> properties:
> ...
>   speaker-codec:
>     type: object
>     properties:
>       sound-dai:
>          maxItems: 1
> ...

Yes.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
