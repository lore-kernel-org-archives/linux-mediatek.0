Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA70CC77B6C
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 19:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45/7TKpTCK5h6ilh1LUuYviPKiZpP9rCbl++IuI078M=; b=hrfaAXX+S3mnZ0ThEpHnGJlMyB
	VCeyVB2M3BzbV4r9V2pq7+uN6Aak7704xu85V0SM5QU6EZtlnnoOwg9+Q5ta9gxxSw2b/uwmwUOxY
	94eoJrm7D6GRgzEOiSO0IILnq2Z3LonHA1XEqL7pFPm/GytV0R4O65NhE0oBBM8sRDrz4xyEgZjdy
	SPbA5ZnTXoxYu1Kwc1omS+EBAVybbgffwkpU7kRndS5aDyhLI8M4pGeL3m7p69B/7SnfSMEz0GLxd
	NGLQloQ7MLzI0z2Tpu1jKYbM3d6EswZ4EYgL5YndX/t7ThKFFiZKwjbDumTSvj7FQPvw87mg8jjMq
	OsDH3JfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUr8-008KzA-1o;
	Thu, 06 Apr 2023 19:01:10 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkUr1-008Kvu-23
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Apr 2023 19:01:09 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9476e2fa157so133958466b.3
        for <linux-mediatek@lists.infradead.org>; Thu, 06 Apr 2023 12:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680807662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=45/7TKpTCK5h6ilh1LUuYviPKiZpP9rCbl++IuI078M=;
        b=AJvUwHrCIdJ0dugZeaXPR9QOmXg1fGP9y7UZ0f2s8f9oAcsuhPGeYFOo7n2XS2BDP3
         w1XG9rv95+HdYppKZu+EXeUbWxDEzBgXDc3O87lWERYFnHv9dAxrdzDKTieu914+curg
         9Y4zxXZ2XbcTQWJxc3SLoHX2fXd2IsQ6dtonVY+aEIfYsnLvfUVjPF+NxSnfWFpG8nfO
         e/M7RrqCvv4/a3fiTBHYliRDaKNazhAQcLeNRA5hmVuWb+q/X2T49Bd7BuJDwFJncxBm
         hQNpi7RT32yy2Jp5oEzg9CV3JctwMyx7SG8KG4I7h6ebOEEbZdUBjZ1l76vEX/piYcLl
         dbNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680807662;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=45/7TKpTCK5h6ilh1LUuYviPKiZpP9rCbl++IuI078M=;
        b=2Z1Jyy9c+zJ22WvNlvJu1lDCCQzvxZ5F+zT5staLpL+yapQZMfhNIxk1PpEGxQKTmU
         8zR/8aqwlZ02ZCV8TvJRcsrcowQECCtKJ8Yuh6FKZhRT7jUGk+4aH/vgBR0boofvf6Mm
         wkqSSLa3rXClabOCGyUTBfWqO+uW7iE06UnF8PWMdyFSDZdbjSnMzb615kwZlm+6CLub
         vGfKYpBtm7EXQQHK+OhEFF0KXn2X6hfrgpkqQ7OFgQsQ0X4cANPwJmn25QclCR1u0B7n
         is0m9D7Yt4Q4xssUIBOsbXKt34ASMTstRvjybohiTbVLIl/MLSoxCNx+Qrm/A76pRddM
         q64Q==
X-Gm-Message-State: AAQBX9djWeQtvCIODnhhXj0qvABNTFmebfJgAZQBvGVI3kkLeTAD78mN
	DqVGxbfbs88BkRjGDKY8+VGT+A==
X-Google-Smtp-Source: AKy350YprH2WnV7+jiFkLh1Q5wGRZkgpCiVtUPg4XJUg3nVkktNIL9AJ0vmKPH7xXC9eO0PeALpsZw==
X-Received: by 2002:aa7:d556:0:b0:4fa:ad62:b1a0 with SMTP id u22-20020aa7d556000000b004faad62b1a0mr445160edr.41.1680807662032;
        Thu, 06 Apr 2023 12:01:02 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id d20-20020a50cd54000000b005027dd7c403sm1056008edj.66.2023.04.06.12.01.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 12:01:01 -0700 (PDT)
Message-ID: <b30f8159-e2b0-8a1a-1feb-507c3a9b37ee@linaro.org>
Date: Thu, 6 Apr 2023 21:00:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/7] dt-bindings: net: dsa: mediatek,mt7530: improve MCM
 and MT7988 information
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
 <20230406080141.22924-2-arinc.unal@arinc9.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406080141.22924-2-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_120106_221956_F6A6C938 
X-CRM114-Status: GOOD (  11.08  )
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
> Improve the description of the schema.
> 
> The MT7620 SoCs described are not part of the multi-chip module but rather
> built into the SoC. Mention the MT7530 MMIO driver not supporting them.
> 
> Move information for the switch on the MT7988 SoC below MT7531, and improve
> it.
> 
> List maintainers in alphabetical order by first name.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


