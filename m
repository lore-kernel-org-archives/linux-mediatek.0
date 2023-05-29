Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0821CC7EE2E
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 15:57:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kk5w1ZF9WZxiTvHaoko6XuzTV0f3ptf0Wt5suaeuZhw=; b=uHHjUYEWOr4zT6
	kppkf4AZ8kUhkVulRaDlXWW2ANz89PICZqwDgNbo1i44emho2TxOCHdQp2WvQ7/SLpXr1UH5KZvlb
	Tf5SXCXEnDiL9amo62OI+RBCcoVX/GIbhT9+/xxa8DxNyVsesPGLdZ3Ha2MSyH3sapy5BX+E+JdA3
	KGkrvUFAOzKp9MtgH+TTFuhvWxTZQD2THMCUXAfNgpKlX/oZvG9WdBeeJbH+HeacLfUFy6+y6fZGJ
	SZClAI7CY/dCBS5sEjN5ch+SEwjYsXrNgAsMpgoyhuZpHpl0llARNTvdHDMhk+3eB09Xdau8PfbWf
	sVztu6wgWr+oNPK88SWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fFl-00B18E-0a;
	Mon, 29 May 2023 15:57:49 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3fFi-00B17O-2E;
	Mon, 29 May 2023 15:57:47 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3f6dbe3c230so35420525e9.3;
        Mon, 29 May 2023 08:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685375864; x=1687967864;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kk5w1ZF9WZxiTvHaoko6XuzTV0f3ptf0Wt5suaeuZhw=;
        b=D3FMDcuu8vM0YPWs4oaKpsco1HoEOxJnviREkZfLdB7g3AQ8cEKJIhGkXQxnTOVYpn
         a0O3mC4EQUCaPnwVfViJRw7RtcS8Nu3dN3w/xqFLkJ6QRaHTPOFO8LuJO+fCmZz1929/
         V1tFSBn3MmjmXWd/tYJgx0rcm/nJikwQRCW5k1j8Rffss4ZQ/DagBcJuoHfVlvXBu2xE
         Bqmkpwb5Kz3iOqHkdondwhscBmw3KK1auAvvtoWixscLpOlmbFsm739169ERChFZpY2Y
         F/vYH/UjmLbCI0hhbFCJs7PT80tt0+IT95vsDy6mGfhjUzdNgqGkj0tXocu+I5/IjTX2
         XsJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685375864; x=1687967864;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kk5w1ZF9WZxiTvHaoko6XuzTV0f3ptf0Wt5suaeuZhw=;
        b=BmkduSQAdtcjWHGVbKI93cfkLH8gP5FfhCFnVdyMXsdu3QIyCGCya4EJvGel4zdFWB
         XaPzo+NQf/5856IqC4qYnkdoJalp+7jeWXD+/9ridvJJMXO4W8KXWXXEo1DpvM6qFnpJ
         fUchZLUu7g6XHPw2aB9PEdhLYlU5s8tHl6exaheLu6BCxSxLatJZqqSJEviUVk2GyreR
         S5GjNJz8ui2NzUjpCg47MDE/5QkYb1mqSbCzKuPU6KOszCHkIc+0UhViMegBnlJSywi0
         6voz96UYueor2ydgSjnkzfRTy0nw97KLz61YAWnmUOEk//xmhHn1AwCIbQQCihJrGyJP
         KfiQ==
X-Gm-Message-State: AC+VfDy8TUHTLlop/MW/Nixtu0N6UNdwFC96guZsJYtK3rtuWl/BaRLn
	2fX3kbVQQbkwIN3jUNOphpE=
X-Google-Smtp-Source: ACHHUZ4ktgXjLFeIrVQoIdPmozklvLl4NMdrl8nqpHdXz2q5dwcyJpHYEba+bseNdZZtQ0DQAIatzw==
X-Received: by 2002:a1c:7206:0:b0:3f6:e6e3:3da7 with SMTP id n6-20020a1c7206000000b003f6e6e33da7mr10618901wmc.24.1685375864464;
        Mon, 29 May 2023 08:57:44 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id p19-20020a1c7413000000b003f60e143d38sm14673008wmc.11.2023.05.29.08.57.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 May 2023 08:57:43 -0700 (PDT)
Message-ID: <c2cfaae3-5f5e-60e1-b8e4-9584dd20550b@gmail.com>
Date: Mon, 29 May 2023 17:57:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 1/7] dt-bindings: nvmem: mediatek: efuse: add support
 for mt7986
Content-Language: en-US, ca-ES, es-ES
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
References: <20230421132047.42166-1-linux@fw-web.de>
 <20230421132047.42166-2-linux@fw-web.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230421132047.42166-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_085746_733324_BBABEAEC 
X-CRM114-Status: GOOD (  14.76  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Lars-Peter Clausen <lars@metafoo.de>, Lala Lin <lala.lin@mediatek.com>, linux-iio@vger.kernel.org, Zhiyong Tao <zhiyong.tao@mediatek.com>, "Hui.Liu" <hui.liu@mediatek.com>, linux-kernel@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, linux-arm-kernel@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Jonathan Cameron <jic23@kernel.org>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+Srinivas as he is the maintainer

On 21/04/2023 15:20, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible string for mt7986 SoC.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index 75e0a516e59a..e3894f9d566e 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -27,6 +27,7 @@ properties:
>             - enum:
>                 - mediatek,mt7622-efuse
>                 - mediatek,mt7623-efuse
> +              - mediatek,mt7986-efuse

Srinivas, will you take this patch through your tree or would you prefer that I 
take it through the my MediaTek arm-soc tree? It's a trivial patch.

Best regards,
Matthias

>                 - mediatek,mt8173-efuse
>                 - mediatek,mt8183-efuse
>                 - mediatek,mt8186-efuse

