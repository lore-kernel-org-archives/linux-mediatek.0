Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF967C77B6E
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Apr 2023 08:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fw2soPX7gkqG1zLnlaxy4FPoDJm7h7PV5yPHWD0C8dE=; b=1xxEUVK2wJ0JIbUXIY1MADRJyc
	Y3QkyPvLAMePUbJCdr69w8J5QNSAwpSKCVktyhHl9ePJ5j9bsk1Wb4eYxdic2hz3IqQFioT4V/9vu
	FTUimJME/JjLw+u4rPn9C+/Uwmm4MhbpBeWl0XyZtaZOKeCJFlE3I16MK/qUWfkSQb5sGiKQJWJvQ
	tLYhPJPrAoKxTQtCbl/y3lHeEsZyr1lp2HGiqhIAeAbHwXmhvHvsvCOs3QO3g3Pusk3HhojRJV7e3
	wIaJWfqG0TgssX3OGsf2Z0pKTDMN4kiPqA3t2t+lUmcYW493o9VIeZtWrl9SdxTMLRmzfcjtbhz7x
	e2ozgjkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEhj-008fGd-0S;
	Fri, 14 Apr 2023 08:22:47 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pnEhg-008fF5-2q
	for linux-mediatek@lists.infradead.org;
	Fri, 14 Apr 2023 08:22:46 +0000
Received: by mail-ej1-x62f.google.com with SMTP id rp27so6697446ejb.12
        for <linux-mediatek@lists.infradead.org>; Fri, 14 Apr 2023 01:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681460561; x=1684052561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fw2soPX7gkqG1zLnlaxy4FPoDJm7h7PV5yPHWD0C8dE=;
        b=FrBtZn2JPfKSOizoc16x5zv6L6PMF/VKB3Zn5fwahF9n7Jh1kc0XqQRTqeKxD9x9MS
         3uUfhNpR4PY5Kx29WjjWcfkqmKDBR94YExPe0ZH82Vf5ApF1qG2Ln4aRvBFZysOhrsSz
         cp9lzWGm/qZIsDkxdC/6azitmGvqhEEhiGtu2Tp26b1y9oIoMgyuyekv6/h9SCepMtLG
         64hYxN8UllvZXSxqrgG4JOHoHVHRxyZY+HaYyquJuxGIltrOgiwix7JcE/jmYz1AbghW
         uEYXHqWhsbwiGhusGQgkORggwjpKOyE2AFwQp2bR6w3KIy7eWhE1jCL1KENx2B5S5BnO
         OTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681460561; x=1684052561;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fw2soPX7gkqG1zLnlaxy4FPoDJm7h7PV5yPHWD0C8dE=;
        b=OR7OxBUA+iETC1Ri8NLt8gOH+a9WjHspJGiEA6Z5AVbhh1vz9GzjQ5VrNffMtvr493
         sHQ5l0bCv6rIvEzXGBYaIx1wnU9HaS4M42tLqFBp2AxHlNDKtko1Jch8cIddoiR5SBUt
         WHdIBFXQrduzUe2Ij1Fto87YyHRjK90f9LNVqplLI8D9IOiEv8wlOSdbPOWQDNUFRnjB
         U09Ugd5cPyIFwD/dNkheTkirDFOxcYI7d5G8zrUqD77Ds+m+mgV4UPlTrcS64kPY1u66
         mWucYQKKfjgAPJCDCtq+r9uPhg8LGT3l+wpOM7KSDVurxcpnbUGxaHqZaDcXwY4rBQuZ
         uZnA==
X-Gm-Message-State: AAQBX9fHvkJ2vB+H3J+Cc/v7w38audErdDaZMz94AXEBjYaGJd13fRRK
	8EimvU/oNv6mwy1oFPXWUSBXdA==
X-Google-Smtp-Source: AKy350ZR6VwGjvDTaRekH/cO9thuWBVNaSAvMXwGsd/aK6bK6v5XYCzSR5T9UaWUz/jtJ7hPHs8cFg==
X-Received: by 2002:a17:906:925a:b0:94a:a77b:363a with SMTP id c26-20020a170906925a00b0094aa77b363amr5558646ejx.3.1681460561618;
        Fri, 14 Apr 2023 01:22:41 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:8a60:6b0f:105a:eefb? ([2a02:810d:15c0:828:8a60:6b0f:105a:eefb])
        by smtp.gmail.com with ESMTPSA id oz19-20020a1709077d9300b0094ebd376fadsm1486449ejc.144.2023.04.14.01.22.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Apr 2023 01:22:41 -0700 (PDT)
Message-ID: <223fcf60-25aa-e45d-159e-6290eeeb6a55@linaro.org>
Date: Fri, 14 Apr 2023 10:22:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 02/27] dt-bindings: phy: mediatek,dsi-phy: Add compatible
 for MT6795 Helio X10
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
 <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230412112739.160376-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230414_012244_942449_BFF5208E 
X-CRM114-Status: UNSURE (   8.01  )
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
> Add a compatible string for MediaTek Helio X10 MT6795: this SoC uses
> the same DSI PHY as MT8173.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,dsi-phy.yaml | 4 ++++
>  1 file changed, 4 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


