Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEEE6C77B70
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NzRZEIILpWyKZWJo32FSk8kcuPmn4Poe45kfA2ZbqGM=; b=gnRTZzozRzvObCBJi28dfgj9of
	wTvNqZreX2nziqgqaS3wIogmoNhhyFHjJqmlou5ABBm5wMJ34LUkgoPPq+SJGUk59L5PIazaawOz6
	9dpxpHz9k7UTv3AntggPjnvGA/VcjtMO43VQM01KsyFavpuVilM4buScqTdbfHAJbFZwkecMslbI6
	xbAwr1Ois9Sd2R0X9sMlewERDbu4BPZANf/t7ZGqDak2Plp3CVS7+cS42RGOU2N4DmHzL+IgV9DHI
	0ZUupzsDJyX5GO8+4NlfVNAgyUwf5ARR9NMvykyjndn3n5znRdNcbhJIY653CxTKhHFT4rVWMXpDz
	HItnfpWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEiC-008fT0-2H;
	Fri, 14 Apr 2023 08:23:16 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEi9-008fOj-1T
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:23:14 +0000
Received: by mail-ej1-x636.google.com with SMTP id j17so34053837ejs.5
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681460589; x=1684052589;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NzRZEIILpWyKZWJo32FSk8kcuPmn4Poe45kfA2ZbqGM=;
        b=uozEHOqhsVLQi8VAd0LiVLiIcaJjqdIe0doxfbqY4LrNElfxRSLsWLNNn5zylJUn0h
         lHxL6cLx6Lm8AJU1Qz7HAS25JoY5i+onzAcV4fLv6Z1z39K0Kknjov5Ime2nZn+f3mKi
         qpeInhnvcx9i+yORBAcxGjvqxyQatYSOgfeWUwXBVPHjesc7/k+ZMwA636R6djieJvJm
         vBChHpBBwVm348eRPxDxWYvwS9mjTI/AdRatEsyAsi9HCe2EedzgJwqtMoqjXsiQTI/q
         BSIUkO+iAL745TdY1tYj04jYfu39mDcmIy3b/wqdgvci8hkpq1ezVGuswXsbqQOUKUX5
         cM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460589; x=1684052589;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NzRZEIILpWyKZWJo32FSk8kcuPmn4Poe45kfA2ZbqGM=;
        b=AE56bht8qf7mRvtFijF5P3Pb6vKA3f27noIAewLkRYaMAA4HETdxfoaDrfeNuY5X1M
         hMcVYiCCCiLORZol4cGkurGAmR/r8g38MVxGNlagVxeinBH9RF1ZyLysycnHrtHTK0fn
         L32iTw6w1bbM1Y5FzMOSD/niNcO2iTdY5S3Tqh5sWMbxKZo1Lbi8c8DhcFDddY3nUjp7
         J7pPDR7roeiSmC9Vd9SL/vLBPmZSDzD8DWQ1QCtty8J6nyA2zHQHUZ8wqbV5azgsO/eZ
         99EXGdCy/dNCcL8PcSKA7+9dcDW4kCu9BLzqRkscG9WgxEZWiCk6D8oq1Yp4Wwahn9hv
         U2jw==
X-Gm-Message-State: AAQBX9cHraMV1iAHJxuzrQHYkII0GtmDf8CJr50zPriWg9yiXohY1fAL
	o8EzbVsBQgrLP9+6tc9JOfLddQ==
X-Google-Smtp-Source: AKy350berumbKkfJ41+HfpsbynlljsimfYfJHpk52Z1fKMpG3joFYZsRrgaiLWvTZCpLIyxkJxRVVw==
X-Received: by 2002:a17:906:4743:b0:932:fc34:88f with SMTP id j3-20020a170906474300b00932fc34088fmr5878677ejs.11.1681460589673;
        Fri, 14 Apr 2023 01:23:09 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id me17-20020a170906aed100b0094e002dd3bbsm2094050ejb.224.2023.04.14.01.23.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:23:09 -0700 (PDT)
Message-ID: <2247fca1-ac4a-a1ea-1c06-0e25d19c0eaf@linaro.org>
Date: Fri, 14 Apr 2023 10:23:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 03/27] dt-bindings: display: mediatek: dpi: Add compatible
 for MediaTek MT6795
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 matthias.bgg@gmail.com
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 chunkuang.hu@kernel.org, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, houlong.wei@mediatek.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
 linux-pwm@vger.kernel.org, kernel@collabora.com,
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-4-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_012313_491706_8DA2A604 
X-CRM114-Status: UNSURE (   6.48  )
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

On 12/04/2023 13:27, AngeloGioacchino Del Regno wrote:
> Add a compatible string for the MediaTek Helio X10 MT6795 SoC, using
> the same parameters as MT8183.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


