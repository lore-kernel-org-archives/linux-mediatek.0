Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797D3C43334
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jun 2022 21:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6KPrZtCN9nzYNVTYaCEV5ks/RpK3o4yrzxyct6Xs+po=; b=OVG82sK2dZ90Lf
	BG2JwvS9y6lllmwow+scIekOmD3r6LoryYHGdOk6JDrwCm4idUIQ9BPsZc8Ex0BJcoaWs01u39Uim
	7romQw0bkVwIpjeKgSeaZrsI8747NOg8OgTJ/BxWBqSOtfQtQ37RWRLGdolihAEyn2Dlx5M1XR7zp
	slYEURh545/4q4zKB6rk1IjYsxa7aWZXFHTwSzkM2/VbkampdpacfrLl/Ufn9CcOEGafKu/ftUwn+
	g1RSrFcfeYRjLGWQEF/4F+qr9EXvSbCHYs8L59DWn5U/Vs6U90/uXy2A56KOwRqr68VxyxpFuLqg/
	0WVXdXNV79+II/t+IdGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxxpv-00FQaG-LB; Sun, 05 Jun 2022 21:31:03 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxxpt-00FQY7-3Y; Sun, 05 Jun 2022 21:31:02 +0000
Received: by mail-qk1-f175.google.com with SMTP id x65so9752431qke.2;
        Sun, 05 Jun 2022 14:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jvbIlYtTimkFNkSuvwvsn7TNxlt9v4zuD1GIswaA658=;
        b=rsVLNL9MTUu5CIi8CP7C3jmfr5pwY3jsE7fYDl6NQLEfLu5xgAAh33tHUUcOR/LZl4
         /UKXRIEVN2mcI0W+p58zm45PrW8hWscrm8UiPM3hL7G+9shWNUg2qymNsQNWV8DILzL4
         uaNbX0/Jg160toxVY/ygwydaywjcsPCRVmuVBiyElcapLOJOf1PXKAAyfrhbDbNZZh+x
         N80+UeqmIuTKUPB6Xxk/f7hzHvwa8UdYxKapRa4RtaCqsfIOelrkZlMw23KRuZBkO46L
         wKrQcqGtjlZVNCfuwuEMdu5z8tr5Q5+7nK1gpExTbe3US0rxiUsSAcz0w0C9dnN4Icjh
         TkmQ==
X-Gm-Message-State: AOAM531IHLmylteZO00sC61vJnV6fHhB5cirCBPPfL6ZG0h4glBJvLPr
	L42HmQTFHsoHbLjRxc75Nw==
X-Google-Smtp-Source: ABdhPJwFTjVuWXRjsufN/+qTiVsbFhiiHDYdgOwg1AeVs9k1uDLrqGyKvhs5aMXcvCtdU1pCv/ghog==
X-Received: by 2002:a37:8ac5:0:b0:6a6:a3e7:565 with SMTP id m188-20020a378ac5000000b006a6a3e70565mr8278256qkd.171.1654464659720;
        Sun, 05 Jun 2022 14:30:59 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:ac97:ac63:b5fd:aa9:8d74:9989])
        by smtp.gmail.com with ESMTPSA id bc8-20020a05622a1cc800b00304bc47a690sm9026031qtb.44.2022.06.05.14.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 14:30:59 -0700 (PDT)
Received: (nullmailer pid 3553606 invoked by uid 1000);
	Sun, 05 Jun 2022 21:30:56 -0000
Date: Sun, 5 Jun 2022 16:30:56 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: linux-mediatek@lists.infradead.org, linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-kernel@vger.kernel.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: input: mtk-pmic-keys: add binding for
 MT6357 PMIC
Message-ID: <20220605213056.GA3553552-robh@kernel.org>
References: <20220531124959.202787-1-fparent@baylibre.com>
 <20220531124959.202787-3-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220531124959.202787-3-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_143101_209182_D88CC0EC 
X-CRM114-Status: UNSURE (   9.57  )
X-CRM114-Notice: Please train this message.
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

On Tue, 31 May 2022 14:49:54 +0200, Fabien Parent wrote:
> Add binding documentation for the PMIC keys on MT6357.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/input/mtk-pmic-keys.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
