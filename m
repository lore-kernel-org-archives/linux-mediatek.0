Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85F0C38145
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Sep 2022 07:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oLFMbl+5E3pdudGW2Qm3NztxICIzutd9Hbab+hs7BrY=; b=dsYzbfrNLzMtFffoyEMieiA17K
	nAlqTtZtqRV8+8B6lqWArW+Y4KEs6TQ6ZLi+Di2B831WcI43PmEtd9lUwbTQBJeNNkZ0Lm/p3C2O+
	70hY2CkRXSMbjWLTy5jfHsL6NcDBcvHk15rmW5hwwrOy24Mv1TNmyifOSWNn/K5ttzu/s7FLv0RzV
	0u/rk0YjjAPdOLg0oPGuR8wPShPtYQUO0HRtnlqvT1DkXIT5RHumFGcVB9GW9rOmEAvas1ME/ZMj6
	Uq4xWzxkOUi1OaJnhNZNfIKfbYnXYd1D6miyjtOd8iY4ULyBcd/AnlMyEwYUHH+9x0dZdujf9k8Se
	j8Ed4eAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVpm7-003rAp-6N; Wed, 07 Sep 2022 07:47:07 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVplo-003qxO-Vg; Wed, 07 Sep 2022 07:46:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 701A96601EAA;
	Wed,  7 Sep 2022 08:46:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1662536806;
	bh=5rRhUwtbnHMHj8qHNYZSNdWbtK8TwaDTS8b/kqMqOvs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=O5rA2NWcpnn9r/mL9r9xUO7jPxnXRDkPINVEd2L3Xe1Tg6yX183Dh939CKd+oPm20
	 vYwEVwc7QakrpFTonHl5AGB7FqpyMEu1HMALnDUuMUoOcFpPPqeiIJLkU4swguvkYX
	 DDTqf2W5IY0SmY9NFsB8Xd/8bRdJag02T6dUWJsQ2/ZbWvcWZLihB8/ANzDo1K+DyN
	 h60g2X+7BXuT6xwU+ZUHt1GC2spl2whKv/P4N1/pSZ0CZeQE/w+ZxD3PG6tIw3lcmd
	 57EiFNO3jl5MSiU9A21Q6zH9o5hiOj927wrKac+LsJH1LqFiyAmtgLzGloXq2JTqBj
	 lJPnA1YvGlAkQ==
Message-ID: <ab8a13a1-c25f-6b24-2825-c481d4715b27@collabora.com>
Date: Wed, 7 Sep 2022 09:46:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 08/10] clk: mediatek: clk-mt8195-topckgen: Drop univplls
 from mfg mux parents
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: matthias.bgg@gmail.com, mturquette@baylibre.com, sboyd@kernel.org,
 miles.chen@mediatek.com, rex-bc.chen@mediatek.com, nfraprado@collabora.com,
 chun-jie.chen@mediatek.com, jose.exposito89@gmail.com,
 drinkcat@chromium.org, weiyi.lu@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
References: <20220905100416.42421-1-angelogioacchino.delregno@collabora.com>
 <20220905100416.42421-9-angelogioacchino.delregno@collabora.com>
 <CAGXv+5G52--wF=e=nd3ezDPoQcOdsqMd_1WdzGEWxjjZaJsRLg@mail.gmail.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5G52--wF=e=nd3ezDPoQcOdsqMd_1WdzGEWxjjZaJsRLg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_004649_280104_C3D9A7DA 
X-CRM114-Status: GOOD (  19.01  )
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

Il 07/09/22 05:49, Chen-Yu Tsai ha scritto:
> Hi,
> 
> On Mon, Sep 5, 2022 at 6:04 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> These PLLs are conflicting with GPU rates that can be generated by
>> the GPU-dedicated MFGPLL and would require a special clock handler
>> to be used, for very little and ignorable power consumption benefits.
>> Also, we're in any case unable to set the rate of these PLLs to
>> something else that is sensible for this task, so simply drop them:
>> this will make the GPU to be clocked exclusively from MFGPLL for
>> "fast" rates, while still achieving the right "safe" rate during
>> PLL frequency locking.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clk/mediatek/clk-mt8195-topckgen.c | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-mt8195-topckgen.c b/drivers/clk/mediatek/clk-mt8195-topckgen.c
>> index 4dde23bece66..6ff610c101ae 100644
>> --- a/drivers/clk/mediatek/clk-mt8195-topckgen.c
>> +++ b/drivers/clk/mediatek/clk-mt8195-topckgen.c
>> @@ -301,8 +301,6 @@ static const char * const ipu_if_parents[] = {
>>   static const char * const mfg_parents[] = {
>>          "clk26m",
>>          "mainpll_d5_d2",
>> -       "univpll_d6",
>> -       "univpll_d7"
> 
> I'd just comment them out and leave a note about it. Or remove them but
> leave a note. Removed code will not be obvious to others. And given this
> is probably the only public documentation of the hardware, it'd be a shame
> to lose evidence of it.
> 

That's fair, I totally agree with you.
I'll send a v2 that adds a comment on top of mfg_parents explaining the
possible parents and why d6/d7 were left out.

Thanks,
Angelo


