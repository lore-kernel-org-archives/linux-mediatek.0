Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 699A5C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 12:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teTEDU5QtKj0Mfr2EVBu+S1YQD/f2Wbp5vvhIJeVf1U=; b=Kp6JNtIasyfD2EV1IHaUkxmH5A
	FUOzE9jD6mf1FjlL4phyIGuRjvFknwEZ0ILmebuyKYcGgM/AdLCUZr3uHIyD5cgSRG7uf+BrOWZx0
	Y280L58rL0IqYhFP3fo690HKiGKMLCb2RLTfa+8vOr05oPPXXnypexGSGxRUD7HPiRRlKAFKm9kHM
	t/sKkPeqs2Je0yY99vlKPt00PFVPaHqgyh6sU4+nIkDhpPuilD5HLbBT3greOAZXXBFCtRmrwPl9c
	4oZlEB6YTqvOetW3IZutU1wjDEy6CIo6Vnm32cjwHVcTG7bjTjYFF32d6fCsKyfNb722Usnrot4/Z
	sbABVJvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2tgU-002bhI-6L; Wed, 07 Dec 2022 12:37:58 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2tgR-002bXn-2P
	for linux-mediatek@lists.infradead.org; Wed, 07 Dec 2022 12:37:56 +0000
Received: by mail-vk1-xa35.google.com with SMTP id v81so8188393vkv.5
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Dec 2022 04:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=teTEDU5QtKj0Mfr2EVBu+S1YQD/f2Wbp5vvhIJeVf1U=;
        b=Jq9l8QUT3RmW8agCe3pj35jp6CDAu9QRV3Me52lzDEq6xGTJdTpJQnUa6FVprMKVYF
         1j/QPap2PSi+LTcn5LXngQ6BSj1ajRXBF+UEKCrsmmvsf9YOH2uYrxHe9TUCzNRS2dzW
         mCSjBh4GwFIr1sktccAiZiGMXYyZfhfe+l0hKFebmB9FDylbefeY5lFaJZ0bfJpvk2jq
         Zug0l6dh6b3UzGzzOwpYbr3AcB5kp9h6/NR5p5563q1ZrasUCIDNBFHk/oME7ut3JG7H
         LcLCyexwfNvXSNH779CRjecVSukD4SOWlKqEMC5XwaaQiAztoYTB1dkgytorOdX0uTEV
         A/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=teTEDU5QtKj0Mfr2EVBu+S1YQD/f2Wbp5vvhIJeVf1U=;
        b=oGRIXPk/0D32nN5jtBmS9BPNKyfb+CsV14oL4l76TWsa5nDcLuVSQlHJpH2b1RCX1P
         4lGGQQjKGEYJkmva8XG7VQvvDVPSiLqA2IiH72x7IYoJ/ELZ2dnqGlXR2fY82mjbzmHE
         va46bXDRrvF0VCdtLBnGsQpSUq7DBnhf1vwJ6cP+57Jl456DEhZ2Ey7xAY5yt9EeHLCj
         6Eg59mpQA6XePeqMOy3uEFg3HoCmL/4A6cV8MHLsDJFtUy8FYON+gO2iHXk7GttH0bfm
         DxZ5gl3E+4Oc+Iwpl2o08aRo3CFH0X46PuO3OyBCcS/P579O85MOQTFN+Y8/eVncGYWX
         U3xQ==
X-Gm-Message-State: ANoB5pkzvd7eu+0vFtHK8bUHvqZsrO4kM66t5eSaUEdOx/+QGFYStaam
	DgWRKpj6DkDwzcLMZ5aLI9vqOyD438vJkz4m/USemw==
X-Google-Smtp-Source: AA0mqf5EouDbLcaUjLPD1/54NEmZJn57yjwMnxFOZ8DjaPlF3C1lSul0Ie2XnC3QvGA+28fynHBDLbuOjNBUXYE7+1I=
X-Received: by 2002:a1f:16ca:0:b0:3bd:8e1:26c4 with SMTP id
 193-20020a1f16ca000000b003bd08e126c4mr19034510vkw.3.1670416670412; Wed, 07
 Dec 2022 04:37:50 -0800 (PST)
MIME-Version: 1.0
References: <20221206211554.92005-1-robh@kernel.org>
In-Reply-To: <20221206211554.92005-1-robh@kernel.org>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 7 Dec 2022 13:37:39 +0100
Message-ID: <CAMRc=Mf0HdoH4Ca0o85j-4-beGGPFr+_bF2OGUP=Fc=tmNd5Og@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Add missing 'unevaluatedProperties' to
 regulator nodes
To: Rob Herring <robh@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Sebastian Reichel <sre@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Gene Chen <gene_chen@richtek.com>, Daniel Mack <zonque@gmail.com>, 
	Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_043755_189859_D603A93F 
X-CRM114-Status: GOOD (  17.06  )
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

On Tue, Dec 6, 2022 at 10:18 PM Rob Herring <robh@kernel.org> wrote:
>
> Several regulator schemas are missing 'unevaluatedProperties' constraint
> which means any extra properties are allowed. Upon adding the
> constraint, there's numerous warnings from using the deprecated
> 'regulator-compatible' property. Remove the usage as examples shouldn't
> be using long since deprecated properties.
>
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> I'd suggest that Mark take this if that's okay with Lee. Or I can take
> it.
>
>  Documentation/devicetree/bindings/mfd/max77650.yaml  |  2 --
>  .../devicetree/bindings/mfd/mediatek,mt6360.yaml     |  9 ---------
>  .../bindings/power/supply/mt6360_charger.yaml        |  2 +-
>  .../bindings/regulator/max77650-regulator.yaml       |  1 +
>  .../devicetree/bindings/regulator/max8660.yaml       |  6 +-----
>  .../bindings/regulator/mt6360-regulator.yaml         | 12 +++---------
>  6 files changed, 6 insertions(+), 26 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/mfd/max77650.yaml b/Documentation/devicetree/bindings/mfd/max77650.yaml
> index b0a0f0d3d9d4..4181174fcf58 100644
> --- a/Documentation/devicetree/bindings/mfd/max77650.yaml
> +++ b/Documentation/devicetree/bindings/mfd/max77650.yaml
> @@ -100,14 +100,12 @@ examples:
>                  compatible = "maxim,max77650-regulator";
>
>                  max77650_ldo: regulator-ldo {
> -                    regulator-compatible = "ldo";
>                      regulator-name = "max77650-ldo";
>                      regulator-min-microvolt = <1350000>;
>                      regulator-max-microvolt = <2937500>;
>                  };
>
>                  max77650_sbb0: regulator-sbb0 {
> -                    regulator-compatible = "sbb0";
>                      regulator-name = "max77650-sbb0";
>                      regulator-min-microvolt = <800000>;
>                      regulator-max-microvolt = <1587500>;

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

