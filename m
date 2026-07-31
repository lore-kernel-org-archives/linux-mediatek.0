Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FABC5516D
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2026 14:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cEYf8XWt7uIQNYBnvw5HrwZeU0df85IjOKBJMRJ7Wzw=; b=y1oiFuLAl+rPa0hBroK+2AATqC
	YHsE7GEs2KyoxBGHmI5OwaafS5Ra3dsAcsBuViG5oAEoySzb8azh9+eHyXkxUKu7LHRFpFUyltA0M
	b9ftBM35y2FPYN0WVHjWPJhV1EurOPtoR4AXLXHW2NoGzVfN1ZzimMQDB+YDbYN+UTnzzfvpRIwUJ
	RIKRFUqzI7l2jRJkNbdVuBOlmNkLATNIPwDn14ULD/x0CEM7adrkU7npEzWeaOYIqchExK16TWmh5
	jfQfZYxY2TAkWHZ1VPxVt5H0my8m3xOG3SeSPWk5NDSi6aIS8lL81GHMK4O5H3UbjULvtuIVrnePW
	+e7Y5ctQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoJm-0000000Cj93-3VQA;
	Fri, 31 Jul 2026 14:34:34 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoJj-0000000Cj7x-1UR0
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Jul 2026 14:34:33 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-39c62764c7cso15961321fa.0
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Jul 2026 07:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508469; x=1786113269; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cEYf8XWt7uIQNYBnvw5HrwZeU0df85IjOKBJMRJ7Wzw=;
        b=iVNfMcpXFtB98Qeb1E85GFVl2aXJlrmx8pFMUkFDNYu0Ooyf7RhXgt8uXD8SMkc+Y7
         5Vi+W/w+nOzWF2Q+/EQFDex2XvZ/937VCkNlBH7p9Pn0CAWZgKddMgV5QLSjcDAB5Zt6
         EGNV3Kr3B2le0LDTt9aKplrM3ekC1fjZeJIygEYLJZd3psAoz7EuCITFxjEwItlv6Lg4
         Hj+rm+HOgrmW0o4mZSvoWLHzlFPrjYdTuZoKNEFzDSton+y0hV56oISBXejmIaWqlV/C
         opsNFn2wyQiE1bIgnvjBmWzM1btpiMzz5zzYFViTRqeX3+2+WkgnBQEjy5bGjGiVuq27
         zjBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508469; x=1786113269;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cEYf8XWt7uIQNYBnvw5HrwZeU0df85IjOKBJMRJ7Wzw=;
        b=f5z7A7ic4eEKYCZAmR+KXFi7Qtz/Vnniz28V2YWJSb+P/ol/tEMobvdD437bX51ann
         bMKJ/XtAzSPPrG2qMpaprMPVi4l9t8wcG1Yr8Ye/W/wyAVPtpoVAipb/FRHOdQvNjPnB
         8SOCy9/3a1bJ3GxkoiGGF3y7a47fr4cyPtSydgCXL9hm/ctHdBInD2YtHOvKBeBkIZhz
         LqxJUwSccjYa8kMHAXhSZYLjov3pJNN4ULOoNacFmZqTq5fp3ZpFKV/B8NHQuywTSiM0
         CpkkXxWhPQTZaGPtYqSgcXhcAEQRtjBBS6HHeG/9U8bQ103JFRd17qAG0/uJW3I99nPp
         H43g==
X-Forwarded-Encrypted: i=1; AHgh+RpteyuU4aWDtaHRtJAahDY8N6KYzQV8alY5DQWWdBIPm1rNHITG7uG+SJuPXQDWEfII7oL1kl3k8oFCyFR3ZA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOJTPgWPwp6eTQGU5jCMzvD9mluEYXxT12QAyCQMcNw42RfaNh
	284zYK6VblgEYKm2gcTXD0O2AnMSDptsNJyBSN2cNAHVkWJh6Yrxf2z9
