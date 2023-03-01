Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0170FC64EC7
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 02:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2mASzywLLLz3SL9h6D/hbMI9Q5P67uUV6RN/jUkz1w=; b=fPMCOp4PgQnHcqfEYJH7TvpCh6
	TUwJqn9f3j9FLw/FsbQ6u/d1w8iryL7auGwvELEu3TJH0bUXf+lhyjEcVDO8ZaBUJ0bVhzovQKbMm
	TKWPKPcKQWP4p2DfvOVPcUgH4PI/kVA5iqQtQqvERCEj0QKDwJRC32qC07Rai3rfsovob5+c2Egfm
	4xNXnS9yoiU+vznCS6RK+n+FbrAq69HFNymUy/wHjViIbB2oLOrtGFOUDrHkIVwfBbmT5nBpnUifL
	2m6VC0+8tUa5sEEoWylxvdji+y+Z+iOj263Fu84n/j9UIIfRNL6/YW27dk0J0rxc1yaqlzeGvyGaw
	ctA9KIWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXCSL-00Evqs-Nz; Wed, 01 Mar 2023 02:44:37 +0000
Received: from mail-ot1-f47.google.com ([209.85.210.47])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXCSJ-00Evpg-9R; Wed, 01 Mar 2023 02:44:36 +0000
Received: by mail-ot1-f47.google.com with SMTP id m25-20020a05683026d900b006941a2838caso1995171otu.7;
        Tue, 28 Feb 2023 18:44:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v2mASzywLLLz3SL9h6D/hbMI9Q5P67uUV6RN/jUkz1w=;
        b=3kKLr3OrQRNUUP7s1tKV9kHNYqb9BmtiusnqZ3zK2SL5/CT5wfFdr0OX6o0jZLzprE
         1OMEGypjUfsASEmEm6kapoujtXWA/cgWODY/rX0xPoFk4wQjOt8oETfncUs2DQ1GNHnk
         VGs3NkAlRnOiAyutggGg8Qiq1S4jv0TvY5noDW1Bteco5WHjEmulCHbKqYOUvNUQALyh
         bxe8mhrKIz+BrkMjt8E5l2AyW6M0f0f8TfqiyabsJAtK+rukcsvnt4vkt0rEMI1cC1kH
         1Lmhzxu/8yFMqyak2WQEZ//g9gk2U9eW5rJwJkFy3+AIq1cJrYDBjHJwxUemk/f44d1u
         w4/Q==
X-Gm-Message-State: AO0yUKUjUXqSe8DxbkYVcFkezCZzzpJEtAg7JTgcY+yZqWeC1UKArAJR
	64p5RjEvNDZJfe14xoyP5Q==
X-Google-Smtp-Source: AK7set9UBWbgFA1YWvOE33zjSRJM6L7Ce9rJOQ8u6UdOLH1WrhEbJt1fAwKlmQilm3WSZq+MRsPCWg==
X-Received: by 2002:a9d:17d0:0:b0:690:ece7:62d2 with SMTP id j74-20020a9d17d0000000b00690ece762d2mr2898278otj.19.1677638673290;
        Tue, 28 Feb 2023 18:44:33 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c2-20020a9d75c2000000b0068bd6cf405dsm4451250otl.1.2023.02.28.18.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 18:44:32 -0800 (PST)
Received: (nullmailer pid 260581 invoked by uid 1000);
	Wed, 01 Mar 2023 02:44:31 -0000
Date: Tue, 28 Feb 2023 20:44:31 -0600
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Subject: Re: [RFC PATCH 07/16] dt-bindings: pinctrl: ralink: add new
 compatible strings
Message-ID: <20230301024431.GA251215-robh@kernel.org>
References: <20230222183932.33267-1-arinc.unal@arinc9.com>
 <20230222183932.33267-8-arinc.unal@arinc9.com>
 <20230227173333.GA496999-robh@kernel.org>
 <d7aea90f-d077-3a41-996c-804c95d72e24@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d7aea90f-d077-3a41-996c-804c95d72e24@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230228_184435_367804_527D497D 
X-CRM114-Status: GOOD (  23.79  )
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
Cc: devicetree@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-gpio@vger.kernel.org, Daniel Santos <daniel.santos@pobox.com>, Linus Walleij <linus.walleij@linaro.org>, Sean Wang <sean.wang@kernel.org>, Luiz Angelo Daros de Luca <luizluca@gmail.com>, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, William Dean <williamsukatube@gmail.com>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Daniel Golle <daniel@makrotopia.org>, Matthias Brugger <matthias.bgg@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 28, 2023 at 07:46:36PM +0300, Arınç ÜNAL wrote:
> On 27/02/2023 20:33, Rob Herring wrote:
> > On Wed, Feb 22, 2023 at 09:39:23PM +0300, arinc9.unal@gmail.com wrote:
> > > From: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > 
> > > Add the ralink,rt2880-pinmux compatible string. It had been removed from
> > > the driver which broke the ABI.
> > > 
> > > Add the mediatek compatible strings. Change the compatible string on the
> > > examples with the mediatek compatible strings.
> > > 
> > > Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> > > ---
> > >   .../devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml | 7 +++++--
> > >   .../devicetree/bindings/pinctrl/ralink,mt7621-pinctrl.yaml | 7 +++++--
> > >   .../devicetree/bindings/pinctrl/ralink,rt2880-pinctrl.yaml | 7 +++++--
> > >   .../devicetree/bindings/pinctrl/ralink,rt305x-pinctrl.yaml | 7 +++++--
> > >   .../devicetree/bindings/pinctrl/ralink,rt3883-pinctrl.yaml | 7 +++++--
> > >   5 files changed, 25 insertions(+), 10 deletions(-)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
> > > index 1e63ea34146a..531b5f616c3d 100644
> > > --- a/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
> > > +++ b/Documentation/devicetree/bindings/pinctrl/ralink,mt7620-pinctrl.yaml
> > > @@ -17,7 +17,10 @@ description:
> > >   properties:
> > >     compatible:
> > > -    const: ralink,mt7620-pinctrl
> > > +    enum:
> > > +      - mediatek,mt7620-pinctrl
> > > +      - ralink,mt7620-pinctrl
> > 
> > We don't update compatible strings based on acquistions nor marketing
> > whims. If you want to use 'mediatek' for new things, then fine.
> 
> Understood. Only the SoCs with rtXXXX were rebranded, the mtXXXX SoCs share
> the same architecture from Ralink, so they were incorrectly called Ralink
> SoCs.
> 
> I can remove the new strings from Ralink SoCs and add them only for MediaTek
> SoCs. Or you could make an exception for this one, regarding the situation.
> Whatever you think is best.

I'm not in a position to make an exception as I know little about this 
platform. Carrying both strings is a NAK. Either you (and everyone using 
these platforms) care about the ABI and are stuck with the "wrong" 
string. In the end, they are just unique identifiers. Or you don't care 
and break the ABI and rename everything. If you do that, do just that in 
your patches and make it crystal clear in the commit msg that is your 
intention and why that is okay.

Rob

