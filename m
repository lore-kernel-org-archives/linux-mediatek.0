Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E69DCC021A4
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Feb 2025 15:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cji69n3WY8P4L0jP3m5wYY9M3Sin0x61QBvMV9h4TzY=; b=FzUR6fMgUfdcSbaNXkra9tIayh
	F6V5W8k4EL1ej2jwIvxJkCTDpoTYpOg6x26gjmMNlRk18DpTwJWnvxsmQAKYY2JsqZAOF5+E6/ODE
	xC42WF3NB43agulRdB6dMVhE+JA81Rlh9iZongqEdZAOJLb/Wu6yXF0ZdXr59dTV8Ha+blYHUomfZ
	nLQ+Hy8fsH42jCSsFruMDZZlPIA9xfv1KR8PIdGs391xkRX2/ZyAVHXvVsCpve3x6Jb+e2ybtFH91
	j9qjk7QSdaiX/e3wZftUaubuPNUxDpsZDsIO9V4Uai4gBcRcVZV8P6MYPiuEZPqLkijG/cLe4ZCuG
	BNvGh9IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZxO-0000000ECgu-20ep;
	Mon, 24 Feb 2025 15:01:18 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZTj-0000000E6Qd-0lMd
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Feb 2025 14:30:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-43690d4605dso27600665e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Feb 2025 06:30:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1740407437; x=1741012237; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cji69n3WY8P4L0jP3m5wYY9M3Sin0x61QBvMV9h4TzY=;
        b=o7633hKYh780fo50ERp9M4zJvOoZbMAZ1zpnWVqaVJZteFXbhpRDrEeTiLvAj5Rfpy
         aXeSf7k/ecLBNp2tvgsz+LE7x6IVWBNeN2hG3sCF9gLYDD+hfGc2XnmiMGDdNZSI2ZMT
         Eo5+Ds2LmCyVMLnCnTf58kkP0x/ljKbsVm3F7qKtQkqYF62tIXw5t78o6/dPc34sFIE3
         FJZntj1KOPbDz/hPSxmsh+WM1ZTmJ05BjzW2HVxkeGpnwaWr6S9xlrqQTOhPTjYpwUMx
         C5nUaxqlcEYo9rgjpp7UKB3oqo75L1qrLjfqvy9lF11FRGnQaaytUdJMVR5pQ5if1brq
         d51w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740407437; x=1741012237;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cji69n3WY8P4L0jP3m5wYY9M3Sin0x61QBvMV9h4TzY=;
        b=oT+hXeqsTTdjHpCVKVC630O4YhAeFaMR6LTyzARhAQBnPGy54qXAoyiY7V6XR2gZuL
         J+MusDgulLO/z8ubqIyHulxECZOtpmGsM6HosZPLpAfWF6nnO0w4UY7P45VhYmnzDXYi
         KdvJ++py4240hOGDMJduvkPWGmVIJYevmfTKLfWu9pBBk57vUXkFGi4ElWaNb8P8qfYk
         EdLkKe/buNnthAXlHsZIYKTPmcP8+PlYmbBETFmFMYVLqkMO9bbUWPAeFsPcvmuKSyDV
         MByHODsgazhLsRtjwEtKVX9II6XzrGB7KGl8YYq22Djjf3jkfuRXg8VKWqkZICTo4RlN
         i/EA==
X-Forwarded-Encrypted: i=1; AJvYcCXtHCT+DPSOSSWQZxOvY5b5NyPAHhYmSrQ8wBfm4daMuQkIdcs6I7tYTIasQ4OsabBNx3DGnpetts7vLEc2cA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5wZfMIIWveGwO2sOTXsTBOb7BYsQpTuq2X42A0PLFueeC+2hG
	JtN6idh8GSFlPkE8lBvHej+EGE6Fre1DLqCYKvA7xPG+bDyuKWDwsDJL6wo2YbM=
