Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DB3C433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Mar 2022 15:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2knS/L1fJOZCIhe5TQKy/dQd/bvP9SDnA1zdclkrayM=; b=ndg6JmTzziavTn
	HtWd4GfsPRzgNblEg4FU+2vIYRv9WcQwqCrEWktFLXoXkA2dIbx+nI78W69z74JCDHI6J7VBkBIoU
	P3F3w8ggbZJEVJVG4U3sSIhADCX1jGjb15Fp+DArICj2H6Bf4VemBjx+JVJcFZYN4eH78WiA5GPU4
	wxDRigkXKIcLQ2J/Ae6hE8jZE+HjZP3qIJ7FHWmS+F8uJG5ia6jUp970Ain//0xDUvRwxpeaCF8Hv
	gsz6Z8jPDmV76S+GcA9TIMJxfJmpQhityeoIHbqCzgBxDOtBvOhMKbcmrbQmtJkNaUERoRls2/dns
	Nwsg46SJsuPql6qUyDAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nTmd0-005oq5-Ec; Mon, 14 Mar 2022 15:28:58 +0000
Received: from mail-io1-f50.google.com ([209.85.166.50])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nTmcx-005op5-Sc; Mon, 14 Mar 2022 15:28:57 +0000
Received: by mail-io1-f50.google.com with SMTP id l18so11384465ioj.2;
 Mon, 14 Mar 2022 08:28:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m6HtwX9B+I/cwGYS9sFs1EBK8BhKR73Z2a3cdC3BGMg=;
 b=wcNXIBhyIb1HkxfWpI1FWdeNFf4SmU2yPwh+icexB2oaZFbXPWr8D0HXTTrv8zBB04
 /tDGa6JwXE7z9OkmACs7JMnLw5XkQdVAismvVqswX5M+aVOjJAAgiQmIWNG1+a8ugL/B
 KtVb/8ossEMHcO8r/0xa/aY1BXdBMA5YzKd03CzENR/Ksm7YYcFlgxRDRudQi9M3s7xd
 RruDM2ZYAs4jHmNpbHDleU8oDfn1H5KUQK7FFG3GTwihgaSkWW3+be+omABoBhOYI6i9
 HNGcSoHWlPuApv22qT/J7NgkYPGi29zK22+0u3wOFDs6WqDm2KVjXCe5jAnO8QFXnyuC
 HxSg==
X-Gm-Message-State: AOAM532a2E0yNmXjvZpXAjwegmYHtgoR9+7POLGkCx0dgQJpH/T//L5Q
 G33NwX2sa1IF+SvN7fA/5w==
X-Google-Smtp-Source: ABdhPJz8r2zMzOR+Daq/ViBSyP3Bs7uRlDXQ3MIRpNLW60TtgExiDCc4dWJQ0gmWm22TOePOpCoXdg==
X-Received: by 2002:a05:6638:12cb:b0:319:c047:6e57 with SMTP id
 v11-20020a05663812cb00b00319c0476e57mr18275449jas.215.1647271731576; 
 Mon, 14 Mar 2022 08:28:51 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a92cd89000000b002c655c48593sm9392229ilb.67.2022.03.14.08.28.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Mar 2022 08:28:50 -0700 (PDT)
Received: (nullmailer pid 84320 invoked by uid 1000);
 Mon, 14 Mar 2022 15:28:48 -0000
Date: Mon, 14 Mar 2022 09:28:48 -0600
From: Rob Herring <robh@kernel.org>
To: Trevor Wu <trevor.wu@mediatek.com>
Cc: broonie@kernel.org, tiwai@suse.com, matthias.bgg@gmail.com,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, aaronyu@google.com, yc.hung@mediatek.com
Subject: Re: [PATCH 5/5] dt-bindings: mediatek: mt8195: add
 mt8195-mt6359-max98390-rt5682 document
Message-ID: <Yi9fMM26XHodzvc4@robh.at.kernel.org>
References: <20220308072435.22460-1-trevor.wu@mediatek.com>
 <20220308072435.22460-6-trevor.wu@mediatek.com>
 <Yip5O3t0Ymyc2h+p@robh.at.kernel.org>
 <fc3c76ab274c12bea9be9e17823fcb4f80ddf764.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fc3c76ab274c12bea9be9e17823fcb4f80ddf764.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220314_082855_955436_BE3B1E0D 
X-CRM114-Status: GOOD (  26.41  )
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

On Sat, Mar 12, 2022 at 10:20:21PM +0800, Trevor Wu wrote:
> On Thu, 2022-03-10 at 16:18 -0600, Rob Herring wrote:
> > On Tue, Mar 08, 2022 at 03:24:35PM +0800, Trevor Wu wrote:
> > > This patch adds document for mt8195 board with mt6359, max98390 and
> > > rt5682.
> > > 
> > > Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> > > ---
> > >  .../sound/mt8195-mt6359-max98390-rt5682.yaml  | 61
> > > +++++++++++++++++++
> > >  1 file changed, 61 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/sound/mt8195-
> > > mt6359-max98390-rt5682.yaml
> > > 
> > > diff --git a/Documentation/devicetree/bindings/sound/mt8195-mt6359-
> > > max98390-rt5682.yaml
> > > b/Documentation/devicetree/bindings/sound/mt8195-mt6359-max98390-
> > > rt5682.yaml
> > > new file mode 100644
> > > index 000000000000..7ec14d61b109
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/sound/mt8195-mt6359-
> > > max98390-rt5682.yaml
> > > @@ -0,0 +1,61 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: 
> > > https://urldefense.com/v3/__http://devicetree.org/schemas/sound/mt8195-mt6359-max98390-rt5682.yaml*__;Iw!!CTRNKA9wMg0ARbw!zb7eaqdAQfuyPpP5m31L3Q5pdCulclJgnygkkMgYh2M6segUZedd-cYz51-5Q2XDCA$
> > >  
> > > +$schema: 
> > > https://urldefense.com/v3/__http://devicetree.org/meta-schemas/core.yaml*__;Iw!!CTRNKA9wMg0ARbw!zb7eaqdAQfuyPpP5m31L3Q5pdCulclJgnygkkMgYh2M6segUZedd-cYz5187C1ArQA$
> > >  
> > > +
> > > +title: Mediatek MT8195 with MT6359, MAX98390 and RT5682 ASoC sound
> > > card driver
> > > +
> > > +maintainers:
> > > +  - Trevor Wu <trevor.wu@mediatek.com>
> > > +
> > > +description:
> > > +  This binding describes the MT8195 sound card.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: mediatek,mt8195_mt6359_max98390_rt5682
> > 
> > You have nodes for each of these components, why do we need new 
> > compatible string for each combination. You can figure out the 
> > combination by looking at each of those nodes.
> > 
> > Second, why does each combination need a new schema doc?
> > 
> > Rob
> 
> Hi Rob,
> 
> I'm not sure whether I can reuse the old schema doc because of the doc
> name and compatible string seems to be specifically for the codec
> combination.
> If I want to reuse the old schema doc, should I change the doc name or
> compatible string? Make the naming more general.

It's fine to either leave it named after the first compatible string or 
rename it if you want.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
