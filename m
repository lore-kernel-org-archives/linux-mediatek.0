Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EE78C00144
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jul 2022 23:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TRZasCiIk8CsLlgIAb+6ZyNOeA1LajNukWxssJQnQMI=; b=XERjFmj+vTN/NF3Z+GB+az9zT0
	pLnC0aOVk2902AyVo3HADO0ZyA6NgnP2KIl4GQjIpfsftiUScuAHUZX7ucrlBMwP8MpbHUe1lmJCZ
	gMQzEXEhpn0se7tXXIR6voEFaL4PeW/H9E1uerwPhWPk2hj02BVUMr4iXrgcCMzjTRzZRd8/NBYe6
	OJd/4MTADDKlUvyogJ8hVlICWRyBCGD2WzhmEDzNizNA7FvrbxoXhhHWpl1tSYjPjnZa8NSFtsU0p
	n0k99ACLciktAqV/kEoREmiOOZSzri6lzR/aiJnnGZ+np94kxX0qJDDxQaSj4XwhbH/ebd47CqPbb
	kT5iiQew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHZ3A-00DdCz-Sc; Fri, 29 Jul 2022 23:05:44 +0000
Received: from mail-io1-f48.google.com ([209.85.166.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHZ34-00Dd64-Uw; Fri, 29 Jul 2022 23:05:43 +0000
Received: by mail-io1-f48.google.com with SMTP id y197so4643707iof.12;
        Fri, 29 Jul 2022 16:05:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=TRZasCiIk8CsLlgIAb+6ZyNOeA1LajNukWxssJQnQMI=;
        b=h+jN8yy40jJ3XyCadHN/CDUP39dvoiCxLSj6u3LOVTReNMx8kde896vQp9KVS3kJHp
         j97jU5a1n+qVK1W/etpKyodHonuW+PLo/FVF0GFGwG/nYJm/+69wT0KVVAAiOeMy6nSX
         x5Xm0uK3yEle6K1YiVInj1sdXXdwIOV6mFHyRO1+1IwH/KUeo26huTw3bWXxPipD+Kft
         39Io5XUG6c2mt7I+0IgKNRPBnsOKbaqiGkVf8C/K4ZRUECvZK/mHAoIgd2x5VxzErqqk
         jSgQkfS12IarAG4AOODCYRNRLXOegTD0vOkbXFffrm/iJ+1Hw0n4U1iuKAu+a62iotlG
         2rbQ==
X-Gm-Message-State: AJIora+pCR54UlzNSgLQcfPo8bOeZgZSzCIBwe0XGIkH301NJ04AdaHi
	3AkpWvBnPkAVWac0oaj1fQ==
X-Google-Smtp-Source: AGRyM1vQFs5en9Ysf3xLEGudHJlBxh1XHCFXGxAEMJODRUCM/yVeWxBD9YoCHNjlzJBuoWTti9oKCg==
X-Received: by 2002:a05:6638:2714:b0:33f:6fe4:b76c with SMTP id m20-20020a056638271400b0033f6fe4b76cmr2160692jav.211.1659135937729;
        Fri, 29 Jul 2022 16:05:37 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id f12-20020a056602088c00b0067b85bb05besm2199851ioz.17.2022.07.29.16.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Jul 2022 16:05:37 -0700 (PDT)
Received: (nullmailer pid 105024 invoked by uid 1000);
	Fri, 29 Jul 2022 23:05:34 -0000
Date: Fri, 29 Jul 2022 17:05:34 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: vkoul@kernel.org, wenbin.mei@mediatek.com, robh+dt@kernel.org, dmaengine@vger.kernel.org, sam.shih@mediatek.com, phone-devel@vger.kernel.org, devicetree@vger.kernel.org, long.cheng@mediatek.com, fparent@baylibre.com, ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org, hsinyi@chromium.org, linux-mediatek@lists.infradead.org, ulf.hansson@linaro.org, krzysztof.kozlowski+dt@linaro.org, linux-mmc@vger.kernel.org, linux-arm-kernel@lists.infradead.org, chaotian.jing@mediatek.com, nfraprado@collabora.com, sean.wang@mediatek.com, allen-kh.cheng@mediatek.com, matthias.bgg@gmail.com
Subject: Re: [PATCH 2/8] dt-bindings: mmc: Add compatible for MT6795 Helio
 X10 SoC
Message-ID: <20220729230534.GA104966-robh@kernel.org>
References: <20220729104441.39177-1-angelogioacchino.delregno@collabora.com>
 <20220729104441.39177-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220729104441.39177-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220729_160539_036778_6448ED35 
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

On Fri, 29 Jul 2022 12:44:34 +0200, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MT6795 SoC's mtk-sd mmc controllers.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

