Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E213AC54E5D
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 09:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zZH9qUNtgW2Xw18S4ZKnK8rTsmDzcvUUwKZrWvPgRFE=; b=UmJoCqmRDlsBDXybh5C9Q5q8NR
	91yHiBl9vWe1b7j55ZxBzyV8f+nMvVWdtD1sdOslDv2tpOx484q1XFCVNbVvlWER76cPedaYpH2Xf
	uaidBx3We4BZ8k6kzfUwHCtBTfh0WFXO80ZgKELixgOHoEMq8ubt+2FNajgJvqRmrrxURJr7cSqjo
	CSXob+ALNqgJS2cAWSQOST6jB97w1ABfd3buSEsT0jlKZFi34Hzn/J8yDZKC91gIVWcqqQhIIJx4Z
	Y69EjS+wh1S2bCtCUVA2chCaY3nk3PQQPEdtrfOunyuK/oRXi/rbv+zO7B2T9IxGki1YSKUeC2kFq
	NPfnVFwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQHh-00000002rBt-2Vkr;
	Sat, 16 Mar 2024 09:24:57 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQHd-00000002rBS-2CJH;
	Sat, 16 Mar 2024 09:24:55 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 139B7240002;
	Sat, 16 Mar 2024 09:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710581091;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zZH9qUNtgW2Xw18S4ZKnK8rTsmDzcvUUwKZrWvPgRFE=;
	b=OcckQWQi32xy54cfHQz3WLnCSoqaaq9oHgi1nlYUUm+TTAdG/BiGRTFQZqH3l60DmNSiSn
	E1B9O1gMj2IqLvVNhZ/8HAO0Dwi/X/BTKiRTm+7Uxg4w3QxlHvvSEx1cxL/gPHghCLnOnm
	59NU5k/QkiBr5DX6iHyo+E2/mf5vu/chMZbs7RSvDI4S+PMk16U0co+52yYf/i4J2xC6T0
	xJ0tREElf19+E8FHaG4K/HpB8qfTX83KYLk4Hwre1O8T/0kaabiRoZfg3LE3Sbw1I8cSMN
	lsp0Irv1buYH8lxtIvL3n9qxp4uziOAMcySXVENqDgbn4c23tQm06cgKPQDuzw==
Message-ID: <31b3d00f-6cf4-4bf8-ad78-a8354d57c518@arinc9.com>
Date: Sat, 16 Mar 2024 12:24:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] mips: dts: ralink: mt7621: improve DTS style
Content-Language: en-US
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
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_022453_795630_C1ED3CD4 
X-CRM114-Status: UNSURE (   8.60  )
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

A well done patch series. Thank you very much for doing this!

Arınç

