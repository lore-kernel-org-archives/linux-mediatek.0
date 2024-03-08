Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5550C5475B
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Xnmr9MOB5BVmHHO38AExbFHMmYDJ5xhXQdg0uW60yc=; b=0dCi9x8w2TEUhvsBwVh0rLQabG
	OI9Goo6+AFCoSstGGoWcTDvc45hnoWavUdX8ljExcnuwdWjjWPQEcPNjwAl77ZJfZDYr852FTZyZC
	tAdOAT0tbMG/KkN1jajsIg02/FLLtS4ZPekN1Jf3jikatbD56ES8bSPcSyBT9gendWFPkdQ3fSf8+
	c3019XAnrCXn8ZqfsRaLEc3Dbu2E+MylMs+48jnyxanDlAx/a3hH/1RqK0XChcsCMvgtTdeqZjc79
	Zmm/vbpH2zCVBovFh6fqObWJhYbrIblLw7+B/wPwpSimVnhPw7D52AKLc3mDPSfyuWgOWzhkb98cV
	WkhUkzAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ricx9-0000000A80G-3tlv;
	Fri, 08 Mar 2024 16:20:11 +0000
Received: from relay4-d.mail.gandi.net ([2001:4b98:dc4:8::224])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ricx6-0000000A7xY-0oEL;
	Fri, 08 Mar 2024 16:20:09 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0CE39E0002;
	Fri,  8 Mar 2024 16:20:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1709914805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Xnmr9MOB5BVmHHO38AExbFHMmYDJ5xhXQdg0uW60yc=;
	b=ElLEqFNtfogo4T3KgmIGrNZ0WebCj57wAEylrFhNXCA5WzYQn91qzrcKwQLTxtgpD8/MKJ
	KkFH8dNoWReyYqihY6uL7r18tr+MURWJqwDDC5zOiv3vLdBpEXdH4N3Zv8Mmpzhm20uZ2Z
	acAGDPvc1NOs/tad60HMQ5hLKKhkqfPzFP7mcTN7P3Xn1TJU74BoZUfJej40ftVI97vPhT
	1fUqKjQRg30llQQdfVKLRvvEFaMvs7VbJ2E7UGo4AddvrdKUtdey9gIRKIncRByQKkpC9k
	A7sfWfiDan69753e1j17Z97yUwrjKEzJ2OT1BkeTbuT2hxsNcmOaWI60dZoh2g==
Message-ID: <f93f19de-1da4-4f8f-92f8-52b4cab0cf85@arinc9.com>
Date: Fri, 8 Mar 2024 19:19:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mips: dts: ralink: mt7621: add cell count properties
 to usb
Content-Language: en-GB
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240308161130.12228-1-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240308161130.12228-1-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_082008_399404_D71A8719 
X-CRM114-Status: UNSURE (   7.36  )
X-CRM114-Notice: Please train this message.
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

On 08/03/2024 19:11, Justin Swartz wrote:
> Add default #address-cells and #size-cells properties to the
> usb node, which should be suitable for hubs and devices without
> explicitly declared interface nodes, as:
> 
>     "#address-cells":
>       description: should be 1 for hub nodes with device nodes,
>         should be 2 for device nodes with interface nodes.
>       enum: [1, 2]
> 
>     "#size-cells":
>       const: 0
> 
> -- from Documentation/devicetree/bindings/usb/usb-device.yaml
> 
> Acked-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

