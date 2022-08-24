Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F107EC38142
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Aug 2022 12:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VIvn4cn38mqmq8WvF2X7y/SBiSVMfGMJeaVNH0qHe9o=; b=kWOIt34cC2A0F2Ya9fekfNEyEf
	luCM0LNzkhUfkTbOO4acneP4OVspohtNxt4W0J+fOuDNKe2CNrikNabyuXsz5cbQWwhssopyVrja0
	MJm4QZ9oVv4x0o0tH8QRvxb3RDgcRDU3m/a+quxaUUYbQUaDwgsrQ51NZTxZDNxX1JdztVtYzxByB
	m4N1/bvQ6CPzrK3byYLeq2Bkv78gGqB5/P/7e7KD0FoyBh23IYChgvJVBUicU41vWmZ9PrCsaUQGn
	yP4Wi3y8Dd/KV0Kllv1AO9Cq1dLXiQUroCVKO50wpK2tYA5hlgo09UpTasO5J3i55rze659bBgeAR
	7Tag+B4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQpqU-00CxQN-TO; Wed, 24 Aug 2022 12:50:58 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oQpqR-00CxNI-RX
	for linux-mediatek@lists.infradead.org; Wed, 24 Aug 2022 12:50:57 +0000
Received: by mail-lf1-x134.google.com with SMTP id l8so6326555lfc.12
        for <linux-mediatek@lists.infradead.org>; Wed, 24 Aug 2022 05:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=VIvn4cn38mqmq8WvF2X7y/SBiSVMfGMJeaVNH0qHe9o=;
        b=myWHpRkE0JHF+tTboHvgSdeq4hDDIDzW3o2/kG40uIP8wBe5Qtf8c4eWWvLeA3qGB+
         5+VAi70dRsuwNRjXlXFZRRi5152W7yHHCTd9A1cYQ07kRzRQCkkDDqdLcsSal9TXUimu
         WHNESwCDBoMe2T4PirwFphqC7jnVY6GXoosXkLj1Qhspt+curOhozmhJWQHIYWA49J0H
         j9ZakInDkVu8bPFMvSuVGx6I5kzlN789kKmwoGcwachUCYbC6KVA8KcaDUH/UksnAdj1
         mtX81dBWvW68wBRbsLgyobXiZ2di4NmNtBQkRko+eStRHi6/WYVFVLyJhlURXaOmSLrE
         IFKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=VIvn4cn38mqmq8WvF2X7y/SBiSVMfGMJeaVNH0qHe9o=;
        b=39aiZq+taSws/cD6rhBIZEpa579RSmgTq4Mx6hHyVWQc1MSME8Rg5dvV/BOH586QZR
         U5kIkgNp4d/4IVzMb+zzl2bk6+++jfBCfIisOEKKLZaIC+PPEZ5FruxKpq4xbj6Y0M4k
         kQbxs5WW4GMDtntYHZQZlJ+RqEey9n5yDqGDgtknNe0lFejLlgSgW6c5vZd78RrCVe9U
         afA7zu3lJLkKU2V/VTr88d2jQd0WtjV43Jjj3gkQtxeOtKAo15pxsiRlVu1PWkxRUKWq
         xOt/8BSO3oHGu+VgG8IADKWNcBT07P8ehtFIKXntfjlOpYKKMwQMVDh5T86at8/cdpVX
         IMSQ==
X-Gm-Message-State: ACgBeo1ic60HkIlvd51MW+ScYw1cVyJozBc+34KrMAq/NoFCcw6JTex0
	G6zlajo1NDRZTB07fNrnMjXpGQ==
X-Google-Smtp-Source: AA6agR7Z/1jGW7Q8B9kfMwTIdCYPqqO+/2YBvt8cNU59/7t5/M6VcYqdYuJNjpfmZf8K+b4Uz38cuw==
X-Received: by 2002:a05:6512:3084:b0:492:f04c:8a3 with SMTP id z4-20020a056512308400b00492f04c08a3mr3618630lfd.199.1661345453600;
        Wed, 24 Aug 2022 05:50:53 -0700 (PDT)
Received: from [10.243.4.185] ([194.157.23.230])
        by smtp.gmail.com with ESMTPSA id v23-20020a05651203b700b00492f294f06bsm1028184lfp.110.2022.08.24.05.50.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 05:50:53 -0700 (PDT)
Message-ID: <58a694df-fb33-dac9-0dfd-eb2efb9abde9@linaro.org>
Date: Wed, 24 Aug 2022 15:50:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/2] ASoC: mediatek: dt-bindings: modify machine
 bindings for SOF
Content-Language: en-US
To: Chunxu Li <chunxu.li@mediatek.com>, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, nfraprado@collabora.com,
 broonie@kernel.org
Cc: lgirdwood@gmail.com, matthias.bgg@gmail.com, jiaxin.yu@mediatek.com,
 devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 project_global_chrome_upstream_group@mediatek.com
References: <20220824122319.23918-1-chunxu.li@mediatek.com>
 <20220824122319.23918-3-chunxu.li@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220824122319.23918-3-chunxu.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220824_055055_924357_A0B97C87 
X-CRM114-Status: UNSURE (   9.07  )
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

On 24/08/2022 15:23, Chunxu Li wrote:
> From: "chunxu.li" <chunxu.li@mediatek.com>
> 
> Add SOF related field.
> 1. Add a property "mediatek,adsp", Only when adsp phandle could be
> retrieved, from DTS, the SOF related part of machine driver is executed.
> 2. Add a property "mediatek,dai-link" to support dai-links could be
> specified from DTS
> 
> Signed-off-by: chunxu.li <chunxu.li@mediatek.com>


Usually first name(s) is separated from family name(s) with a space, not
dot. Looks like you need to configure your system.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

