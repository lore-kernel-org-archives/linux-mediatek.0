Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36D9C48260
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Feb 2024 09:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h6Xu1HAHZ9HRxjD9AT8qdpfBrvzwdj1aG2VVZhQOMJw=; b=KGu3HX0kqXv20xaoL0zjQrU0MT
	ZW15aUnUPVYCKN28j+jVbwkBsOYX8Fuq/S6Hlxn+AQV6jhTUfkRkSG7wV9GFURGkzw+JMfxmQpyfn
	T7gIlCJmMJN3WIs0JhP92DVMe0UKGqytY56jQIBvuF/TrYurZHC/axvA/I2KaSMa5HbuFZ2I2Kjaq
	BhJ8wqoYJ/JqmnhDyRXHi4QUha0qh8BVLZe5AkBo92y5taY3QDDYOtTv9fHD0e0orC+xSeTWqtjM8
	MFFEyU7ZswZE3E78Xgyz43wrS8CZZgSQH1Vx3FXD1ZM7IHOLA7POHlNAaMUd8+QbFUJOWtUELbg/t
	wjBC0IeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzd2-00000009juW-1G0I;
	Mon, 19 Feb 2024 09:08:00 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbzcy-00000009jsk-1mRK
	for linux-mediatek@lists.infradead.org;
	Mon, 19 Feb 2024 09:07:57 +0000
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2d09cf00214so40023481fa.0
        for <linux-mediatek@lists.infradead.org>; Mon, 19 Feb 2024 01:07:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708333675; x=1708938475; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h6Xu1HAHZ9HRxjD9AT8qdpfBrvzwdj1aG2VVZhQOMJw=;
        b=psQ02Q3XGGWePx17VATGGNynUCQvKxgDNqNCkdmS5nMq6073aQw1d3xbuAYxsB9i02
         wi5vGPBvsNRnO67jNwjKd2w2kyMBs+PKCgo59TNDztHn2DtajwEY6/xl0NfUI5FBb+xS
         hl1uRaI6nVyvjqd7w1HzzKp7xouP1zquUB4/wKG9RZfZvSeE74Ac7QhqTSCXZWsQjIhy
         T8K4pxHdutu/SVhq/e/ZUUB9F94FrXnFqJTm4AgXsdtdpoKqGL0gRaSSzmpuV/Zjk8lO
         eKE2eSO7YMm1ruQUgXvSR7+jfmdH2MLC5w27nmscjExucdCzY7JjlAalSBXgUGT59B6F
         x9Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708333675; x=1708938475;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h6Xu1HAHZ9HRxjD9AT8qdpfBrvzwdj1aG2VVZhQOMJw=;
        b=c993WT9u6LQoZgCQ40CMWPsj31nc2Pmg64jqw0IBhr6Aqqwp4NGrssIyLTkkn6AMWp
         dV4Q10lnBphmXVN4CX+eSUi71xEW8b89urd4JxL2rdznEelx/Y+udMqFuVa2hpivA7av
         YjYoZc524N/TRKT1avlfpN1k/pbOnXc0NbZS4dK4QO2PhgDUroy++kgMGnBPGwP4mLAp
         IZ/i56Kvk1O904liNZKUZ7Dhjq0fBJpVtNHTci6YKS7Tj64328mmHLZ8GfSIPA9PGohf
         izHo25VtZ7R6Ing1UwYPZij2gdHhsfpRmfHLc6Dbodb52hWa3T8sCZreA1s7ge7NBXng
         3SUw==
X-Forwarded-Encrypted: i=1; AJvYcCVu2uUUjPCFKbfb5xH3q7dR2kdgibvySBhFBFXACjeakgXDBmbHeHiaJNKmFH7fEcksyj8PK4H8d0UdLSvP2ljOhT3KpPyccWL7qNsVyx/Snr3s
X-Gm-Message-State: AOJu0YzykUSsNXY60qKlVdtTo2U95Y//WUTh2p61SnIEssksneAX8u0Y
	Rmnv65ZqRI3DoT37Xz5LhdC5VamRuQ591YQbvnq+JgPnrURVgHwlsynJbnDyg+E=
X-Google-Smtp-Source: AGHT+IHKVEM/gaTzGxSC7rvNgeF2ynwsCj8mGyyotbBTNHns2GoyzBtLpoPiJwNRHV81I2/an5TDpA==
X-Received: by 2002:a2e:99c3:0:b0:2d2:3b20:72ba with SMTP id l3-20020a2e99c3000000b002d23b2072bamr994750ljj.50.1708333674873;
        Mon, 19 Feb 2024 01:07:54 -0800 (PST)
Received: from [192.168.1.20] ([178.197.222.116])
        by smtp.gmail.com with ESMTPSA id z2-20020a5d4c82000000b0033d07edbaa6sm9725160wrs.110.2024.02.19.01.07.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 01:07:54 -0800 (PST)
Message-ID: <77a7223b-9407-4191-b53a-0bfc623f14bf@linaro.org>
Date: Mon, 19 Feb 2024 10:07:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: ata: convert MediaTek controller to the
 json-schema
Content-Language: en-US
To: Niklas Cassel <cassel@kernel.org>, Rob Herring <robh@kernel.org>
Cc: Damien Le Moal <dlemoal@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-ide@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
References: <20240213074747.26151-1-zajec5@gmail.com>
 <ZdMTx1CJzFR5uAzK@x1-carbon>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <ZdMTx1CJzFR5uAzK@x1-carbon>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_010756_485512_B5C2B88C 
X-CRM114-Status: GOOD (  10.84  )
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

On 19/02/2024 09:39, Niklas Cassel wrote:
> On Tue, Feb 13, 2024 at 08:47:47AM +0100, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This helps validating DTS files.
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
>> ---
> 
> Hello Rob,
> 
> For device tree patches for
> Documentation/devicetree/bindings/ata/
> 
> Usually, if we see your Acked-by, we queue the patch via the libata tree.
> (If it is part of a series, usually you take it via your tree.)
> 
> We have a R-b from Krzysztof, but no Ack from you.

You don't need Ack from Rob. Rb or Ack from one of three DT maintainers
is enough. Therefore mine is enough.

https://www.kernel.org/doc/html/latest/process/maintainers.html#open-firmware-and-flattened-device-tree-bindings

Best regards,
Krzysztof


