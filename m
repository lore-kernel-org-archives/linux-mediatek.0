Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 176B6C7EE29
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 11:08:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXdQfD8VSWsZR3Vi8Y0WmvbNHXZH6Vk6c/6DrYZtkC8=; b=djbjo62j8tGoe9cXq6L9xsZqRk
	VZN5MRq3D7JQ5OMEoDyRpOkMzjJimHVMqcEJcg0uAhLOgt49MJ3VIFtL4pN/ySq6W+FIwCDkbGirM
	+4Q033PaTOHT2JbA6Wly5YfvMPtBEG7ZeN32npRTcGe4hJ28W14Ex7pGzPEpSDY2tabJWeDG3E7O5
	61um/sFO+WxeBtQebqa3SEiYIdYtJK9Lb0OsuUKX5658LRoPM4rNLWBg+u6vr8w5Kw8wmnjdtjuPm
	Izpfjxotd4Yv3N8fn+40KDs5w6gQ2iSKBNX25leVbGnhfZh79Y5RV1wZ5WW38sMYMQbDYzoH5ANT6
	0tq6ccdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6r1r-005bZd-0w;
	Wed, 07 Jun 2023 11:08:39 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6r1o-005bYR-18
	for linux-mediatek@lists.infradead.org;
	Wed, 07 Jun 2023 11:08:38 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3f78a32266bso34659735e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 07 Jun 2023 04:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1686136112; x=1688728112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BXdQfD8VSWsZR3Vi8Y0WmvbNHXZH6Vk6c/6DrYZtkC8=;
        b=QTGW/Vu9XZf4s5MS2p6ojUMV554GSqknEVOpWK5rGAZhbYaLpwTl8/+tjQONBnIaq+
         K5z2TQrCWI6tT7yx3jDljuWe41E4Jg5nbdX4Yea9exFxwTVouVkdpV5zdWrHi6l5W2IK
         yFwXMY//lgwBCYuN5i+RJLudw4GNG9rdqe7DJ4eMM4ygSpbYRfzrx4iIMaWkG2QMw712
         cHOnQKkKpZ0U5OGRfZBYI+pilulQqDFrBrvzbOqBL5EgKFX/mXVH7f8U/qB/eyxuTtMg
         GiTCZZLVG8J5A0SPIZ/uZPAJKab2DTYhNxRWEXS3tIwN/p9sSPvWv0gmfxTki0GS1Cld
         PTOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686136112; x=1688728112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BXdQfD8VSWsZR3Vi8Y0WmvbNHXZH6Vk6c/6DrYZtkC8=;
        b=F8u6eSgNXDLBjYULGO8RDGwuDhC1tr+aRkwLmfn24E7yN76MBRAGu2vZdf4aHmywrQ
         V/iwjS1LKYgd14ChbmfUlfe5M6euMbdj+Bz3/UbpikVYDhFX2gMa1bfy5ywoql9GGYtR
         CsAGqWY2zU4zolkQZDddqC5JyuOwB33RYKc7F7GEHUqtmue5X02NA5Mad315984Z3qcH
         CRZXn/Tcd1M0cCkzrv+5Fw2kSmYYSTI8WCjWPSKMhaqrS9+c1dVRSaF/iPbmRD2ldoUM
         i70JSMl++cA9AV+ZYKnNkBXDrO3giSzGJ3yw3Ks2O0cB1N1sxuTZhkPOERIYq7nRz7xI
         xKhw==
X-Gm-Message-State: AC+VfDzM5hVlAKdv/qtkY0SFLbcawh+XkgWy7XWcO7tNUb3zCgbFK0BX
	taPKedeqfsVNZglNSvC/Fke0+A==
X-Google-Smtp-Source: ACHHUZ5cgp+HJScZGL+i7YPbTv0GsIwRUhE+kDDIAWVzH4PmbSPpPjc3VBa/gfSJIjWg0y/3D8pOUw==
X-Received: by 2002:a5d:63ca:0:b0:30e:41c5:9715 with SMTP id c10-20020a5d63ca000000b0030e41c59715mr6529879wrw.47.1686136112241;
        Wed, 07 Jun 2023 04:08:32 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id m4-20020a5d6a04000000b0030aea925fbesm15020875wru.50.2023.06.07.04.08.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Jun 2023 04:08:31 -0700 (PDT)
Message-ID: <ce2737b7-a2fa-b4f2-16f2-09971d5877fb@baylibre.com>
Date: Wed, 7 Jun 2023 13:08:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v5 1/1] mmc: mtk-sd: reduce CIT for better performance
Content-Language: en-US
To: Wenbin Mei <wenbin.mei@mediatek.com>, Ulf Hansson <ulf.hansson@linaro.org>
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Ritesh Harjani <riteshh@codeaurora.org>,
 Asutosh Das <asutoshd@codeaurora.org>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel test robot <lkp@intel.com>
References: <20230606113249.28057-1-wenbin.mei@mediatek.com>
 <20230606113249.28057-2-wenbin.mei@mediatek.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230606113249.28057-2-wenbin.mei@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_040836_652431_1DA77B98 
X-CRM114-Status: UNSURE (   9.11  )
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

On 06/06/2023 13:32, Wenbin Mei wrote:
> CQHCI_SSC1 indicates to CQE the polling period to use when using periodic
> SEND_QUEUE_STATUS(CMD13) polling.
> Since MSDC CQE uses msdc_hclk as ITCFVAL, so driver should use hclk
> frequency to get the actual time.
> The default value 0x1000 that corresponds to 150us for MediaTek SoCs, let's
> decrease it to 0x40 that corresponds to 2.35us, which can improve the
> performance of some eMMC devices.

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