X-Gm-Gg: AR+sD13ILztdoE8VZDo8CFRm55MieVgD4KrNuq84+ZZ4OhMAeAiPzF0CnxnD8nQk3Fo
	6nF5UsoXZ3tNsqCBrILRk49UrhPUhEn+34kALwd5qjLAqtq9O70ZZRJMgZE+2FnC7qGBwZYPj5o
	8qGOCCy+Rm8HwjNiKsruRvhDMOVYdGteWLX0ylQEZP4ml5N2DwA0U9MsyN9tTXD8AomJTyXjrSf
	6A36GBmmlPN/07dtSb2duiInbqAR+ZRY8pVlRuIQ05kV+HQPW3aQjor8C9G3u8S2mDjWkWssAEV
	q+T2XEtjPM3HF+pbUfFyPiXMhToLa6r7YXmAimwHXRrHWIJDzub92Nt87Unbt2e9JkuMH7VHonG
	egG7tjAmmy4YBWJYN53NqGsQ/SzcvgpPIjRw8BEKR9OfxgafNPN/MpUUTrdcxxr7XJFvlKXa19T
	sJuLMGaAplUkELj9BuFrAOw2Z6i2fO8yppmlTbqz0vFfwDmq60ZlNbs+LY+4zWYEcS0GMqiDHd
X-Received: by 2002:a05:6512:3d03:b0:5ae:acbd:439c with SMTP id 2adb3069b0e04-5b2e2422d22mr454761e87.23.1785508468894;
        Fri, 31 Jul 2026 07:34:28 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e2441db4sm332262e87.45.2026.07.31.07.34.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:34:28 -0700 (PDT)
Message-ID: <7855a0c3-29ac-4842-8e07-352fcb535a63@gmail.com>
Date: Fri, 31 Jul 2026 16:34:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to
 ports for USB connections
From: Konrad Dybcio <konradybcio@gmail.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Daniel Scally <djrscally@gmail.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
 linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>,
 Alan Stern <stern@rowland.harvard.edu>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-12-wenst@chromium.org>
 <38397324-56b0-41e9-960f-152a16ce8b12@gmail.com>
Content-Language: en-US
In-Reply-To: <38397324-56b0-41e9-960f-152a16ce8b12@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073431_864428_256714BF 
X-CRM114-Status: GOOD (  12.40  )
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

On 7/31/26 4:33 PM, Konrad Dybcio wrote:
> On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
>> This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.
>>
>> MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
>> and USB 3.x Super Speed (SS). The block can also be synthesized with
>> either HS-only capability or HS+SS capability. The SSUSB controller
>> handles the device or gadget mode. Saying that SSUSB handles the HS
>> portion is wrong.
> 
> [...]
> 
>> +  ports:
>> +    $ref: /schemas/graph.yaml#/properties/ports
>> +
>> +    properties:
>> +      port@1:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: Super Speed (SS) data bus if SS-capable;
>> +          otherwise High Speed (HS) data bus.
>> +
>> +      port@2:
>> +        $ref: /schemas/graph.yaml#/properties/port
>> +        description: High Speed (HS) data bus if controller is SS-capable.
> 
> FWIW this is opposite vs what the (most common) DWC3 schema defines:

(s/opposite/different to)

Konrad

> 
> 
> (also true for mediatek,mtu3 and renesas,usb3-peri)
> 
> -- Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
>   ports:
>     $ref: /schemas/graph.yaml#/properties/ports
>     description:
>       Those ports should be used with any connector to the data bus of this
>       controller using the OF graph bindings specified if the "usb-role-switch"
>       property is used.
> 
>     properties:
>       port@0:
>         $ref: /schemas/graph.yaml#/properties/port
>         description: High Speed (HS) data bus.
> 
>       port@1:
>         $ref: /schemas/graph.yaml#/properties/port
>         description: Super Speed (SS) data bus.
> 
> Konrad

