Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64AA5C54E4A
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 13:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1W1uIW1yTRjaOWSrRZn4XPwWcs/FMebFW0j769IDic=; b=XkhCOO+iQOw/lax+IxFDfnxd9R
	V87wd35HzGMesqBbTbGbqkQbBzrfvQlFwHwk9MnQg7ynXMAuTG0j/r2bao8dKy7JCWZFwgD+GArGt
	b4JsTD38kqnd6vaWQALXpbRkEfM4HgZFFhQTExYrEX8LCoi6fIJS5r8cDiN5wXy+GJdcB2s/yQZO+
	kV919wlviTXwY0rlUVyH89IuOS2nxhK9Lo5WD0BMH66U0qD9fG/twISOb7rY6l9Lka4nCV6Djun25
	MaydZ62ezu6GbC+FmvY9PI7LJTVEghDPhgYgZVz80J8z267Sn5pk7cG/TFxvRpHj+pX3Ya6FcPqsa
	qniOrCZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riaaq-00000009MpK-26pw;
	Fri, 08 Mar 2024 13:49:00 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riaal-00000009MmF-1wlp;
	Fri, 08 Mar 2024 13:48:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 599A620004;
	Fri,  8 Mar 2024 13:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1709905733;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=m1W1uIW1yTRjaOWSrRZn4XPwWcs/FMebFW0j769IDic=;
	b=mdafCrbE238vktgOYBwyLl+3RD4vjLBbljQ4Wwj1cCVBr0Ytaw2p8D5AuTJRDZ2bILdkuM
	bzt0LDOrWPwlprR1NDCSGxokr/h7bz0UPV7wFn6WjyiQpW6yloK+NJA9sa8H5bUY6v+kA4
	MWRmEN/M5BLjRQXyJY5Lde9i8LWlF7B0J3CbhGMYb8XmWcZnLVRHKaqMbLgTA80g3JLs47
	5S+8E8cD4i2KeK431KaxiiwPR9YfR4VAFd0aRWxM4V6BigFAOnSn4QuHl02mVqtukihcQ3
	0mFNBqPQUxcDfd/ofQiFDD5qHErmLNUYiIIBJ52xkgoM2gM4qLyY7egttYMYkw==
Message-ID: <7e9221ae-e53b-475f-9b6f-4cab58b2d109@arinc9.com>
Date: Fri, 8 Mar 2024 16:48:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] mips: dts: ralink: mt7621: add cell count properties
 to usb
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <0001-mips-dts-ralink-mt7621-add-cell-count-properties-to-.patch>
 <20240307223756.31643-1-justin.swartz@risingedge.co.za>
 <c445fd12-f8a8-41df-bee8-8b126b26110b@arinc9.com>
 <067071a9d57ffb09f437718cf905b121@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <067071a9d57ffb09f437718cf905b121@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_054856_455342_EB4515D0 
X-CRM114-Status: GOOD (  22.99  )
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

On 8.03.2024 16:21, Justin Swartz wrote:
> 
> On 2024-03-08 14:01, Arınç ÜNAL wrote:
>> On 8.03.2024 01:37, Justin Swartz wrote:
>>> Add default #address-cells and #size-cells properties to the
>>> usb node, which should be suitable for hubs and devices without
>>> explicitly declared interface nodes, as:
>>>
>>>    "#address-cells":
>>>      description: should be 1 for hub nodes with device nodes,
>>>        should be 2 for device nodes with interface nodes.
>>>      enum: [1, 2]
>>>
>>>    "#size-cells":
>>>      const: 0
>>>
>>> -- Documentation/devicetree/bindings/usb/usb-device.yaml
>>>
>>> This version of the patch places the properties according to
>>> the order recommended by:
>>>
>>>     Documentation/devicetree/bindings/dts-coding-style.rst
>>>
>>> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>
>>> ---
>>>   arch/mips/boot/dts/ralink/mt7621.dtsi | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
>>> index 5a89f0b8c..7532e17dd 100644
>>> --- a/arch/mips/boot/dts/ralink/mt7621.dtsi
>>> +++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
>>> @@ -289,10 +289,10 @@ usb: usb@1e1c0000 {
>>>           reg = <0x1e1c0000 0x1000
>>>                  0x1e1d0700 0x0100>;
>>>           reg-names = "mac", "ippc";
>>> -
>>> +        #address-cells = <1>;
>>> +        #size-cells = <0>;
>>>           clocks = <&sysc MT7621_CLK_XTAL>;
>>>           clock-names = "sys_ck";
>>> -
>>
>> Please keep the empty lines. It's easier to read. I don't see anything on
>> the Devicetree Sources (DTS) Coding Style that would restrict this.
> 
> The reason I removed them was due to the SoC DTSI example shown in [1]
> lacking empty lines between properties, but then using them instead as
> visual separation between properties and child nodes, or at least that's
> how I understood it when I looked at it.
> 
> Personally, I prefer the look of the SoC DTSI example - but I don't mind
> recreating the patch set with the empty lines between the properties left
> entact.
> 
> As there is a mix of property spacing and ordering styles in mt7621.dtsi
> already - what is the consensus on what a node in this file should look
> like?

There's no precise spacing style I maintain here. I simply group together
properties that describe a single attribute, and separate those that
describe different attributes.

> 
> I also don't mind following that pattern and cleaning up the whole dtsi
> according to that if it'll save us all time and energy in future.

If you'd like to improve the ordering style of the MT7621 device tree
sources accordingly with
Documentation/devicetree/bindings/dts-coding-style.rst, I'd be happy to
review those patches.

Arınç

