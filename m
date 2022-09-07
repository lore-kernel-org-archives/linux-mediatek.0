Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E26E6C54EE9
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 20:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2IFflJH99H+OmtJdbEsZW5tBYdpJ1o3T6IM/Tw43fg=; b=oj465jvONPiP3EPkSuVg1OFj2W
	9wnXfu7Rq8xdSDcHpDryMuJJYXxzGAaC4/HLx9+TOmQcM9YjrQErLAbMOALl1qoN1VAh/ifBwio2J
	d3+IDFZzmYPlMyjR8sz3PIwHtvNPU7SNrKZ9N/VkHZCZ7FjqUygDmxKMbpnx+UQbTfW8eijl+80JF
	9uqCTXpX12EE4lp1/tW7UaUsjHsJ78x+z0A9FLbJi3yFz6jeQWLCrVPu/0Cz23ZSXwh9HbqEV1dzP
	0KxFKCMW6A19RJoisSiuik86GqCoGCejd8W6gNEvEPteyf4rk+uYPmkUH09+LT0ckf7bisAI8GtMG
	i+leRV9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW1qJ-009gnI-2l; Wed, 07 Sep 2022 20:40:15 +0000
Received: from mail-ot1-f41.google.com ([209.85.210.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW1q4-009geU-I7; Wed, 07 Sep 2022 20:40:01 +0000
Received: by mail-ot1-f41.google.com with SMTP id h20-20020a056830165400b00638ac7ddba5so11055076otr.4;
        Wed, 07 Sep 2022 13:39:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=B2IFflJH99H+OmtJdbEsZW5tBYdpJ1o3T6IM/Tw43fg=;
        b=fpPaqvI37NQET8zts6Od3ej6NCUgXALgvhD9VOZyPHdrckU/WD2buh7ShrZ9H8ULo5
         j3rvLcg6OMxtWcPHMWkOd3Ru0E8TgxqYkLePnYYFW7dHyjPufLLrvCKXPXdr9dYih3+6
         TfKCDbXwp+hIAfV3b1/g4/Vt+Fp/4wTTBcoY8jNCoJU9i0ZfpS+aVMN5MeWO9AU1cPjJ
         m9QptAvWooys58Gk4KsNBJyuOeX8rCPe84wG2EBLtw23OvSa6Wi5uOVXTfc/HVPSwJ+q
         KgbdE41hZ5I8td2Fj0Ch8jumb2PnDLTxh3ucBatGv7PsUigDkNpLbS0XxEx6EWhuhN4h
         I7LQ==
X-Gm-Message-State: ACgBeo1h2tVvvlEvOAiYL2twWYMsQg7kTE6y5fGOzG2wfhQ1MjlOEsN0
	UNzcejtkrPiByECxfATbRg==
X-Google-Smtp-Source: AA6agR7Zwv+cfNRWF8LPCK6tEJYQ/3fgZgDC1mz5CxKX026LM4pO4X/fCpUoU4sFmJeQ961ACcczcw==
X-Received: by 2002:a9d:6c50:0:b0:638:9f91:9d8e with SMTP id g16-20020a9d6c50000000b006389f919d8emr2101339otq.217.1662583195614;
        Wed, 07 Sep 2022 13:39:55 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id cv3-20020a056870c68300b0010efb044e37sm8477078oab.27.2022.09.07.13.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 13:39:55 -0700 (PDT)
Received: (nullmailer pid 301983 invoked by uid 1000);
	Wed, 07 Sep 2022 20:39:54 -0000
Date: Wed, 7 Sep 2022 15:39:54 -0500
From: Rob Herring <robh@kernel.org>
To: Amjad Ouled-Ameur <aouledameur@baylibre.com>
Cc: amitk@kernel.org, Fabien Parent <fparent@baylibre.com>, rafael@kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, rui.zhang@intel.com, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, robh+dt@kernel.org, devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org, daniel.lezcano@linaro.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, matthias.bgg@gmail.com
Subject: Re: [PATCH v3 1/4] dt-bindings: thermal: mediatek: add binding
 documentation for MT8365 SoC
Message-ID: <20220907203954.GA301949-robh@kernel.org>
References: <20220901133950.115122-1-aouledameur@baylibre.com>
 <20220901133950.115122-2-aouledameur@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901133950.115122-2-aouledameur@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_134000_698045_35D22D83 
X-CRM114-Status: GOOD (  10.28  )
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

On Thu, 01 Sep 2022 15:39:47 +0200, Amjad Ouled-Ameur wrote:
> From: Fabien Parent <fparent@baylibre.com>
> 
> Add the binding documentation for the thermal support on MT8365 SoC.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> Signed-off-by: Amjad Ouled-Ameur <aouledameur@baylibre.com>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/thermal/mediatek-thermal.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

