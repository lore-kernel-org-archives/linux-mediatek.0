Return-Path: <SRS0=WTSR=MS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 612A6C4338F
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 09:20:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1D21760F02
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Jul 2021 09:20:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1D21760F02
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4oBl86LhIul9VklAlfCsumjcD5buoXW5jVuZhvkN2Cs=; b=hM5e5qF/1mAAGE
	36Nlk2wqWoe3C9/T37g0HgJQc/rxTcngiH2rDFfR5fQvYwWtcYtV81uWVJNKECuZ5Odg7qdXjUZSE
	AwSbe2lX2+c3yyegQDhxKoAo47KMy2vO0vHpxqecTrZn3NgB0kYOWlbIwqjipP6rdggdxSQIks1RZ
	8TDNKVqz5LlxuZ94k10d9NPvxhxjSWxumwoAkDCzPjyHvDMJDjK0zZ0Rmaj6/R2x7bEVTmFgKEchl
	7BkvrWP6qpRmibSKpKkOrOs+TjofuxKgxMF6KdPcP0Bk6OdOgkQSztMIFw3KiCHKYW2mOpyMPVkJb
	AiiA9t8DWgESJ7qMtRNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m7wmd-00AQV3-PU; Mon, 26 Jul 2021 09:20:23 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m7wmb-00AQTe-0i
 for linux-mediatek@lists.infradead.org; Mon, 26 Jul 2021 09:20:22 +0000
Received: by mail-lf1-x134.google.com with SMTP id m13so14194456lfg.13
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 02:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=UyAhVW8SUVdW2juHf4NXSIfTyUpw2d4E9HcLC6UlbsU=;
 b=PFhaUyyioW4u4jvnVZfDpQc+0BSgWt8O5W+h2/JkXloGBxxa1lz6qvX+LcbuUXQc2N
 Z/sV52rf44gz4YnpyNlA3a5x50wV6yKSQCx7U00BnemtwgGM+ascTy/4/9Bei7pKU0i6
 ejhLDXqu6p6hD3mYKZgz79DXesDgefxzliTwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=UyAhVW8SUVdW2juHf4NXSIfTyUpw2d4E9HcLC6UlbsU=;
 b=FCl3x1oSgDnalGJxArUEXdBsqye+JLqj06V24eQ/rskyMpvW8tYoxMYe6yLsEFQjuJ
 KThoxICzCdTcQjiJ3RHdLm3uLyiNOf9JC3RBGNb6FaG+KROy/nrGKj7VKkxgV1rWNL7T
 uu1npc9xm0IaTT3aGs8fjvOzGhHYRwmUtMgfehCt1G3X+iNY97U0m8A1HXdiu3dlddRY
 0+5s6hVcmtvqCtPZ1MWM800+8aK4rYA331XH+BwO0x5S33s4yZklXSGcuayD4iazE18e
 r5fVmqLWy4FoqY0z9I1d84Bw4hB+4X4GwtJRHg0jOBxTKHCfEM+C4Efz+aOd22fIA1tu
 whDQ==
X-Gm-Message-State: AOAM530W73KMy0q+LXwdgx6IU8Q3ghCLZ6pIsWTmh3nGmDaRVlxH/IBe
 3lXd9Z4Gq32JIYWhQ8rwPGA2Yc671sCYXITASm0lnQ==
X-Google-Smtp-Source: ABdhPJxZeDoaO4+lBiCkXyq/2Admv1+kefRfVNjKKrFIMZn357CPp9SKVLhT5mJJhxTofCy8T41M60sD5j6u/8BBBOQ=
X-Received: by 2002:ac2:48b8:: with SMTP id u24mr12319860lfg.587.1627291219448; 
 Mon, 26 Jul 2021 02:20:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210726071439.14248-1-sam.shih@mediatek.com>
 <20210726071439.14248-2-sam.shih@mediatek.com>
In-Reply-To: <20210726071439.14248-2-sam.shih@mediatek.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 26 Jul 2021 17:20:08 +0800
Message-ID: <CAGXv+5GeEBAkXKfA=S7XGOLYtCRihP5ov6kSiw+eevPAi74GAQ@mail.gmail.com>
Subject: Re: [PATCH 01/12] dt-bindings: clock: mediatek: document clk bindings
 for mediatek mt7986 SoC
