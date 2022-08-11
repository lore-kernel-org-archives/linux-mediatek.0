Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64C37C19F2A
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Aug 2022 10:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UpvdQiXiaoWE7lmdI46FMRRQoH8NCO0q4oDKow84fM0=; b=xwtGaHnddjU6PKNZVDkQd2P84l
	OTLBx367rY7mGYu+9AkL/FnH63FL+rqauVZdCYE45MkXqTpj1U38gbNXRmEDI9dSDyPnMskzrSqGB
	XQruZs49AVzPtYzGN1+e168FMf3JwbSIUHc4RUqfRe8s1hTj/Qx1AHi/bfzF+Mcjk6Ly5BxB6wFMV
	LPm/aXDHP2R1N+xVBuY1SBwsb2m4aL8zVcwt/gZSQ+aNMPXlJjnrMH2ikhaHGj5EQnafi+/lmoohy
	Azzb2p4gtoZ6UPb1JxHHZRq0u4BNkTpT4qNBs3z8ZLlYjd9XdzAPD9DPkUifz6IifVn1zHbuKQBnN
	ue5VIcjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM5DQ-00B7MO-4Z; Thu, 11 Aug 2022 10:15:00 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oM5DE-00B7Hi-GN
	for linux-mediatek@lists.infradead.org; Thu, 11 Aug 2022 10:14:49 +0000
Received: by mail-ej1-x631.google.com with SMTP id w19so32682643ejc.7
        for <linux-mediatek@lists.infradead.org>; Thu, 11 Aug 2022 03:14:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=UpvdQiXiaoWE7lmdI46FMRRQoH8NCO0q4oDKow84fM0=;
        b=UMK/Hou07kBp+Xwl3DSQCFMY2dhZk3AM02CB+Y/hkhC9tRM4tNcdrdtrheQxQTs+nV
         bTbKOcgpLsq3iXo1nfrWs75vuxP3NhqbDotrKZb6Mg3gY8zrBrvAyM16Cw9cTD5Na1KH
         /7KCdEwvErJFkCgG/yvinPxkkkX/UR6rqSYOThIhRm1CsWJ2HJQ08tB7P2kV+aySQg3n
         dhFEkWsSRRUQl4bgHrgUs1uyfDYsG7Rlfi5n/jBtATPNk3lMuBF1ePQfj8CrH5tkPABj
         3rxhuPzhvuj14cmrZtz1QEDjEw0+SobtvG5u4Eopx2CRN9lg89Tz2gKB5xgoriu2dSwx
         gKaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=UpvdQiXiaoWE7lmdI46FMRRQoH8NCO0q4oDKow84fM0=;
        b=ZKdHQ1l6NwAo/EALk0CYwR+Wkc0vkjBLUzRZeNU0132aPfU9273SCDhQzD6x4EXa+I
         lusUH94821uFSlR54rPz4axg0bhy6GgVq2FpGfS9pMZGUmo3u8Bd6NeMn4iKxzHOaMfR
         AsBP346Xva/kUTD0niHXKLdNrDdOcGdky2wZSynwfoLQpD3e33AUyjuO17z7r5Zz7Dzd
         c/G9MqUXXYMpwMRxOFKdBEP8XV17fnTqSQLgz0qHP9V8b2Auk3oHHnYHLj652agD0mmA
         ayXTWlEB5JV5eXQYB6OJEGpDsYwq4CtxLnyxkD1sG02+v99PWOnVP/eeERdIlBCGCQ3b
         qK4g==
X-Gm-Message-State: ACgBeo0a68WYQD+l3W2MBIbtWCoUjMOXbQ1H+ccz3xXlKiF3AT2pK6bX
	PxALh4KoHsb8la8oTXPaAi9G1Q==
X-Google-Smtp-Source: AA6agR5L2wWzNcCPE7/bJF3PDQb95PoMLxtTDASXrh6z5KvVlnXynNFIDpNjNBO239jdMWu9vzaw7Q==
X-Received: by 2002:a17:907:209c:b0:731:27bb:da8c with SMTP id pv28-20020a170907209c00b0073127bbda8cmr16525790ejb.555.1660212884692;
        Thu, 11 Aug 2022 03:14:44 -0700 (PDT)
Received: from blmsp ([2001:4090:a243:8036:200c:a862:4253:884])
        by smtp.gmail.com with ESMTPSA id x17-20020a1709060ef100b0072b6d91b056sm3386837eji.142.2022.08.11.03.14.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Aug 2022 03:14:44 -0700 (PDT)
Date: Thu, 11 Aug 2022 12:14:43 +0200
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Weiyi Lu <weiyi.lu@mediatek.com>,
	Fabien Parent <parent.f@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Fabien Parent <fparent@baylibre.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: power: Add MT8365 power domains
Message-ID: <20220811101443.eevyf5xnctmo5y4f@blmsp>
References: <20220725081853.1636444-1-msp@baylibre.com>
 <20220725081853.1636444-2-msp@baylibre.com>
 <bbdde7ce-4512-2e61-5e1a-e22e5cb91184@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <bbdde7ce-4512-2e61-5e1a-e22e5cb91184@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220811_031448_552112_178B6782 
X-CRM114-Status: GOOD (  18.41  )
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

Hi Angelo,

On Mon, Jul 25, 2022 at 10:54:58AM +0200, AngeloGioacchino Del Regno wrote:
> Il 25/07/22 10:18, Markus Schneider-Pargmann ha scritto:
> > From: Fabien Parent <fparent@baylibre.com>
> > 
> > Add power domains dt-bindings for MT8365.
> > 
> > Signed-off-by: Fabien Parent <fparent@baylibre.com>
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > ---
> > 
> > Notes:
> >      Changes in v2:
> >      - Made include/dt-bindings/power/mt8365-power.h dual-license.
> > 
> >   .../power/mediatek,power-controller.yaml      |  2 ++
> >   include/dt-bindings/power/mt8365-power.h      | 19 +++++++++++++++++++
> >   2 files changed, 21 insertions(+)
> >   create mode 100644 include/dt-bindings/power/mt8365-power.h
> > 
> > diff --git a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > index 135c6f722091..2c6d3e4246b2 100644
> > --- a/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > +++ b/Documentation/devicetree/bindings/power/mediatek,power-controller.yaml
> > @@ -29,6 +29,7 @@ properties:
> >         - mediatek,mt8186-power-controller
> >         - mediatek,mt8192-power-controller
> >         - mediatek,mt8195-power-controller
> > +      - mediatek,mt8365-power-controller
> >     '#power-domain-cells':
> >       const: 1
> > @@ -67,6 +68,7 @@ patternProperties:
> >                 "include/dt-bindings/power/mt8183-power.h" - for MT8183 type power domain.
> >                 "include/dt-bindings/power/mt8192-power.h" - for MT8192 type power domain.
> >                 "include/dt-bindings/power/mt8195-power.h" - for MT8195 type power domain.
> > +              "include/dt-bindings/power/mt8365-power.h" - for MT8365 type power domain.
> >           maxItems: 1
> >         clocks:
> > diff --git a/include/dt-bindings/power/mt8365-power.h b/include/dt-bindings/power/mt8365-power.h
> > new file mode 100644
> > index 000000000000..e6cfd0ec7871
> > --- /dev/null
> > +++ b/include/dt-bindings/power/mt8365-power.h
> 
> Please rename this file to add the vendor prefix.
> 
> mediatek,mt8365-power.h

Thank you for your feedback.

There are currently 12 'mt*-power.h' files without vendor prefix in that
directory. I can change it, but it seems very inconsistent.

Best,
Markus

