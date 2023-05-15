Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41CA3C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 11:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nJeMmmVh2vw+WCM0aVHMw7xbSvnwY1j3ghh3DoK6qnM=; b=xokTAZaDSe7tlmbreSONJfXDxy
	3lJirnEA7YR/+Vw8CZ1me+9k47EKEG/rKcrtvRBJNXRKu42wlTwyUQa/63kVlMZoDLhrp87U1wijd
	JZmIe94x3HaBcHTGxAW76idD1K6rsostpDCIrT5W7KYuKRZKLgr2RBdCsPGbgnBe2HKQO2cKfg8gv
	dUvONp+1psKJjAUxPR9eJfx0X+zDfiygsnsyeC3LmXSHJScTZfeMHx7puZjO2VuXvejp4rjoHYYM/
	hCBISkFw9drAyRImtxYe+kpnNLrf0CXAujRNHlzaSJNfYPvrPrjc83f2NM3mf67RJIXC6O0psM+n8
	Ti4kpn6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWiJ-00228u-1h;
	Mon, 15 May 2023 11:50:03 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWiF-00227M-1W;
	Mon, 15 May 2023 11:50:00 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7F9B366058D2;
	Mon, 15 May 2023 12:49:57 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684151398;
	bh=uLQ/16EflB7+33SpW7tkukm03+MQ1MMQ8JfjTfIpkps=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JKcjfZ84MUxXab+z5aVIruWHTLwJdV9jfEJ5NSggWUTVLJLr8tPH+O1w7M671QAl/
	 L3/SXo9DvaH+19OChEMyRYVh9Ca00ow8z7ztrZMUHUxwOE2+H1TjMjwt0HCk9x/Fxd
	 2NX2gWg2UwaO9oi+jymEODLXywC1thWn1Zj37B/wvZzB209h8b2fvoNTwRMwID8uAB
	 DunoY+ZWzqNmdysO8jcGc18iMS02xFevLMi+Zgr/E4pQ7gST2MLj0PT8I8MH3ertpZ
	 bEd6h8IWkYWzmXGcMjrluBlTAUtmQ8X9/bBEf2ibdDVkW3RBkcSYHLivJM6Ra84UQt
	 sNVQsVA6v4LuQ==
Message-ID: <aa383909-7a03-eb24-3a61-397f2a6adb54@collabora.com>
Date: Mon, 15 May 2023 13:49:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
Content-Language: en-US
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
References: <20230511133226.913600-1-msp@baylibre.com>
 <8603c2b2-2a5b-48f6-9b08-9b3b518b716b@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <8603c2b2-2a5b-48f6-9b08-9b3b518b716b@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_044959_646583_D30B4C71 
X-CRM114-Status: GOOD (  13.03  )
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

Il 12/05/23 13:51, Matthias Brugger ha scritto:
> 
> 
> On 11/05/2023 15:32, Markus Schneider-Pargmann wrote:
>> The given operations are inverted for the wrong registers which makes
>> multiple of the mt8365 hardware units unusable. In my setup at least usb
>> did not work.
>>
>> Fixed by swapping the operations with the inverted ones.

...with the not inverted ones, you mean!

Anyway,

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

>>
>> Reported-by: Alexandre Mergnat <amergnat@baylibre.com>
>> Fixes: 905b7430d3cc ("clk: mediatek: mt8365: Convert simple_gate to mtk_gate 
>> clocks")
>> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> 
>> ---
>>   drivers/clk/mediatek/clk-mt8365.c | 6 +++---
>>   1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
>> index 6b4e193f648d..6d785ec5754d 100644
>> --- a/drivers/clk/mediatek/clk-mt8365.c
>> +++ b/drivers/clk/mediatek/clk-mt8365.c
>> @@ -583,15 +583,15 @@ static const struct mtk_gate_regs top2_cg_regs = {
>>   #define GATE_TOP0(_id, _name, _parent, _shift)            \
>>       GATE_MTK(_id, _name, _parent, &top0_cg_regs,        \
>> -         _shift, &mtk_clk_gate_ops_no_setclr_inv)
>> +         _shift, &mtk_clk_gate_ops_no_setclr)
>>   #define GATE_TOP1(_id, _name, _parent, _shift)            \
>>       GATE_MTK(_id, _name, _parent, &top1_cg_regs,        \
>> -         _shift, &mtk_clk_gate_ops_no_setclr)
>> +         _shift, &mtk_clk_gate_ops_no_setclr_inv)
>>   #define GATE_TOP2(_id, _name, _parent, _shift)            \
>>       GATE_MTK(_id, _name, _parent, &top2_cg_regs,        \
>> -         _shift, &mtk_clk_gate_ops_no_setclr)
>> +         _shift, &mtk_clk_gate_ops_no_setclr_inv)
>>   static const struct mtk_gate top_clk_gates[] = {
>>       GATE_TOP0(CLK_TOP_CONN_32K, "conn_32k", "clk32k", 10),