To: Sam Shih <sam.shih@mediatek.com>
Cc: Rob Herring <robh+dt@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 Matt Mackall <mpm@selenic.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Hsin-Yi Wang <hsinyi@chromium.org>, 
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, 
 Seiya Wang <seiya.wang@mediatek.com>,
 Devicetree List <devicetree@vger.kernel.org>, 
 LKML <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-gpio@vger.kernel.org, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>, linux-crypto@vger.kernel.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-clk@vger.kernel.org, John Crispin <john@phrozen.org>, 
 Ryder Lee <Ryder.Lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_022021_123243_54E89AE9 
X-CRM114-Status: GOOD (  22.30  )
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

On Mon, Jul 26, 2021 at 3:17 PM Sam Shih <sam.shih@mediatek.com> wrote:
>
> This patch adds the binding documentation for topckgen, apmixedsys,
> infracfg, infracfg_ao, and ethernet subsystem clocks.
>
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt    | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,ethsys.txt        | 1 +
>  .../devicetree/bindings/arm/mediatek/mediatek,infracfg.txt      | 2 ++
>  .../devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt      | 2 ++
>  .../devicetree/bindings/arm/mediatek/mediatek,topckgen.txt      | 1 +
>  5 files changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> index ea827e8763de..3fa755866528 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,apmixedsys.txt
> @@ -14,6 +14,7 @@ Required Properties:
>         - "mediatek,mt7622-apmixedsys"
>         - "mediatek,mt7623-apmixedsys", "mediatek,mt2701-apmixedsys"
>         - "mediatek,mt7629-apmixedsys"
> +       - "mediatek,mt7986-apmixedsys"
>         - "mediatek,mt8135-apmixedsys"
>         - "mediatek,mt8167-apmixedsys", "syscon"
>         - "mediatek,mt8173-apmixedsys"
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
> index 6b7e8067e7aa..0502db73686b 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,ethsys.txt
> @@ -10,6 +10,7 @@ Required Properties:
>         - "mediatek,mt7622-ethsys", "syscon"
>         - "mediatek,mt7623-ethsys", "mediatek,mt2701-ethsys", "syscon"
>         - "mediatek,mt7629-ethsys", "syscon"
> +       - "mediatek,mt7986-ethsys", "syscon"
>  - #clock-cells: Must be 1
>  - #reset-cells: Must be 1
>
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
> index eb3523c7a7be..5f68c30162bf 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,infracfg.txt
> @@ -15,6 +15,8 @@ Required Properties:
>         - "mediatek,mt7622-infracfg", "syscon"
>         - "mediatek,mt7623-infracfg", "mediatek,mt2701-infracfg", "syscon"
>         - "mediatek,mt7629-infracfg", "syscon"
> +       - "mediatek,mt7986-infracfg", "syscon"
> +       - "mediatek,mt7986-infracfg_ao", "syscon"
>         - "mediatek,mt8135-infracfg", "syscon"
>         - "mediatek,mt8167-infracfg", "syscon"
>         - "mediatek,mt8173-infracfg", "syscon"
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> index 30cb645c0e54..0e1184392941 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,sgmiisys.txt
> @@ -8,6 +8,8 @@ Required Properties:
>  - compatible: Should be:
>         - "mediatek,mt7622-sgmiisys", "syscon"
>         - "mediatek,mt7629-sgmiisys", "syscon"
> +       - "mediatek,mt7986-sgmiisys", "mediatek,mt7986-sgmiisys_0", "syscon"
> +       - "mediatek,mt7986-sgmiisys", "mediatek,mt7986-sgmiisys_1", "syscon"

The order should be: most specific compatible string first, followed by
fallbacks.

Furthermore, based on the driver patch and the fact that they share the
same compatible string, it seems you shouldn't need to have two compatible
strings for two identical hardware blocks. The need for separate entries
to have different clock names is an implementation detail. Please consider
using and supporting clock-output-names.

Also, please check out the MT8195 clock driver series [1]. I'm guessing
a lot of the comments apply to this one as well.

Regards
ChenYu

[1] https://lore.kernel.org/linux-mediatek/20210616224743.5109-1-chun-jie.chen@mediatek.com/T/#t


>  - #clock-cells: Must be 1
>
>  The SGMIISYS controller uses the common clk binding from
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
> index 5ce7578cf274..b82422bb717f 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,topckgen.txt
> @@ -14,6 +14,7 @@ Required Properties:
>         - "mediatek,mt7622-topckgen"
>         - "mediatek,mt7623-topckgen", "mediatek,mt2701-topckgen"
>         - "mediatek,mt7629-topckgen"
> +       - "mediatek,mt7986-topckgen", "syscon"
>         - "mediatek,mt8135-topckgen"
>         - "mediatek,mt8167-topckgen", "syscon"
>         - "mediatek,mt8173-topckgen"
> --
> 2.29.2
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
