Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC6D6C352A1
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Dec 2022 10:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IsTYMet2hWLr3HIOVIEYk8GU36k9S0NlblzhYMtyZX0=; b=Say3zueE0h27U7fsSsE8Z7VErb
	oe+9BJdTUmv9nHcNtE7ne5ZfkiW4s4ZRv+SS09CKiSCJpYvtYnqUgvdsTWq5k/ldREk5B+/7BqYFq
	CJI63KqmUSiiLqbsMSLu6nedxHApOYWZsNhdNUIHv1bWNgxv7EKp1bA4m0V4XYk97lNP0JC6WZh3a
	MsK7KdIN11DkzFMsR/QDqgVbXjAmR2dZMw7OOr2GDPKQVre71RwgbXwMgrCPFBtU8V39zF0hfoP4Y
	GjAzsiipNDKjIq5fuXhtLUuwNRHI2TtDNLOMdYrHtryW3nzA/lGDV6S7fIWjh8TXIv/KkaFU+u3CW
	tEMjubKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rML-00GvCl-H5; Wed, 07 Dec 2022 10:09:01 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2rM5-00Guvm-FZ; Wed, 07 Dec 2022 10:08:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1D0296602BCA;
	Wed,  7 Dec 2022 10:08:41 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670407721;
	bh=AyR0RJnVKrrqQBm9hFiiBr7ZIDDoQirRHSbrqdL6UgM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Lt1ouqtzvN/cuiyAwGqv8hAf7z0yOZ7kKLfaiI2zvDgg+xHD+3X9XYLh4CPC+tpeE
	 VhrqNI5+jpml1H8zckoIDyzdcqhFTgeSKuQxKVbtMMZOJ1poRgLRvY0Pgp1PtKd44e
	 URFvFOQWTsc99dYvNbtT5MFbJcqH3/HYxxZaseaihah8pgMfxy5QD8Bo6fpBLClyM9
	 F298s/We7GqPdmqjnLOpHPmWcjMMy3tCTGUjKdw/rF8yMeP8OcNFi525DTelWSPp0C
	 qDH4/2Vqi0afKEOssANEbUKPrr/V+WKYSOpb7f9n5RUlKJMsORCAfAKfwhMejfodD5
	 0Me9nh+W+yTYg==
Message-ID: <ff2931b5-948f-f013-056d-b0a78d7272d6@collabora.com>
Date: Wed, 7 Dec 2022 11:08:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 3/9] spi: mtk-snfi: Add optional nfi_hclk which needed
 for MT7986
Content-Language: en-US
To: =?UTF-8?B?WGlhbmdzaGVuZyBIb3UgKOS+r+elpeiDnCk=?=
 <Xiangsheng.Hou@mediatek.com>,
 "miquel.raynal@bootlin.com" <miquel.raynal@bootlin.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "gch981213@gmail.com" <gch981213@gmail.com>,
 "vigneshr@ti.com" <vigneshr@ti.com>, "richard@nod.at" <richard@nod.at>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QmVubGlhbmcgWmhhbyAo6LW15pys5LquKQ==?=
 <Benliang.Zhao@mediatek.com>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 =?UTF-8?B?QmluIFpoYW5nICjnq6Dmlowp?= <bin.zhang@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-4-xiangsheng.hou@mediatek.com>
 <ef2e6859-56e1-bbf0-dbde-44ea3d7d2f3f@collabora.com>
 <4db35ac3914e444b754f9075141fd69e07e7c858.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <4db35ac3914e444b754f9075141fd69e07e7c858.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_020845_670598_595005F3 
X-CRM114-Status: GOOD (  18.34  )
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

Il 07/12/22 02:42, Xiangsheng Hou (侯祥胜) ha scritto:
> Hi Angelo,
> 
> On Mon, 2022-12-05 at 15:21 +0100, AngeloGioacchino Del Regno wrote:
>> Il 05/12/22 07:57, Xiangsheng Hou ha scritto:
>>> Add optional nfi_hclk which needed for MT7986.
>>>
>>> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
>>
>> Is there any operation for which you need NFI_HCLK enabled, but at
>> the same time
>> PAD_CLK and/or NFI_CLK can be disabled?
> 
> No, for the new IP design on MT7986, will need the
> PAD_CLK/NFI_CLK/NFI_HCLK enabled at the same time.
> 
>> If NFI_HCLK and NFI_CLK must always be ON at the same time, adding
>> this clock to
>> spi-mtk-snfi.c is *not* an optimal way of doing things: you can, at
>> this point,
>> set NFI_HCLK as parent of NFI_CLK in the MT7986 clock driver instead,
>> without
>> making any addition to this driver at all.
> 
> For some IC, there may have only NFI_CLK/PAD_CLK, and have no NFI_HCLK,
> this rely on IC design.
> 

I've just checked clk-mt7986-infracfg and we can't reparent NFI1_CK, nor SPINFI1_CK
as they have xxxx_sel parents already, which are not common with the HCK.

You're right, the addition of the nfi_hclk clock is needed, which means that for
this commit, you get my


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


P.S.: Thanks for clarifying!

Regards,
Angelo

