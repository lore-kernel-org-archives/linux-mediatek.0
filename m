Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CADDC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 Jun 2022 10:02:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtDx/4MtrxYt8hYrk4oMF8kIZqBnmvODq04HfBb169o=; b=LBxFnuIRy+vJfdbcGjH0beS64c
	A4q9yPnkE7g9uKwTRI02G1sbfrye9nWoHBV690M6HLXIYDGMXrtbyMYJK5IfevAzS6CRzPVOICR4E
	YptderI/TPCg5itH/AS9YPSL6yH2XzfiUe/jFeLx6NE1sZpUiogvm+/mwT2rqdpWNYDh98hPlp0eR
	YZxk8lx9mk/I45TnV1YYCPJ+OLPk+E4vYtnzKsbCqXlew5T8RyCMZeKE/y0JVj82s/mCeE+fBU7T1
	HcYmztHEiCSPFlak7VoD1cEm1iNWJ9OehT/vZN0GGRc7gvBRYTgu1rswU/jEe5Oui8LZ8sCJsMWv9
	6oDx5XaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4g8z-001bsA-9e; Fri, 24 Jun 2022 10:02:29 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4g8t-001blo-J3
	for linux-mediatek@lists.infradead.org; Fri, 24 Jun 2022 10:02:27 +0000
Received: by mail-ej1-x62f.google.com with SMTP id t5so3707489eje.1
        for <linux-mediatek@lists.infradead.org>; Fri, 24 Jun 2022 03:02:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=GtDx/4MtrxYt8hYrk4oMF8kIZqBnmvODq04HfBb169o=;
        b=EPz+7sJNDH++V1yMWLrc5mRkOsO+NqZvLBrjqveEPoRRpCThZZ41cOoejZek82+QIG
         28oBv6aGSlevvdxpkzAkvGzcY201imYWhlJNA5NPN/m/8oVaPWKug7D1CfKK5p14lz55
         QffaEfY+Y4qMXPxB1unyi1u8N9j+/oWBz86a0NptnrYcqC0/eNqg04+K8wUCbeMzYdbd
         GKmEV6EeeXdzPfmU6cAv14I0z3c8CIK8QUt7x3COZTbu11U1q0p/q8r+5Xmrpth5PUnh
         VVO2uDmWpLrqkcL+bp5CZJkgvJYl9JM6P22l9/2AL9SIT3Mzf3uyf3FQsdeWRsijrCKz
         kLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=GtDx/4MtrxYt8hYrk4oMF8kIZqBnmvODq04HfBb169o=;
        b=zGna4Mmutr+Ydx4gh2Lp+epHVa0qgErpYaTW6Dn3oZuCbiRXFyBlugNtLuyepydL9j
         lwrym6z6QCCwpZmd+ipzFpdqCrdV9aDsC8bFZZ0Zlcv3PiCdjB8f/z14XNggNwcqtqwj
         4sVXU+idK3AdEMr0VlhfLkIYCjexCYs2u/B1QOE4k8MWcGkt+S9KFq4XS9akbwCgglE7
         htmLKUEtBWp1vQhRZGrIyXawVeGJNIed25g2A33qUoafGieNU9hEsTaJtrupf9hCnhMj
         uzPUHFB2ukGE3vRtXXoZz8me3m36i9up9G4wGYR2omHOxd+hPuF/jHEBhkXJ1yuKhV0q
         6wtg==
X-Gm-Message-State: AJIora8nqPH/nIJ8NHNbHeRHqitr5ZC+C9h8oyPduUKbe+vXxzYQ0092
	j2oyFhq938WUASFUJXBI50wsNg==
X-Google-Smtp-Source: AGRyM1sefjpiKJ7ux0kcypv9fmdJCP+pCzqZ3OVhjn3YCPERtUsWGvmVzsziW2GqNk3WP0rJOKi51A==
X-Received: by 2002:a17:906:5047:b0:710:456a:695e with SMTP id e7-20020a170906504700b00710456a695emr12397953ejk.433.1656064940041;
        Fri, 24 Jun 2022 03:02:20 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id uz12-20020a170907118c00b00711aed17047sm850487ejb.28.2022.06.24.03.02.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jun 2022 03:02:18 -0700 (PDT)
Message-ID: <5a19a73a-e81a-8f7e-e26c-6c1d8e8331a4@linaro.org>
Date: Fri, 24 Jun 2022 12:02:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2] dt-bindings: mmc: mtk-sd: Set clocks based on
 compatible
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Ulf Hansson <ulf.hansson@linaro.org>
Cc: kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Wenbin Mei <wenbin.mei@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org
References: <20220623154038.771874-1-nfraprado@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220623154038.771874-1-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_030223_712722_B288E1D4 
X-CRM114-Status: GOOD (  13.33  )
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

On 23/06/2022 17:40, Nícolas F. R. A. Prado wrote:
> The binding was describing a single clock list for all platforms, but
> that's not really suitable: mt2712 requires an extra 'bus_clk' on some
> of its controllers, while mt8192 requires four different extra clocks.
> The rest of the platforms can share the same 3 clocks, with the third
> being optional as it's not present on all platforms.
> 
> Move the clock definitions inside if blocks that match on the
> compatibles. In practice this gets rid of dtbs_check warnings on mt8192,
> since the 'bus_clk' clock from mt2712 is no longer expected on this
> platform.

And now we see that you introduce incompatible change and ABI break.
This should not be combined with that patch but instead separate patch
explaining why ABI break is ok.

Best regards,
Krzysztof

