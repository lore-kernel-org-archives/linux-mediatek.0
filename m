Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B436C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 08:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=grZJ4NICXdF2G/wQCy1rfpvzfnXZMazCRtlS3FxP9/A=; b=y/37Aux7kOZmqLKqwqeWB61pE9
	s6gYtu2pW6B1eWCXVlzA08CfmSVZFSClHN90udavW0P+0bBxYCUk/5tHcVDT8mPB7CbQKvGxK3Yk1
	ESbzT6lnWQYKraQmq+Zw1AGrDn+flqlNN6eYiOyzlt+7HNhVBEySVtpPLelqXlSGEr0t+CbHp0kT4
	NUZjSVhYhc1ZxGA8j4XOTO6RGFx4IgdWe2nQK7CokRjKGHg03t0t2DtffotzmvrEo/KNvdefa03tm
	FiTWdasI1zH73OLVSdPD96wSPu7r1kBgNApV6WOEWK4Wj+s4m10kPPobrDc1h0xMx7O32g0tJ4m+F
	sm8KTIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovwY1-002j8J-QW; Fri, 18 Nov 2022 08:16:29 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovwY0-002j71-2x
	for linux-mediatek@lists.infradead.org; Fri, 18 Nov 2022 08:16:29 +0000
Received: by mail-lf1-x136.google.com with SMTP id l12so7012039lfp.6
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Nov 2022 00:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=grZJ4NICXdF2G/wQCy1rfpvzfnXZMazCRtlS3FxP9/A=;
        b=EiPsSo7100XsJMn/i35fEOUPjM57DMGuvZ3ztM6Hx+B95MV3Desk1upPCrJh06+uO/
         4vXRoIlxpDh1GjmCN3F8fMN/HwSA6OOFuTSfNGXntqSEUl9JplrO6uYrCuwLSqJyWZkE
         CPHjkOHCbt3ym5bfsxgJKzCIZ/JvQ/C6cYCGNYiCIhud2Knn1RqBwV+Wch1AiNHCjssU
         5GgsvzSXnFsCHKpm3wuU3FBfeZrMYN4O/8gr2wCpupytPffOuzXIqRK/tLkthm55Qinr
         s1BPMSBuYW8mhOIMlijIpKAFRnL0eVLdiEuIuUa6JFzrvW3PxvZ1YymosFw9OrTCGP82
         44Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=grZJ4NICXdF2G/wQCy1rfpvzfnXZMazCRtlS3FxP9/A=;
        b=n93ISKAz1AiOLKUMX5OswtBcAbGeg4ZKy2nZ1a5wDK//vRoqMgyADyFhCd34l6dYMc
         tqzy54fIL1mzz7VQMp2Q9+LS/ibTNrCJwigrC2sWaI13/Ri4V1DNzJDvgVLkDxUWaS64
         aEq8bIDlJbGG+QJRi+JRQS60j3/DiMh9oAjGxqsdjyfhBN9s8kW9wy8nXa6z8rBQwZex
         aAmey26pmxqwKvbNMXjZrphW7qYzz8zJGVueRvDA592MxAXkqx96oKtfDR3jSbsEJeII
         6AzIGxo4AafHMj6QuOcd0Tq/tYrpaUcr7qKh5To57EttWV2tHGKVb8wJhitfJqKJNca5
         dCQA==
X-Gm-Message-State: ANoB5pkGW0MZ4ABe3V2bAZOW10WaVluNw0XJsPLpaeJAY2oOFn15nGio
	QC6ruOKsiTNQIUntF3iI85UBhg==
X-Google-Smtp-Source: AA0mqf6/sVDu+xO/1Gr2MEKrR0lfheX0m1lS07JqLuTzmvLJ/Unpd1ycv0YbyaOSR9XYI/g4LuYgiQ==
X-Received: by 2002:a19:4f15:0:b0:4b2:af4:65b2 with SMTP id d21-20020a194f15000000b004b20af465b2mr1913266lfb.189.1668759386499;
        Fri, 18 Nov 2022 00:16:26 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id p8-20020a19f008000000b004ac980a1ba1sm566372lfc.24.2022.11.18.00.16.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Nov 2022 00:16:25 -0800 (PST)
Message-ID: <128a0b84-0ae2-5c79-ba2c-bfe26712a4a5@linaro.org>
Date: Fri, 18 Nov 2022 09:16:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/7] dt-bindings: irq: mtk, sysirq: add support for
 mt8365
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 angelogiocchino.delregno@collabora.com
References: <20221117210356.3178578-1-bero@baylibre.com>
 <20221117210356.3178578-3-bero@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221117210356.3178578-3-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_001628_149903_A7A4CF0A 
X-CRM114-Status: UNSURE (   5.93  )
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

On 17/11/2022 22:03, Bernhard Rosenkränzer wrote:
> Add binding documentation of mediatek,sysirq for mt8365 SoC.
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


