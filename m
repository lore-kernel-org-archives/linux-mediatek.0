Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17600C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 21:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h425gcHyCJbnI4wfopzu1ynRiogGjCRkxUq0gd2HMiI=; b=bDoLJe1qWMSTQimfEI0km/HJr4
	Sh60ma3qzAKDcJoVpvuIltI485zrRT5KphDhdjH8Uy/mlAwE4YEV6lvKE197e7ixPaD+W4wPkIhTy
	CQyY9iJ8tztRlYBVWxNNyhLtj6rQyoFahD1LrNbNxq4ZFCbAvjOp5MBb9gD1pOElcKL1O1vjPO2nR
	Ohg7faCRwmi02imUMUPzXQPe0l9Y5v6cVXf8PNgJxjHlNEm6QlN2u0gbE1UP/onZDncW6adePkviV
	kiVP3uXOaKBP8TlhGbOLHAapHrlHDKJUUiuOZMMCGw8oFXsls3tSibUITB3KUiJl199aSH0YrFKDF
	JQbRv6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEHQA-00BcOc-6V; Wed, 20 Jul 2022 21:39:54 +0000
Received: from mail-il1-f169.google.com ([209.85.166.169])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEHPm-00BcFH-5k; Wed, 20 Jul 2022 21:39:31 +0000
Received: by mail-il1-f169.google.com with SMTP id c17so8997952ilq.5;
        Wed, 20 Jul 2022 14:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=h425gcHyCJbnI4wfopzu1ynRiogGjCRkxUq0gd2HMiI=;
        b=rLIpQagdMBAxZdYYJrOVw6KaXqngn5gQ7MEXfOTU0OZNkugjUFxO3mu87cUxcfefnr
         K/5PYO7D27NEqBswaFdkRZu1VonMbwb+6mspkXICQ5iz4imMWFe5OIs+g8dgN0uZnaAj
         TLQGBy7sYN8geVt5kEG5+xj5KU3WSo1kbm8BB9/5vkyvd2JaCtYDkhorcAcZAFrVf4CW
         hPS5OMDNvIafZs7ncdQVKwNqcYRviaYwW126tGB1NFmsiuOajyMEeoPqJAp79RZj/WRr
         8FlP2xBfNLg68Mm+6MjMfnSIGFRmAFHeV6Iof+UMT9pPMdEopscOimPOg+3bmi1UKmXj
         31tg==
X-Gm-Message-State: AJIora8S2BgUdPug7pKAiXxup+SbM9+Z14iPyDe1rlgpCY/4a+CcFRgh
	JcWRrZkkwHMCFmCHhVJVKQ==
X-Google-Smtp-Source: AGRyM1t20OnxGJS1vaExDsOK8a5XeT6fNqY65S9WpBmw3BKummPXIq/zxfCiwFS8JXomabVblpvgOA==
X-Received: by 2002:a05:6e02:2141:b0:2dc:8352:3a3a with SMTP id d1-20020a056e02214100b002dc83523a3amr20409273ilv.32.1658353166341;
        Wed, 20 Jul 2022 14:39:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id i3-20020a92c943000000b002dce11c89c7sm70299ilq.14.2022.07.20.14.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 14:39:26 -0700 (PDT)
Received: (nullmailer pid 4028087 invoked by uid 1000);
	Wed, 20 Jul 2022 21:39:24 -0000
Date: Wed, 20 Jul 2022 15:39:24 -0600
From: Rob Herring <robh@kernel.org>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Chen-Yu Tsai <wenst@chromium.org>, Project_Global_Chrome_Upstream_Group@mediatek.com, linux-kernel@vger.kernel.org, hsinyi@chromium.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: Re: [PATCH] dt-bindings: mediatek: Add #reset-cells to mt8186
 sys-clock controller
Message-ID: <20220720213924.GA4027969-robh@kernel.org>
References: <20220715110021.3127-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220715110021.3127-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_143930_268008_525E427F 
X-CRM114-Status: UNSURE (   9.84  )
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

On Fri, 15 Jul 2022 19:00:21 +0800, Allen-KH Cheng wrote:
> MediaTek system clock controller includes reset controller and needs
> to specify the #reset-cells property.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> ---
>  .../bindings/arm/mediatek/mediatek,mt8186-sys-clock.yaml      | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

