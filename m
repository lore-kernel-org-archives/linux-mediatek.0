Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 209F1C25B50
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 21:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=8daWvhav3exVg13KsQMucbRN9RZn7I3X/4TrQdWi0uU=; b=1m/w9eMQY2eiJe
	3zKnBqsLyt7hoPavDHvVVVfgZVCX2S6/RAUWtSDxhvHzZKQIlMUV/bxmW0Wo1RIhgrX1TcpJ7hdLO
	/zELs100HLHXaEwZ/odyEJK3/VfJwqvRIz33ghITpXW7sMNbgM+pLP0I9PcqGLXwVHEpt+GOYdzgv
	pzvOIcioylL4AnqFHpiZdjxNXXSBSDdIm6NjMtVDQdJWsJdFlcz1N5hiyEZBM3urqnXNIUf2HcKgt
	zNjHQpMpvZFIVe94N71aUO+gVsaQqwxSv9JJULyHom4yBfSix17AInFS8TJeihjvFCNRyIJ1bTppW
	+jQPBbtTcJ3q6Ud0gg8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4Hz-001UwW-FL; Mon, 23 Jan 2023 21:23:39 +0000
Received: from mail-oo1-f51.google.com ([209.85.161.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pK4Hp-001Utg-1G; Mon, 23 Jan 2023 21:23:30 +0000
Received: by mail-oo1-f51.google.com with SMTP id b10-20020a4a9fca000000b004e6f734c6b4so2332620oom.9;
        Mon, 23 Jan 2023 13:23:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8daWvhav3exVg13KsQMucbRN9RZn7I3X/4TrQdWi0uU=;
        b=yrQlzLgZOrTlPwvMxOu/wVCy2AgPgLGhxJSf51O9fPJa9gQaancHmJL+0QQhiyMu3j
         lnpsXfBORGB6oqusSGo4Ejp4zv4koJeFfWCQXRGkn9n/iPaNZ6C2R0C3qFrJQLUXdzVH
         AhNIs6juFoB3vLGMA0piv8Wa/foZUEQgYpgQ6Kz3g7ildiEMVsTX5I9AOF1HCL4O6rXD
         1Zh3NHt4aVqfQOz9Azu0tS2QrjkmjzdMOQUvp/nDInrn87Xuzp8wREQwVWCyefEbYVHe
         qaTRk7OUs6KIdOWBlOpZAjT5m5FZLEuG9bwg1hhAnts2On5cy2BG/8NwcxniPFmAzWAi
         DiGQ==
X-Gm-Message-State: AFqh2kpxk0qH11GrvPP8QzGyApKqGGFLk5cgoVBElNdlhGcrCC7U8cFg
	fmHhU8nuAp9s44I9A5BcTw==
X-Google-Smtp-Source: AMrXdXvz7wXg7GEnoByWzAIaEXjJ/g1Rl1Ua/Jfxd+Wd1LTEufTC97JjA23GJCSB5bHJ4a/7wSBkpA==
X-Received: by 2002:a4a:370c:0:b0:4f2:a3c:e285 with SMTP id r12-20020a4a370c000000b004f20a3ce285mr13151556oor.4.1674509006545;
        Mon, 23 Jan 2023 13:23:26 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p9-20020a4ad449000000b004fb2935d0e7sm47610oos.36.2023.01.23.13.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 13:23:26 -0800 (PST)
Received: (nullmailer pid 2663747 invoked by uid 1000);
	Mon, 23 Jan 2023 21:23:25 -0000
Date: Mon, 23 Jan 2023 15:23:25 -0600
From: Rob Herring <robh@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, Fabien Parent <fparent@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-mediatek@lists.infradead.org, Miles Chen <miles.chen@mediatek.com>, Jianhui Zhao <zhaojh329@gmail.com>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Johnson Wang <johnson.wang@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Edward-JW Yang <edward-jw.yang@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: add some compatible strings for
 MT7981
Message-ID: <167450900448.2663686.2248170035264417570.robh@kernel.org>
References: <cover.1674137304.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_132329_093552_A45DC674 
X-CRM114-Status: GOOD (  11.35  )
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


On Thu, 19 Jan 2023 14:11:35 +0000, Daniel Golle wrote:
> Add compatible strings for MT7981 to existing binding documenation
> at mediatek,apmixedsys.yaml and mediatek,topckgen.yaml.
> 
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> ---
>  Documentation/devicetree/bindings/clock/mediatek,apmixedsys.yaml | 1 +
>  Documentation/devicetree/bindings/clock/mediatek,topckgen.yaml   | 1 +
>  2 files changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

