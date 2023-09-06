Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0005EB8FB6
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Sep 2023 11:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1wAlvRs1s+iG2Zeq5bR+RPSk1Ov/XWzqSAXnvT9GRU=; b=Wk6eGFmImXnJ1vgnqcZCm8VFeS
	CZGwaLlFsuNrZhMFt5IsaGXRC8QwUMm4LztwxDJmDy6xrk9a+4nvBA6rMcVy0W/hhhO6fbzVaMUcO
	SOdlUHutdovWA+zrl/MoNsr2Oph5/Gu3T6ZmyGMXfz8ky+xJYil1iDzawIGKxqLDbcGgpFB7f6gQ0
	cvNnCIpW1kvzXnPVhZbjmbzf2B5e/WUBTBEcGpC8PAVkVT98cDjnSQSjz8jv3yZvlyyBcjN8fHSt2
	RTAZkmMJF0Nb6wu/gOeKe1amBiTsApIpX+5aXa02eT0M0kqUAX3w815eJiMmOcUupts2x0CXIRn4P
	qF1jSbsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqe5-008hLb-20;
	Wed, 06 Sep 2023 11:24:29 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdqe3-008hI7-0i
	for linux-mediatek@lists.infradead.org;
	Wed, 06 Sep 2023 11:24:28 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5230a22cfd1so5141915a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Sep 2023 04:24:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693999465; x=1694604265; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m1wAlvRs1s+iG2Zeq5bR+RPSk1Ov/XWzqSAXnvT9GRU=;
        b=VBWVhGCTwIjMPBsm+IsZpSQ3+InGZPm0evfSg13sABaT2LZa6NZIs2jw8F/o+szgfe
         +Y40nUzQmwdWKcwOFFpqJFhrwaauwVssP/F1kzo+ICBdPRQyprthc1QH9Y5ejXN22r3z
         4cUyZW7NtoCh4mVVxJGiPGoIiKYnEOmDzc483ecde0m24php68Hm9kUJI2e0KfrtavEb
         ClOnuN+mdHNdzDcehgu/dU/0Dg+7bMUca4M85zFMNqBlVqYBmqSFpPDWmdrsE3q5DTW+
         pb07YKVVh56dKXUAreE6S5VMX6VaxhKoH648QDCSW5wcg6Z9XBQ2CV8155I0tZXoyuMT
         Zt1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693999465; x=1694604265;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m1wAlvRs1s+iG2Zeq5bR+RPSk1Ov/XWzqSAXnvT9GRU=;
        b=Frw4UfDZHlQFmcjz1ojb0oT0JkVNGP6lYkelF6Qlx4pAefukKN/KHgHge2WkOYLESP
         FDqZ/MduEJ4A/c9hL9OL9oEpWpFS/GX4vizPeSDvactxMPIpf/G+4FAMbn0Vlc03d3ug
         EsbsIu32JiDhPNwdcRxm0wctGKXhntRuqA3Q6Vt4mikZTwWJ4orb+fggS18+05OGOeVm
         jcrQugbIRSXL3J8UCuXDzhfFfCii/8hwnQxObofBtQ4wgSnQxo2UNw5QWMuuK1oOf3sr
         V7NrNH7DfrD3gk18TccCRN5Bnft7J2vzqZiasA8/ca0IvnJ6Cn/jt50OFLGirXHdXfSl
         vSvg==
X-Gm-Message-State: AOJu0Ywgy4PL+s4PhioBqDH3A7oU6xpYygWYq2xDNTwWMMutuM9lYyj/
	g1Y6hncVmo2SLx0zmhZu76kzsA==
X-Google-Smtp-Source: AGHT+IF78fS9Eg7R0VlxkHPMQfbfw3JU8+PGZlkuhqY6CLgNB73N4t7Yp4iilxfshUiQOSytqEPEaQ==
X-Received: by 2002:a17:907:a046:b0:9a1:d29c:6aa9 with SMTP id gz6-20020a170907a04600b009a1d29c6aa9mr1883605ejc.11.1693999464940;
        Wed, 06 Sep 2023 04:24:24 -0700 (PDT)
Received: from [192.168.0.22] (77-252-46-238.static.ip.netia.com.pl. [77.252.46.238])
        by smtp.gmail.com with ESMTPSA id rp24-20020a170906d97800b009a5c98fd82asm8785839ejb.81.2023.09.06.04.24.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 04:24:24 -0700 (PDT)
Message-ID: <50f7fbdd-8592-7a47-b2d8-a1af8ed93b92@linaro.org>
Date: Wed, 6 Sep 2023 13:24:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: add mt8395-evk
 board
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Frank Wunderlich <frank-w@public-files.de>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230904092043.5157-1-macpaul.lin@mediatek.com>
 <20230906092527.18281-1-macpaul.lin@mediatek.com>
 <fbad941f-232b-9f56-5de3-98a16a8c4d89@linaro.org>
 <c3ddf00c-235a-2d23-db60-c998a67a3fcd@mediatek.com>
 <f343b6e2-6106-47eb-71cb-f391aff6cb7f@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <f343b6e2-6106-47eb-71cb-f391aff6cb7f@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230906_042427_256159_D9C3EFDA 
X-CRM114-Status: GOOD (  12.66  )
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

On 06/09/2023 12:48, AngeloGioacchino Del Regno wrote:
>> Yes, mt8395 is fully compatible with mt8195.
>>
>> But after reading Angelo's comment, we thought it is necessary to create a new 
>> compatible to avoid confusion for users.
>> https://lore.kernel.org/lkml/bf8394c6-5460-8696-f46b-0c39927aaf84@collabora.com/
>>
>> Although they are fully compatible, developers cannot arbitrarily replace the chip 
>> on the board with another one. So separated bindings might be better.
> 
> Sorry you've misunderstood; I was trying to explain to Krzysztof that the two
> SoCs are fully compatible... my suggestion was in like with what you're trying to
> do as in I am agreeing with your first version, Macpaul, to inherit MT8195.
> 
> So,
> 
> - enum
>      - mediatek,mt8395-evk
> - const: mediatek,mt8195
> - const: mediatek,mt8395

The other way - mt8395 followed by mt8195 :)

Best regards,
Krzysztof


