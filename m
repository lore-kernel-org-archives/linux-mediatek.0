Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB1CDC7EE24
	for <linux-mediatek@archiver.kernel.org>; Sat,  3 Jun 2023 19:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c/1fXZdlFrD4ZTMnSyIek5ravNGSg+bm7NeK4UcfZ5I=; b=4uDLxspSg5AXd2hd/2pGKP1ZJx
	YDvAV5asLGHSZF5BKIw4sF4TfVkpPVWeKoKjDxjhmaFSWsLU62acBAE1jvEcvwfwaa0OHj0f9OLNT
	LKY7HJu53FcfrhDpXK1YJWG4BbCqSLMpqh9uUCP7mSwimyQvkbvNHGSWtQPr4n32vqBR1Cs292mcC
	LAWIqvXUJQvCy2bToFBrvab+NALaSGQPAcUrBIXUfC2HwLAWJJKgYGPwqkZ5nC3gUjTMTZ3EFlZye
	wohJtHpvxqA1UwddI+pVDas6Zh8+lIw8q1t+rgIAL3wfA9GpCHwX4TMVeiAeS7D0nBVt0kZDup8GD
	uAuBbMLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q5Wdc-00AODZ-2E;
	Sat, 03 Jun 2023 19:10:08 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q5WdY-00AOC7-1l
	for linux-mediatek@lists.infradead.org;
	Sat, 03 Jun 2023 19:10:05 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-9768fd99c0cso244203666b.0
        for <linux-mediatek@lists.infradead.org>; Sat, 03 Jun 2023 12:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685819401; x=1688411401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c/1fXZdlFrD4ZTMnSyIek5ravNGSg+bm7NeK4UcfZ5I=;
        b=XGWSGPhc+xt9lfYE3ElzKDuGrJr3WUc1F9NreSgchCvhk9+TGEXaB0X+FKeFhLa4Ul
         dBWwVA0PU7u3A9Gb/r9/YacGuXlVlqHEu42aPrlpEXXDzJscOc1SF0ShHSQse0Oj/chT
         QLovyIjmr92pscaSYQIt6uY5CA4K46N++1MwTW+XvEsqSbFTIBJVPKBUnQcFshqSmfQK
         AlKleHL2WPQjWo13ySdvQFAtO3k6DRkLK4/THrSTOZf+p2O7ixH3ctDfYqgLUS+Hg85I
         68k9+su4xAFbe2lICX5JB6tswOOT4SmDCXRpHWHpjtOEseiVoM9V54Gs8SlVtQ7YAqlA
         6tmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685819401; x=1688411401;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c/1fXZdlFrD4ZTMnSyIek5ravNGSg+bm7NeK4UcfZ5I=;
        b=lngopmqikgB+G4QkRJXoJeXL0HhQOmtTzMb+btY5BatfqGgmZ3K/Zbxi4HmRs2KOwL
         hs3Z5duhCixFh8idEIsLdEHGCLSPkUbuIV3tsl4WTizqYhCaGA1LgP4JClZbfdcCCHZa
         iEoqg4z4bIKeQXchl8UCRCvXz+j64H4EiXvDfF2y3VTMhrDxuQx6gbO4Db9+x3fdxBJv
         iQL4pT3Zw75n1bK36jZ1EAU8TUafi3eInMs/2qNTFxCVDMMMCY0gcN1kHZdaqP7QfmIU
         vyRZjGzaGvo4QvAngUMQ5lERgwHmddI8SBVjOgw6aL0W7LBCH2UIrAAEicV7N+ROTsD+
         AFUA==
X-Gm-Message-State: AC+VfDxylqU6vY7kml519dYKsJZNWzFRUY9WwjcybCa3d3CN8+IqUPc4
	xPr/+tTswNgAr+7E3IxZN8+25A==
X-Google-Smtp-Source: ACHHUZ4RopHcJJ7GF3SSU2ePLu5DlX+l9IkWhVj+EuFjvR5yyF0baMdpGCWtH8xOXILm4qx46Z8pUw==
X-Received: by 2002:a17:906:5d0a:b0:974:5bd2:1807 with SMTP id g10-20020a1709065d0a00b009745bd21807mr2096976ejt.24.1685819401691;
        Sat, 03 Jun 2023 12:10:01 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id bi1-20020a170906a24100b009664cdb3fc5sm2218126ejb.138.2023.06.03.12.09.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Jun 2023 12:10:01 -0700 (PDT)
Message-ID: <d354734e-c8d1-2d75-fec4-e91bb322bbe2@linaro.org>
Date: Sat, 3 Jun 2023 21:09:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: add PHY_TYPE_CDPHY definition
Content-Language: en-US
To: Julien Stephan <jstephan@baylibre.com>
Cc: mkorpershoek@baylibre.com, khilman@baylibre.com,
 Andy Hsieh <andy.hsieh@mediatek.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Vinod Koul <vkoul@kernel.org>
References: <20230524083033.486490-1-jstephan@baylibre.com>
 <20230524083033.486490-2-jstephan@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230524083033.486490-2-jstephan@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230603_121004_637935_F426E23E 
X-CRM114-Status: GOOD (  14.34  )
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

On 24/05/2023 10:30, Julien Stephan wrote:
> Add definition for CDPHY phy type that can be configured in either D-PHY
> mode or C-PHY mode
> 
> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
> ---
>  include/dt-bindings/phy/phy.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/dt-bindings/phy/phy.h b/include/dt-bindings/phy/phy.h
> index 6b901b342348..a19d85dbbf16 100644
> --- a/include/dt-bindings/phy/phy.h
> +++ b/include/dt-bindings/phy/phy.h
> @@ -23,5 +23,6 @@
>  #define PHY_TYPE_DPHY		10
>  #define PHY_TYPE_CPHY		11
>  #define PHY_TYPE_USXGMII	12
> +#define PHY_TYPE_CDPHY		13

I don't think there is CD phy. It is D-PHY or C-PHY. This is not for all
possible combinations but just types of phy.

Best regards,
Krzysztof


