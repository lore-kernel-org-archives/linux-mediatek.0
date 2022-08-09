Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2B40C25B0C
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Aug 2022 13:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dBqbYW9tbViwcewTo3bCPmvXW6SZtS25kUYhTbQNV8c=; b=GnrtKBxoSlan+iHIgAx7p1mYWB
	R0+spVezGG+IjhiFrdbNoBlofms/LyEWIhT502vJrl5JppVQKjli6IRb7MCxpyLqjUTKzDwrcDqHu
	86Kc9/nb4DNuKem58/csldr/8HYqRJUDhMrXL33iFCyS7oSGpxnF7aMPc+BZfmMagSZIMSB6o40Mh
	AOxSrAKlGVsIrQFB/ofkQ3WmEUpAOsXN6A9NkWNPq7ZmQXTGRQhXjI06zWiL2WcS5kWtEwATAtyRa
	EX3Ki+2u7ZicX+zF0t04UXFHVmEi3ZjB6ldMH7xZX2uzVSqomeY70oDldFOuaVj0ToqobKPoC/QZX
	v9iaz/JA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLP4t-0042WV-OL; Tue, 09 Aug 2022 13:15:23 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oLP4L-00429t-Lk
	for linux-mediatek@lists.infradead.org; Tue, 09 Aug 2022 13:14:52 +0000
Received: by mail-wm1-x331.google.com with SMTP id ay39-20020a05600c1e2700b003a5503a80cfso1665602wmb.2
        for <linux-mediatek@lists.infradead.org>; Tue, 09 Aug 2022 06:14:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=dBqbYW9tbViwcewTo3bCPmvXW6SZtS25kUYhTbQNV8c=;
        b=y571nheINae9LUI/SJMNbLrGWhVOjCeCDgW1FZioe3HjacILCjd6QSMQsqQLVaf6ej
         vIu1F57XpVYbcP4KdE2zpOJXTaoTzu0BV5waTrO9VkrQKOyXdOdHigwSkiT1LSg0yEfz
         nvdTRa0VyWxUrvttnpZhPUA2nBjZ/UYCUgqZlOsmZMdY2108t+OmfmbTT7+us90g5Rf7
         i+0hxV16SiU7p7aTM7uSA6Cuj2vHo6O5Nm6ss3AEfscFNblCFzDGlPa/sHFBVbaj0T6l
         oTJx8MwwHSJtrMvKNV8wSIpolrJVA+vV6dbRo2MUkzEksKk8omCBBBIFWfQN8hYxzd/P
         OFWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=dBqbYW9tbViwcewTo3bCPmvXW6SZtS25kUYhTbQNV8c=;
        b=xbQljtJ8S8Dis3DovnwJI5j1e+MFi6me0T1fRjlMd1kqXFSsexeFT0K2a/PezgIUFz
         X8a4H2Pqwb576E15D0aCXgQE3tuGaGjH9pcq2W2DLzkxq9TWglccsCio+LAiIIIrUoF8
         3vbDrCXf+S0ufePGY98hGPTN63MkCbtwfyXUk8YuHZwv8YmVd8NRDp0+KBZoHAPqD1Ob
         FscOfaosKm0VA0DGVhaRCLJ1m6fGsa+EqzjjWQ+THiJ5nmxLkZRBL5PvNbCymGCkCC4l
         2zCXHmbz299fY5+Tp6kbvP8b7aihtSNACYdmwSSZUyMQKGocq/eXTclwDi7gx6DIcjuO
         ZE3Q==
X-Gm-Message-State: ACgBeo3CyTV3bybbQ1SSxbiZO/M48f/eovpb7YRnzMKWG/W2m5y73T2j
	2xl4Tju7UfD7/E0xXolT4XWrKw==
X-Google-Smtp-Source: AA6agR6TpJGcLGt3ec1JQE9loH2/RHUpfI8WY60Mc8fNQRrRSfAKatUW5XphGdaQl8HnNqdDadGXhA==
X-Received: by 2002:a05:600c:3790:b0:3a5:435d:b2d3 with SMTP id o16-20020a05600c379000b003a5435db2d3mr5591567wmr.134.1660050887523;
        Tue, 09 Aug 2022 06:14:47 -0700 (PDT)
Received: from google.com (cpc155339-bagu17-2-0-cust87.1-3.cable.virginm.net. [86.27.177.88])
        by smtp.gmail.com with ESMTPSA id w8-20020a5d6088000000b002185631adf0sm13519557wrt.23.2022.08.09.06.14.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Aug 2022 06:14:47 -0700 (PDT)
Date: Tue, 9 Aug 2022 14:14:44 +0100
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
	szunichen@gmail.com, Lee Jones <lee@kernel.org>
Subject: Re: [PATCH v7 07/13] mfd: mt6370: Add MediaTek MT6370 support
Message-ID: <YvJdxEpC2cB58Bq9@google.com>
References: <20220805070610.3516-1-peterwu.pub@gmail.com>
 <20220805070610.3516-8-peterwu.pub@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220805070610.3516-8-peterwu.pub@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220809_061449_734184_7734FBDE 
X-CRM114-Status: GOOD (  13.54  )
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
> This adds support for the MediaTek MT6370 SubPMIC. MediaTek MT6370 is a
> SubPMIC consisting of a single cell battery charger with ADC monitoring,
> RGB LEDs, dual channel flashlight, WLED backlight driver, display bias
> voltage supply, one general purpose LDO, and the USB Type-C & PD controller
> complies with the latest USB Type-C and PD standards.
> 
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
> Signed-off-by: ChiaEn Wu <chiaen_wu@richtek.com>
> ---
> 
> v7
> - Move '#define MT6370_REG_MAXADDR' to the next line of
>   '#define MT6370_REG_CHG_MASK1'
> - Rename 'MT6370_REG_ADDRLEN' to 'MT6370_MAX_ADDRLEN'
> ---
>  drivers/mfd/Kconfig  |  16 +++
>  drivers/mfd/Makefile |   1 +
>  drivers/mfd/mt6370.c | 312 +++++++++++++++++++++++++++++++++++++++++++++++++++
>  drivers/mfd/mt6370.h |  99 ++++++++++++++++
>  4 files changed, 428 insertions(+)
>  create mode 100644 drivers/mfd/mt6370.c
>  create mode 100644 drivers/mfd/mt6370.h

Applied, thanks.

-- 
DEPRECATED: Please use lee@kernel.org

