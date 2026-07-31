Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48FF7C54F54
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jul 2026 14:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eA4/Jfq3oApsdwkMmM8JpBKsrNAF9FmOl3wpFinK2xk=; b=AoAa9lHu35HC+n6uNj+LEFeaaG
	TFb41W4r27lfDO1Ok+oVy17dcX2xdQV9bDsnXHkf1HLiFLWeXhZH+sF8CUD8J3mYa+7Z9Dn/0VKAY
	ZSX/HKTNhTgyPsLXv9BA7TEilicVh5OmVWd2Ukz5EdSOBFUob6ZVcq/BfRzEmwCaLRweW3PW/wumx
	j5fYVI/xuOJJkyTLb0jH+YhWysyRQiaMQk+dNJitB9ezPMqoVpDp8qpYtFAXCmu7NJv6ZfjroC0/v
	FTwwPy/0RGdwyMR2VRcnIoxP4DIewZ26GvCphd6SOE3p1Ml04e8X5+6XO+N2L/XrQ1GNK6e4Q4r0w
	G+KftnHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoIk-0000000CivO-1zqL;
	Fri, 31 Jul 2026 14:33:30 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpoIi-0000000Ciu9-0ebh
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Jul 2026 14:33:29 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-5b0148201fbso1038388e87.3
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Jul 2026 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508406; x=1786113206; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eA4/Jfq3oApsdwkMmM8JpBKsrNAF9FmOl3wpFinK2xk=;
        b=avH/Gj0nnXgs0Y0bP/dYMTG+aVQ+hyUuIZDYInNGxUUQYhaUCvXivNzCxWA6HwQCjn
         5jKYD/YKBPOuAsc2KHAhRbP8peEk9fDAr96TpAAyT2hbN6/WWGVG068860CCyUv4a0ju
         uqU8p+0I5xahPl8UwoNH8hs6V5dUib3LwKDWNqG56Pil/tlY125DDIxiLqxsqJyBHmWl
         JSVnFg5xg0TyCyUeZVUHOOqMSbbNy1FWiqo3SoFOZJqKjg7cZY/Qzp/4bGETPfnxyZ7Q
         ulp0R8gLt6RyYodRSZ9FyFSZ1XOZSnsECT4P6Bx/kptaRggmaOXlfuO4GTHck5QXam/s
         KDkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508406; x=1786113206;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eA4/Jfq3oApsdwkMmM8JpBKsrNAF9FmOl3wpFinK2xk=;
        b=RU5EqtKRtZobQoRVbVQjG87DJT/vvZFqhKGQiraqHNznLptvQ9bvyC52mMlCmqaT+y
         yVO4K1VWJAIbHrtp5lCu1QacmQbYWJA9CnQYAYDW9ZN2KywO2wnYuPkQt7mLyNkccbXG
         6m06kMVkz9kyAZ/RpQChiJZXBzKUMIPKHDdgdTX5evh0itZiCA0DsJIlV56gmdMdtm30
         D4wsoXsLC8fu3wrMltV2Cjs/r0/K0FfTar0DQRAw+x2MA4PifUmtewiPFWZ8dLDd8RYv
         IEavZWnva17DMs7KXqm+aKBdaS97DH/OAB+IF4irFdktfS7SFipIV9aviZBjwbJDkwke
         TYuA==
X-Forwarded-Encrypted: i=1; AHgh+RpofFi8OUP+Vz5nKtWSSL8fnDM3e/F2hH3uZK1ov/H87vc3oABXYjYJD+0Rp3qLCUu3UkYpZhZaforkR9EegQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRvxOshUvhjPe1Abay7IjvSfeCvJKVsktswQSwCim7844guYSl
	GvhaMVh3vBCNvRX9WqH8znS5SMecFpkykseg7M4TNsp4r8GZvtUACk8U
X-Gm-Gg: AR+sD11Y7rokQyLNtK9Vquivi6w3B+pnnLooSxoAt8F/n0r2sS3rthk90BWVzDoFS+M
	CYxnBpvyLd4P7CEX0QHPFtXOvA6NMyHfgoZAMZ5A+VjR5vb1Y2NhOn9ndXZDq85Z9wgIRnz24q9
	VwmeivL4u4OE1p+sRIC8jkICEC35QpKCmXu0e2Ukj6Clh5WLQpXm0jsIMfCJeyyi8PSVnXPmkKv
	RWyXfn68tEONEyrQf7I4EspwwciHh57ERDw6z0rzJNWx1A+BzNx7NH24z8ASwLGXbWIesFZg8ek
	+TurIn4x92Li+BujWVkyNxgayU1qZ7W86VtuOALLCp5wvfPnbNLI+DJzzRg5KX0GhraG4sFeCx6
	BteshFv554k76xJSb1pWOhJxDqSO0OrLGgi7ydZjYJgJOt/17ha3knPoB+pk8ui/20iIRniIt+r
	/IdDT+Gg6y1JX2bqHtI7duo14n+vC7cSiLSa34bcXpBL0UjbpmbKzq3WNr1qFnNfb4JvL0Jt77
X-Received: by 2002:a05:6512:3d0f:b0:5b0:17e7:67cb with SMTP id 2adb3069b0e04-5b2e1fc6317mr582376e87.17.1785508405470;
        Fri, 31 Jul 2026 07:33:25 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2e23c556asm341380e87.9.2026.07.31.07.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 07:33:24 -0700 (PDT)
Message-ID: <38397324-56b0-41e9-960f-152a16ce8b12@gmail.com>
Date: Fri, 31 Jul 2026 16:33:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 11/16] dt-bindings: usb: mediatek,mtk-xhci: Switch to
 ports for USB connections
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
Content-Language: en-US
From: Konrad Dybcio <konradybcio@gmail.com>
In-Reply-To: <20260721065413.2306137-12-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_073328_200405_A3CE2E9B 
X-CRM114-Status: GOOD (  10.03  )
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

On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
> This reverts commit 454a1e3cd36c113341d7b71e8e691c6e47ab4a8a.
> 
> MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
> and USB 3.x Super Speed (SS). The block can also be synthesized with
> either HS-only capability or HS+SS capability. The SSUSB controller
> handles the device or gadget mode. Saying that SSUSB handles the HS
> portion is wrong.

[...]

> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Super Speed (SS) data bus if SS-capable;
> +          otherwise High Speed (HS) data bus.
> +
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: High Speed (HS) data bus if controller is SS-capable.

FWIW this is opposite vs what the (most common) DWC3 schema defines:


(also true for mediatek,mtu3 and renesas,usb3-peri)

-- Documentation/devicetree/bindings/usb/snps,dwc3-common.yaml
  ports:
    $ref: /schemas/graph.yaml#/properties/ports
    description:
      Those ports should be used with any connector to the data bus of this
      controller using the OF graph bindings specified if the "usb-role-switch"
      property is used.

    properties:
      port@0:
        $ref: /schemas/graph.yaml#/properties/port
        description: High Speed (HS) data bus.

      port@1:
        $ref: /schemas/graph.yaml#/properties/port
        description: Super Speed (SS) data bus.

Konrad

