Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA74C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 19:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySIVfsaxNA1ijAI7bATHRfKRS7AcLI7DST7iNvCc2ro=; b=Gzg+s2iGfsXiFZmEz86xolIsGf
	tm5LpqFU0h2rcx93r0kK3aDi7OE2mnnrSYJJ7XlgznL+yvubE4N7pnAN1poGADAVT9D+HsOWtaFjh
	DWQbYfLEw1pxx5SELrDIPc+sp30fncbL18oGd8CnqDegww61zAI7q57MgXEeEj99VHxz6HgOEfhDJ
	gFx8jZD9C4dKACngvBrdH/lCNWmzeg2Qztb65lTxmS3J9BOJNCWdraWz2Gr/Jf++qhJ6q7e5Hqcaq
	e4oj0F75yJs3NPSfX1ueW/vbyPIIXw9ihjbHA2Cz6ctrddl78Q5gR5SKEGZerofBavw87ezfqnkAL
	pGrXsCng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWZE-004lGs-5P; Thu, 06 Oct 2022 19:30:00 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWZC-004lFT-Dn; Thu, 06 Oct 2022 19:29:59 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-131dda37dddso3404353fac.0;
        Thu, 06 Oct 2022 12:29:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ySIVfsaxNA1ijAI7bATHRfKRS7AcLI7DST7iNvCc2ro=;
        b=NOryYakHy1D3RclrcswAJkYZZxEAU/AGqefvsAel1EDkfbcBNGnHJORee/khvzu7d4
         toCBawuz++dyCY7Y6hH9t319izPY21R3UXTg5QWtMWPvVFE9QQU+WAR7x78OKN31H4xm
         35E0NqFJmZlUW9sY7yAI6CGn3Y4gYKvKtJfivoPWScNFXk8OC9n6o6+nGG8L/egKT7hm
         7uiNH96jIyyvGPwE4zBrQHJ+iY94Ib4hMKlmh8bY4do7ahcsoN5S5iJ0vBQSRwWq34dP
         iOdkAVD7f6j8fO7a/vO+gAEt4QvVrjceTAZkctdD5o+7vaLdTiT5Bavv/Q2N27WF9QzP
         GVnQ==
X-Gm-Message-State: ACrzQf1oD09EenWb/WWnySxADnTWVcwErQWycNfvpn9BACTU5HkdQ1dc
	FhvnFW2mquO15tAX+g4LMg==
X-Google-Smtp-Source: AMsMyM4/iv7myuy0Nn8kCe3Et5vu7Cu1CfGYnJEilG1xPRLoHrvgqYBZoN4qRCc43LPwkI6oA1Oltg==
X-Received: by 2002:a05:6870:b422:b0:131:d458:2d21 with SMTP id x34-20020a056870b42200b00131d4582d21mr756756oap.24.1665084596364;
        Thu, 06 Oct 2022 12:29:56 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:8a65:c536:245:842:a3a4:9017])
        by smtp.gmail.com with ESMTPSA id q65-20020acac044000000b00342fc99c5cbsm6147248oif.54.2022.10.06.12.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 12:29:55 -0700 (PDT)
Received: (nullmailer pid 58541 invoked by uid 1000);
	Thu, 06 Oct 2022 19:29:53 -0000
Date: Thu, 6 Oct 2022 14:29:53 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, Yassine Oudjana <y.oudjana@protonmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Andy Teng <andy.teng@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 08/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Document MT6765 pin controller
Message-ID: <166508455748.57937.1260917394101293139.robh@kernel.org>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
 <20221005174343.24240-9-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005174343.24240-9-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_122958_478806_CD236430 
X-CRM114-Status: GOOD (  10.63  )
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

On Wed, 05 Oct 2022 20:43:41 +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The MT6765 pin controller has had a driver for a while, but DT
> bindings were never documented for it.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../pinctrl/mediatek,mt6779-pinctrl.yaml      | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

