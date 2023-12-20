Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2E07C3DA6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 13:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOS8DTrvmPSw+knXmLbsq5Dg1l74tlA+SpqMinNtpIo=; b=w2j/bJ0ETjHgb9qDdihFX8QDhf
	NLqqqhU8HhqKkM2dlZMnxfLVev/Ya/7aa27KwcvUGhLZK//0rqtcAZe/JFwNSCTwDC+9QzDR2K7Up
	IthdzsC9mLAeOplY1wrJuP7dcLPknAzG22eDqyI/vj5B/5JzutIvCvM4ag30HeS7cN7GLKW/JNbhj
	kt4DLMAMUzLOCY7aJGYan6uowumq30VSt/KZfq2fTjwgnGPyg/tGTiJ5efDX7ioRmXFNwJzTtLk5M
	XWZ7htzV/A77NHkiODEOxf+95VrlzHvVCwbp7DL1RWSwKeG1/wWxemkYlQMq0wTfeCL0CLfg81nTE
	7/NJjTXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFwOe-00HTrz-1y;
	Wed, 20 Dec 2023 13:14:00 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFwOb-00HTqW-2o;
	Wed, 20 Dec 2023 13:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703078033;
	bh=U12hPniJ+DF7IxQzd9EDTvjLsfdGz2472CrJfYpM9O0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CFJ6GVQ0Qq/6obqVZnHcU/vZWLRZCY+ZYJn45S9ToZ3nFiZkTN6TZc6JYzpiAhdXb
	 VscFsaNOUSZbDHINbB/rOolsFnUhV7LcwvpVdQrQzTX3mTOqY5KRmUrYr7RkNk7z3g
	 ejipU50/EvlQ9S2xC+AX9WJAM3JewvYLNjnFNwGhSJOBIUDb6W45vczg1L3HA9hAVi
	 4CqQ81S6JhAEvutaN22Hx2yXDkah9uEdTGgWL4UZ1Nu+i7uVGyhJdmqCJ1Mni1cQEU
	 kbuvch/iDfRj8F6p0REB/k91oxNa+WZ+y0B/r/4QIYqZRmNhDlKufsCazYbVJdkQct
	 8QLw6SRI0rMkw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id AAD32378107D;
	Wed, 20 Dec 2023 13:13:52 +0000 (UTC)
Message-ID: <479fa717-8de7-4f1b-b02c-2cfbd49f71cc@collabora.com>
Date: Wed, 20 Dec 2023 14:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] soc: mediatek: mtk-socinfo: Add driver for getting
 chip information
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231220103901.22180-1-william-tw.lin@mediatek.com>
 <20231220103901.22180-3-william-tw.lin@mediatek.com>
 <97d54894-7c71-49d8-a456-869c398636ec@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <97d54894-7c71-49d8-a456-869c398636ec@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_051358_107306_3C92453F 
X-CRM114-Status: GOOD (  13.06  )
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

Il 20/12/23 12:34, Krzysztof Kozlowski ha scritto:
> On 20/12/2023 11:39, William-tw Lin wrote:
>> Add driver for socinfo retrieval. This patch includes the following:
>> 1. mtk-socinfo driver for chip info retrieval
>> 2. Related changes to Makefile and Kconfig
>>
>> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>
> 
> ...
> 
>> +static struct platform_driver mtk_socinfo = {
>> +	.probe = mtk_socinfo_probe,
>> +	.remove_new = mtk_socinfo_remove,
>> +	.driver = {
>> +		.name = "mtk-socinfo",
>> +	},
>> +};
>> +builtin_platform_driver(mtk_socinfo);
> 
> module platform driver, because this is tristate and because this should
> be a module.
> 

Oh! Yes, right! Thanks for catching that, it totally slipped off my brain.

Cheers,
Angelo



