Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03C7BC76188
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 13:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WeZ9y9cBWf8D72zPud79w30qw3KXJ+7zJufVpVM/bXA=; b=K140qb283/EfZMLu5Y6wu+aiNn
	eTGBCwmQwDbH6wvD5xof9vh5y3fcSj+Stzw3I0thS8f9bCDobGjT+NqbgW/3Ye44zvMSmVwwpInYh
	Am3ejuu1jSr3dBToVpO0H03I7IO+o60d0n5etVpKI4WL4MEUxaVF7JzRudiNFwFl6IrQldfPEA0bM
	WM6jscOmsfzhpT3cGG1pES2ybDjaOhz5S6y/BbnqpxrBZX9W35UfpJ853JX5T47DKQ6dIUmdhC8g6
	bwFU5wAqo49S46q9tfVuo4dBOpZ3gvdzl0z1oSjqF4XrfRQIPV6wxr9rHxS1KyerdaEdj7pjzllkt
	+0jCA28Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk2qw-004Tkm-1S;
	Wed, 05 Apr 2023 13:07:06 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk2qr-004Tge-2u
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 13:07:05 +0000
Received: by mail-wr1-x42d.google.com with SMTP id m2so36141548wrh.6
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 06:06:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680700015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WeZ9y9cBWf8D72zPud79w30qw3KXJ+7zJufVpVM/bXA=;
        b=x9C1l3yN6ebb0k9A9ISZ/SNmRbWnaNsCPmvIRmimgXqS+3KfKLMyqL85N9PzN2LhRg
         00Cl1uG6z5LFbekfIcB3R9xZKQ+tTZkd56YT0HFh3dbXygkYOQ7Zqg0iEEIRDEdJ+g1S
         bkfdBm2mafUl3f7rX0ox0fqJpXyzmLE1v43buDEH9OQFDCZbOu7Bz3kPFGjcWCwx3h+G
         s/zEa3IV6p2PBSuEfcSuD8mOlmIp5/ysvJ6KRi8UcpEnenpCdG5xvfUe3vqSiTE/WSXw
         slbj2JpS4kPKDqJ6cJN6GQIiFmCnRLkks/YPsdq06So/4s511HNCUwCwUjravbV4NqMs
         WmuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680700015;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WeZ9y9cBWf8D72zPud79w30qw3KXJ+7zJufVpVM/bXA=;
        b=id5j2KMp4iVOX3MU15CTthFs2edNBAXwMvSzzdU7XhYd0dpTJnyrujy+pcIKYHpsqw
         XH/7FA0oiwal5B3m4645mjBdsnzkwX3maESO1h83oepTjIUd5HNTNXx/5J/zUZIZ7Fj6
         iUR+37R5iJ+13gVotl7sCTIIJlWSZ4hxwTmVqfY9y30WwAiVqxZjvgwQBlj8F3pSPGAZ
         BJSGpMc0E0QfN7mLmyXhsEFARrbe8iAFoy2SRyY8cFuL9bWYKWAK4sNK4DKwAOvRDDid
         +kTaqC/TV5xep6ffaJn5uMm5zf85OubuPwICRgT1VYuoE3bN3pqkeh7EYjfhh5DFQcDl
         Bnbg==
X-Gm-Message-State: AAQBX9dOTS8eNjQHhnApDItcxkzjcyTafgj3mst9wB/KHY3mFdiiAo0U
	9bE618vIc44Z8crQpgY2VvF7wQ==
X-Google-Smtp-Source: AKy350YMENPnv85x0KK3Edc9qCwxaSQhCwtpw07WNjYCbM151PHxdsUy7oVj1ngPfQ6V4vI31lfjTQ==
X-Received: by 2002:adf:f402:0:b0:2e4:cbbe:cfc2 with SMTP id g2-20020adff402000000b002e4cbbecfc2mr4497441wro.25.1680700015544;
        Wed, 05 Apr 2023 06:06:55 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id p23-20020a05600c205700b003eb5ce1b734sm2161425wmg.7.2023.04.05.06.06.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 06:06:54 -0700 (PDT)
Message-ID: <fd24877a-5fae-5434-dc56-61ab35ccd820@baylibre.com>
Date: Wed, 5 Apr 2023 15:06:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 10/10] memory: mtk-smi: mt8365: Add SMI Support
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Yong Wu <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
 <20230207-iommu-support-v2-10-60d5fa00e4e5@baylibre.com>
 <9847bc48-c96c-3599-e876-bcf9ebf1522e@linaro.org>
 <CAFGrd9pBdaHLGUZHkaz2_XKafyX=dxu9UckQxrphg52EG=A1SQ@mail.gmail.com>
 <8fc3dd22-79df-32cb-c219-896eda8fa986@linaro.org>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <8fc3dd22-79df-32cb-c219-896eda8fa986@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_060701_939737_3E9032B5 
X-CRM114-Status: GOOD (  10.02  )
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


On 05/04/2023 13:45, Krzysztof Kozlowski wrote:
> On 05/04/2023 11:53, Alexandre Mergnat wrote:
>> Ok, I will move the driver patch before the DTS patches in the next version.
>>
> Or do not send it together at all, which might solve your dependency
> problem. According to your cover letter I cannot take the memory
> controller bits, so I am waiting for dependencies to hit the mainline.
> Alternatively I will need pull request with stable tag.
>
Ok, I prefer send the driver patch in another serie. That will solve the 
dependency with the DTS a least.

Regards,
Alexandre


