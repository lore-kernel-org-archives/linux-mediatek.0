Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E774DC433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 19:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=21hNv+nZ869o4qhHs3w2kIGrD509wB6x9WnNWTl2ai4=; b=wFEv/yeRTgM3ngM3llJl+kVXsT
	bYuXdJ0plvLrjH3AwiI5mXz6pj8b/kX82E4KRZ8dEsBzuJ3SddUJwwHoYCGPKgliG1G8yeBycnuzM
	0lWHRHuPHNS7xlrqQon68PJTsYNPChkV9Av16JpYAdtyoLK5RZ2qVqqymQXertXbHhwyloQpJYgqS
	9t1N7dZRQV6s3W9ZzdmoB6euhra8/frpNFCWYcn+IsOGFEoflMMnis27XqTChF/riEprSaeVVOT4d
	6kJ+4Tkj/22Tz5BbmoX5iHukgmbncxOxoEk9bmjEAbheJucRKjSkOEoMDyphPvuTn+6/KELJ9cWGP
	WKHUQG9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWLe-004gFN-Ud; Thu, 06 Oct 2022 19:15:58 +0000
Received: from mail-oi1-f180.google.com ([209.85.167.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogWLc-004gBv-Uy; Thu, 06 Oct 2022 19:15:58 +0000
Received: by mail-oi1-f180.google.com with SMTP id m81so3145809oia.1;
        Thu, 06 Oct 2022 12:15:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=21hNv+nZ869o4qhHs3w2kIGrD509wB6x9WnNWTl2ai4=;
        b=5P4M5lwbS4bTIPmOyhODyYWjrcFWYI/AKPpNJQprcfKCSVHhMvzV7Hy9MxttbSFeV0
         1652PAqnji+B9LzqHcJjl44eTzlcbyieWJg4o2jV+tGeizaOv/R8GK3IRGqxXlT6QVSD
         h04PdzBkjVomJXQTpQruyELs+VgohJL3EbqawTP9h6PUhK3HPcb6V95HczGyyxdQeXcf
         m9CWrZvIlwsrdWSLu13RqCx/AfdfRHBnLDi8xck+4LTfTUL5Ia+rzJsWov3JqR2uClvA
         dbN2qXBEYA//7255I8pGW8mc6wJ8oiaKNLJXSMkU35M0kDbW8LtHh+Xsd9cVrStVhHi/
         dpYA==
X-Gm-Message-State: ACrzQf13PT09RiKjQ3GPBQ1smfm6lp/pDg53e2MLYN1Jo905tdBSurAc
	32XfAhKoiswvraqfcYiW8A==
X-Google-Smtp-Source: AMsMyM5VgjxQ1Wp5dG64oir/yFkUIJN8TuHLx8FIisZIq8C87xbt5crQOesIvyyvmVvxZYhaCmwW0Q==
X-Received: by 2002:a05:6808:f12:b0:353:d701:f435 with SMTP id m18-20020a0568080f1200b00353d701f435mr5718532oiw.292.1665083751545;
        Thu, 06 Oct 2022 12:15:51 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:8a65:c536:245:842:a3a4:9017])
        by smtp.gmail.com with ESMTPSA id p7-20020aca5b07000000b00342e8bd2299sm8433oib.6.2022.10.06.12.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 12:15:51 -0700 (PDT)
Received: (nullmailer pid 47054 invoked by uid 1000);
	Thu, 06 Oct 2022 19:15:49 -0000
Date: Thu, 6 Oct 2022 14:15:49 -0500
From: Rob Herring <robh@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Andy Teng <andy.teng@mediatek.com>, Yassine Oudjana <y.oudjana@protonmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 03/10] dt-bindings: pinctrl: mediatek,mt6779-pinctrl:
 Make gpio-ranges optional
Message-ID: <166508374257.46912.14127423308546660871.robh@kernel.org>
References: <20221005174343.24240-1-y.oudjana@protonmail.com>
 <20221005174343.24240-4-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221005174343.24240-4-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_121557_016589_C96D0D51 
X-CRM114-Status: GOOD (  12.78  )
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

On Wed, 05 Oct 2022 20:43:36 +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> The pin controller can function without specifying gpio-ranges. Remove
> it from required properties. Remove it for that reason and to prepare
> for adding other pin controllers which currently don't have the
> gpio-ranges property defined where they are used in DTS. This should
> allow dtbs_check to pass on those device trees.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  .../devicetree/bindings/pinctrl/mediatek,mt6779-pinctrl.yaml     | 1 -
>  1 file changed, 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

