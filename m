Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A431C67861
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Apr 2024 07:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TOp49wR0ZnxZnd24arLLCuD8wpBxdjATDAE8QmV+ES4=; b=dJcCQ3s1TftjoQyBrn3vGspTaX
	V129AA7BV/a/2fLg5z+aejxlwmHF+c5fnueTZ/OhlmzaZuHAYIgcRJn+GXfRUxQalFncQZekvt22v
	diupm61iW5DvZ2Oq5xi8ZZT9Aw7KytwFnuqT7+CMkdw37833Brn6pQ+S3saTrTDkUIfsmyJiZEMIq
	6zQWs5/crSRudf/QI2rd4HBojXhzCL0NoIdk4lsSQOky/oaUZfqlJEOYw50Bxhue1Yst26YrWtIW2
	tm8V9xLhAiEQI5fZY4gzDwKz64fVwAHB26843x0Q7LBwzUcbr/AmY3+zyNeu91Mp7Ho1hkZOF20xd
	yfBHAQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjXN-0000000EfyQ-1XAn;
	Mon, 08 Apr 2024 07:35:29 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtjXI-0000000Efwx-1Q7e;
	Mon, 08 Apr 2024 07:35:26 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8293F20003;
	Mon,  8 Apr 2024 07:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1712561715;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TOp49wR0ZnxZnd24arLLCuD8wpBxdjATDAE8QmV+ES4=;
	b=SI4j28qfV9ZiONtSaHOnwCk87oVwiir9ac6G/abNo4NaUkl50ord6H4AMnuvFzhvpOQX8g
	lDswJG2dZCztV2XiICclsxAe0VmPTqcwqGK0yvCEdS2UwuvetMqW3mbNBTu0gpCbafSVLx
	VqeYCnaSAAYJ/AxwQsBfl10X6PI7slsE+AfPMwmWBIx/jWJ0GCzhSadHQPMEbkzis0f1Ik
	AycxZwtm/rJl38O1RokPnQuB4puX2S9r4WZuJ5NAZK29GZyT4mI0cTcP6V/vYQ+mF3mkmK
	m+OvM1JiyJMpYCzs/PRtLG5KKmyxfXEqvKlRONihhDdsZ8HSlYPn+wr24BZm9Q==
Message-ID: <6e8d08e4-5b26-4705-b636-0fc4412a7457@arinc9.com>
Date: Mon, 8 Apr 2024 10:35:07 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] mips: dts: ralink: mt7621: improve DTS style
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
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_003524_667331_A73BE303 
X-CRM114-Status: UNSURE (   9.84  )
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

On 16.03.2024 07:54, Justin Swartz wrote:
> This set of patches was created with the intention of cleaning up
> arch/mips/boot/dts/ralink/mt7621.dtsi so that it is aligned with
> the Devicetree Sources (DTS) Coding Style [1] [2] guide.
> 
> [1] Documentation/devicetree/bindings/dts-coding-style.rst
> 
> [2] https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
> 
> Justin Swartz (14):
>    mips: dts: ralink: mt7621: reorder cpu node attributes
>    mips: dts: ralink: mt7621: reorder cpuintc node attributes
>    mips: dts: ralink: mt7621: reorder mmc regulator attributes
>    mips: dts: ralink: mt7621: reorder sysc node attributes
>    mips: dts: ralink: mt7621: reorder gpio node attributes
>    mips: dts: ralink: mt7621: reorder i2c node attributes
>    mips: dts: ralink: mt7621: reorder spi0 node attributes
>    mips: dts: ralink: mt7621: move pinctrl and sort its children
>    mips: dts: ralink: mt7621: reorder mmc node attributes
>    mips: dts: ralink: mt7621: reorder gic node attributes
>    mips: dts: ralink: mt7621: reorder ethernet node attributes and kids
>    mips: dts: ralink: mt7621: reorder pcie node attributes and children
>    mips: dts: ralink: mt7621: reorder pci?_phy attributes
>    mips: dts: ralink: mt7621: reorder the attributes of the root node
> 
>   arch/mips/boot/dts/ralink/mt7621.dtsi | 430 ++++++++++++++------------
>   1 file changed, 239 insertions(+), 191 deletions(-)

Thomas, will you apply this patch series as is or should we squash it to
one patch?

Arınç

