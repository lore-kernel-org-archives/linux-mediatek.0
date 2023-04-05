Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8FAC7619A
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Apr 2023 13:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8Iuh0IiFYm20OyO5pxZvbSOFVNhaWvAY5Q417BYDls=; b=XJ4e05PL1LumpNlO20FxvbrQjp
	YjeKKl9uHZWTzBH1cOR56nNRvTc7DzTeXKiyDxYuUPh4xSl8JQmpBh4HZuP74Nb9ZAyX84D09ChMb
	/8vgLb+vtQ1VMoEXuPrai6XPU12l4phhoduBpC17vLgRT4ntSZ+nvMWGW6K3k5wX7X/qtACVUqH+2
	MbY7478Ly2Y3Af8luvGsElYkNsMIub2KbttNQdyFrvTPjUsRB7mZGmoWjCDQwQ/phM4hXPRRuPohh
	b/+3X5sheySsJa92fk9/KE73wT5QIPAPdpUwFvkNTHa4MQXKaJc1SeHdHX4h9q+8RX2O6ZdBFTTfe
	eYNvrHCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3au-004aFH-2V;
	Wed, 05 Apr 2023 13:54:36 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pk3aq-004aDU-3C
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Apr 2023 13:54:34 +0000
Received: by mail-ed1-x52b.google.com with SMTP id er13so100283549edb.9
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Apr 2023 06:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680702869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p8Iuh0IiFYm20OyO5pxZvbSOFVNhaWvAY5Q417BYDls=;
        b=K69pvH4Wpx6N/Hgu8hVF4CdTepkKmSgss1zM6Ey7r2QZLEN5VnIJjnRfwQcMBo4M8a
         ESdH4tDXaqEKob6suZP1XrG3sKFfNieood23du/yUgy8x3fmZtaMDdRhMmtVP/5cTc05
         xJWv0ng+LbAflGcF7ve7Xn9r+nYdZK9yuxy/I/4jlk2A359uwykvWw2v1elLxy9CORsW
         D/knuLne8tSJo2j+ape+Oq7EvQFeTPGkK8FJ3iXiz38WXRqpUAkrAPnw+CwqupysoXSO
         X4EPdKIDGhD/YQ8UWQul2zmShAvXxsKieW+J+oUWAO/6VjEQwv4ca7ctgi9Q9WpHNsca
         irow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680702869;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p8Iuh0IiFYm20OyO5pxZvbSOFVNhaWvAY5Q417BYDls=;
        b=hjrGPows2CCK3oYa/5/B2/5y6dnpBRIDCFL9lzC9tWktcTxAv19PYrI51gRGOf7hz0
         aFznSjjU4gPxKlG0I7VmglhEqK6ekda9uubE201XaHRz0GNbKerTNt+DBmnIOtxSKfM2
         BB3uEbGgrpoljBfMH3u5bXnY9Tr7/r3kgxjFVB+nXK7t0bJbwPGUBvh2W1V5glAEFYw8
         gUttTohtSlyk4TVJN0OlJF+D/axW7LWRICa1a3Ws6VcIqEHKasT40qMQGs68SqPzqPS6
         Vkt830Xzc61A2LOzn6wJVpAfotHvnMRzJ9UC+gu58J3CtWSZoXYe1w/Q9+IGlj0T203t
         GNnA==
X-Gm-Message-State: AAQBX9fiILRWKLKQHwxIBzstm8ojUcPbmAe3MKZoi8CORf+SCrhrxbda
	PjzGAusCZK+1Zxm6CYBmGjMRpg==
X-Google-Smtp-Source: AKy350bPfXexYPtEgp8ZhWsektOp/hbKdkXu4xztIT8ip6Kd356UsKREg/wRh9RqozjJsoOo2LhMYw==
X-Received: by 2002:a17:906:4e59:b0:930:fe49:5383 with SMTP id g25-20020a1709064e5900b00930fe495383mr2870387ejw.76.1680702869311;
        Wed, 05 Apr 2023 06:54:29 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3f:6b2:54cd:498e? ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id xd2-20020a170907078200b0094809142160sm5948567ejb.55.2023.04.05.06.54.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Apr 2023 06:54:28 -0700 (PDT)
Message-ID: <2b238291-8939-cd52-2169-db217bb9fe04@linaro.org>
Date: Wed, 5 Apr 2023 15:54:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 00/10] Add IOMMU support to MT8365 SoC
Content-Language: en-US
To: Alexandre Mergnat <amergnat@baylibre.com>, Yong Wu
 <yong.wu@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20230207-iommu-support-v2-0-60d5fa00e4e5@baylibre.com>
 <00a0d832-9a0b-6160-31eb-30d2e9c32c79@linaro.org>
 <3c51a5d3-8d76-9d8e-7cbe-6a2a1776b360@baylibre.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3c51a5d3-8d76-9d8e-7cbe-6a2a1776b360@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_065433_034892_15323A3B 
X-CRM114-Status: GOOD (  15.59  )
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

On 05/04/2023 15:13, Alexandre Mergnat wrote:
> 
> On 05/04/2023 13:43, Krzysztof Kozlowski wrote:
>> On 05/04/2023 10:06, Alexandre Mergnat wrote:
>>> This commits are based on the Fabien Parent <fparent@baylibre.com> work.
>>>
>>> The purpose of this series is to add the following HWs / IPs support for
>>> the MT8365 SoC:
>>> - System Power Manager
>>> - MultiMedia Memory Management Unit "M4U" (IOMMU)
>>>    - Smart Multimedia Interface "SMI"
>>>      - Local arbiter "LARB"
>>>
>>> This series depends to two others which add power support for MT8365 SoC
>>> [1] [2].
>> So does it mean they cannot be merged? On first glance I do not see the
>> dependency, so I wonder if we understand the dependencies the same. And
>> subsystems.
> Exactly, we shouldn't merge it before the dependent series to don't ]
> break the build due to
> "#include <dt-bindings/power/mediatek,mt8365-power.h>" in the DTSI file.
> Additionally, LARB will not work properly (or at all) without the power 
> support.

And how driver is related to it? If it is, you might have some unusual
coupling between power and memory controller driver.


Best regards,
Krzysztof


