Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69AE2C001B0
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Aug 2023 10:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3Zt5s29TnSg/CAmpiGJTp2KeGbSi5eYrrS3v7ExYhXA=; b=VPg5Yi0xt4VFvYwCB4PVoLsriz
	0hyVQnBu1ESiCiMdvMQyL7fbDDFjVfxbjOqrwjsgG9nL1KmJ54d/VGG3RqVp7J14Bxpbdq/b/JXa6
	1+8wWT6ncM5PyOGJXGmL0xDl7k3+zk/RG9UzdHSkJ+vIszJYmFHHlxPl3vn+LTNMUgD3fKMm8X9OG
	46oRvhQrZTDwX+g/0SLSDEQ2fV6Fq7pS7R6pDZCeym4KYreprmTeQca1YGKHwYZAVtQinFc4wVAQI
	tldVId1OuEelVKMxsFfT85lRBFv2RjtUM5D3yDZFYUtG85IebVQ1rmrLeamy/YSsechIM/iUWzJYf
	4wezKMZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWDrD-003r5d-05;
	Wed, 16 Aug 2023 10:34:31 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWDrA-003r4V-0H
	for linux-mediatek@lists.infradead.org;
	Wed, 16 Aug 2023 10:34:29 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-3fe4cdb727cso64699995e9.0
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Aug 2023 03:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692182065; x=1692786865;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3Zt5s29TnSg/CAmpiGJTp2KeGbSi5eYrrS3v7ExYhXA=;
        b=XrTS+uZWIuwDbjV2LJQ6SaPt+4MG+NZ0PDne2qv/Mm0VWAwJiLWmy0oA8mNvJ85tZD
         ovhnG7HnZezWid/JQ5eZUvQ5ZkJ43t+JAAU37fuM7hv0eP3cS0691IBZ8N0+gVg5nh+7
         0XjvUI7QiT6DXAkOKBo7kqayPQwo1hmBxUUj2UgFNibnNY7VTekNygLuBdA7XWbFHC+6
         5OkhGyTvnnhvlKTWst3gMYaRrDaEECz99+uYZxU0Lx8BJm6YJThyuV7uWTyaZu7Am2tM
         I1/d4RLrNTe/Nuow5B7Ins8jTXRqyuUM8YJeP4wXGxm/CcqWN0hRzHU4ucZbo/w9l2Iw
         kqXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692182065; x=1692786865;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3Zt5s29TnSg/CAmpiGJTp2KeGbSi5eYrrS3v7ExYhXA=;
        b=X0GWhGv/DBqof7JUcXFs7BKcTvGhB2SGk63qJHPRN5d+NIcaZgQ6pA9p3GiJmbrXmv
         vkIm+3APpGfc++BikyR6psNk51WFW4BeMnE35056VspqRvvFctiBQfCmrP+14AXwI3TL
         sqsM03f+eE+8N1I1yOp/wzNppvzzzwkL3GBZQEIVTov66W31MBTSeRgV3w4bsPYhMmCK
         ART/+GrSLKIMlWyjAT3uOT0PlXOdMGj/SQSzG7x2EzB9xYR+zs8gZbBfvxA9mGYLFgxZ
         HmpJBjJymjD9jKiWDQC8+3CeYoLlGFnWPGwF4yNr1EMB6xhzakpAU2SwKuE325kWRvYj
         BKKg==
X-Gm-Message-State: AOJu0YzRrBJjlNvP6MyMojr+rT+5emTKaDMYqOselmu1CXRfzyL4embs
	8GDvmElEQcvSGSfIIHpMkSQPxA==
X-Google-Smtp-Source: AGHT+IEHnjG1745XHVSq0ZGcqMftv8YU1ddVlDVtAVOTAo25ZERTfubpQnq/0Y1258rby6TxUWnjkA==
X-Received: by 2002:a7b:c458:0:b0:3fe:4cbc:c34c with SMTP id l24-20020a7bc458000000b003fe4cbcc34cmr1071490wmi.24.1692182064818;
        Wed, 16 Aug 2023 03:34:24 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id c16-20020a7bc010000000b003fc00212c1esm20895369wmb.28.2023.08.16.03.34.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Aug 2023 03:34:24 -0700 (PDT)
Message-ID: <3a34c547-f6f5-7e8a-8a2c-157dd651490c@linaro.org>
Date: Wed, 16 Aug 2023 12:34:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] thermal: mediatek: auxadc_thermal: removed call to
 platform_set_drvdata()
Content-Language: en-US
To: Andrei Coardos <aboutphysycs@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Cc: rdunlap@infradead.org, void0red@hust.edu.cn, daniel@makrotopia.org,
 bchihi@baylibre.com, aouledameur@baylibre.com,
 angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com,
 rui.zhang@intel.com, amitk@kernel.org, rafael@kernel.org, alex@shruggie.ro
References: <20230811192847.3838-1-aboutphysycs@gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <20230811192847.3838-1-aboutphysycs@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230816_033428_142493_B5CD9B98 
X-CRM114-Status: GOOD (  10.31  )
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

On 11/08/2023 21:28, Andrei Coardos wrote:
> This function call was found to be unnecessary as there is no equivalent
> platform_get_drvdata() call to access the private data of the driver. Also,
> the private data is defined in this driver, so there is no risk of it being
> accessed outside of this driver file.
> 
> Signed-off-by: Andrei Coardos <aboutphysycs@gmail.com>
> ---


Applied, thanks

-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


