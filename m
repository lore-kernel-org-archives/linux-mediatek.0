Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B48E1088E76
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Mar 2026 04:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1zufBE/wG0H/dPy5NtwxW5QdocP2uRSfDHkfDw+3Fq4=; b=iSupS2VF1qEu3rH1Iqy2Tc8dUS
	eqWGmNR04EnvW6ZPS6gj+jsSxiyviKXc7qaXdfCaC7fQx8etoEeY7gGWZ77QFPRNh/4YvcxSZpjpx
	yPXBRHJuFtena3TfgeNp+QqL6fAyqyMi/VhlS0xJc5OrLqtsNer3KBWV4oA3loLBofn/It4bcBGH3
	fR15N7rJdkU16qMMOhbw/UysaDXv/wBca4o+SOOz8yK3l6qfyfcTfBy1+ubY9zQPsk08Npekndvap
	bjsk6S+ql1W1kdlLVuS/GfUzHXHYnF/b30ZbILR5M5kCGsA46rKnbyXzkg4xu0OD4terC+n+0D+6l
	PZswXUZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w35RW-00000009vH8-1opd;
	Thu, 19 Mar 2026 04:57:10 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w35RR-00000009vGT-2nYf
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Mar 2026 04:57:09 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a278e0f7f6so701627e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Mar 2026 21:57:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773896223; cv=none;
        d=google.com; s=arc-20240605;
        b=Y5gkUAAnXyaUEhD9m5hvhhlkzApFsnI/7S8s83XFX0lGAdTzjPfYSHasghpFFBArg4
         xMXSPw0ehJWlGEV9DuTUy4/y44inBamqbSEcrrgTrdC8sI68/ksCtEprOmLjW+aWfuWt
         v+Rf97b202XPM0V982TPEJtv7e++RnWmowv+q0SttRgBXu+mLXa2EC7jhanTnfbQsJdG
         iAdj8gDQVZFoLAplKFmBOzGqFtKSx3uvLR9shclszvIVEYr5lLPT4aoNyqDYi9NvtpXP
         ZiABdkgnLefvN6cl+CpTnAw6ayE8TR+Tg2Lh4ehxG8b/5c1qDybsZulLKEnq3ppuLuNP
         Hsrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1zufBE/wG0H/dPy5NtwxW5QdocP2uRSfDHkfDw+3Fq4=;
        fh=ITxoUDo50ZozrV2X7qnPcWUoJiSJevDycy07xX6BEFM=;
        b=gPmMnm2H0IgxkdLR56RKkFZyHhSCjmhaXHBW1qGnN3A1f34CEl1uiIQdG+UPqWZzcx
         mSAsyJKB/SNHk57XbM60/OtSqe0jkenId9gk2ZlC8gaUCzoR4T61bLBYjBwYmrR+OU9K
         8Gm5e4/PnUFgZs9OsaQnYrEUmZEuUVV8R0UiBYir8BZtqoBJxEX4aMTazju5GDWUoalh
         xTHloVHttKUtzfgJ+gD7ca64z3IGQlklLmZ6yIj3zdZ3YliSWdPI2FKLSW88CHxUu3xu
         GbSuqiD76jwD0vTirc6xeK4JrFu15k97HKKdOaFXHUAsZNks7nmOt1vPlv+H8L3ZcWzF
         zYfw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773896223; x=1774501023; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1zufBE/wG0H/dPy5NtwxW5QdocP2uRSfDHkfDw+3Fq4=;
        b=PzGY07zHi+OXU0s9qM4NO/g9DnS8KnwHk3LWWdESAVn7GvajQ6TjP2JJra0o2QkHaB
         Dob3r3flg/0FtABJv4aBvh+HwZyAHaXiDF7ZG7cPj8HVte59Nobgx1bzN6v89Nl00LWL
         a+lqMQD6D8uDh4A5VwJ4Lv8Yg2Jr+2P199lvw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773896223; x=1774501023;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1zufBE/wG0H/dPy5NtwxW5QdocP2uRSfDHkfDw+3Fq4=;
        b=nMPWE0M8HH+Z9MsbFD2VdudO1atsS1xsVHp+WP3e0ogVi4jIzVnKj2TUndjnbP0Kf1
         OIryp8ZkcW0Cnu9LnEdIiSar4tot5bLr17VvsjFew0EtS21VnY4BKgmfiOMAWRCpddDJ
         HwRlebs3li7lCLTKbuDxQ+cv7JZF56hb0ttQJ0eJdVSE9DKruJE7TaTYtHPjySGdi7r9
         jMKC3QrAYsyWW15lgNcVOVlSWTlgcZvizpgZjxRkJCIJ0T/w68JE9FnqxjNKiStY+sBP
         5rLyTQhGXjTCDxe4ub+bYnCg5E2sjGlsnE6xpoiiHOxkPxO4bHybuHVJR1LU6nwHxFQO
         vORw==
