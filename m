Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F2EC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 13:39:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qh5g/jeg4IcMVIdYOAqzKtEWeQUG7j9eLKz+CVBRSTY=; b=42qYkCq91Orrc7anOvuAoBfm9b
	D7Vh1l3KeLCu1qSuRYM8L+5+44rSUTa0hDVNDLbDVoG3mBO5fS2mMRPviboWR/qngOuaXJ+2pPh9A
	ZsvfPHUNRFV+U9VSJGRr5Ag5GLd7UpCHfHvkTCCAdYnkvDgsMZAIluGG89q/7pBjO7VcjXMoHjqsk
	NRQ5MVhOAiA09Y8q05PoxqqQ0jwxI2gLyrQIfy8TEp0bgwqTOt9p740mZqRhJ7QtZvZdNI++iZFnp
	+7mZpuss8ijYrGGv9G0JaW8vGCXdrZhiyzuR2auxPpx0KBKwPO52W3Vk1PKgAQIQmThvTZjaK9T64
	ma52y7ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og4ci-00EHF6-K2; Wed, 05 Oct 2022 13:39:44 +0000
Received: from mail-oa1-f54.google.com ([209.85.160.54])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og4cL-00EH1R-83; Wed, 05 Oct 2022 13:39:22 +0000
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-132af5e5543so5077217fac.8;
        Wed, 05 Oct 2022 06:39:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qh5g/jeg4IcMVIdYOAqzKtEWeQUG7j9eLKz+CVBRSTY=;
        b=YooAWDXVhS/prSjxEdxKW8yPlf1PeYnN+9l1G1u5GXAKJiNlSnDEcwnS95NIyF0tOR
         6YelPhX3ENqitYP3gF6d+T4MPHCzwQGT1f/cjeB/wUDXfncfxyv/B4WdknAWifnkl0m+
         +DiGaUEvpyB2vvDW/ima9wyi81OLKZzjVGaCqb9/iXk3PHrl4vXstXaJlHy6lXLBRkqR
         lrBABUWO27FxrjdfP81QgLbk1YPVs441yDSWds3vHfh2gU0gv4VTz/7Efa2v37GeAWT9
         7+rI5tRXYwmBERPhgYmWxY/PfxAj3pqUNdXDxoROcRfN89NitRMC7QDBD4+y7tnG42E+
         eL5w==
X-Gm-Message-State: ACrzQf2os7cYDerldaogGCxyQ0Xc2JpLHy25fLfOsvpM3XKyMXi7yDLX
	xY0LktniCHq4afwiVmzFHg==
X-Google-Smtp-Source: AMsMyM5C6tFxD3JDoJ5tDFss5UAJmxP132Evy2zUMEZix7Ezd7j3BSP+YJYi8vnsTcxuy2maFgcD9g==
X-Received: by 2002:a05:6870:f588:b0:131:3f4c:572c with SMTP id eh8-20020a056870f58800b001313f4c572cmr2638570oab.210.1664977160358;
        Wed, 05 Oct 2022 06:39:20 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:5fee:ea3a:4239:ad4:650a:6e66])
        by smtp.gmail.com with ESMTPSA id q123-20020a4a4b81000000b004763bad30f1sm3422743ooa.11.2022.10.05.06.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 06:39:20 -0700 (PDT)
Received: (nullmailer pid 3284822 invoked by uid 1000);
	Wed, 05 Oct 2022 13:39:18 -0000
Date: Wed, 5 Oct 2022 08:39:18 -0500
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, tinghan.shen@mediatek.com, linux@roeck-us.net, linux-mediatek@lists.infradead.org, robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com, wim@linux-watchdog.org, allen-kh.cheng@mediatek.com, krzysztof.kozlowski+dt@linaro.org, linux-watchdog@vger.kernel.org, seiya.wang@mediatek.com
Subject: Re: [PATCH 4/5] dt-bindings: watchdog: mediatek,mtk-wdt: Add
 compatible for MT6795
Message-ID: <166497715817.3284769.9012408776318065890.robh@kernel.org>
References: <20221005113517.70628-1-angelogioacchino.delregno@collabora.com>
 <20221005113517.70628-5-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005113517.70628-5-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_063921_316719_CF0D6401 
X-CRM114-Status: UNSURE (   8.61  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 05 Oct 2022 13:35:16 +0200, AngeloGioacchino Del Regno wrote:
> Add the mediatek,mt6795-wdt compatible.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

