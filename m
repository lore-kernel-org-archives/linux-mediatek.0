Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D97BE6FE4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 21:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=modpcTFGLF9aKbO8/hxRVTkNY+Z5zDvT8kayu0jRlU4=; b=p2xNd+OOzL17QeTHR8zUBF8RSl
	GPmIw2aY3DTESvNy0x9kczkEyLK8BiZGDDVpEafaf8ezrB4qqYtQiq0dx4WJjF/KTsLEwpttiGyxp
	sNWHgc99Dz03/QL0MAauqSet8KoE7NzQWTmdmK0KWt2wxT6phgSIFGdjofdeKwel3Yd5AcjNR+8W6
	PxPmXQSJsRQlVYPNakJ/B/R/BSTL/2Aqd3m7dQakW3kxWr+bCcKj4H+iEjX7uYL41uwjCAdgop0zr
	fH8ewG+iOWQ8HlDG3Em5I0eBDtk5Co006qIxydrkfh5a+LWyH/c+ZyiaMFJLS1VuvQzEylJ4O3gCe
	GVGW3QqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smgTq-0000000Dexn-02Sd;
	Fri, 06 Sep 2024 21:26:58 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smgTm-0000000Dex3-1I0p
	for linux-mediatek@lists.infradead.org;
	Fri, 06 Sep 2024 21:26:55 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5c26852af8fso2623431a12.2
        for <linux-mediatek@lists.infradead.org>; Fri, 06 Sep 2024 14:26:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1725658011; x=1726262811; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=modpcTFGLF9aKbO8/hxRVTkNY+Z5zDvT8kayu0jRlU4=;
        b=T6WvqpSD9Cwlu5L+WCeEAJjEHkvSxcPRDu7qm1RHFr6igCNnJa5/nceuRbVzaT3VJy
         ca/SUdSo63CPTRO8DdAkGXkhIl14Pnjeitf2ejaXyPvWnh4iHAsyr31rSWRIVs2Ae3cn
         1N1431wgKAPmm7bXyXRFpH9gLTg/CRAcPrsmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725658011; x=1726262811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=modpcTFGLF9aKbO8/hxRVTkNY+Z5zDvT8kayu0jRlU4=;
        b=gqlOJPh/qPwV1mM7UTx27H6I3HjHU4pBVJGINovS7vF/OHbc6EJNuHfhl4da6Tn+H3
         mxLui6KASNXIimbR1rFUxGw6UN4+cCmoAO2VcbtxBPTo6Nr7bYNdqMOvhzjP+Ubxcg5Q
         3vIk51ct3h3eb9WhFlS0fHnCNojDD6Cf5LNIu/Iu/ruJIu7n4y22xGZjkIN85tJyHVui
         /tis5jBn8RBKEHth+/X012sBgCgm9QK2T0996mTvxfZT8nMzt3zuEOxpEw48yLrdhB+P
         VhRkSS69a3aqwqhKeyDFrxAHrfDCaUI6/Enkt238N8KUfo8V2PwbBCYHvSdTXALEq2Ek
         MCCA==
X-Forwarded-Encrypted: i=1; AJvYcCV1fsjmN9vv9Fq6x68YjPVhjVTMXR+hpX9HijzOXDovr2UX5rRkbFTRCut2/nFKXAMQ2W//IoxKd8PB1xDSXg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwERH8vH5CVcrDqHE/sRJYWB0L51jSMh+aHdvE/XFgk0Ws8tZ23
	1gBoZLIqMIkryo1G1Rf4YfQYhcb7GdYclCdKz3VU21JgAOoVbcMK78+0G9nleTxsv4ojJEpe4RV
	kT9KYs+YNwDH+GWwDQ+LXHnIi2JKRZRgO5ZvF
X-Google-Smtp-Source: AGHT+IHcF5eFRWlqZt110Uz30CQNhxKthjlTRSddSsueRyNGudDWIFoPa9u+T+MfMoSREaLKrpMFRIaqTdFrN9C5Yew=
X-Received: by 2002:a05:6402:35c1:b0:5c2:4ad9:6d9f with SMTP id
 4fb4d7f45d1cf-5c3e953355dmr454244a12.1.1725658011403; Fri, 06 Sep 2024
 14:26:51 -0700 (PDT)
MIME-Version: 1.0
References: <20240906085739.1322676-1-cengjianeng@huaqin.corp-partner.google.com>
 <20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com>
In-Reply-To: <20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Fri, 6 Sep 2024 14:26:25 -0700
Message-ID: <CAJMQK-imYrDTuycVzQxkfbkZuHehE8uwc+qS2w=UDShETsBvEw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta Chromebook
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
Cc: angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	knoxchiou@google.com, hsinyi@google.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_142654_388780_295F76D5 
X-CRM114-Status: GOOD (  14.25  )
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

On Fri, Sep 6, 2024 at 1:57=E2=80=AFAM Jianeng Ceng
<cengjianeng@huaqin.corp-partner.google.com> wrote:
>
> Ponyta is a custom label Chromebook based on MT8186. It is a
> self-developed project of Huaqin and has no fixed OEM.
>
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
> ---
> Changes in v4:
> - PATCH 1/2: Add more info for Ponyta custom label in commit.
> - Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjia=
neng@huaqin.corp-partner.google.com/
>
> Changes in v3:
> - PATCH 1/2: Modify lable to label.
> - Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjia=
neng@huaqin.corp-partner.google.com/
>
> Chage since V2:
> - No change.
>
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 1d4bb50fcd8d..4bc1777b9ea6 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -257,6 +257,17 @@ properties:
>            - const: google,steelix-sku393218
>            - const: google,steelix
>            - const: mediatek,mt8186
> +      - description: Google Ponyta (Custom label)
> +        items:
> +          - const: google,ponyta-sku0
> +          - const: google,ponyta-sku2147483647

sku2147483647 is not available anywhere besides the factory, so you
can drop this. Same for the v4 2/2 dts patch.

> +          - const: google,ponyta
> +          - const: mediatek,mt8186
> +      - description: Google Ponyta (Custom label)
> +        items:
> +          - const: google,ponyta-sku1
> +          - const: google,ponyta
> +          - const: mediatek,mt8186
>        - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
>          items:
>            - const: google,steelix-sku196609

