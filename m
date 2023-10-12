Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80EEECDB46E
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Oct 2023 13:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n03///ypwOylvxxE2t2JFpzUrILVyw4S/vaZQ4FGgqY=; b=efc48obUZfMtZ/RQDecRcF8VOu
	VlkndO5FRyPDvzIQEBbWYQdT6Fi22B3ojIUbIyz14SMlv9QSJzSRfT/wYyCZXKS5ydxVRHB0EvP7Y
	l8MU1XE/JDl3pM1rS7jNllBbhoovDZgT8RhVI8vR6irJacHVvRQprzOBtS7TUGemqjSfBVmB3QHfU
	CSinddvBzr2ofC/1IIAFFXTTG5v6JBkhKGlVe4NrjqPyZfos2/VJuSPx5ojultHP63h8QSxKPp8Jj
	UygiNGmeDmUGIMbocS7Yv16XrZWmsaznEow38bHe3tImfwlXe7357ziDpt/hwifPh7vdctLJa71/n
	3AeG8DUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvXw-0013eH-1E;
	Thu, 12 Oct 2023 13:16:12 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqvXs-0013dm-05
	for linux-mediatek@lists.infradead.org;
	Thu, 12 Oct 2023 13:16:10 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-533c5d10dc7so1711205a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 12 Oct 2023 06:16:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697116565; x=1697721365; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n03///ypwOylvxxE2t2JFpzUrILVyw4S/vaZQ4FGgqY=;
        b=M7IRplWUM89DSSfHjLprEaQIJfljSWltMSt1r+D8iUNnuFKPCfHV90a0lDljj3Hd7h
         wbsODyRpcnXSZSa9WC5cQyGOWkFI4PtXoZbmXyhwfLLnde9BIMJk1l396dmk2582HRkU
         t51Sdw6b7NqGRCJqvtZJ5ypDLYpstI42s80EB090b8da0C2assvdFus6Bzd+Bw0ylkF7
         eeNqI0qP8PcAMNz4O0GcsiqFkyAEt1nmxOQFHvWlZpyxUfQBYCeI/mCj9L7wj1H4q8cV
         oGhjmtd9vJwTgZObbgIcn8REoX0mwPn05aozoGfWFoYae7qPhJzKNfL5x5oVQsBD2AyP
         brvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697116565; x=1697721365;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=n03///ypwOylvxxE2t2JFpzUrILVyw4S/vaZQ4FGgqY=;
        b=Im5cfPp2bYkTF0zguuHbww/zt5QXD3ua+O9IX9w94loyUYvUQSNOLPm9BRsrlgaTlK
         PHMNF6xgWu+Kw1qY3yLl2b4EKEhYhC1Wsh9LBxBcrWKm9tKzQ9IbdtHxd/waU3iZ0QWP
         imeThPkLAUtgfmTPuIP9+utaCPlL6yQckMdwcAyL2okKQVf11Tno6HKlyljfcz8DWAXY
         93J05IPkAiPMNp03agcRWeq2FR4MP128WgYZmJzqNgRccB/GWgJEJFsDROFswozBpJd+
         Ud3TF7unTQu+tUasjf46Qu0teAlKb4US+hcIu4c3BIUxpOiNPcBQ3iUZ4aP8CmMPZ0tV
         rNCQ==
X-Gm-Message-State: AOJu0Yw8GEowNROY4ZDTc/SiWE7zfTOrpKL+VGSFPcgtJHxsZ7DMXpoU
	KuNxPffDihzT/5kCvyFsN8u4Mg==
X-Google-Smtp-Source: AGHT+IGJakQzcUUkiOi5dcUAVgc0RhCt8/r0lk9gqH8jHw/gtpwB2nLo6ZQVxRBhBURcqIKH5PkhYw==
X-Received: by 2002:a05:6402:1513:b0:533:c55f:5830 with SMTP id f19-20020a056402151300b00533c55f5830mr20365873edw.28.1697116565579;
        Thu, 12 Oct 2023 06:16:05 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.100])
        by smtp.gmail.com with ESMTPSA id f26-20020a50ee9a000000b0052e1783ab25sm10202276edr.70.2023.10.12.06.16.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Oct 2023 06:16:04 -0700 (PDT)
Message-ID: <0aeaa158-d56a-4d3b-a0c4-25b25f031a51@linaro.org>
Date: Thu, 12 Oct 2023 15:16:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: media: Add bindings for THine THP7312
 ISP
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Paul Elder <paul.elder@ideasonboard.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Julien Stephan <jstephan@baylibre.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20231012012016.11535-1-laurent.pinchart@ideasonboard.com>
 <20231012012016.11535-2-laurent.pinchart@ideasonboard.com>
 <b214e763-2175-4de1-af54-43961ff94afb@linaro.org>
 <20231012130544.GA31878@pendragon.ideasonboard.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231012130544.GA31878@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_061608_073955_9E3B8622 
X-CRM114-Status: GOOD (  15.61  )
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

On 12/10/2023 15:05, Laurent Pinchart wrote:

>>> +
>>> +  clocks:
>>> +    maxItems: 1
>>> +    description: CLKI clock input
>>> +
>>> +  thine,boot-mode:
>>> +    $ref: /schemas/types.yaml#/definitions/uint32
>>> +    description:
>>> +      Boot mode of the THP7312. 0 is for standard streaming mode, for the
>>> +      THP7312 to be used as an ISP. 1 is for firmware flashing mode.
>>
>> Why, for a given board, would you always boot device in one specific
>> mode but not the other? This does not look like property of DT.
> 
> The device has two boot mode pins, and it operates differently depending
> on its boot mode. The pins are typically hardwired, on development
> boards you commonly have DIP switches, and on production systems test
> pads that allow modifying the boot mode on the production line. The
> driver needs to know the boot mode to interact with the device
> appropriately. I haven't found a good way to interogate the device at
> runtime to figure out the boot mode, but I'm still trying. If that
> doesn't succeed, we need to convey it through the device tree.

Hm, that's okay then, but please describe that it is expected
bootstrapped boot mode of a device, because now it sounds like
configuring some boot mode in the device.

Best regards,
Krzysztof


