Return-Path: <SRS0=cYlk=GP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0F6CC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 14:49:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CBEF23130
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Jan 2021 14:49:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CBEF23130
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cwOCzczXjAdPh3KzYnijAESw13sFkFIflDJTnoM4dAo=; b=zVdK+UbMb/TBzSQnJeDEht3d7
	b+nKppxeX2N0gLUoQCFw3sQHSYujq1zwzEhcHXYh2Y0Cp/Jj81kEwE+L1TgdluXYcmMyqHFBYK7hE
	n5pmGd3+T1Ulznty/qyD9T8AcH7gFgSuC+PBw7GzHl7ZqD4OnLg3sVbXcFSq0x3Phjba1VCJNKjcY
	YPY/Y/85pK2wbQ1dsjuZs5LiRGmLOIJj7wkkpsRaR930lAom9bMWMNpIYf/8HuSAndavyIqzgEEK7
	yl3SlZyL3g4V9K7IKuRVSr7TZGRU5a8NLIY3sS0ZdGDiiDln1mVukDXiOylnJWsfUZnCj7mmtZIhW
	dGs2D6hVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzKyh-0007uI-O4; Tue, 12 Jan 2021 14:48:59 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzKyX-0007ni-Vy; Tue, 12 Jan 2021 14:48:50 +0000
Received: by mail-ot1-f48.google.com with SMTP id d8so2467038otq.6;
 Tue, 12 Jan 2021 06:48:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=R65jgJ9ZXA6KLRUaL143AJzdpFEYKDU6ZEDoHXUUWuk=;
 b=f2ygYb7ULQJ+/CrnYwOmBm+rJd3e+NCaaoOlx2boa1V8wuGXPrmQeCEMxT10+37qIU
 sHOwltDjdol2SU5mPMEuXGoZcwij6elHPHwbEq9tHUJa8KAqIp7MRKnQJgBone5UFDAW
 ENBphT5AcsKEs3XtGaM/U59EMpxstk3meuEeT6tGezh5oIP0Jq4cLwk8RyiVt43PTAry
 LgKjwYNZOyh0a10cT3n8TOHVyFdU/hEFNhgiM2kGUrjsDFvYASoSW8bNeDD3DSC8gvZw
 FY0zn2BTFUW2SVZRRyxFO/woy23kiUhJcGRaZehSR3oTOxgpPT2tGQ8SHKVULtxW9pPv
 ES4g==
X-Gm-Message-State: AOAM532RZgdzZy4rxFhoz3opC0sOmFzGekOdL79b4y/e8QTvttY+d6ZN
 EobrZBDVlIQPDLLmj1tzww==
X-Google-Smtp-Source: ABdhPJz47DeFCqd1oQBxWpdz0vtjnHrb9OMZhE+QbK/kAhF8YobPG+Mkx0lWOxRC/NuYKWzUBCBJpQ==
X-Received: by 2002:a9d:71cf:: with SMTP id z15mr2992431otj.259.1610462923140; 
 Tue, 12 Jan 2021 06:48:43 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id n13sm654071otk.58.2021.01.12.06.48.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 06:48:42 -0800 (PST)
Received: (nullmailer pid 329242 invoked by uid 1000);
 Tue, 12 Jan 2021 14:48:41 -0000
Date: Tue, 12 Jan 2021 08:48:41 -0600
From: Rob Herring <robh@kernel.org>
To: Roger Lu <roger.lu@mediatek.com>
Subject: Re: [PATCH v11 5/7] dt-bindings: soc: mediatek: add mt8192 svs
 dt-bindings
Message-ID: <20210112144841.GA327919@robh.at.kernel.org>
References: <20210107024356.583-1-roger.lu@mediatek.com>
 <20210107024356.583-6-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210107024356.583-6-roger.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210112_094850_073825_729B8B07 
X-CRM114-Status: GOOD (  14.91  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, Nicolas Boichat <drinkcat@google.com>,
 Angus Lin <Angus.Lin@mediatek.com>, Kevin Hilman <khilman@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, HenryC Chen <HenryC.Chen@mediatek.com>,
 YT Lee <yt.lee@mediatek.com>, Stephen Boyd <sboyd@kernel.org>,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Charles Yang <Charles.Yang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Nishanth Menon <nm@ti.com>,
 Fan Chen <fan.chen@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jan 07, 2021 at 10:43:54AM +0800, Roger Lu wrote:
> Signed-off-by: Roger Lu <roger.lu@mediatek.com>
> ---
>  .../devicetree/bindings/soc/mediatek/mtk-svs.yaml        | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> index bb8c345a0c0a..2e61b07921aa 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> +++ b/Documentation/devicetree/bindings/soc/mediatek/mtk-svs.yaml
> @@ -22,6 +22,7 @@ properties:
>    compatible:
>      enum:
>        - mediatek,mt8183-svs
> +      - mediatek,mt8192-svs
>  
>    reg:
>      description: Address range of the MTK SVS controller.
> @@ -47,6 +48,14 @@ properties:
>        - const: svs-calibration-data
>        - const: t-calibration-data
>  
> +  resets:
> +    description:
> +      svs reset control.

How many?

And you can drop the description given there's only 1.

> +
> +  reset-names:
> +    items:
> +      - const: svs_rst
> +
>  required:
>    - compatible
>    - reg
> -- 
> 2.18.0
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
