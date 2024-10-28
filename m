Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54513D1359F
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Oct 2024 12:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ANRl9fyJhN3L3pKsYoqtRh0fyM37Mr+toNEHHpk2z1g=; b=hnbFFN5VobqyL19KCNkkFJcti9
	ND+a8mIgVqX8We6jS3q/Khe/oR8H+1Bn/BaMPTgDN38AR2XLVbZR7yrI7vrVpa5R1K92K/nNQ1vvd
	hre0y6708DoXnEGlxabynx8sPT1b9jrffr00ikyO08M4jZqKRZDuI9DNPBRfBXdq2+3ar9C8Tb0Gp
	evfoS09h8r3/QCcx4/FW7y5RNOByCyJwLQyuufnC6fSaq6+nQQzFizG1BrR5Rzjr32Fxskp+Yma8i
	hCRzbdBV8kiY7d+pWHWkapUjcctFr6AV8qIp+VI78J9a9Yg9crZpVsuQSKBFoEe19D7zC9DjAgiTl
	Tq8ybmzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Ot3-0000000AkrN-02YI;
	Mon, 28 Oct 2024 12:30:21 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Nic-0000000AXp6-1di3
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Oct 2024 11:15:50 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-5ec1ee25504so980856eaf.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Oct 2024 04:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730114129; x=1730718929; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ANRl9fyJhN3L3pKsYoqtRh0fyM37Mr+toNEHHpk2z1g=;
        b=gRTwTnlYAPy5nYsDActU8F2HPCzxQEPbziALxwrrU8BgBEQHLClIPGdSSjGqSQUTyd
         j3xCWlyTFKApBOBb8N3knb/Ln4mgNuEJYmEsMzSmZFIM3VWGQGzj42eRnpk4e1+9a1aS
         Uf8Fw4ujQ5WYb9dnuyPHsyPpgWtZdWp3DCZnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730114129; x=1730718929;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ANRl9fyJhN3L3pKsYoqtRh0fyM37Mr+toNEHHpk2z1g=;
        b=o93MOJ5V1Cu+BDODockrCUQEhaSw1zhF1a7BlJ3+AUnaHim2miMQzIUUuQYfmvQjCo
         Ib1z7BczBjyTsuso2WsxSkvqpKNtiJ+thkijD69Or6ZpxV2vKAl947jZO5YmwuW3K+bV
         6zbciaS+iH5tUFadbdR9dH34KmmLBj3Ssi8Dc+n6xzPnR7AoDfJLyAkHfsQMbrXtzMey
         mhlELi81DS6FO9B5ZO6wkplxGkb+mrG/QocjcCHnbaRHb5X3br6JNxhDHV8APPSlAtzq
         jMI1aRPi1dGAyPawWBwmCoCXBLQX804AecG24Khvp5ob06C3Pckx7LmWV5NlhO3lvuvo
         yzHw==
X-Forwarded-Encrypted: i=1; AJvYcCUq7WnBeNgfowj0ETkyc334jm+fhXokV3eovppa42LdWGRs2nFdIrH7jOfqpPgBLpEUDoxh5x4OnRaaGRfNOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyC/nRGuFFLPMxlcaa0F0AVgaMAq/T9OgtuknQsY0kMzAkdFTLX
	AdLzY0Pn35SZFT2TMr3kwG41aXCcOH0XJzNmO+Wstb0hoo4ThgL144x6/linW5RcKZnBXclYKnE
	=
X-Google-Smtp-Source: AGHT+IHJw2VdjON5rjzz/rZ2Zt2auwiyr8a2VqmFvUid630T9XWIsMledqDmcEUSREgwLZ3aagRWrg==
X-Received: by 2002:a05:6820:1c8f:b0:5e5:7086:ebe8 with SMTP id 006d021491bc7-5ec23618320mr4887937eaf.0.1730114128978;
        Mon, 28 Oct 2024 04:15:28 -0700 (PDT)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com. [209.85.167.182])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71861507216sm1456791a34.13.2024.10.28.04.15.28
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 04:15:28 -0700 (PDT)
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-3e601b6a33aso2390726b6e.0
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Oct 2024 04:15:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNPtjIwF0HmFCUUjEenKJBqIaCixoFBYVclf9ycAOp63b42aRqk3C32lNUrSpEyD1ROvhpgn+EYPjK6ssjHA==@lists.infradead.org
X-Received: by 2002:a05:6122:2a41:b0:50d:5f75:f7d9 with SMTP id
 71dfb90a1353d-51015109f5dmr4172633e0c.9.1730113723870; Mon, 28 Oct 2024
 04:08:43 -0700 (PDT)
MIME-Version: 1.0
References: <20241025104310.1210946-1-fshao@chromium.org> <5vjaxo652w5hici5hxi3t6o2r5vkggrz25lqvm3or5fip3svke@fttqk5wabxqb>
In-Reply-To: <5vjaxo652w5hici5hxi3t6o2r5vkggrz25lqvm3or5fip3svke@fttqk5wabxqb>
From: Fei Shao <fshao@chromium.org>
Date: Mon, 28 Oct 2024 19:08:05 +0800
X-Gmail-Original-Message-ID: <CAC=S1ng7zRR-Ek1AQ7W6DhhB82=yVpMZq6JfzPEbWWb67knCVg@mail.gmail.com>
Message-ID: <CAC=S1ng7zRR-Ek1AQ7W6DhhB82=yVpMZq6JfzPEbWWb67knCVg@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dp: Add #sound-dai-cells property
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
	Jitao shi <jitao.shi@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Maxime Ripard <mripard@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, devicetree@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_041530_467915_93E1DD6D 
X-CRM114-Status: GOOD (  19.02  )
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

On Mon, Oct 28, 2024 at 4:52=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Fri, Oct 25, 2024 at 06:42:45PM +0800, Fei Shao wrote:
> > The MediaTek DP hardware supports audio, and the "#sound-dai-cells"
> > property is required to describe DAI links and audio routing.
> >
> > Add "#sound-dai-cells" property to the binding and filter out non-DP
> > compatibles, as MediaTek eDP doesn't support audio.
> >
> > Signed-off-by: Fei Shao <fshao@chromium.org>
> > ---
> >
> >  .../bindings/display/mediatek/mediatek,dp.yaml   | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/mediatek/mediate=
k,dp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.=
yaml
> > index 2aef1eb32e11..c05c2b409780 100644
> > --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya=
ml
> > +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dp.ya=
ml
> > @@ -42,6 +42,9 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >
> > +  "#sound-dai-cells":
> > +    const: 0
> > +
> >    ports:
> >      $ref: /schemas/graph.yaml#/properties/ports
> >      properties:
> > @@ -87,6 +90,19 @@ required:
> >
>
> You need to reference dai-common instead, since this is DAI.

I'll add that. And if I understand your feedback in another patch
correctly, I assume I need to reference dai-common and also keep the
original #sound-dai-cells lines for the number of DAIs, so I'll keep
that. Please correct me if I'm wrong.

>
> >  additionalProperties: false
>
> and this becomes unevaluatedProperties: false

Acknowledged.

Regards,
Fei

>
> Best regards,
> Krzysztof
>

