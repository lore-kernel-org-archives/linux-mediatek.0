Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E15CC43334
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 Jun 2022 21:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u60V9k2ls0VxsE3lwxpHXB+HYy5wlpkDquI2QsuV6R4=; b=FhszmbuK2+Jb3m
	GlGnzgAR9C4kJ47qNl6YBZz8d4/EPblZ4QobHabjJsY5AJqXSKk5Ygxm/bATCoK2IQygJL2PMlTCi
	PamRduRebc6QaGjcA0Kei2noF2fVQZaXfY3W6ACUYp2hMCfzh4K0jjvNP706uQDJ6N/qDD6Gk4yc9
	gcf84nZqxwdahSxwzpk3pX6EIDBWt7BM9dS1Y7nTJnbfa5LDkJnaAO3WUcVsA6Thj8ZVHeJeERhTG
	qkY37Zq/wT58bW+eEesb7+vZHBhU/4uK8HOMg/0oA0vhkK5TmoQQ8VEXsX9gvRb4PeGmwWn940AAS
	L1gQB3upVsKiNRV+e4Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxxou-00FQ2H-DK; Sun, 05 Jun 2022 21:30:00 +0000
Received: from mail-qt1-f180.google.com ([209.85.160.180])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nxxor-00FQ0x-91; Sun, 05 Jun 2022 21:29:58 +0000
Received: by mail-qt1-f180.google.com with SMTP id ew15so9274781qtb.2;
        Sun, 05 Jun 2022 14:29:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6WJ/cPPuCGEcGJe5vuLwdlkfztZsLYNQcfy21FejcMY=;
        b=lLgQ/SWaBFB6DKuY9ap9V5sc/BhNNIaqWdYZ068q2Zl9UvVVNwaGiceo/RBIKlmETE
         uA0ynskcq3M5FboCg+Cl8F8LutDjdF7NE2qtVqPyp2LRyXbpbdbTruncL3UMmsdhwlX+
         Ipf7O3o2PivnaWaem+fnywqkxoTIUX1kBgmGPUzheCazRlybCUNs747BbBUjy3O/Xgsn
         bZiA0H3JAyb/WUHz0U0C2Bl/gUhAmo4mojwDiT6VPg7zP2mmTyJYyjC3d1Iko+y4SIJQ
         sur37FO1fWulOPgOnHC7dtbGuNR4Ecp4KDFePtKq6ifeGi14mfIV0NstKsv3PBdjXIgE
         mKkw==
X-Gm-Message-State: AOAM530H3IurOykibq6I79eZqURQcDFThQeH18ELd7eN7C4a/Jl0hLYW
	oplZ5EujFep4Lg3/AYDX5Q==
X-Google-Smtp-Source: ABdhPJyHi6eBGQ+GxgFnFyx3TIgsB59Q5okv0AgtRq4h1nbNXXkD4Zyg153WflRQW6zPHqhaFp001w==
X-Received: by 2002:a05:622a:1820:b0:303:b8ef:b564 with SMTP id t32-20020a05622a182000b00303b8efb564mr16441196qtc.319.1654464595562;
        Sun, 05 Jun 2022 14:29:55 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:ac97:ac63:b5fd:aa9:8d74:9989])
        by smtp.gmail.com with ESMTPSA id c15-20020a05620a268f00b006a3af1bd183sm9008320qkp.127.2022.06.05.14.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 14:29:55 -0700 (PDT)
Received: (nullmailer pid 3551819 invoked by uid 1000);
	Sun, 05 Jun 2022 21:29:52 -0000
Date: Sun, 5 Jun 2022 16:29:52 -0500
From: Rob Herring <robh@kernel.org>
To: Fabien Parent <fparent@baylibre.com>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Lee Jones <lee.jones@linaro.org>, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pwm: mediatek: add pwm binding for
 MT8195
Message-ID: <20220605212952.GA3551762-robh@kernel.org>
References: <20220531114544.144785-1-fparent@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220531114544.144785-1-fparent@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220605_142957_356028_B11D0F77 
X-CRM114-Status: GOOD (  10.06  )
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

On Tue, 31 May 2022 13:45:43 +0200, Fabien Parent wrote:
> MT8195's PWM IP is compatible with the MT8183 PWM IP.
> 
> Signed-off-by: Fabien Parent <fparent@baylibre.com>
> ---
>  Documentation/devicetree/bindings/pwm/pwm-mediatek.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
