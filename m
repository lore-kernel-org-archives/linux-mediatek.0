Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37E98C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Dec 2021 09:25:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NCPGrYaqvTPweRnqM1t0TaNRnRjtsCNh2NdD042PQQ=; b=U3mHXuUr8z/8af
	1MdRxzzTOSJ3+IHnI5O15brTHXHPOYpzv8T+5RgoA0yW9tHfqCDp5Tcn2O4fLhCSOSvjl0x+rWfVZ
	5v8saADUyuogtTC5a8pwACcpoKl67BLclGIZx1aUdvOx4DtW9qmETXqm/UtuEcjDUKEDVqqJsnYej
	T5NaX2E0Prt4Peunjr6oQLEg25Ldirb7vhUMX0ZW0Xk8QtrM+11IxZyyaiGhTi+qdgTRJdC77qOCD
	R0EmQd9Xk+mIoO6VANbGbeJ0LiA1zq6eL5jwroVk5CEEAvCap03IcoSpEDrLnfmUq+nmorSgPhYqK
	cPhc68R0ENRe2YLo/tMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mxn17-004RK1-7k; Thu, 16 Dec 2021 09:25:37 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mxmoS-004LIO-KQ; Thu, 16 Dec 2021 09:12:34 +0000
Received: by mail-wr1-x429.google.com with SMTP id t26so6582054wrb.4;
 Thu, 16 Dec 2021 01:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=x4k1zI3iK8DOJhhJ2DmMVfZXMtCAnERs0JGKLaP5zks=;
 b=g7B5mwruW7SaPK3YRN0vN1C4bg9zqB9Ywk1YaN1ZHC+C4M2xe5bcvX2h8HaZaIZhBp
 LGEjbMupndL+W7AnOtC1K0bnqTtZ38dkmRj5vaDJFyXIReAGosUh9/t5aTkWy+6PW8ep
 cQeJy5kTpMdVr2MsYex0AyAE3xFP+iB5oKMD7o8PmA/aL1IDyW1QbOJ5pqNYJgSJm8av
 t0DrQTB/p9rAC9X1jshQ/krBxgAuM2oI//I7Qui5F/KmTWU2cVWKil0zoXLZOBvudhda
 CzlVPhoiA6s0+R8K1GX4Jql16UYlDvKvo/RXW6kLGiJiN335cO1bEKcPSVItYxLx5cxO
 W0MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=x4k1zI3iK8DOJhhJ2DmMVfZXMtCAnERs0JGKLaP5zks=;
 b=a8LSRrkReQHRrwt0At2p5DuIBi8W1p7x9EQ4z3GGBTRhZNskH1G/2q1dUX2t1bV559
 72sBVyzcE7Z6yIM9uPxCc9ikJE17Xg7hHEcvICKJvIeqkCUacETElsmpLKLoIcgzK4q0
 A4mpu4/DRF38jsaG01oWr6R+6xt8wG85MZ3MZW+YT9C/Mo1c/wXUETzKXfRLxKDiI7nW
 TliGGl/o+z/LCRo/iJNXCRui0auKNLTsR2zNaeRZTHqKxkKf3Z+3m0mYV3OI4UORDzph
 IfgUZ97JtBwnpngs2z5+C/LtD2DoXLTn34dCnGbFDvMxOuLlRBNVho+3mms0n/gYrpGe
 GvgQ==
X-Gm-Message-State: AOAM532wBxoyoOI9xzzlr8mDaGZHG/WaIQn1IstNWaOrJU4V3HTCR+Ew
 WSZNa0ZRyAle1+D7wSoxCJU=
X-Google-Smtp-Source: ABdhPJyJAX5eTdhQft6rbyMCvlaLfw/tuoiMzMaSKhEPruM32RpV2ndbiE23NWpVs+J19vPeJ/k2+A==
X-Received: by 2002:adf:c146:: with SMTP id w6mr8274090wre.541.1639645950098; 
 Thu, 16 Dec 2021 01:12:30 -0800 (PST)
Received: from [192.168.0.18] (81.172.62.207.dyn.user.ono.com. [81.172.62.207])
 by smtp.gmail.com with ESMTPSA id l6sm4444640wmg.3.2021.12.16.01.12.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Dec 2021 01:12:29 -0800 (PST)
Message-ID: <5c9d87cd-2d11-6272-ee40-e0c3aad15e1e@gmail.com>
Date: Wed, 15 Dec 2021 20:31:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v8 1/2] dt-bindings: arm64: dts: mediatek: Add mt7986
 series
Content-Language: en-US
To: Sam Shih <sam.shih@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Seiya Wang <seiya.wang@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>
References: <20211122123222.8016-1-sam.shih@mediatek.com>
 <20211122123222.8016-2-sam.shih@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20211122123222.8016-2-sam.shih@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211216_011232_754373_24BF8048 
X-CRM114-Status: GOOD (  16.23  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 22/11/2021 13:32, Sam Shih wrote:
> MT7986 series is Mediatek's new 4-core SoC, which is mainly
> for wifi-router application. The difference between mt7986a and mt7986b
> is that some pins do not exist on mt7986b.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Acked-by: Rob Herring <robh@kernel.org>
> 

Applied to v5.16-next/dts64

> ---
> v6: separate basic part into a single patch series
> 
> Original thread:
> https://lore.kernel.org/all/315d7823aa108c909a3d36464fe54763b76ab2f4.camel@mediatek.com/
> 
> v3: changed 'MT7986' to 'MT7986 series' in the commit message
> v2: added an Acked-by tag
> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 80a05f6fee85..a9a778269684 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -76,6 +76,14 @@ properties:
>             - enum:
>                 - mediatek,mt7629-rfb
>             - const: mediatek,mt7629
> +      - items:
> +          - enum:
> +              - mediatek,mt7986a-rfb
> +          - const: mediatek,mt7986a
> +      - items:
> +          - enum:
> +              - mediatek,mt7986b-rfb
> +          - const: mediatek,mt7986b
>         - items:
>             - enum:
>                 - mediatek,mt8127-moose
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
