Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C40C761A6
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Mar 2023 13:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CKdeKXMZKkzRzmYzogTN+akOjOk8EAmTZBQ/2FEAwgg=; b=pzjWL4GFCCIAffUf9Khgm2BpcZ
	aAubJf64fmOqzO+ihP9wH93qXIN0EbKUPIpD12cMiJVHj5IGnxG224SSLR2P7bvQws8M1jrBFXVtj
	Zn8vhusTaagzDdXsJ/ysGwc5CWJT0OfAveZfk4OYWSUOWm4WZzjf1loVsR6s7x3tO39RWZvDwBmm5
	KmTh7LGsvCbH2QNUM0CVpqdXUcM6xxhIdY/x5YAADtkrTKzmKWOrNXYyh5gP0Yf6mzoWL8p9mMyhW
	++Y1uvpoiAVR8ZTy335cAOyzZfoWXPiQ6oVaLI/XeV30NEGnraeq9odwKJa94qJdqETn9Bl3GYXrS
	J/kBLf7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phsfH-003vj4-0M;
	Thu, 30 Mar 2023 13:50:07 +0000
Received: from mail-oi1-f178.google.com ([209.85.167.178])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1phsfD-003vi5-2b;
	Thu, 30 Mar 2023 13:50:05 +0000
Received: by mail-oi1-f178.google.com with SMTP id b19so14177328oib.7;
        Thu, 30 Mar 2023 06:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680184202;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKdeKXMZKkzRzmYzogTN+akOjOk8EAmTZBQ/2FEAwgg=;
        b=Pfkg2uh6omNQJrqn7xGchBYNndRsSUZD7+tQqLzAlEYkD2GK7O2/Rc7pKZr2GrBmil
         OU9jGe3ZDuLu7/JtR9N4Zn4mK6u1d7iZButtUMyU+pue8XaKev4UKMY8cDoxedsOCBa2
         8k/Ia6TJlw9av4kdw9wQem9YtL6kawLJ3lxLisC7q7FRFyfzBB0oj3K+w8hQkkVwjU3q
         VRcksR6JhJF8UfiWAz/xZd9xWlGZ4f9WYpvfNIdxxZl5XAd1dZ3QJTNm+pIfRxs9dHoS
         VDJDkDMQ8TBC+ui8r5niAjTpfTiEit9YAN6hl7hxLmcPyQuXUmWdbwmb9NKmM65JFTi8
         8+7w==
X-Gm-Message-State: AAQBX9cUx2NzPKFo/3pWWs4XXyAQ5TqJMQPxL6aAgk41RT8Qtii8ngMn
	Glz/Z/DFoU83H2T76ogZHw==
X-Google-Smtp-Source: AKy350bFeV3x8EQIVtLXWGoO3fQp/HyP946oOhe7XGW6LnNcoGBq+6UaL8exWCu6W4e++Ed/2NEAcg==
X-Received: by 2002:aca:280c:0:b0:389:72d5:f16f with SMTP id 12-20020aca280c000000b0038972d5f16fmr1649086oix.28.1680184201780;
        Thu, 30 Mar 2023 06:50:01 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o184-20020acabec1000000b0038934c5b400sm4334154oif.25.2023.03.30.06.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Mar 2023 06:50:01 -0700 (PDT)
Received: (nullmailer pid 1903371 invoked by uid 1000);
	Thu, 30 Mar 2023 13:50:00 -0000
Date: Thu, 30 Mar 2023 08:50:00 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat <amergnat@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>, Bernhard =?iso-8859-1?Q?Rosenkr=E4nzer?= <bero@baylibre.com>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: mediatek: deprecate custom
 drive strength property
Message-ID: <20230330135000.GA1898063-robh@kernel.org>
References: <20230327-cleanup-pinctrl-binding-v1-0-b695e32e4f2e@baylibre.com>
 <20230327-cleanup-pinctrl-binding-v1-1-b695e32e4f2e@baylibre.com>
 <334089fd-f0e8-bf63-5100-d8632c478ccc@collabora.com>
 <3fbb78e9-a450-3741-070b-2caedbaa47a5@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3fbb78e9-a450-3741-070b-2caedbaa47a5@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_065003_842984_22324F96 
X-CRM114-Status: GOOD (  24.83  )
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

On Wed, Mar 29, 2023 at 09:58:57AM +0200, Krzysztof Kozlowski wrote:
> On 28/03/2023 15:41, AngeloGioacchino Del Regno wrote:
> > Il 28/03/23 15:06, Alexandre Mergnat ha scritto:
> >> Deprecate mediatek,drive-strength-adv which shall not exist, that was an
> >> unnecessary property that leaked upstream from downstream kernels and
> >> there's no reason to use it.
> >>
> >> The generic property drive-strength-microamp should be used instead.
> >>
> >> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> >> ---
> >>   .../devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml      | 8 ++++++--
> >>   .../devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml      | 6 +++++-
> >>   2 files changed, 11 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
> >> index c30cd0d010dd..b82a066b91ec 100644
> >> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
> >> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8183-pinctrl.yaml
> > 
> > Thanks for doing MT8183!!!
> > 
> >> @@ -110,8 +110,13 @@ patternProperties:
> >>             drive-strength:
> > 
> > ..snip..
> > 
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> >> index 4b96884a1afc..347f533776ba 100644
> >> --- a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> >> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8365-pinctrl.yaml
> >> @@ -91,8 +91,13 @@ patternProperties:
> >>   
> >>             input-schmitt-disable: true
> >>   
> >> +          drive-strength-microamp:
> >> +            enum: [125, 250, 500, 1000]
> >> +
> >>             mediatek,drive-strength-adv:
> >> +            deprecated: true
> > 
> > In the case of MT8365, since there's *no* devicetree using this property, *at all*,
> > I think you can even just entirely remove this block, as that should not be
> > considered an ABI breakage in that case.
> > 
> > Krzysztof, can you please confirm?
> 
> If it is defined as ABI in a released kernel, then should be rather
> deprecated.

Yes, but if no one notices it's not an ABI. It's up to the platform 
maintainers really. I only care that the commits indicate they know what 
they are doing (usually not).

Rob

