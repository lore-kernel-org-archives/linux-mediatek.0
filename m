Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0CEDC77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 14:18:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w8EcgL8XH2DYKYLWbrmI23f+0NvOQxEV1exc96sdfeo=; b=a8J3fu2RFMojLI54cGj7TMUXtP
	/ib1WaqfnykCuD7+u47hknVZgEgWV+bwtRuNZU0Q1/8BOzxslgBBr+JqrPurWplQaklkFBqlE+lAX
	kl/fttD6UIJC936Uav/B+04/4MK3SkM0I4BHqyAyUXPU5VrIbXtU4bu94CTVZhe5cQQH3z2JwUXoL
	z6f4Urc41ogr044Z6FqpVLVVMkmcmSjkOMPyCCscTXT/m+oBjMcFeh0Vi6BrCIAFTQnfm/+s7K81H
	9TEh9PrEdvfDTDlpNkMgdxtBprFK00YPEb2Tinnp/+GkLo2+ptdsrZzokZQexLtKspkJzJgrXzeRB
	8a6jGO8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyZ1W-002NT3-1W;
	Mon, 15 May 2023 14:18:02 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyZ1T-002NRK-22;
	Mon, 15 May 2023 14:18:01 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CFE4966058D2;
	Mon, 15 May 2023 15:17:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684160276;
	bh=isAu6jaVeMeTLU5u3pXCbHYMMByM16GBW5K9iE6wVqM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E69ssZrHbA8dsU7JD1aA1yNwFgIFGa0oJvFQ/Vpc25IlMQ2Hxz/BxoHaMBvjlPwrO
	 3SXNMteCZzP+chskAdlAOobejNHmNhFiyLDXOcYKGCzs8GiceWkgQz/tjuv7QBev3p
	 0vClO/kOP5dMbdxm40B9TSQTx0PxxachJjvpMq4X6h5M+yKzO9eZeMM7Ul+ZdwhuqF
	 erD4C3GgGVXW5hH7FTRMmBThEAETUHnycQ7AP4aC3jBdEyhJUoHvrFlh5UMAIdC1n1
	 Yh9LagnpYpJ2qskxEa+I1dsO/S/Q91vHcMdZcDDCDzAH+0zI5l5B1H4bTe9+EYum87
	 IxG/FN1b2ZGhg==
Message-ID: <adca53e5-5c26-e087-f142-5a6f9e9961db@collabora.com>
Date: Mon, 15 May 2023 16:17:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
Content-Language: en-US
To: Markus Schneider-Pargmann <msp@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20230511133226.913600-1-msp@baylibre.com>
 <8603c2b2-2a5b-48f6-9b08-9b3b518b716b@gmail.com>
 <aa383909-7a03-eb24-3a61-397f2a6adb54@collabora.com>
 <20230515140153.ppjl4zyshscvcbuu@blmsp>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230515140153.ppjl4zyshscvcbuu@blmsp>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_071759_870587_C925DC5D 
X-CRM114-Status: GOOD (  17.47  )
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

Il 15/05/23 16:01, Markus Schneider-Pargmann ha scritto:
> On Mon, May 15, 2023 at 01:49:54PM +0200, AngeloGioacchino Del Regno wrote:
>> Il 12/05/23 13:51, Matthias Brugger ha scritto:
>>>
>>>
>>> On 11/05/2023 15:32, Markus Schneider-Pargmann wrote:
>>>> The given operations are inverted for the wrong registers which makes
>>>> multiple of the mt8365 hardware units unusable. In my setup at least usb
>>>> did not work.
>>>>
>>>> Fixed by swapping the operations with the inverted ones.
>>
>> ...with the not inverted ones, you mean!
> 
> Actually now I am not sure how to express it correctly, maybe I should
> have just left that sentence out of the commit message.
> 
> I meant replacing the no_setclr_inv with no_setclr for TOP0 and no_setclr with
> no_setclr_inv for TOP1/2.
> 

Yeah, the sentence may be a bit confusing, but you're actually inverting the
inverted ones and the non-inverted ones.

It's fine, anyway, this commit can get picked as-is imo :-D

> Best,
> Markus
> 
>>
>> Anyway,
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>
>>>>
>>>> Reported-by: Alexandre Mergnat <amergnat@baylibre.com>
>>>> Fixes: 905b7430d3cc ("clk: mediatek: mt8365: Convert simple_gate to
>>>> mtk_gate clocks")
>>>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
>>>
>>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>>>
>>>> ---
>>>>    drivers/clk/mediatek/clk-mt8365.c | 6 +++---
>>>>    1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
>>>> index 6b4e193f648d..6d785ec5754d 100644
>>>> --- a/drivers/clk/mediatek/clk-mt8365.c
>>>> +++ b/drivers/clk/mediatek/clk-mt8365.c
>>>> @@ -583,15 +583,15 @@ static const struct mtk_gate_regs top2_cg_regs = {
>>>>    #define GATE_TOP0(_id, _name, _parent, _shift)            \
>>>>        GATE_MTK(_id, _name, _parent, &top0_cg_regs,        \
>>>> -         _shift, &mtk_clk_gate_ops_no_setclr_inv)
>>>> +         _shift, &mtk_clk_gate_ops_no_setclr)
>>>>    #define GATE_TOP1(_id, _name, _parent, _shift)            \
>>>>        GATE_MTK(_id, _name, _parent, &top1_cg_regs,        \
>>>> -         _shift, &mtk_clk_gate_ops_no_setclr)
>>>> +         _shift, &mtk_clk_gate_ops_no_setclr_inv)
>>>>    #define GATE_TOP2(_id, _name, _parent, _shift)            \
>>>>        GATE_MTK(_id, _name, _parent, &top2_cg_regs,        \
>>>> -         _shift, &mtk_clk_gate_ops_no_setclr)
>>>> +         _shift, &mtk_clk_gate_ops_no_setclr_inv)
>>>>    static const struct mtk_gate top_clk_gates[] = {
>>>>        GATE_TOP0(CLK_TOP_CONN_32K, "conn_32k", "clk32k", 10),
>>
>>


