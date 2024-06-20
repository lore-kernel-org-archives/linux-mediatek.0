Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C04C2BA18
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wnzPQkY7olrxeTisghk4ynlDr11qeA45cqHLGGh55Sg=; b=rwuT6rXChCWyttUtT5QHWcTlEZ
	AqoHxZQver63geoODfjjjrYQVYvMlKLm9Zrop6nNty5v8JxYtBZvhwzCGm+PWRzTRWkwKxHdKKCvg
	BAhkehxXMQMSj8eQ27Hd7KqJatVaZa+eGVvguPhL2BDe5hkqFbLOeWFBuLCkaC7KikcUsT4xlEcu+
	Yz3jWxK6GIuMcKb/It8bD8QVp+8lhKABfb8axXiKUKu8b63cJrxDs/B9v5513W+NoLjvoQGR/4/6L
	DSj4mf84QIvwp+9y2dTkEUVA8BoWdQa6XrG5Yg1nmUZmNDniVzzyQutZnZetYuQZd9HwYJJX5dGCH
	6PzEPfew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKDUV-00000004FoQ-1kY5;
	Thu, 20 Jun 2024 08:49:59 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKDUS-00000004Fn5-1RDf
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 08:49:57 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-48d9998787fso254701137.1
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 01:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1718873395; x=1719478195; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wnzPQkY7olrxeTisghk4ynlDr11qeA45cqHLGGh55Sg=;
        b=ZeGK0OfWzcutwK9IegL+tMTN2noaVo3c9MUJm7Ols/SFlxhxXkQh5IArx8OEphI6w4
         Mxc51tXEl+6IJazilDbGWTNcoewmdOiec5McrLWraB1lnaVBr9ccN0J4g7oLKidrxcFG
         ufvoINzvTWzosyyHcwDEZKYRqLxnU+uBC/gEs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718873395; x=1719478195;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wnzPQkY7olrxeTisghk4ynlDr11qeA45cqHLGGh55Sg=;
        b=KsAyYXeWFTag3vViT999xVvJXmqRpmN5nzrWXa+qKYabg7GaCsAtse/DWnjYcB5W9q
         5h5fPA1Hu/7PKXrmioFE5/k5ZYXOFFgq2V3JDa3GxEecXv8L3Q8v5K32T3mXNWCKVAke
         nlc6q3Sezloe7Q5Mk+cATG3jRVsxOgR1RCIl1+sUiUXJ4z1Vv4lsy6SbSSJgD9XcMSdD
         6BUrUskoE92TYgDFXaURMhAkcycCYb1Nek/UpYHWZOZU3IFpP3+pmIgl2hYMsUnkYGMj
         amK3lUhUYroF7KsKexD1COVFbh/Bp8V0xEzHWfdI8J/SB+XwAjbG+QjaiZ0mVWV3CMoQ
         XBCg==
X-Forwarded-Encrypted: i=1; AJvYcCWUVjp00v896+gNvHZQnd9nMGyJzivTZ0XdQ4KiJZWSyjQLTBTx1i7lrM4oSBdQw1UwR7KPyBfei6IuauHzhdpl7+nSbly6aX6C4dPtlrHeuRWa
X-Gm-Message-State: AOJu0Yxta/9jMWc8QWwM4GNbZ/FrRNHR9ygGI1CIAcsoB85F110bVPr4
	/DqpVBEp/jRnciz80dORAlGTs9YuwVY6a+9SnNIrelpk+QUjvj0FO741cYTZR+2jOPytmcOPxHo
	=
X-Google-Smtp-Source: AGHT+IH/So63cul2omfpaJUBrEyhIRI7uESlIzq6j8Sfp7xU0KnHj6Ml0tqgIi9rbPAzlgqRO23i5w==
X-Received: by 2002:a05:6102:4a4a:b0:48f:1337:fa70 with SMTP id ada2fe7eead31-48f1337fc83mr5181704137.26.1718873395131;
        Thu, 20 Jun 2024 01:49:55 -0700 (PDT)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-80d7871f3b8sm2898036241.11.2024.06.20.01.49.54
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Jun 2024 01:49:54 -0700 (PDT)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-80b8a8b06b9so149913241.2
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 01:49:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWB7rmh8mWCMP6gtQUIbvqSpaqO13p+xLj/EMz2CCcnv8SQk47yR5X8kv6RomIj+lcrzMV/k8PaFymNHyXWDLMmrddxhJVBitEoVM8BPD60HB4E
X-Received: by 2002:a05:6102:1889:b0:48d:7692:51ba with SMTP id
 ada2fe7eead31-48f1304d706mr4853217137.4.1718873393626; Thu, 20 Jun 2024
 01:49:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
From: Fei Shao <fshao@chromium.org>
Date: Thu, 20 Jun 2024 16:49:16 +0800
X-Gmail-Original-Message-ID: <CAC=S1njt1tEH-S2YYKvewRmqta468DuteZFCXKgC02vMUoiBdA@mail.gmail.com>
Message-ID: <CAC=S1njt1tEH-S2YYKvewRmqta468DuteZFCXKgC02vMUoiBdA@mail.gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: mediatek: mt8188: Fix VPPSYS0/1 node name/compatibles
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: krzk+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org, 
	robh@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, 
	jassisinghbrar@gmail.com, garmin.chang@mediatek.com, houlong.wei@mediatek.com, 
	Jason-ch.Chen@mediatek.com, amergnat@baylibre.com, Elvis.Wang@mediatek.com, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_014956_550658_ABE6A570 
X-CRM114-Status: GOOD (  15.15  )
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

On Wed, Jun 19, 2024 at 4:53=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Like VDOSYS0/1, the VPPSYS0 and VPPSYS1 are syscon nodes, as
> described by the mediatek,mmsys binding: fix the node name to
> be syscon@address and add "syscon" to the list of compatible
> strings for both VPPSYS0 and VPPSYS1.
>
> Fixes: 9461e0caac9e ("arm64: dts: Add MediaTek MT8188 dts and evaluation =
board and Makefile")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Fei Shao <fshao@chromium.org>

> ---
>  arch/arm64/boot/dts/mediatek/mt8188.dtsi | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/d=
ts/mediatek/mt8188.dtsi
> index 3b02170562ae..77c4f2d104cd 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
> @@ -1331,8 +1331,8 @@ mfgcfg: clock-controller@13fbf000 {
>                         #clock-cells =3D <1>;
>                 };
>
> -               vppsys0: clock-controller@14000000 {
> -                       compatible =3D "mediatek,mt8188-vppsys0";
> +               vppsys0: syscon@14000000 {
> +                       compatible =3D "mediatek,mt8188-vppsys0", "syscon=
";
>                         reg =3D <0 0x14000000 0 0x1000>;
>                         #clock-cells =3D <1>;
>                 };
> @@ -1349,8 +1349,8 @@ wpesys_vpp0: clock-controller@14e02000 {
>                         #clock-cells =3D <1>;
>                 };
>
> -               vppsys1: clock-controller@14f00000 {
> -                       compatible =3D "mediatek,mt8188-vppsys1";
> +               vppsys1: syscon@14f00000 {
> +                       compatible =3D "mediatek,mt8188-vppsys1", "syscon=
";
>                         reg =3D <0 0x14f00000 0 0x1000>;
>                         #clock-cells =3D <1>;
>                 };
> --
> 2.45.2
>
>

