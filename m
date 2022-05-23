Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A03CC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 14:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bEZX6gO27PI4QOqER+jZhM4q4YAJXsNSIgdS9B+jtO0=; b=M7kKG9EwJ95I3x
	PKxhhKBuZd2VaGZnAYrX71T4NG5TFWT3fImFfNp5sXjiMqjuS9kzjEoglt4S2I5W+odR6Ds+M/Ad6
	pTwB/SDxQhNUEzoAyLsaHGnHH49nmDkVz4qF5E+nuWs7GQOGKlxmX0eUf4aOnOzgEM7VJA3WE+V32
	L17ZotnQPIAIMOOY/AaA82npNl25DfGmMqxQudBPuNaTt938CI9oRYJFKXguc0Db8DSKJ2i7T0X60
	asVeVl0doqAS21d2e80YkixUE0BSeskjCyzm8orqjMkhfYXATcOj6Fd71pvTaJb8HCQKo5dLRQi+/
	5PpGQfh5BcV7DjGl+21g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt8jb-004eAA-Gb; Mon, 23 May 2022 14:08:35 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt8jL-004e71-7T; Mon, 23 May 2022 14:08:20 +0000
Received: by mail-oi1-f180.google.com with SMTP id w130so17978144oig.0;
 Mon, 23 May 2022 07:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=c/Revpi/NQeBVLl9e7ZCFj2VurS2hZIRuL3sCTpYBPU=;
 b=TA69fadFyMcWnWF0T0O/kEiHta9sYtms60tW883ngZqsFjoxPlucirXMI1XwmQt85u
 1UEOvHYrTyQmWZVgaPPMA+WLbV8h978wxVtDLN4SnXznBYjl7DESKqfeDxQ7cFK2A1MY
 BUOUOzm38vNew4X3QitEQyWhrGxSO0/aX4lOWhg4F+ETeOzzLj8LTu/PFM6LEwl/Utw4
 /gYokd/P1CJQkuXswWfA1l4Sx9KU2SfGq5DuNCS4jVJ/NrrCvLFUiH2zNjt6zoc0r0Hw
 f6TAaZp4n1dLAA9Yqo4HpHqeSEu7wKbUwIUtV8f9MTwkUho5pkx28WPGmbHiOzHRLVL+
 +YQw==
X-Gm-Message-State: AOAM533gWNQrITb0siQuaH/G7CKBqAf7cFcGQOB/6og2xLFVLP/ldTfC
 9LTFeWQ16hiyn4fhnqopsw==
X-Google-Smtp-Source: ABdhPJzQukjWCQT1QEmWzFgP+OVp9orwtCbowykGqCuwEbqMpR+WgnafwDT9QfD0g/ABT99ODaPCxg==
X-Received: by 2002:a05:6808:1314:b0:328:eb31:99b6 with SMTP id
 y20-20020a056808131400b00328eb3199b6mr11775397oiv.12.1653314897097; 
 Mon, 23 May 2022 07:08:17 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 g4-20020a9d6484000000b006060322125asm4025063otl.42.2022.05.23.07.08.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 07:08:16 -0700 (PDT)
Received: (nullmailer pid 1515070 invoked by uid 1000);
 Mon, 23 May 2022 14:08:15 -0000
Date: Mon, 23 May 2022 09:08:15 -0500
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, sboyd@kernel.org,
 chun-jie.chen@mediatek.com, rex-bc.chen@mediatek.com, wenst@chromium.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] dt-bindings: arm: mtk-clocks: Set #clock-cells as
 required property
Message-ID: <20220523140815.GA1500210-robh@kernel.org>
References: <20220518093631.25491-1-angelogioacchino.delregno@collabora.com>
 <20220518093631.25491-3-angelogioacchino.delregno@collabora.com>
 <20220520221910.GA348732-robh@kernel.org>
 <288690ac-b23b-92f8-64b4-d994f249f21c@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <288690ac-b23b-92f8-64b4-d994f249f21c@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_070819_315537_B9D27285 
X-CRM114-Status: GOOD (  17.11  )
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

On Sat, May 21, 2022 at 04:05:01PM +0200, Krzysztof Kozlowski wrote:
> On 21/05/2022 00:19, Rob Herring wrote:
> > On Wed, May 18, 2022 at 11:36:31AM +0200, AngeloGioacchino Del Regno wrote:
> >> This is a clock-controller binding, so it needs #clock-cells, or
> >> it would be of no use: add that to the list of required properties.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> >> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  .../devicetree/bindings/arm/mediatek/mediatek,mt8186-clock.yaml  | 1 +
> >>  .../bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml         | 1 +
> >>  .../devicetree/bindings/arm/mediatek/mediatek,mt8192-clock.yaml  | 1 +
> >>  .../bindings/arm/mediatek/mediatek,mt8192-sys-clock.yaml         | 1 +
> >>  .../devicetree/bindings/arm/mediatek/mediatek,mt8195-clock.yaml  | 1 +
> >>  .../bindings/arm/mediatek/mediatek,mt8195-sys-clock.yaml         | 1 +
> >>  6 files changed, 6 insertions(+)
> > 
> > Acked-by: Rob Herring <robh@kernel.org>
> > 
> > Wasn't there some discussion about moving these to bindings/clocks/? 
> > Maybe that was another one, it's all a blur...
> 
> Yes, there was such idea although I am not sure if this is worth by
> itself - messes up with the git history.

There shouldn't be too much history since converting to schema. For just 
a move git is smart enough to see across moves.

Rob

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