X-Gm-Gg: ASbGnctWL6NrxYIVrROnZLRI8joUET2o4XZWvco5W3xW1MAZ6CEIegfmzGJIBuereuM
	wMeb52umk3thm0U/uPjQbU3xE4GN+uCaFDmf77rnYHza1DdejX+KF2VDz+9mZr829oviCPzR7dK
	P5+wWHCIj2miEsC7yd0N6Z9K7blwHcHwJQV6TEUGaQAjI+ONx5O6G5BYwhgHOnIPY+b+ZADjjhp
	z5e5gnAHEvOO/17Ca1tBwB23Jt+e8ItEVpnYo2bwOlyfJjUUxsApgxaYhj/iTzoykoi73wTrfXF
	+PlYpyDQBRzW6vHCJGVnaKr4V+TkKns1TcY9cOqb9+QF8/0bGhGh/onjhLiSuS9rKBH7KxF8nA=
	=
X-Google-Smtp-Source: AGHT+IEC7mdR0hWAg4+Gqbpyo8+1P9D8qUn8hGBjBBnsIrJNrEh/GPTRe144zpuW/58kf6KoAeRu3w==
X-Received: by 2002:a5d:6d85:0:b0:38f:2726:bc0e with SMTP id ffacd0b85a97d-38f6f09750dmr12138802f8f.44.1740407436620;
        Mon, 24 Feb 2025 06:30:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:5ee:79d0:ce53:5813:dc8a:b123? ([2a01:e0a:5ee:79d0:ce53:5813:dc8a:b123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d5eeesm32323805f8f.63.2025.02.24.06.30.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Feb 2025 06:30:36 -0800 (PST)
Message-ID: <41849f69-ee2a-4cee-85d8-2d3b0993b907@baylibre.com>
Date: Mon, 24 Feb 2025 15:30:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: mtu3: Add ports property
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "robh@kernel.org" <robh@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>
Cc: "macpaul@gmail.com" <macpaul@gmail.com>,
 =?UTF-8?B?QmVhciBXYW5nICjokKnljp/mg5/lvrcp?= <bear.wang@mediatek.com>,
 =?UTF-8?B?Q2hyaXMtcWogQ2hlbiAo6Zmz5aWH6YCyKQ==?=
 <Chris-qj.Chen@mediatek.com>, =?UTF-8?B?UGFibG8gU3VuICjlravmr5Pnv5Qp?=
 <pablo.sun@mediatek.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
References: <20250220142230.2530583-1-macpaul.lin@mediatek.com>
 <0e58bfb8f2f7b7e83e3da6075986ddbcc84531fc.camel@mediatek.com>
 <fd173075-df66-4ee7-a9fa-07e840976f26@collabora.com>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <fd173075-df66-4ee7-a9fa-07e840976f26@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_063039_226605_12F684FB 
X-CRM114-Status: GOOD (  11.34  )
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



On 24/02/2025 13:18, AngeloGioacchino Del Regno wrote:
> Il 22/02/25 09:35, Chunfeng Yun (云春峰) ha scritto:
>> On Thu, 2025-02-20 at 22:22 +0800, Macpaul Lin wrote:
>>> Define the ports property in the mediatek,mtu3 device tree binding
>>> schema.
>>> Include definitions for port@0 and port@1, specifying their roles as
>>> High Speed (HS) and Super Speed (SS) data buses, respectively.
>>>
>>> Suggested-by: AngeloGioacchino Del Regno <
>>> angelogioacchino.delregno@collabora.com>
>>> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
>>> ---
>>>   .../devicetree/bindings/usb/mediatek,mtu3.yaml       | 12
>>> ++++++++++++
>>>   1 file changed, 12 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
>>> b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
>>> index d4e187c78a0b..21fc6bbe954f 100644
>>> --- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
>>> +++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
>>> @@ -155,6 +155,18 @@ properties:
>>>         property is used. See graph.txt
>>>       $ref: /schemas/graph.yaml#/properties/port
>>> +  ports:
>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>> +
>>> +    properties:
>>> +      port@0:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        description: High Speed (HS) data bus.
>>> +
>>> +      port@1:
>>> +        $ref: /schemas/graph.yaml#/properties/port
>>> +        description: Super Speed (SS) data bus.
>>> +
>>>     enable-manual-drd:
>>>       $ref: /schemas/types.yaml#/definitions/flag
>>>       description:
>> Reviewed-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>
>> Thank you
>>
> 
> Is everyone okay if I pick this (and the XHCI one [1]) in the MediaTek trees?
> 
> This is so that I don't get devicetree warnings when picking the DT patches
> that are adding USB MUX/TCPC to the MediaTek boards.

Sound good to me.
Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre

