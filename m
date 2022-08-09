Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 079D6C25B0F
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Aug 2022 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbYq10AH7DFyPthSKrztZodwwushB5t/2Y6IpnigFO4=; b=la6uXOq1OrVGZRVXVuI8J/zrtz
	H7bZRsiQG1uSw0Ga0tK7uVQ8sMUnyX+y2Iz502pQKt1lHlbSjkekst3fuWoSlGvwfOB3rU8uxgIKL
	xUC1IXR+rHVOYMy8JEYlr4VyN62GtRtbCHYmfZDEnBiN8OE94Qx8lLMvMjhdSPxmEw9YgYBk+ofvJ
	mUO/vGoj76q+m87dQ0qfmGPncN8Nd3ZSIZ7Z2HfgMqEeu0X+J/ZtvhJdDaPs73Lc5Y5Umvm0Vc7ea
	69EfBIMdgKU9tplBoRwLttWQvtEJUM2WfCA0zmSY2kLg0ovP4G/f7OCa1VD7orCp9MIPp/YyeYn+u
	QIJnr51g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLP4I-00428g-1M; Tue, 09 Aug 2022 13:14:46 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLP3r-0041y1-Hn
	for linux-mediatek@lists.infradead.org; Tue, 09 Aug 2022 13:14:20 +0000
Received: by mail-wm1-x333.google.com with SMTP id q1-20020a05600c040100b003a52db97fffso3966828wmb.4
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Aug 2022 06:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=YbYq10AH7DFyPthSKrztZodwwushB5t/2Y6IpnigFO4=;
        b=Z7YPedDXnLSgBPd9OMsLK57MpNaQ+Vcno0m+BuDTk72qpO7Aul44JeaGBXTzylLRf6
         nLlLx0AAopKc9yoMFkj+Q54hadriFobDH/c4+X0sfC9AHuazANM0RuLRgl7aIbp7cuqZ
         GuqgXlEc4WGquTmSK1cBzJuaCX2BX2TNLtrn0hY9FZo6tj0eSfsrMRlv0hloKxBdqAxe
         HzL7oWPVQvc9jYePBqrd3jAmn1hhsql6nZA98xDcQZHIrlEoh2Q1hNjtZQezpUCmpo7M
         blu04r+nOiSHk4MsGO4DyfiRnWD0AV/92wFDYDkXqtnn2T/ooJhtO/5AZzhil2k4tdEF
         DqKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=YbYq10AH7DFyPthSKrztZodwwushB5t/2Y6IpnigFO4=;
        b=uv+3Zg5KkBNhKagTJoLxEAVKdNmWXWP3pkxZkYhfRMdMyH2URmHhrCdn0EVQbHfBW8
         iG1gnDs6JTItEYq88WvSDhxtZkcOoRWHkNCWfKgTKZSW4j0Ikes4XrWtQt0h3UHp98Bo
         MRkmiUK4vEw13rPzwRVZ7QG3/MLl8aDQxfiDsgsIStMvufn1c5z9VBAVgch/SYfuHq+1
         nvVVs3t7eQ50KN2rOxDnQSmuaIoFs4xGeEEH4/oJCg4CaMb99A8O2tIUxGTFYloXy/1C
         MMPiHLZHiU9unaO9VDGbsz/huh2GmcFQj1D84vhXmMzXjxX64+SN43Zw6eXgAvdJA0wt
         Y5ug==
X-Gm-Message-State: ACgBeo0br+HUdPdiX6Xu3kmoIyLF8iclVupDJQ/MHt2LgSYv3FTYn1iL
	xUbn0LM3eW9BwFURQ1nGMrpucw==
X-Google-Smtp-Source: AA6agR4/lo60i+WLJVLsgEtDWzhjrmVdxnP64JGuV05zhH+S6LHtffAoI85nP9uDE8F/o6OlDzl8sg==
X-Received: by 2002:a7b:c848:0:b0:3a5:41f6:4d37 with SMTP id c8-20020a7bc848000000b003a541f64d37mr5721352wml.23.1660050857317;
        Tue, 09 Aug 2022 06:14:17 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c4f8200b003a1980d55c4sm22561795wmq.47.2022.08.09.06.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 06:14:16 -0700 (PDT)
Date: Tue, 9 Aug 2022 14:14:14 +0100
From: Lee Jones <lee.jones@linaro.org>
To: ChiaEn Wu <peterwu.pub@gmail.com>
Cc: daniel.thompson@linaro.org, jingoohan1@gmail.com, pavel@ucw.cz,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com, sre@kernel.org, chunfeng.yun@mediatek.com,
	gregkh@linuxfoundation.org, jic23@kernel.org, lars@metafoo.de,
	lgirdwood@gmail.com, broonie@kernel.org, linux@roeck-us.net,
	heikki.krogerus@linux.intel.com, deller@gmx.de,
	andy.shevchenko@gmail.com, chiaen_wu@richtek.com,
	alice_chen@richtek.com, cy_huang@richtek.com,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-fbdev@vger.kernel.org,
	szunichen@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v7 06/13] dt-bindings: mfd: Add MediaTek MT6370
Message-ID: <YvJdpq0MWNPQZw5c@google.com>
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
 <20220805070610.3516-7-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805070610.3516-7-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_061419_647965_5E985CF8 
X-CRM114-Status: UNSURE (   9.51  )
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

On Fri, 05 Aug 2022, ChiaEn Wu wrote:

> From: ChiYuan Huang <cy_huang@richtek.com>
> 
> Add MediaTek MT6370 binding documentation.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
>  .../devicetree/bindings/mfd/mediatek,mt6370.yaml   | 280 +++++++++++++++++++++
>  include/dt-bindings/iio/adc/mediatek,mt6370_adc.h  |  18 ++
>  2 files changed, 298 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/mediatek,mt6370.yaml
>  create mode 100644 include/dt-bindings/iio/adc/mediatek,mt6370_adc.h

Applied, thanks.

-- 
DEPRECATED: Please use lee@kernel.org

