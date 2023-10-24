Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7C77C00A8F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Oct 2023 09:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x6MWUd7aqJU+RyKZEkGxK6HLsZy1LBZI2NHtQ/z43aI=; b=EP6UEFqTDscjvcKZOMpXVclLPD
	4y94myBwf3sY8Pj7o9dORn1cFIfFjj0OnxLnKwOjG83F5owyHGU+oQCTqt9GPCcrwLVT8g2qtk8es
	D+5ebmTSzLVXcoSrVyFhA1C21syFNJofDu2/OG4Vc9knTzMAuI2BfjW2bHeOEfaWEjbahUy9cqInm
	ix0zGIWUB/geKceXWjIMPEGW6UbvEYR96vs5ZawnjJmwHPPIUOkeYofKIaNq5YwHNo2fu/94xr3H5
	aJ+fBiRvEQORXBoIL9M/Q6dXy1Qc1Uw6pHcABcdNCXe5VL4CbQLOqcm1mXLjNA1ZfMI5IpoWiL/gz
	nrjJx1sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvE0c-009M8l-2W;
	Tue, 24 Oct 2023 09:47:34 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvE0a-009M80-1k
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Oct 2023 09:47:33 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4084de32db5so36678825e9.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Oct 2023 02:47:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1698140851; x=1698745651; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x6MWUd7aqJU+RyKZEkGxK6HLsZy1LBZI2NHtQ/z43aI=;
        b=r17l22zLvsFuPZ+Wd8Pe8O1UMOo8PvgBxmSp9ulqHFkYlS0C7i7ULhLkV/04hc4Fpu
         O+Habm2qhA2mqJvgw9TWrq/tBy6En1Io1t+zOM/a4ieDKmCqnBVH1tqdkyYPOkCWZ6JM
         nfeqeqHpFl1bZp1wcUxd6OXzHmbNnb4lUdCRhulbPa9w97CZ5ZuAk2XJHEK4TvsghgY9
         Oz9N2achkpe4YnN7dvqFHKQ+soZgKXyzp2JsoKw+h8qjw3WRdfMQq6mT6dhnLeyCgGLl
         BXydOcpVZ3nC84ERIRqAG/SH4/fyBxSgZjLZxPkEtc9ZYYjND7fWvxjVnQdplPyezMHf
         LJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698140851; x=1698745651;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x6MWUd7aqJU+RyKZEkGxK6HLsZy1LBZI2NHtQ/z43aI=;
        b=iS3I+nzlNd7ePh4olG+tWtl4B+wrA8df0V3g+jRO4YHPMTNN6yYkQdM3ZRWPHbwsbJ
         FZy5/Hdx5HkpF+Usf5sOl7YFuY3Zhi79ghqCon2bikDeXbLhNnLFDM2NFIKLYhqOVPR2
         aKwunfhxWEp1ru7qaNKjW1PzBAtvljc47+AzfuHYo/ue5VTqTXt90ucaFmbdc0HsrV1y
         ouaQZZIrb5VuAC3mt0oVwdHLRkuwtsnpeCgtzyt5WR0sOz/g8AGJod9fFeZG3h78G5xC
         AFI5YArBzyousyvyntET+O8HWQTZ/qjshzr97R2fM0Vk8OxUOZ4UJz8NbGCv3B8RaJzy
         kdyg==
X-Gm-Message-State: AOJu0Ywic5u6qkuAhen0fAvkbx+pi9iF9+0EIk1iTryl47lo+LiVvBPB
	kEqC90QKlMmJDEvPE9UlBpF4+Q==
X-Google-Smtp-Source: AGHT+IEQBKgigKRTPFTRZ1HUumAXzBLooE6sUMLZ71bOwGt4iZlfl+uviaSnAYq2eru3B4WrrZD2NQ==
X-Received: by 2002:a05:600c:1907:b0:408:6fae:1aae with SMTP id j7-20020a05600c190700b004086fae1aaemr6443536wmq.31.1698140851135;
        Tue, 24 Oct 2023 02:47:31 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id r8-20020adff108000000b0032db1d741a6sm9602052wro.99.2023.10.24.02.47.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Oct 2023 02:47:30 -0700 (PDT)
Message-ID: <037d24b9-38ea-4da5-a1d2-8ace4d9dfa5c@baylibre.com>
Date: Tue, 24 Oct 2023 11:47:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/18] dt-bindings: display: mediatek: color: add binding
 for MT8365 SoC
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>,
 CK Hu <ck.hu@mediatek.com>, Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org
References: <20231023-display-support-v1-0-5c860ed5c33b@baylibre.com>
 <20231023-display-support-v1-3-5c860ed5c33b@baylibre.com>
 <CAGXv+5Hwe8jhgthnxwXEPezhwvhfcE=WMp_My3W8FisRagRTKQ@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <CAGXv+5Hwe8jhgthnxwXEPezhwvhfcE=WMp_My3W8FisRagRTKQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_024732_581022_EEF22D0F 
X-CRM114-Status: GOOD (  13.42  )
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



On 24/10/2023 11:40, Chen-Yu Tsai wrote:
> On Mon, Oct 23, 2023 at 10:40 PM Alexandre Mergnat
> <amergnat@baylibre.com> wrote:
>>
>> Display Color for MT8365 is compatible with another SoC.
>> Then, add MT8365 binding along with MT8183 SoC.
> 
> This unfortunately doesn't match what the patch is doing.

Yeah, I fixed it for v2.

> 
> ChenYu
> 
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>>   Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>> index f21e44092043..fbf15242af52 100644
>> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
>> @@ -39,6 +39,7 @@ properties:
>>                 - mediatek,mt8188-disp-color
>>                 - mediatek,mt8192-disp-color
>>                 - mediatek,mt8195-disp-color
>> +              - mediatek,mt8365-disp-color
>>             - const: mediatek,mt8173-disp-color
>>     reg:
>>       maxItems: 1
>>
>> --
>> 2.25.1
>>
>>

-- 
Regards,
Alexandre

