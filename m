Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1856CC77B7C
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 May 2023 13:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88pW8qWBWl/gwLo1P5APo+OBYDB/KVhHfdTYqAO9eAY=; b=e12N8lL473EyQGj5scTqKXFpqQ
	iLu87tSar4slZI/MMey4ZV5FJxjgYOHnqMHPiuxI91Z2rKaobVdUwm+rMg8KLNggGACPAE0hnoC4g
	279N4ZeAIuzzouSnI1sIrtTpvz2yvX5SAKMiBwki2wI/0ZKCJhS3SBjuA+y4ubj2l6+kAJoUwaR8S
	1okbZ3h6zXIQkTNMPb8s17yunDFvjpWhxjfjxbdYKRDRDYNbgpJp1ClsmxaGMe3jt2TKNaWufXD5j
	a0EdkGqssI5cdbTN7V55+LZF2GinIqDQ8rxwVgGCbl5OTX1inJ/iorUQPfFzZgWS6/32fNqKNTwMh
	Olom2Trg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puvQi-00Az3l-1z;
	Fri, 05 May 2023 13:25:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puvQg-00Az3F-1X
	for linux-mediatek@bombadil.infradead.org;
	Fri, 05 May 2023 13:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=88pW8qWBWl/gwLo1P5APo+OBYDB/KVhHfdTYqAO9eAY=; b=Db0euFuFrwzJ48QF2u2384M/ag
	sljRtKEMAJw6MQXon7CBD5MYsQ7KB47k2HoEoJpjkMTY61UY19Sw7DKYZeL38Zdi0VIBPNNf9lLJc
	ys/z5QYJv2KmuiturzFNRUyd0ym9CA9bYhG2AmOgM1zv9vSU4KVuWWNRdUdM1gNoEb9JAu0Xbg7PX
	Z0Y3t65QhUuaLzxnXwyEQnDqvEVGMd6wdyV1C0tm3aTg78xAVjUg3/+jwOWjAst8vz237P1rtwOrN
	Fb6GEb0BVQxoASphCLmkKZjPz6KCeigUfxR2YCN9acl+tIL2T5DPXiN2v3kiumFkaND5rAVbMgQWi
	2ris3prA==;
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puvQb-003GA4-0M
	for linux-mediatek@lists.infradead.org;
	Fri, 05 May 2023 13:24:56 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-50bceaf07b8so3379211a12.3
        for <linux-mediatek@lists.infradead.org>; Fri, 05 May 2023 06:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683293088; x=1685885088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=88pW8qWBWl/gwLo1P5APo+OBYDB/KVhHfdTYqAO9eAY=;
        b=AYnqjAD5rvuD0ZLSQ5l7Hx9KJ9x+C+/56HPgqiMC3wy3USc+lyae/7wy9iNF7t0vxb
         lvrAaaQBdc0S1YkRVHZo+0sD3UDvZNQSkuwx6CPFfAUibMm1mHqyPM3TMSp351Jn6VIt
         VrwvYV30SSKTYqbhmhusdZFioAnNVpYUwfVWEwLuG11XE9PNhZcecwjcCY9Erbtv5Uci
         FHYoc8dBhR6TNPell11XM5U3IEOj8EjSZfnQQpI5Rlzhy3y9OnheMWlcHj+ztw3baaDJ
         PIuHKw9ZbJ/toYNj6//FTWJMhfHsi3HUbmsWXGeWMBjxmNcnAfPDv5rAZ3pJvbLAKiNv
         r/cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683293088; x=1685885088;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=88pW8qWBWl/gwLo1P5APo+OBYDB/KVhHfdTYqAO9eAY=;
        b=Oe0ftxD3DQksbirNgoww5BOR42fB0Z0HgoJ10CumksjaKsD/+a6CxhFd87aSygmnAh
         XHYDYOkNrTSTKk8l39AOJ8/2lFWlZd77Z3t92AA2IsYOLXQz0YkrKYzBIOGX0CPoIizF
         MkzVvyvvllUHv+Y+aKxX2AYdXvwhs/1htK0lSYG+mDFyGR1gM4/CpaNNH5N6c9KAurKe
         k6rlKZgw64wkO51eGYq/Drzs3oGaGVtLudMmHRrfywBzpoITsTf37nNwet9cxsZF4T3E
         XwDnO+rVPPFv/WsQAEZfw7d3JgFqmte5Ju4RACJlWlZUuIrMicVaI9R8SENMEbfD0hcx
         MzTw==
X-Gm-Message-State: AC+VfDzS/rwkcXMPcgrYAEfB9+14C5j/eE9I9aekG6TjhXUB+Wjibrcf
	i1wkDcd6aYfgCdtiCGjeLOCcNg==
X-Google-Smtp-Source: ACHHUZ7tE6qiopnAwq868iND3B4v8MQrCg6KKrBzkP+dMPCgtv9gp6t7xiaJTraOtyF4Q0MGc7vvBw==
X-Received: by 2002:a17:907:7d94:b0:961:b0:3e0e with SMTP id oz20-20020a1709077d9400b0096100b03e0emr1314712ejc.30.1683293087751;
        Fri, 05 May 2023 06:24:47 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:52e:24ce:bbc1:127d? ([2a02:810d:15c0:828:52e:24ce:bbc1:127d])
        by smtp.gmail.com with ESMTPSA id i19-20020a17090685d300b0094ebc041e20sm930557ejy.46.2023.05.05.06.24.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 May 2023 06:24:47 -0700 (PDT)
Message-ID: <6582da01-03c0-77cf-9646-fc536ceb9b3d@linaro.org>
Date: Fri, 5 May 2023 15:24:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/2] dt-bindings: reset: mt8188: add thermal reset
 control bit
To: Runyang Chen <runyang.chen@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org
References: <20230505131308.27190-1-runyang.chen@mediatek.com>
 <20230505131308.27190-2-runyang.chen@mediatek.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230505131308.27190-2-runyang.chen@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_142453_277464_8DFDAE5B 
X-CRM114-Status: UNSURE (   9.14  )
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

On 05/05/2023 15:13, Runyang Chen wrote:
> To support reset of infra_ao, add the index of infra_ao reset of thermal
> for MT8188.
> 
> Signed-off-by: Runyang Chen <runyang.chen@mediatek.com>
> ---
>  include/dt-bindings/reset/mt8188-resets.h | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


