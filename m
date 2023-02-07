Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBBC4C636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 15:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIbYH97TxLgixdKa28c31PIMP/GNt5Y/8VwWaoYgHoQ=; b=J/VpbnP2Um2RueRC8+Kc/8JCHv
	qbBdzO0MFmBAoB+AZo8iAoV3xJOsqNxgHdXhXU2x+oFehnK3EJIlxYAUwf1k9jInBluRs71kGao7i
	a5x7tkxZrYE9SBgRoAbi3/FOss9SOh6GsUAuA1UX0PYnNG5s2F36h4cyBOZvsyBh2wDAm8dzENBPx
	HxWMyoLzYcvM8uBsDUMy+wKktxoK/BBwHiv1UwsZtfz+X9I+duAhFaZZJG2hYNfQNIvKTt5LDSZw1
	myLOp3AmvO7RtgAHU9AKz76eewlyoE0PCJYgBSKUMdDn5JLBQdS2l95bszuaFteXXQue/+GHxa/hJ
	PTEP8vMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPoF-00ChKu-L3; Tue, 07 Feb 2023 15:23:03 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPPo4-00ChFc-IS; Tue, 07 Feb 2023 15:22:54 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C28736602077;
	Tue,  7 Feb 2023 15:22:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675783368;
	bh=TZepTjo3+nkX5BEQbUyUdwEN1gV6gBz2EQ1M2bKFwnY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jOCPgYCsbXt8gQDxCDqMhk3LT2l7kUUGjjAmcqFWgHpsSrmi+eBZyju608AbpEQTS
	 JwfANqNaoiogWq7GX08/8RSeiYYaduBrfqaXic04dQ9iipkVgU/w/5iWq+5NSkXAV4
	 iO+Zo/PRQw/f7eDgoFKi5Df6Kt2AjflDk6+jLZTeLy1DyWqQ3AF+yh2hPrx7f3sGPc
	 BWhyiyXKZC3Be5GoQUVEM8Y8seq4EvVIxCMHwxDVCvVYbixGXt2JPynse5fgXpBTUk
	 fKQANB/aulkoAye/QTiUzhNN3vzsR3bBwBTIBTRdImfcYsmScYov9hdCjo4PswTTrQ
	 bOttbVgsizukw==
Message-ID: <326154c5-0a78-31c0-2d70-1ef4a8a0c1bb@collabora.com>
Date: Tue, 7 Feb 2023 16:22:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v1 29/45] clk: mediatek: mt7986-apmixed: Use PLL_AO flag
 to set critical clock
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 wenst@chromium.org, johnson.wang@mediatek.com, miles.chen@mediatek.com,
 chun-jie.chen@mediatek.com, fparent@baylibre.com, msp@baylibre.com,
 nfraprado@collabora.com, rex-bc.chen@mediatek.com, zhaojh329@gmail.com,
 sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
 yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com,
 sean.wang@mediatek.com, chen.zhong@mediatek.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230206152928.918562-1-angelogioacchino.delregno@collabora.com>
 <20230206152928.918562-30-angelogioacchino.delregno@collabora.com>
 <Y+JjjLLYoOgSlG55@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y+JjjLLYoOgSlG55@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_072252_854744_4CDA186B 
X-CRM114-Status: GOOD (  20.63  )
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

Il 07/02/23 15:43, Daniel Golle ha scritto:
> 
> On Mon, Feb 06, 2023 at 04:29:12PM +0100, AngeloGioacchino Del Regno wrote:
>> Instead of calling clk_prepare_enable() at probe time, add the PLL_AO
>> flag to CLK_APMIXED_ARMPLL clock: this will set CLK_IS_CRITICAL.
> 
> I've been preparing a similar change, but also splitting-off the
> apmixed part from dt headers into a file of its own, so that one of now
> identical drivers for MT7986 and MT7981 can be removed in favor of a
> shared driver.
> Should I propose this on top of this series or can you make this change?
> 
> 

That's cool!!! I'm not comfortable in stealing the idea, that's all yours.
Please go on with basing it on top of my series, but wait a couple of days
before doing that, as I have to send a v2 of this one and that'll happen
in the next one..or two days.

Cheers!
Angelo

>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clk/mediatek/clk-mt7986-apmixed.c | 4 +---
>>   1 file changed, 1 insertion(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-mt7986-apmixed.c b/drivers/clk/mediatek/clk-mt7986-apmixed.c
>> index 62080ee4dbe3..227ca572056e 100644
>> --- a/drivers/clk/mediatek/clk-mt7986-apmixed.c
>> +++ b/drivers/clk/mediatek/clk-mt7986-apmixed.c
>> @@ -42,7 +42,7 @@
>>   		 "clkxtal")
>>   
>>   static const struct mtk_pll_data plls[] = {
>> -	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0x0, 0, 32,
>> +	PLL(CLK_APMIXED_ARMPLL, "armpll", 0x0200, 0x020C, 0x0, PLL_AO, 32,
>>   	    0x0200, 4, 0, 0x0204, 0),
>>   	PLL(CLK_APMIXED_NET2PLL, "net2pll", 0x0210, 0x021C, 0x0, 0, 32,
>>   	    0x0210, 4, 0, 0x0214, 0),
>> @@ -77,8 +77,6 @@ static int clk_mt7986_apmixed_probe(struct platform_device *pdev)
>>   
>>   	mtk_clk_register_plls(node, plls, ARRAY_SIZE(plls), clk_data);
>>   
>> -	clk_prepare_enable(clk_data->hws[CLK_APMIXED_ARMPLL]->clk);
>> -
>>   	r = of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
>>   	if (r) {
>>   		pr_err("%s(): could not register clock provider: %d\n",
>> -- 
>> 2.39.1
>>
>>



