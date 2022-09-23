Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D06F2ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 23 Sep 2022 09:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AD0vTTxMT9RyIohVOxhCfhEFX/pSVlOoEyWGLFMykLs=; b=nUDZjy1CtUtOUlm8FK9PbOYd3z
	xnL877vVvXm3+IE3R9Hqr4KdrMbJYBaU89Q13y7dIdCSZX7MAysTANecz6rqlueeNETCKJuZtWeUU
	iJoo7ljH5XR+XviPs7y7rDbUwV3m48emtmFEN9TN3VScRsh78JXQK3EiMutA9Z2aDQtdCq0/T3006
	CZM0ndBS1jNCTvcfa0X61uedrOgLFQ6CfLD0Q1QjQ5s56xPB+bhiqeJpM6Mrd4o9srcqacSBni57/
	BWTeDWIwME6nDconou5qw+J6mRZAgg8D1+4K4GX3K378bVcmrrPn+pqat9gvelrbe8pe3Y511dkE/
	/e3OTsUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obf4C-003Mqp-7K; Fri, 23 Sep 2022 09:33:52 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obf3r-003MgP-PL
	for linux-mediatek@lists.infradead.org; Fri, 23 Sep 2022 09:33:33 +0000
Received: by mail-lf1-x132.google.com with SMTP id d42so1280954lfv.0
        for <linux-mediatek@lists.infradead.org>; Fri, 23 Sep 2022 02:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=AD0vTTxMT9RyIohVOxhCfhEFX/pSVlOoEyWGLFMykLs=;
        b=UhkveveyGMsC3fXDaMiw6HTgR5Zv+DbiE61b4ocxMG3/U8cuKdD2iW7i5Yp31yRIug
         QopqNYn25G8AvUp3dsrrwngLRlX/To+TOvIAji4gRf/yIz2Kdc1MOIgN8vLUgBVt+lHm
         cQO80P447qb3+hFff+intrPsHiB14c/0itSyHqIwD4OWn5hamdkRWZusiimZN/b3Xwrh
         iYGQsnjSC8YqCEjq5dtj7wqu+7nP5kfQ9eFe3XcfqSjm7eDvc2lbgQfOja66ySEnSuqr
         N1zckqBM1DuLaI6D9A6Pr1oTdeHId9lk3HPYWxBpeDKihykWbTWrdIRpnO+yEd78UhJe
         xnjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=AD0vTTxMT9RyIohVOxhCfhEFX/pSVlOoEyWGLFMykLs=;
        b=QJS7G6I9bAN5Nn1toDX326GqEBxTp/56Mt6o66n1rVjotE1k1RBu234y8pa+h5xGY8
         HA1V6h8UprsI9qLUFz6b1+47l2IoNX9HHy2hzqaz+rU2gOJjpA/E0rqR0G9RbFTsRF6w
         2r3Z5KIPXpkU/M+cisoD02A4g36BAXUAeDWI3Yo0O+GHptNsCqLfPE2L57QM4nf2F3cW
         wDSCG60BcoVdfs017JG9CLCKnaEI+UxcGpWMObSsnGzfcgaqgMi1FeMIxNXdbMe1U/8Z
         YfUJyb3a2sMV3am+BgELefzT70ISzi2EtwHvAV6spMuG0ud+YEeJZzx7n47YMz80q74q
         FKmA==
X-Gm-Message-State: ACrzQf0I6W4Sj7z8ontWl0r+KN+Hoacm4DpDW2ohXYc6b5Pr4iT2KmA1
	zPo/4HKpMQpB2acc8cosaDhCcg==
X-Google-Smtp-Source: AMsMyM5ItBtaNE5LqPfrqHn/2dI0USL2WWX+6SJ0p7rlNnSh/9j/Nh1IbeRKKJtADpAcudz6OcL6dg==
X-Received: by 2002:a05:6512:6c9:b0:49a:51d4:d517 with SMTP id u9-20020a05651206c900b0049a51d4d517mr2977807lff.329.1663925610119;
        Fri, 23 Sep 2022 02:33:30 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q2-20020a2e5c02000000b0025e4c49969fsm1282517ljb.98.2022.09.23.02.33.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Sep 2022 02:33:29 -0700 (PDT)
Message-ID: <2d4f3740-88cd-c3c4-70f5-69c0a040d268@linaro.org>
Date: Fri, 23 Sep 2022 11:33:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH,v2] dt-bindings: pwm: Add compatible for Mediatek MT8188
Content-Language: en-US
To: xinlei.lee@mediatek.com, thierry.reding@gmail.com,
 u.kleine-koenig@pengutronix.de, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com
Cc: linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@list.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <1663915394-30091-1-git-send-email-xinlei.lee@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1663915394-30091-1-git-send-email-xinlei.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_023331_864224_77DA9246 
X-CRM114-Status: UNSURE (   6.14  )
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

On 23/09/2022 08:43, xinlei.lee@mediatek.com wrote:
> From: xinlei lee <xinlei.lee@mediatek.com>
> 
> Add dt-binding documentation of pwm for MediaTek MT8188 SoC.
> 
> Signed-off-by: xinlei lee <xinlei.lee@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


