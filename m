Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAE1C54EBE
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Jan 2023 12:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lM60jB5CeQGfmEnmDWStP3rhRDC4AugryFBW67wjBxI=; b=j57gGuEhn6zL9FLzudx+CTXOfF
	8bdFQum6nJVU9+cR7wSfpcA8PHz5ooCi/Fe5nAokmiU4uQqhK/SG72hi6igwRcXnkTr1KYXocI5LK
	z3TScAazMx077Nm/brjS4nrbBgmHY9pXsvHwtQ1uOe6RTjsqqdNGh99o0UorZEuHcGVhga6inYU/k
	LVOzyvjD2TqgAh85sGNZm8JfeIhDmn9vNtYAYCpMd+mc280x80FpxbfY4vovD38Euz0sISHyZBXWv
	aR2thQ3y+lnxi4mRt9hwDkxbdb6M5Z+Ekw6f2eeG6bV1lp40XLXGgqmRxleOTVFK3RqnY9tFhxKI5
	VpPkK8dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGInt-002ReO-P3; Fri, 13 Jan 2023 12:05:01 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pGIiv-002PNF-Ei
	for linux-mediatek@lists.infradead.org; Fri, 13 Jan 2023 11:59:54 +0000
Received: by mail-ej1-x634.google.com with SMTP id v6so8780916ejg.6
        for <linux-mediatek@lists.infradead.org>; Fri, 13 Jan 2023 03:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lM60jB5CeQGfmEnmDWStP3rhRDC4AugryFBW67wjBxI=;
        b=XaEEC5PZdtcHMQ7EV4jsUpXyAKWlZi1l4EUZI2/t0KdEhJEZf2pRJWdFEIkdkcDAWS
         hNEV7yYATrN8TE65cpXj9S2cI4rY3lprGDk7RPsbQOJksOYrf1rgDlUaMEFheiLIi4OD
         gWtrHp+p+t2y56+Yea4IE2kMNDXtC70yZeClRBMZlYzJtYebnmDQ4bQhCF1b4G2wsRz/
         G380H320AapWZ74/58MqNsqQ+fk8UBx12uOW6598WiU94HbxImN/oMGdjBUgiOBt8ayG
         uhtGX2OEQrV7eSCTy1NKbMMxVouHv2gLlXeJpaDffQ+hpsNJGXloKDm3l4SNRRp/uCGE
         IvpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lM60jB5CeQGfmEnmDWStP3rhRDC4AugryFBW67wjBxI=;
        b=fdvMl+x+NkbKFYqUXYhEU0GF7b17PeKKAViya8xRHwQnWgnYPgsCnzCq9D2xVyHUYY
         0Y6GJkMKYaWgtKYMpqczXk9dETQr9MeMhX1Hnsu71l9/loGqxPRKZ6gUYCloC+XGlVls
         /NvNBPddPSUdzeoQlz6i+thmPHuvmf5axnmWo4a+3oOw5FnRexgTk6YKLeN5vATErATE
         nxryVYad0rjUphXcWwklkIncpqAOoSdzHkfXZdnibUsDGAV/i0VWr6NBlhg8k0+G7wOw
         SXpQqJ7YK++h2fqUBoRpEO1UShBSiOvBpnAZhwFR9BCFsQHXK/ANlrBEd+ggwgFojT9T
         rDjg==
X-Gm-Message-State: AFqh2krFUXtspYw/ET8nZDTRM7CcfRZ3udpybngSv3kgP9TbXrOjwSS0
	sVqiesBvVfJBBTov3jKx2dE7IQ==
X-Google-Smtp-Source: AMrXdXvHFuBXHMVk0hBzhEM99tOU+VIvQ/ZKfYPQVI98WQOjRvcco+YhoSpAcYKvIxwXWJifbqXL3g==
X-Received: by 2002:a17:906:99d1:b0:7c1:12ef:bf52 with SMTP id s17-20020a17090699d100b007c112efbf52mr63943919ejn.3.1673611191261;
        Fri, 13 Jan 2023 03:59:51 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id kr12-20020a1709079a0c00b0084d44553af9sm6417588ejc.215.2023.01.13.03.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 03:59:50 -0800 (PST)
Message-ID: <d16ed246-86b3-7837-845d-ba33dd61b482@linaro.org>
Date: Fri, 13 Jan 2023 12:59:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v5 02/10] dt-bindings: arm: mediatek: mmsys: Add support
 for MT8195 VPPSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230113054304.21841-1-moudy.ho@mediatek.com>
 <20230113054304.21841-3-moudy.ho@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230113054304.21841-3-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230113_035953_527869_36379410 
X-CRM114-Status: GOOD (  12.95  )
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

On 13/01/2023 06:42, Moudy Ho wrote:
> For MT8195, VPPSYS0 and VPPSYS1 are 2 display pipes with
> hardware differences in power domains, clocks and subsystem counts,
> which should be determined by compatible names.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml        | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> index 84de12709323..27d2631d43d3 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> @@ -34,6 +34,8 @@ properties:
>                - mediatek,mt8188-vdosys0
>                - mediatek,mt8192-mmsys
>                - mediatek,mt8365-mmsys
> +              - mediatek,mt8195-vppsys0
> +              - mediatek,mt8195-vppsys1

That's broken order and I did not ack something like this. What's
happening with these patches?

Best regards,
Krzysztof