X-Gm-Message-State: AOJu0Yw2P1zjQLKw+VBvn6jssj1sQjImrORuZO1ZeK6jQF4navOJoBke
	k2YoqKBfwKiSsjwqweTnlySb3fpfSFG18hP3b7DzEuFpSDnjbi/WOrUqZABFkqKue3JH2TXLJos
	I5Cd+E78eiRt6BHGRju7Kx1Lb0shuqTnp7aVX2JMI
X-Gm-Gg: ATEYQzxRiJos67Z/kx/EndM95twACPXHsqmhdhQhb2mmf83UQ0yPy1Sqc+vX6ZrYO02
	hjZW+YYCACXBs5g22lAKUhUhInOUO1c8A3T1SXmqsti7ArnDsH5sP8Y1SHet7nw2frMP18ha7AX
	Hr+OjESfLuIY64Nje5JQN6iBQrHz7EBYj5X5/+KdgncBt0GqirP8jYRZaYQM3Wk3/bkyWAuothD
	3Q+VR94uYZRJaNK669DdNnrWNgDiV6Po6QITNrYYxIfOYKMnarEpEF4qPA7MKivdcXB0QQezEs4
	vQHgzVgqIVxbrufm2INABtuRMScBCzew8aAmBg==
X-Received: by 2002:a05:6512:1598:b0:5a1:3561:de7d with SMTP id
 2adb3069b0e04-5a2796bae61mr2319165e87.41.1773896223417; Wed, 18 Mar 2026
 21:57:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260317184507.523060-1-l.scorcia@gmail.com> <20260317184507.523060-4-l.scorcia@gmail.com>
In-Reply-To: <20260317184507.523060-4-l.scorcia@gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 19 Mar 2026 12:56:52 +0800
X-Gm-Features: AaiRm53ZcC1_5GBB68m3xy0r3oGl-8GEHHuCoUTvKM9klv1nQiqkqQTd8EeYleI
Message-ID: <CAGXv+5Hz6JHBTX1ftxRuD0pJuhxGJnAkGUO7=kUh3fErOLtXTg@mail.gmail.com>
Subject: Re: [PATCH v3 3/9] dt-bindings: regulator: Document MediaTek MT6392
 PMIC Regulators
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
	Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus Walleij <linusw@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Julien Massot <julien.massot@collabora.com>, Gary Bisson <bisson.gary@gmail.com>, 
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, Val Packett <val@packett.cool>, 
	Fabien Parent <parent.f@gmail.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_215707_521163_43593D63 
X-CRM114-Status: GOOD (  15.89  )
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

On Wed, Mar 18, 2026 at 2:46=E2=80=AFAM Luca Leonardo Scorcia
<l.scorcia@gmail.com> wrote:
>
> Add bindings for the regulators found in the MediaTek MT6392 PMIC,
> usually found in board designs using the MediaTek MT8516/MT8167 SoCs.
>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  .../regulator/mediatek,mt6392-regulator.yaml  | 318 ++++++++++++++++++
>  .../regulator/mediatek,mt6392-regulator.h     |  24 ++
>  2 files changed, 342 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,=
mt6392-regulator.yaml
>  create mode 100644 include/dt-bindings/regulator/mediatek,mt6392-regulat=
or.h
>
> diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6392-=
regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt639=
2-regulator.yaml
> new file mode 100644
> index 000000000000..fa4aad2dcbe8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6392-regulat=
or.yaml
> @@ -0,0 +1,318 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/regulator/mediatek,mt6392-regulator.y=
aml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6392 Regulator
> +
> +description:
> +  Regulator node of the PMIC. This node should under the PMIC's device n=
ode.
> +  All voltage regulators provided by the PMIC are described as sub-nodes=
 of
> +  this node.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: mediatek,mt6392-regulator

Please add the various supply rails. This allows you to properly describe
regulator dependencies and have a complete power supply tree.

They can be found in the datasheet.


ChenYu

