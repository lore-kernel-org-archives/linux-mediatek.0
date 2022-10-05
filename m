Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18905C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Oct 2022 13:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3t+GscuuDlNI3lPYH9+53v6c5AMIA5UB0rxRf4WczLI=; b=ie3GJP9gFhx5iOHBrRmkWtybXd
	pSkeTgMh0P9yFKQ/3PXXa63MmAYkXHYaqpUHW479T4z8JUitYWjWVgx+Jvq4K7aEUxxNQLdMdWimO
	IIKZqT4ugTggFGU6B5DIZfN7RFLK10O89dyjjTZvQssfn4cy/jmz+EbrDt+zn51uOCTc8ZAy6rgFT
	1D/3gXJFGQI0gllRDug7aroeTlBL9dbQbIYZoTEINkvHqTwOOJ5RbkAXnfGR0SUdtVzkUiEzWqmhM
	M8FcmRA98lEXO8adKpMov4loXcdPPZuhr2XLFdHOlfcpUKF6XmUvpUfU5ippiFDUm1mvKpFvddYCe
	aJcCqR+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og48U-00E8Wu-Fj; Wed, 05 Oct 2022 13:08:30 +0000
Received: from mail-oo1-f43.google.com ([209.85.161.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og48H-00E8U7-NL; Wed, 05 Oct 2022 13:08:22 +0000
Received: by mail-oo1-f43.google.com with SMTP id k10-20020a4ad10a000000b004756ab911f8so10762716oor.2;
        Wed, 05 Oct 2022 06:08:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3t+GscuuDlNI3lPYH9+53v6c5AMIA5UB0rxRf4WczLI=;
        b=6x6IUnPA296Kl4WFThn8yihdaEXG6qklQ/FTfTRXfoAtutN2bq7cSlI+h1uNtTEai3
         vBmlTyRtA/lK1e0a7daS9mEGJmxWBwNvD/4oAXj8WPDBZfKYtGj3QvXxPXb47SkQjKMZ
         34j/p0fJiUwfaaVOPvGwSAUmC7hiRuJVxAGlYOLRMkfwQOzyxjnX9UOUlaMSP9egdUV3
         ZvEKImzbCUyHXmJCF6YYJ93ZZpiEgJp5jvavuV5d8BRy+pDhrmUvYRkRSQqyGAqG9dh0
         09JHSe/WsxdOjgktKM0r1Ms80VVVzO/IUPtPV6ZWQEnap2CLb4wrCuMx9cMtrv3AhDd7
         qm2w==
X-Gm-Message-State: ACrzQf2krJazFW9LTRfN2Z7K6kx0dEu4gsdxDhoPEjiJz+Gj5fLCOVt4
	ZGfpXVDyS3qNB4KjZazSmw==
X-Google-Smtp-Source: AMsMyM4q/HGTToLRqz7AqWvI/17SkBm4JEFT4t2hNCcS793qd+QzBZ07JBmeBJ3urLCd+Z60PXBUYA==
X-Received: by 2002:a9d:4a1:0:b0:65c:4497:6cd9 with SMTP id 30-20020a9d04a1000000b0065c44976cd9mr11633009otm.188.1664975296268;
        Wed, 05 Oct 2022 06:08:16 -0700 (PDT)
Received: from robh_at_kernel.org ([2607:fb90:5fee:ea3a:4239:ad4:650a:6e66])
        by smtp.gmail.com with ESMTPSA id 188-20020aca06c5000000b0034d14c6ce3dsm4275306oig.16.2022.10.05.06.08.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Oct 2022 06:08:15 -0700 (PDT)
Received: (nullmailer pid 3248915 invoked by uid 1000);
	Wed, 05 Oct 2022 13:08:13 -0000
Date: Wed, 5 Oct 2022 08:08:13 -0500
From: Rob Herring <robh@kernel.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: pavel@ucw.cz, krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com, jic23@kernel.org, lars@metafoo.de, andriy.shevchenko@linux.intel.com, chiaen_wu@richtek.com, alice_chen@richtek.com, cy_huang@richtek.com, linux-leds@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org, szunichen@gmail.com, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v13 1/5] dt-bindings: leds: mt6370: Add MediaTek MT6370
 current sink type LED indicator
Message-ID: <20221005130813.GA3246955-robh@kernel.org>
References: <cover.1664991040.git.chiaen_wu@richtek.com>
 <d59807369c2ad245245514c49d9f91d47c8a5851.1664991040.git.chiaen_wu@richtek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d59807369c2ad245245514c49d9f91d47c8a5851.1664991040.git.chiaen_wu@richtek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_060817_776645_E399FB78 
X-CRM114-Status: UNSURE (   8.46  )
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

On Wed, Oct 05, 2022 at 07:43:54PM +0800, ChiaEn Wu wrote:
> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add MediaTek MT6370 current sink type LED indicator binding documentation.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> 
> v13
> - Remove 'allOf' property
> - Add '$ref' and 'unevaluatedProperties: false' in 'multi-led'

I already applied the binding patches from v12. Send incremental fixes.

Rob

