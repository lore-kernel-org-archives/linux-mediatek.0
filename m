Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C51A7EB64DA
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jul 2023 09:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6PvR0BmPCX2F7Z/dAooVkslxoa6D12tqjDYCACtz70=; b=aCkEyDw5SirRHWdxFZ69XPgti0
	KngbcHJlBCc385syddHi2mIDBVP6sVwu4YGIpUlv8bXLgsM/al+Wlt6HUUYa2m6BbLFk4QQ0AkEyj
	2dmhWOd1jpzLuhc49F45m58MuaZPjkOZMEOtXdHz8T45mP55RABMIRvaYeRVr3voOSKQ+15YXtuLW
	aRqHrNC4fxo2Y61IQbNC+APzPcC04Odfbr0rFCGrIVRjFXeMEXBmzgWFw0D9OYs9poxLpdU7IgDKS
	plPGaX8APE7y7Eqv8q9JAXUYUtRsJ0WGYt4lI2tZf2495aTN9mEq6UBWBrgou4qax2YNHHjiGUUjj
	OOikMb0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKEzr-005f3x-2h;
	Fri, 14 Jul 2023 09:21:55 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKEzn-005f2I-2t;
	Fri, 14 Jul 2023 09:21:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4E7606600357;
	Fri, 14 Jul 2023 10:21:44 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689326505;
	bh=aQFzKq+ca3eHMYbMfFhasP40m7wIjw2gYDIjXkZhC3k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IRnpytYs7MityuQa2jBNUVOSa7U26dQHWq4XXuTfoiphZAAL+SS9DbCRYwhG3ALbn
	 8hU+02LtxjPHKtoDWKJ7r2pGGZYRyLqadZunMcIx3X7YqjiA3Ki9428ORvkgQlT/Zf
	 J6474xGUuDQ9PmlD+m0VpuU4fbllIEFNMs/p5VS1GyGmq4hXpXggL7dZIx3XE8mQDP
	 CZOmaY1yuSPQY8CInVSBjEEW7T0iI/f2lZS1fcX1MY1ftDHCpHoUXzL1XJpaJSLFfD
	 +uPrTENumZZ2ZiQJnQ1z026pP1H4aXiJkBVTSy+rCjWNtB5g/usENkkvlQNPW8nYak
	 C4FUn2IPogrsA==
Message-ID: <0dc87b13-77f7-ff1e-f621-43e692b4b8ff@collabora.com>
Date: Fri, 14 Jul 2023 11:21:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] clk: mediatek: mt8195-topckgen: Refactor parents for
 top_dp/edp muxes
To: Alexandre Mergnat <amergnat@baylibre.com>, sboyd@kernel.org
Cc: mturquette@baylibre.com, matthias.bgg@gmail.com, wenst@chromium.org,
 msp@baylibre.com, yangyingliang@huawei.com, u.kleine-koenig@pengutronix.de,
 miles.chen@mediatek.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@collabora.com
References: <20230713072138.84117-1-angelogioacchino.delregno@collabora.com>
 <20230713072138.84117-3-angelogioacchino.delregno@collabora.com>
 <9a0817c2-4101-5c21-977d-77ac0d83a067@baylibre.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <9a0817c2-4101-5c21-977d-77ac0d83a067@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_022152_214085_0E37DE98 
X-CRM114-Status: GOOD (  23.44  )
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

