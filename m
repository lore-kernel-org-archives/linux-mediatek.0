Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE0EC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 13:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bb6P2byqyLNvxYx5mpnu/HADSn0CeAL5J6+dhakFGrg=; b=i9YH4KUkyuTvTwy0T2Qm3cSxXi
	zGiwTxijBvTeCbzgzkDwhz8OQEKeqJ6fRRa3couEeYqkMp5Kg5ScVjFJxStE/NOrnkTCq6dq9guNn
	BVZYXTI7q/C+yH8d/q8uhpAxK2bozFKwROBy1o33fo26NIOZqmr8uCSKC8F5RHPNIhIF+almHoN6i
	hVAy/K5nCtp3Ghv3bZLYpP0jn/f/f+ISCLYUCSjq/ymw3S9zn82jeOHS95cHI6532NWXBYrl0HndK
	qpRVOvBTxUD4PHE0I9njvLRS3nSPSKXuJfJ6GwZVBHFlKM2DPwo4/cobi42CGX/wvh8GdoYXZz9hm
	AgeVpX2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaqj-003Ojt-0h;
	Wed, 12 Apr 2023 13:49:25 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaqg-003Oib-0t
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Apr 2023 13:49:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id j1-20020a05600c1c0100b003f04da00d07so2271655wms.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Apr 2023 06:49:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1681307360; x=1683899360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bb6P2byqyLNvxYx5mpnu/HADSn0CeAL5J6+dhakFGrg=;
        b=P+Olpx6A3/vNNZTdwI1G9eweBEoTH2LcwW2usLoVzpvOgrv5iZZ+KFMS27g/J/nfqZ
         reVa1Zx0lcjz6/7AlgdAny5ttEg1/A8/XSCvh2l7OO2rKzCVgRxHBPkkemKIOni+lCny
         1THlxhFeo2QlJMDkwR0f/NFAEgK1tfH/W+ftLtUkhnUkFrRnyqeBhWwbh6g6ZChXZS8s
         HI7sgOh5GakN3NTsu2jN1Z8PWH55G04Rj6Whp8gqyK4cGvTzgM+FgKSZT5UUCB/Ye6W7
         BWa3lO6jD0+wwjP/KXSgknZEQUIMW5tR2eS+YesJAdlkZt8k8+BlQiVYPZ8zhiccPFSJ
         vCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681307360; x=1683899360;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Bb6P2byqyLNvxYx5mpnu/HADSn0CeAL5J6+dhakFGrg=;
        b=TYBOht4c88Z2pUYT8Us8SCj0q2nBB8iSM0hEiLcrSz/GvHhCwcehMHCi3QKCFI/w7n
         SkSNeeBgIa0HuSOX0N6y9nh+ZLCGN4ExbmCdCe1i4W9dG6KCjgMd1xtaiCUv7EStac4E
         ovMbgMKwIczUuv7yp/iapYYoIIbC4Ty5fyCo4hzxrhkftit4HcTsttpKTcx0lJSm91q4
         3693LEL8kYqRQkGK6TpCngp+fMKmzWm/WTK6dddal5FMCRNN/TTSjd+elGilgulQk+wd
         VLVNXF/T0XJziMGB73Bm5QDJql+uT/hxiRUEoKt93JVsWxdFGoQY0JGhoeKigj1EFdH0
         f+Mw==
X-Gm-Message-State: AAQBX9eGe/nWYiV9L62/WDRUw8SeLovL0tSyC3GbUn1qjBITuvKc/qU/
	OCBMq6QzTm1BgNtgviR7Mo4zkg==
X-Google-Smtp-Source: AKy350Z5xFXV56UaJrsLbPCn9vUe4kX4KLRpXMruYqeY/5IcZ7js+EzGemp3jS4cE2erPI4Z/lM59A==
X-Received: by 2002:a7b:c7d4:0:b0:3ef:68d5:9573 with SMTP id z20-20020a7bc7d4000000b003ef68d59573mr4733356wmk.19.1681307360680;
        Wed, 12 Apr 2023 06:49:20 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id o24-20020a05600c379800b003edd1c44b57sm2451789wmr.27.2023.04.12.06.49.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Apr 2023 06:49:20 -0700 (PDT)
Message-ID: <de6bd3f0-5e54-7f03-f01a-4095aaf87dd7@baylibre.com>
Date: Wed, 12 Apr 2023 15:49:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH -next 2/3] drm/mediatek: Use
 devm_platform_ioremap_resource()
Content-Language: en-US
To: Yang Li <yang.lee@linux.alibaba.com>, airlied@gmail.com
Cc: daniel@ffwll.ch, matthias.bgg@gmail.com, chunkuang.hu@kernel.org,
 p.zabel@pengutronix.de, angelogioacchino.delregno@collabora.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230412064635.41315-1-yang.lee@linux.alibaba.com>
 <20230412064635.41315-2-yang.lee@linux.alibaba.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412064635.41315-2-yang.lee@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_064922_317048_363ADFAA 
X-CRM114-Status: UNSURE (   7.53  )
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

On 12/04/2023 08:46, Yang Li wrote:
> Remove variable 'res' and convert platform_get_resource(),
> devm_ioremap_resource() to a single call to
> devm_platform_ioremap_resource(), as this is exactly what this function
> does.
> 
> Signed-off-by: Yang Li<yang.lee@linux.alibaba.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


