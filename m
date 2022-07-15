Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 322E2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 07:36:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqhVEUWoJhyGaRXatPdO6jF7+Eft9kIRbLVR6FWlzs8=; b=DTjmB+B985nnlkyQevAYGGpJ7r
	jqPeUS7hVeL/g5v4falw4usT/EH57UEYO0onxDgMu6VNQ440PPstYBLYXGWP13oDAxJIsr5oo6Q0M
	llJtHTu35XKcAcpaaqwDSKYIAYxI3/wWRPadJdiWNUpuwxKUp8tGtz0DFqD1BjEAbHwMh7U7L5uSo
	jML9iAQBpBzASYdm/QMy7ZnIA62ZiYIkQxTTM5UmRK/LjLEkXWMOsmJaNCZ+PB4qr9Do3LL09iM+i
	YafyT2pgzmx0SIFT4QmxrhkYSXNfK6YoWzOvtdjK+pGlIpGtTASk1967RBUTt0dFS1yg3jurOqDQh
	KFFD7ZIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCFro-004wHa-OC; Fri, 15 Jul 2022 07:36:04 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCFrl-004wEy-Ch
	for linux-mediatek@lists.infradead.org; Fri, 15 Jul 2022 07:36:02 +0000
Received: by mail-lj1-x236.google.com with SMTP id c15so4848356ljr.0
        for <linux-mediatek@lists.infradead.org>; Fri, 15 Jul 2022 00:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=mqhVEUWoJhyGaRXatPdO6jF7+Eft9kIRbLVR6FWlzs8=;
        b=qjvMjtSFhMHa6WnM74siqopulg6O3rjmx3IiBooXy24W/I4PZDNd+xl+uQGyiC1DZb
         lWSfhBY62FfqUJPPAXUjczFT0aIo4m6S8H0G2jRVq8b5ye6HG/pii+GGvDCQtIvh+fnO
         XRT06LG1Jrsu9wN0TpvNrdx+gSWPx6A80gCufY3qCCovtvtHOgGRPlxsaSSmDvfOs+Kx
         8gMkrLffn5LHOlrIxv7+/xe1caZMYMya/z7j91Oec0mGl4cN/XYqMSkWSqkbC9ckT/LP
         CPFq0oj54KUPsoZaR86X2Te9VAE0jtoZgM7Td6AvTmm6RDdgwd5pakE6FUb5ZdfDhFkV
         uNXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=mqhVEUWoJhyGaRXatPdO6jF7+Eft9kIRbLVR6FWlzs8=;
        b=6Diky/BReg09PHl3J/nxpRKAy1w4L30zheUDXguQ/Ni4TkXQpSap58vZHR9mQRMRsh
         59v8qXNx0PXIT/+NiZGdLd+rQUXrh08vLSdw8pnoqR26YuVpd72PNGvNUkcSwfQ3X6Yd
         21TDbLtXXxwF8vol27sXT1WVyvIWAvgr7xqy3cKpdDet2Lsui3IlapreuVJCi0mtr8wn
         /s3edIlDJjH9CY21T8qHynGewgppRk2N+3CE0KBlpMyalIjLpVVKXrIfaFWW8fcZV1to
         kpye7NwUaNzIaDGKV1dRVl2Qcd6Eu9uurJn85W4m9FyHUDkARPFKyZr1Sj7pWHeLYUJT
         b4HA==
X-Gm-Message-State: AJIora+lWjc7LWBZfPk2wwVrTO0xhUbckgchjyrkEz5aYSkIrJous5Xi
	RHhcjGg67TU9EDkmiwRiqrc1/A==
X-Google-Smtp-Source: AGRyM1tOzrr9Yq9VEdfdXk1wmZFGhIc3cdIcL/0dwI8mv3a3rDX0Kkzg3QqLlEmjX7QvHubznwMfXQ==
X-Received: by 2002:a05:651c:1a0a:b0:25d:a17d:9c23 with SMTP id by10-20020a05651c1a0a00b0025da17d9c23mr1419736ljb.480.1657870558571;
        Fri, 15 Jul 2022 00:35:58 -0700 (PDT)
Received: from [10.0.0.8] (fwa5da9-171.bb.online.no. [88.93.169.171])
        by smtp.gmail.com with ESMTPSA id 3-20020ac25f03000000b004790a4ce3e5sm771300lfq.278.2022.07.15.00.35.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jul 2022 00:35:58 -0700 (PDT)
Message-ID: <9f8217f5-7369-0abe-cf8a-d501e163580f@linaro.org>
Date: Fri, 15 Jul 2022 09:35:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 02/19] dt-bindings: memory: mediatek: Update condition
 for mt8195 smi node
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Lee Jones <lee.jones@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 MandyJH Liu <mandyjh.liu@mediatek.com>, Weiyi Lu <weiyi.lu@mediatek.com>
Cc: iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220714122837.20094-1-tinghan.shen@mediatek.com>
 <20220714122837.20094-3-tinghan.shen@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220714122837.20094-3-tinghan.shen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_003601_461850_6551717C 
X-CRM114-Status: GOOD (  10.38  )
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

On 14/07/2022 14:28, Tinghan Shen wrote:
> The max clock items for the dts node with compatible
> 'mediatek,mt8195-smi-sub-common' should be 3.
> 
> However, the dtbs_check of such node will get following message,
> arch/arm64/boot/dts/mediatek/mt8195-evb.dtb: smi@14010000: clock-names: ['apb', 'smi', 'gals0'] is too long
>          From schema: Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
> 
> It's because the 'mediatek,mt8195-smi-sub-common' compatible incorrectly
> matches the 'else' conditions for gen2 HW without gals.
> 
> Rewrite the 'else' condition to specifically identify the compatibles
> that utilizing gen2 HW without gals.
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof

