Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A9AC7618D
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 19:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bum/yWGbHMLt1EOFHvTWnBxq9eD7t+qsjTNeqkn9sM=; b=IwsT/vewGiIaF+CGgy2PWx12v3
	XqtrvXPZ6lmSklllHojpLkxod5pKvBI8Q9aTxg5jdDpYxjSJs7LJuusQp8Uoo+p1V54sQcJfeWoGk
	D3pyvX1qbnthiHhQuVsAZsVn8UKXzbRegPnVdY03N3EUodgwUVO/tDCeHzvEA75y4gfEPBO4J0Zdb
	K5YSkfyn8hQKvEURyMCW80dHtpCIbbbqVpbk6hXib+i/82rOwtuO0yLqRdJLtlxZNBhWg9CEUXNd0
	zsANmuDnTU8uFkY48yTPCye2mcSn9Vwh8Fgh+74H83fsoo6BIrfdWBLrWdx7QGeOAGlg2i+kpqvU5
	IQjMVJeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUqo-008Kru-1r;
	Thu, 06 Apr 2023 19:00:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUqm-008KqR-1j
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Apr 2023 19:00:49 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5002e950e23so1337994a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Apr 2023 12:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680807645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6bum/yWGbHMLt1EOFHvTWnBxq9eD7t+qsjTNeqkn9sM=;
        b=CaFz4Ll9HSjfp9WnbEfCJKng1D3GwpCX+2GMTfWMCanvgwMkGmhKqx5zCQZi2RbeVQ
         PUMEyb/sY3anAc1WS81l0nuGAEfUD5O5FievJS1stvUVJWI9e0CdYWaExKN0j5hoxc75
         M4wgqR60SES71Pbaa2Skjxn7n/bJkRelRp81p+H/NYrJQFYxi+ocQSqOHnm+f9pnNsli
         SM31YE2ySEoKy5AystZv3bXJUio/O/of9wyckuwfzMxwyXgh6lDWkzdtA15JSM2SwjA1
         PctiWbldVGJ4Xad6V7SbdPdCxu5A4aKA2xtjL3NnSlm0LqADLY/sYvMVr60fVJXtAnd+
         Gjyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680807645;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6bum/yWGbHMLt1EOFHvTWnBxq9eD7t+qsjTNeqkn9sM=;
        b=1ra0TXjduZEVSCRT/iGzapVlPyNA702aEYvZeGuaRdv8CJ7aykzQmoh/sK0e/0JXgR
         8Kd/lsbVasp/MZpJcHGbVk2l3A78hBKwBc9iL3yBPjq9t1+X6qZxwzuJjskWoLHn7POS
         kjVvx0ISoKbltRbKdxP0d/EYoNjLGzaVlHSpxPHfjq5HETdcEDm4FbsFJ6DbSlGmeYBW
         nk/21qM0IQlLSiZcKLtpfIOwFIq/w7Bz4Jiyv6tmMYicW5lHpagzuojjbnfjaXbW9/NZ
         l7ijhQ5X5T+7PKTyaWhou+LD37VtSz21T0xOThLInQBU/h00bcPAmOQgZOiYMyg5EoCl
         Ftug==
X-Gm-Message-State: AAQBX9fv+2QHfZ2SGOf8HffYVUU2BtIOw+hk66d+I0/T1f5iJ91qSqJ5
	YiMopISS+UxAj8qdrdq9Cu+akA==
X-Google-Smtp-Source: AKy350Z8stGIoN0clalRjlcrw4YuEeDel7GzxJhI8mHMUqprxubCAqKxoonftbqeyBRB5AZPNECy6A==
X-Received: by 2002:a50:ef17:0:b0:502:a6b3:6e2 with SMTP id m23-20020a50ef17000000b00502a6b306e2mr561489eds.3.1680807645684;
        Thu, 06 Apr 2023 12:00:45 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id e14-20020a50a68e000000b004bb810e0b87sm1071884edc.39.2023.04.06.12.00.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 12:00:45 -0700 (PDT)
Message-ID: <678d5752-b5c8-dd21-9e43-68f4d4e674ee@linaro.org>
Date: Thu, 6 Apr 2023 21:00:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/7] dt-bindings: net: dsa: mediatek,mt7530: correct brand
 name
Content-Language: en-US
To: arinc9.unal@gmail.com, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 erkin.bozoglu@xeront.com, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230406080141.22924-1-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406080141.22924-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_120048_572294_BDC42CBB 
X-CRM114-Status: UNSURE (   9.51  )
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

On 06/04/2023 10:01, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The brand name is MediaTek, change it to that.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  Documentation/devicetree/bindings/net/dsa/mediatek,mt7530.yaml | 2 +-


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

although maybe this would be a lot of churn if done per-file.

Best regards,
Krzysztof