Il 13/07/23 15:22, Alexandre Mergnat ha scritto:
> 
> 
> On 13/07/2023 09:21, AngeloGioacchino Del Regno wrote:
>> The top_dp and top_edp muxes can be both parented to either TVDPLL1
>> or TVDPLL2, two identically specced PLLs for the specific purpose of
>> giving out pixel clock: this becomes a problem when the MediaTek
>> DisplayPort Interface (DPI) driver tries to set the pixel clock rate.
>>
>> In the usecase of two simultaneous outputs (using two controllers),
>> it was seen that one of the displays would sometimes display garbled
>> output (if any at all) and this was because:
>>   - top_edp was set to TVDPLL1, outputting X GHz
>>   - top_dp was set to TVDPLL2, outputting Y GHz
>>     - mtk_dpi calls clk_set_rate(top_edp, Z GHz)
>>       - top_dp is switched to TVDPLL1
>>       - TVDPLL1 changes its rate, top_edp outputs the wrong rate.
>>       - eDP display is garbled
>>
>> To solve this issue, remove all TVDPLL1 parents from `top_dp` and
>> all TVDPLL2 parents from `top_edp`, plus, necessarily switch both
>> clocks to use the new MUX_GATE_CLR_SET_UPD_INDEXED() macro to be
>> able to use the right bit index for the new parents list.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clk/mediatek/clk-mt8195-topckgen.c | 22 ++++++++++++++--------
>>   1 file changed, 14 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c 
>> b/drivers/clk/mediatek/clk-mt8195-topckgen.c
>> index 81daa24cadde..abb3721f6e1b 100644
>> --- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
>> +++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
>> @@ -417,15 +417,21 @@ static const char * const pwrmcu_parents[] = {
>>   static const char * const dp_parents[] = {
>>       "clk26m",
>> -    "tvdpll1_d2",
>>       "tvdpll2_d2",
>> -    "tvdpll1_d4",
>>       "tvdpll2_d4",
>> -    "tvdpll1_d8",
>>       "tvdpll2_d8",
>> -    "tvdpll1_d16",
>>       "tvdpll2_d16"
>>   };
>> +static const u8 dp_parents_idx[] = { 0, 2, 4, 6, 8 };
>> +
>> +static const char * const edp_parents[] = {
>> +    "clk26m",
>> +    "tvdpll1_d2",
>> +    "tvdpll1_d4",
>> +    "tvdpll1_d8",
>> +    "tvdpll1_d16"
>> +};
>> +static const u8 edp_parents_idx[] = { 0, 1, 3, 5, 7 };
> 
> AFAII your solution is to force a specific TVDPLLX for each display, and it isn't 
> dynamic.
> 
> Do you think it's possible to do that using the DTS ? I'm asking because, IMHO, 
> this kind of setup is more friendly/readable/flexible in the DTS than hardcoded 
> into the driver.
> 

No, there's no way. In DT you can assign one specific parent to a specific clock,
but we need to dynamically switch between the TVDPLL dividers with clk_set_rate()
calls.

Besides, can you please explain why you're worried about having TVDPLL1 on DP
instead of eDP and vice-versa?
The two PLLs are powered from the same power domain and are identical in spec,
so one or the other doesn't make any difference... you could use TVDPLL2 while
TVDPLL1 is OFF and vice-versa too.

Cheers,
Angelo

>>   static const char * const disp_pwm_parents[] = {
>>       "clk26m",
>> @@ -957,11 +963,11 @@ static const struct mtk_mux top_mtk_muxes[] = {
>>       MUX_GATE_CLR_SET_UPD_FLAGS(CLK_TOP_PWRMCU, "top_pwrmcu",
>>           pwrmcu_parents, 0x08C, 0x090, 0x094, 16, 3, 23, 0x08, 6,
>>           CLK_IS_CRITICAL | CLK_SET_RATE_PARENT),
>> -    MUX_GATE_CLR_SET_UPD(CLK_TOP_DP, "top_dp",
>> -        dp_parents, 0x08C, 0x090, 0x094, 24, 4, 31, 0x08, 7),
>> +    MUX_GATE_CLR_SET_UPD_INDEXED(CLK_TOP_DP, "top_dp",
>> +        dp_parents, dp_parents_idx, 0x08C, 0x090, 0x094, 24, 4, 31, 0x08, 7),
>>       /* CLK_CFG_10 */
>> -    MUX_GATE_CLR_SET_UPD(CLK_TOP_EDP, "top_edp",
>> -        dp_parents, 0x098, 0x09C, 0x0A0, 0, 4, 7, 0x08, 8),
>> +    MUX_GATE_CLR_SET_UPD_INDEXED(CLK_TOP_EDP, "top_edp",
>> +        edp_parents, edp_parents_idx, 0x098, 0x09C, 0x0A0, 0, 4, 7, 0x08, 8),
>>       MUX_GATE_CLR_SET_UPD(CLK_TOP_DPI, "top_dpi",
>>           dp_parents, 0x098, 0x09C, 0x0A0, 8, 4, 15, 0x08, 9),
>>       MUX_GATE_CLR_SET_UPD(CLK_TOP_DISP_PWM0, "top_disp_pwm0",
> 


