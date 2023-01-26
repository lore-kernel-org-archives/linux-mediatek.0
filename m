Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13AC3C54E94
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Jan 2023 15:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2DtWIPpTLIQ8C+gywhpHGRhGc3/mNomrJy1W49Sq1A=; b=kQddqDBZn4JHqEQTlEJmLAh3Ri
	2kxoQ7gabNabrsEfXq/qI2QHWnmUCq1q6006u3TsL1e8yT804yBajIZ5ZvIimpU/vOu2jVIhH8BJ0
	aa5ZPUksykSxO7Vc6LlkAD3/p6ypd9tDa7SbXmqCs+M33l2P7fhGZrV3djp3J81KGnJ/oGTLx6jPD
	5z0w+6iFJ9rrWPOWa8qBHIzH3+NWTXJw/ww0yAKaJwBvDXfr9Y/3iDK9DXdk2ZAHbr/ADFYE/JNZx
	i8CTUqMcNzdsz7gSCnNOalSHSk0DsOWgV/ZDUZ2y68m9g9DzHDtqPgBv5oIgy9uVeM4wPLB/9buFQ
	Z5Uec89Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4G2-00BXxU-Bj; Thu, 26 Jan 2023 15:33:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pL4FF-00BXbr-Eb
	for linux-mediatek@lists.infradead.org; Thu, 26 Jan 2023 15:32:58 +0000
Received: by mail-wm1-x330.google.com with SMTP id m5-20020a05600c4f4500b003db03b2559eso1365304wmq.5
        for <linux-mediatek@lists.infradead.org>; Thu, 26 Jan 2023 07:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x2DtWIPpTLIQ8C+gywhpHGRhGc3/mNomrJy1W49Sq1A=;
        b=KgzgTfZpE6hK1mWgepzyISXPkXP8x/G8JXTtkwpXboYIOqB6GJR5yYyOPl9/pJ22NC
         29PKCe2JmwPqgLqidpMMsKfD9A+f14TMlhFhIiEJvOGOAX7bdtVEhw1jMK6qWIqaekhg
         0dOApjm2qtgcAxc4QlESmFe4R+xZorXgDW0Hy+Vr8RoVkz4LT6SvXLoV0QFkbqXaqgu8
         qGRsqceUZrc6cIUfgQ20stb24YXIAYPGRCpg0nPc9AgjB3vfBc9OqDiKm1UAncjEubyP
         KG9Nq6FxTEiApyb9hQAL06wbrdIyCvbZX9PACAQWDctL3ZJs4bdzlYWA0hfONJmgpFE0
         85fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x2DtWIPpTLIQ8C+gywhpHGRhGc3/mNomrJy1W49Sq1A=;
        b=ITRuL1/cUe0r2jHkbKwjLMTX2rJqSKv1MK/RYenVN158qRh9HrGO1r6LK7xRXHByRA
         c8RqyaAFaXHt2w+Xr1xmypYQkBf9pJ+uf46woX/ATl9QnGcqyti+pnDtn45R34HYIrob
         ZeMLJB/dSVb7GZ8oY21NTDvAwk7unGwGNGn23KMy3s/jRD9llnvceXqNweRLQ8l0Xc1n
         tmXzP9vzcgRIu/jWaEm6AUOK4Jh1DGxToo9s5KH5e1Zlcwl8lzTHVfqdrV0tqVFvCfyt
         1wgYZz8rWJSEtlOCGYI8r8P/OGJmZtOOAI56q7T67wT9Wr6JIoOjNjkmuMCEcwM0pJuY
         88pA==
X-Gm-Message-State: AFqh2kpQtl6dKZNLyQBfWcqOGmILU6rkmOBg4ph/g7+g/ruLOlQ/yyF7
	e9rvHuonPuroV4P92aLqKtnrxw==
X-Google-Smtp-Source: AMrXdXsqi25krBPlSUs5ENxJjNmAgCxXPeRBz6P/pTN/p+l4BDGKLDq95pWNDOquzcNuENVjQFJKcg==
X-Received: by 2002:a05:600c:4e8d:b0:3dc:b0e:1e44 with SMTP id f13-20020a05600c4e8d00b003dc0b0e1e44mr12505410wmq.4.1674747173394;
        Thu, 26 Jan 2023 07:32:53 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id x26-20020a1c7c1a000000b003db01178b62sm4947527wmc.40.2023.01.26.07.32.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jan 2023 07:32:53 -0800 (PST)
Message-ID: <4bcf8191-fe6a-7229-9ebe-a79cebdce87e@linaro.org>
Date: Thu, 26 Jan 2023 16:32:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/6] dt-bindings: clock: mediatek,mt8186-fhctl: Support
 MT6795, MT8173/92/95
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 sboyd@kernel.org
Cc: mturquette@baylibre.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 edward-jw.yang@mediatek.com, johnson.wang@mediatek.com, wenst@chromium.org,
 miles.chen@mediatek.com, chun-jie.chen@mediatek.com,
 rex-bc.chen@mediatek.com, jose.exposito89@gmail.com,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230126085321.87267-1-angelogioacchino.delregno@collabora.com>
 <20230126085321.87267-3-angelogioacchino.delregno@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230126085321.87267-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230126_073257_517163_812133B3 
X-CRM114-Status: UNSURE (   7.08  )
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

On 26/01/2023 09:53, AngeloGioacchino Del Regno wrote:
> MT6795, MT8173, MT8192 and MT8195 support Frequency Hopping: add the
> compatibles for them.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---

... but you already had here an ack.

Best regards,
Krzysztof


