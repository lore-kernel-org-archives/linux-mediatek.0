Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE6BD3C937
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 07:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNidV6zQRVAttNm6/BViiBS78cigdlLuD+Cor4bHBRU=; b=qcefQ0CjBNoJCHMt5wLvXGUDIS
	jVahqZBe71vAwuRjDurj8y3+fKXpW5aXhjKxfFUwP5dYeui8UcuwhUhRJtgIfmTufIbmYHRjTuYZh
	fCtEfTUDqn+/M+sPaHZaPpJEG/6mnYEpwhE5hD1w4kRF2bx0xOFuFi8RkIyoNCj3C3olvrzsp1S7w
	DvZBx4SXQXqPmLHKdGsa/njC+wQduAGh4yKekeTmk0d62tftBhJdB9tXkHU40ENYO94kwcIeiSyFt
	U9z4eTyPTprrb5ho3bz2MyH+BuNqF08e2eoBq+yrJUfv6F2VW9Z5+pB7RgjKNYA6093Td7nDJFa9p
	I16CbEiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mZk-00000006JoF-3fpv;
	Mon, 21 Oct 2024 07:11:36 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2mKj-00000006Heb-1TFo
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 06:56:06 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-539f53973fdso3209374e87.1
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Oct 2024 23:56:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729493763; x=1730098563; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XNidV6zQRVAttNm6/BViiBS78cigdlLuD+Cor4bHBRU=;
        b=TGghS36Gk2cH0Tp/TmbqOf/Lk8pOBJ3uH8F5KPz4kMgc1PfedHn8l1So4xvPowyO2s
         ehYGhMSDmv3Kh0KGXyr1OPbyEj62W5cWQWlz+FD73H4cwgpru9qXlG3nEvJRbTwneIty
         LaTnn7dUK7QZuv0zqTe0zP+93rQq6TIW7yH2U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729493763; x=1730098563;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XNidV6zQRVAttNm6/BViiBS78cigdlLuD+Cor4bHBRU=;
        b=fZDrXsQ+JkeoVRVTqm/owhseQkikrBZm8pMttBmNexhY0mQX70WNRI/HHCq2vjtlti
         5byLI+06QbyGlqikzMoR9dhZEHbbA5V+vk0GPBg5gZQwRWHG1/5QTDlbD2WFYhiOVR+8
         ZmrFWIFIeZm85iyEDqsNYq37yvut//o3dD1/kleXXKHGBxdF4tLdF+g2Lp4OkjkFjyOU
         io/fOWvh3K3ThhlolMtxyzX5jE6WNlWI+/3Gu1ndmlSHIahMehZPZZfMNMRvxFwKADRK
         eZbL3TQ7zMW929j8b2q/n+Fsl12kDM5Vg0c5YRkMAkBGRyqOHhD39SBp0rIAWZ8vovXU
         Bgwg==
X-Forwarded-Encrypted: i=1; AJvYcCWigMaHX99xN839GJWzf805/aldbnw9rPLtGA+EnmroOdYEU2pyRiYtBu45AEKsEAmgbPK4LQL/tQEA4MwswA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyXtOj9D8nWxXBx+ai04+ihL35//e7uTvdqrFu5TXVWmyE49moK
	Y9mxIR0svaB+aPyIci8Z65GrAcrROGi+OE2iw1tl4qkCKqixWE3s1FnduDNQ9gBUqJAUFiLqLml
	KFIqTIMvYomPlVvwLb7RHPx0TJHx5BQflsqdY
X-Google-Smtp-Source: AGHT+IH2grfsk2J11/R+DtqJL9MsiARRehfvs3wTJ4dpT61anw0+qbBHxQCnXBmSmtIOZmW35lIuuB1aQSapi3a6q+Y=
X-Received: by 2002:a05:6512:3b2b:b0:53a:1b6:4624 with SMTP id
 2adb3069b0e04-53a0c6a5c2cmr4349435e87.5.1729493762768; Sun, 20 Oct 2024
 23:56:02 -0700 (PDT)
MIME-Version: 1.0
References: <20241021025938.676-1-xiazhengqiao@huaqin.corp-partner.google.com> <20241021025938.676-2-xiazhengqiao@huaqin.corp-partner.google.com>
In-Reply-To: <20241021025938.676-2-xiazhengqiao@huaqin.corp-partner.google.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 21 Oct 2024 14:55:51 +0800
Message-ID: <CAGXv+5HRc6MrNuNxqAi9mst3X4pieUpRW5jzbjKgtBjTUT0P8g@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
To: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Cc: devicetree@vger.kernel.or, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
	hsinyi@chromium.org, sean.wang@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_235605_559529_2808D2F3 
X-CRM114-Status: GOOD (  16.02  )
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

On Mon, Oct 21, 2024 at 11:01=E2=80=AFAM Zhengqiao Xia
<xiazhengqiao@huaqin.corp-partner.google.com> wrote:
>
> Add an entry for the MT8186 based Chinchou Chromebook, also known as the
> ASUS Chromebook CZ12 Flip (CZ1204F) and CZ12(CZ1204C).
>
> Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com=
>

Hi,

For upstream Linux kernel development, it is customary to have the maintain=
ers
and anyone that may take action on the patches to be in the recipients list
or "To:" list, while the mailing lists and anyone that might have an intere=
st
be in the "Cc:" list.

Here you mostly have it backwards.

ChenYu

> ---
>  .../devicetree/bindings/arm/mediatek.yaml     | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 1d4bb50fcd8d..3efab59b8a73 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -239,6 +239,34 @@ properties:
>            - enum:
>                - mediatek,mt8183-pumpkin
>            - const: mediatek,mt8183
> +      - description: Google Chinchou (Asus Chromebook CZ1104CM2A/CZ1204C=
M2A)
> +        items:
> +          - const: google,chinchou-sku0
> +          - const: google,chinchou-sku2
> +          - const: google,chinchou-sku4
> +          - const: google,chinchou-sku5
> +          - const: google,chinchou
> +          - const: mediatek,mt8186
> +      - description: Google Chinchou (Asus Chromebook CZ1104FM2A/CZ1204F=
M2A/CZ1104CM2A/CZ1204CM2A)
> +        items:
> +          - const: google,chinchou-sku1
> +          - const: google,chinchou-sku17
> +          - const: google,chinchou-sku3
> +          - const: google,chinchou-sku6
> +          - const: google,chinchou-sku7
> +          - const: google,chinchou-sku20
> +          - const: google,chinchou-sku22
> +          - const: google,chinchou-sku23
> +          - const: google,chinchou
> +          - const: mediatek,mt8186
> +      - description: Google Chinchou360 (Asus Chromebook CZ1104FM2A/CZ12=
04FM2A Flip)
> +        items:
> +          - const: google,chinchou-sku16
> +          - const: google,chinchou-sku18
> +          - const: google,chinchou-sku19
> +          - const: google,chinchou-sku21
> +          - const: google,chinchou
> +          - const: mediatek,mt8186
>        - description: Google Magneton (Lenovo IdeaPad Slim 3 Chromebook (=
14M868))
>          items:
>            - const: google,steelix-sku393219
> --
> 2.17.1
>

