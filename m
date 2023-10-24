Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE07C25B47
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 19:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ko81kVFawiPk62I2UsRSceb9b1VOPxmBQiQP7A61UvE=; b=d7fKVLRQoS91j3
	kTpI85Ex4YQboR+3Nq6fG/7WaKG3z4N449rrPRqQZ7OSbPZRAtjOWpQb9YRAHSCWs6pYMlaiAege+
	yYR62WhCKFSWtn/bfeaq0N1wJ3os9y1CJJgSVJLnb71w6jm6w4EZleZF1MJO9O6UZ9Yllf2In7Sjx
	bvW3xb5dAEzZMrHbR8uU+Trtajtodwgtg7JOREarkR0JkLfJNtDZ3YPm/Mv8N5Veab52bYgXf+VGY
	BaGK3JzTrc4TZR2UPGrtIxpLEd0QJwL46f8HCB/62ftiKCjkYMzTKJei65sl4/TpEgf86CG94clxd
	82NACwoIW3Vb8GqM6sSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvNMR-00AlvS-2w;
	Tue, 24 Oct 2023 19:46:43 +0000
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvNMP-00Aluf-2H
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 19:46:42 +0000
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-581cb88f645so2971358eaf.1
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 12:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1698176800; x=1698781600; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ko81kVFawiPk62I2UsRSceb9b1VOPxmBQiQP7A61UvE=;
        b=CuwarAcwto/EYhbar1/f7SU81jrqX+9Sc1MuRbTftjUQtsExEt5a7NFwOn8L70ImUs
         rSS0H9uRuItUzqQEAFTMFREFJK836Of//n+7BcJWMw9RBsGQQJqgxEWC+NhpSGdqJXY6
         ZZ4mu5KOebUyn1mMzVFh9RqVoI7M5CwklRPqM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698176800; x=1698781600;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ko81kVFawiPk62I2UsRSceb9b1VOPxmBQiQP7A61UvE=;
        b=qrrFCvnt9UyLMQuYYoQmKfubTl1JCBEp8HBx9cwDNh7BcpxWuWTqHD5KwkhIt15bBr
         A+PPO0asfFOpmZwUCHUNU3pyeIJiSiTU4LLZNrYNpTCduBZKLymVCpx7EaizRmgcQ/r4
         VX1fHwuXAdieA9ODbzbZ8krp/HvnSYbIlW1ccLOoAz9Ad7NsvP4PkWfHSvSm79ywjL1Z
         58Gzr8kKFthb9xcC+TYCG3tchqmwDOze8nBnfm7IsMcB21gPtoq80yqSl0dZfQUmqhkb
         3Au5nf59kypxCM38d+ZHFspwyHmyAhXjmY3dXCjODjMWknI4vNnCEDoo7sc65ZIi0yUN
         LlfQ==
X-Gm-Message-State: AOJu0YwT2uAAMwZVE/xCD2HDDKT+PVcBUm6oYaQs4hMtq7uYwDdk2jCn
	62MoxDIs6NTwqzom6zGBrkbBQwFl1eWQmuTbKcrSFg==
X-Google-Smtp-Source: AGHT+IGZLu9siBSnt2MbWkvBMR/N7snwcPPmuPMWWr58Q8rokuqI3qNHuZ9YSR/3f+pgfmtMzYR7ZeBgSq+sGhGPjVQ=
X-Received: by 2002:a4a:bb0f:0:b0:571:1fad:ebe0 with SMTP id
 f15-20020a4abb0f000000b005711fadebe0mr13943983oop.3.1698176800424; Tue, 24
 Oct 2023 12:46:40 -0700 (PDT)
MIME-Version: 1.0
References: <20231024000724.57714-1-hsinyi@chromium.org> <20231024000724.57714-2-hsinyi@chromium.org>
 <20231024-reenact-wildfowl-de6575bbe6f6@spud>
In-Reply-To: <20231024-reenact-wildfowl-de6575bbe6f6@spud>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 24 Oct 2023 12:46:14 -0700
Message-ID: <CAJMQK-g2hWi1GO+9HxE=0AUDWMNF1YSQc9z8=imdF8FduOr+MA@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-katsu
To: Conor Dooley <conor@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_124641_781042_2F259F35 
X-CRM114-Status: GOOD (  16.26  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, =?UTF-8?B?TsOtY29sYXMgRiAuIFIgLiBBIC4gUHJhZG8=?= <nfraprado@collabora.com>, Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Macpaul Lin <macpaul.lin@mediatek.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Oct 24, 2023 at 8:15=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Mon, Oct 23, 2023 at 05:02:24PM -0700, Hsin-Yi Wang wrote:
> > Add katsu and katsu sku38 which uses different audio codec.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docu=
mentation/devicetree/bindings/arm/mediatek.yaml
> > index a5999b3afc35..fe8c488a3207 100644
> > --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> > +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> > @@ -235,6 +235,12 @@ properties:
> >          items:
> >            - const: google,kappa
> >            - const: mediatek,mt8183
> > +      - description: Google Katsu (ASUS Chromebook Detachable CZ1)
> > +        items:
> > +          - enum:
> > +              - google,katsu
> > +              - google,katsu-sku38
>
> This seems a little odd - does the non sku38 not have an sku of its own?
>

It's actually sku32. I'll update that in the next version. Thanks.

> > +          - const: mediatek,mt8183
> >        - description: Google Kodama (Lenovo 10e Chromebook Tablet)
> >          items:
> >            - enum:
> > --
> > 2.42.0.758.gaed0368e0e-goog
> >

