Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8303C04A95
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 13:51:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hiXTBIxGK2t5txUBusQYuhQcGX4TmO1rhGy37Hdf2JA=; b=BJBMyI2mCw/zCW
	gFaicXtBkxnEnP9q4idf8W8JPZvfjyrwjzPYJ/Eo5Kfz0wOItuyP22bGgaV3CrHkuFLv8w1uPijc5
	a9w+iq1G8c/4tkJkmtSzHpLygYyalM7k8YVRO8XAnyOMKAVn1zGn6SaFJKo6Ybw1OfTsJoB/VDeNG
	t09lNkMATSIlS12tAMM4fc5WrZG+ZYE0RLtIp5KSyRyl1Z2DMohJbeYjzW/QpSJUACTHq5iJe4tSo
	M+MrlOQ0ZEnX+xBzwotKNf6uv3iYCemdksammBTmCLaonb0UEZMGIMBxFOpb66tTAbgVbKzEe7K4K
	SDaqM6ThAxshAJagSZBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onKLH-005a0Y-RY; Tue, 25 Oct 2022 13:51:43 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onKLF-005Zz6-43
	for linux-mediatek@lists.infradead.org; Tue, 25 Oct 2022 13:51:42 +0000
Received: by mail-qk1-x733.google.com with SMTP id o2so8031485qkk.10
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Oct 2022 06:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hiXTBIxGK2t5txUBusQYuhQcGX4TmO1rhGy37Hdf2JA=;
        b=Sy75r9oaFQDWQ861B3wpDbhx48jsZ91GQwb1V9jtLdb0fJPBRF9sWKv/vUqoZRIRt/
         ZoTLEFflqwJGrqwjgdI3rQAALaUUqOU0Cmf8YNyCgrLdAoOr6iGAv22dol71RNj9y4MO
         C4YuV+0/1Z3xBU1pTrXP/hO+odmt2uyRsupbUWkTlnN7rCZ/kBQ5u9XmM7vYG9n3Ha/a
         BhOVqqOy3heRCb4cs/aW//nd4C3f4g2y/7+kZObxeSCmvB72s3P0oTHRvxd39Ojaf44C
         InKVAZ3F16xPJA9ICpDgeEukM74I4JiovMI6QB5upqcfS2TGZt6ZypXS/MTwkWSGQ1ta
         wO5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hiXTBIxGK2t5txUBusQYuhQcGX4TmO1rhGy37Hdf2JA=;
        b=B/DD3OMt/xcW+z+NhjYk8o8Sg4nKSZTp8nDmqWJOCMQrkwxohl5LLMjX/pvlGu4OVN
         hgCJY1/fj95Wzujl+s9T8pRlSXRCr/ZTdkxEWtxzVUu/WHggLcT93xgCn0m2E3V1/USj
         ZJ0rZ12QLTceAR/kIq4SgXqgjtbrBFAk3Vuq2dosIBY1pU9LyFRRWo+WUqb/hszmUKXA
         WqwcQEXfTJxs3s5FMGCjZMVWbA8uNxTb95B+vcOP06Mzj2RlAzFuUYvv08nGzrp1Ccjc
         q83T1iPqhhXgVbV4UqpUDMNJIuhnn5jvHxdm1tmJad+A/CxULxXCP9HwILawbe/yo62m
         MU7w==
X-Gm-Message-State: ACrzQf3c2efeb1n7dnuvipa9oGo9myviFG/w40yGSAHh+lsDhevdE+je
	K7bdNd9ve2Um/YSiB/qvG6aZXg==
X-Google-Smtp-Source: AMsMyM7Es2ToCl7355XkI7mwGX8iRulCB/ilcwJ+dOH/F3DEcOMkvtbZTVso1pxl4RvSr/chaakG7A==
X-Received: by 2002:a05:620a:4245:b0:6d7:6d51:f66e with SMTP id w5-20020a05620a424500b006d76d51f66emr26370218qko.617.1666705899534;
        Tue, 25 Oct 2022 06:51:39 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id u7-20020ac80507000000b0039cc47752casm1609741qtg.77.2022.10.25.06.51.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Oct 2022 06:51:38 -0700 (PDT)
Message-ID: <0a9a8833-f664-d3b0-7194-069845512ea5@linaro.org>
Date: Tue, 25 Oct 2022 09:51:37 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v5 2/6] dt-bindings: mmc: Add support for Mediatek MT7986
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
References: <20221025132953.81286-1-linux@fw-web.de>
 <20221025132953.81286-3-linux@fw-web.de>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221025132953.81286-3-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_065141_196349_86802022 
X-CRM114-Status: UNSURE (   8.83  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>, Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>, linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Chaotian Jing <chaotian.jing@mediatek.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 25/10/2022 09:29, Frank Wunderlich wrote:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> This commit adds dt-binding documentation of mmc for Mediatek MT7986 SoC
> Platform.
> Add SoC specific section for defining clock configuration.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v3:


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


