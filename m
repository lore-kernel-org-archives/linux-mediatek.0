Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECE65C43334
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Jun 2022 21:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dfex5zkXKkeooxQN/ie1mbSy6D5VlmZJJ+QaTGQJ2d8=; b=H3miBywWvDWrxV
	57KouSemecbS4CLSIl1GpQKkPuPobDoG2XwNXo0YCqRKWhQzNcB+KnHbgn5TzutmPDHFh0hohjHtO
	jFI98ulQ7Hpjm2I2nBZHTkWwyjEg/KMYfWvki55g6fwQ1Pk02x5gMl4Pv6iEq+69bj+8PCP87L+sb
	ayN/nDxlU4bwcRTzIG+5+VIhdpx04VhHRNZZMXzwWnJdGNFUtVzAyL7VI5dxB3Dh+9DeH/Hee+k2z
	xRFWFfSa6eDqOYCsucwoeHF8u+ptIQg/Q3iHf+/yp4Z8FeUxkHflcNs2fpIoorWhFwf42bwyNYEut
	dKUq8nudJOWvizPf+dEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwVmo-000SnJ-6h; Wed, 01 Jun 2022 21:21:50 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwVmd-000Sio-74; Wed, 01 Jun 2022 21:21:40 +0000
Received: by mail-ot1-f49.google.com with SMTP id l9-20020a056830268900b006054381dd35so2140498otu.4;
        Wed, 01 Jun 2022 14:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mD6A518pLN0OGYxwYdiHrx5ULjL15DVCTZFPIr11wP4=;
        b=s24HnOVm1qy0VKuKsc16pQd60oYB26WgC8h5IUuVM8t1NlRxY68Z6VqvVAIT4/y4j9
         v6eBGuwpk8VdhkXMrO+Z9Q5EanH2ylzdcTlWFJdnJbBzl+OoJxoS+jUiS1inpaRTbv1U
         mL2FEZZ2jEAx11zcOEVdzjeaoluSf8YRaTVGMt+g7UbiEDbrmO8VWXtjbMpq0ZT9sGF2
         DH33HdZACf6MmTMiIabCnPOoDFnAe2OBW6UwhH+RR6EhG056fxZv3njbyZfgrAOWuAF1
         NOHqi77HYovCnciXCOzUOdw9snGskVtW0HbAk0uj28EFMqFKoRRzA0qhOXcV4O9LIMhE
         U/Rw==
X-Gm-Message-State: AOAM5306wOTqraALZXbipUABQTR2upIGM7Qbbk3BmWzx7VWvePTzEcZU
	QbksJpLQorzFfWqc9IxyJg==
X-Google-Smtp-Source: ABdhPJzPxKIFoS6v7zdVdtYI6RyvPqTBWA/y3iFw05esM5zHDiEwwCh3hh1x0yu+5RBF39jjcsqxzg==
X-Received: by 2002:a9d:69d7:0:b0:60b:cee:4cd0 with SMTP id v23-20020a9d69d7000000b0060b0cee4cd0mr751041oto.145.1654118497642;
        Wed, 01 Jun 2022 14:21:37 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id c10-20020a056830314a00b0060b0b638583sm1354298ots.13.2022.06.01.14.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 14:21:37 -0700 (PDT)
Received: (nullmailer pid 478620 invoked by uid 1000);
	Wed, 01 Jun 2022 21:21:36 -0000
Date: Wed, 1 Jun 2022 16:21:36 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: johnson.wang@mediatek.com, linux-kernel@vger.kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, zhiyong.tao@mediatek.com, linux-mediatek@lists.infradead.org, henryc.chen@mediatek.com, devicetree@vger.kernel.org, lee.jones@linaro.org
Subject: Re: [PATCH 6/7] dt-bindings: mediatek: pwrap: Add a compatible for
 MT6795 Helio X10
Message-ID: <20220601212136.GA478570-robh@kernel.org>
References: <20220520124039.228314-1-angelogioacchino.delregno@collabora.com>
 <20220520124039.228314-7-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220520124039.228314-7-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_142139_347019_E743EF25 
X-CRM114-Status: UNSURE (   9.33  )
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

On Fri, 20 May 2022 14:40:38 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible for the MT6765 Helio X10 SoC's PMIC Wrapper.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
