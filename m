Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44975C48BF6
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 11:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SBhw97N6aUwVB+TYfpBd4KJ9qlVvC/cOtavxB99aN8=; b=eDtANuym0YFWBOKixAZHusZZd3
	3v2XMhpxrPxK7dEobezG3YSTCGMwR0/lSH3Rg914RHSYRgVT53QUTkC/TITz3+Hhhk48C1oKw6zID
	TjI07HFv+zPmxek7rUIdYeLgN2na/1JAWdCZSezDuXdZbOlnMkib3uqY3aOtAsN7AnejguEZkn4oP
	Wv70BcD3ZZHfMIwRR1wGwms9y4RJcUvdBaBESeyBOt+GQNcGP9cDzqAO8t5arO5kCrkx5yUkiLVOB
	lkeEOAr8tANW7Mb/rOvkut9G+ZUBvDC78KDgvhk6djp7vdWBCDs/c6IN8Vef8OtSq9aHbjpImXi6K
	zIx3OiQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZGd-00000000MkN-3KGo;
	Mon, 26 Feb 2024 11:35:31 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reZGM-00000000McP-3Jz8;
	Mon, 26 Feb 2024 11:35:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1708947313;
	bh=PRmRkpP87fdXdGPmJyV15H5s0bYWIoTINv/TZ8U2PQI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=06Av+1byeWeu/a9c4RjGq0y+ZA3NMayTQiZwBpfKVYZb79d0czUVUfHmqd+MCssPn
	 cavR8TihvdA8cPiTblZFR6LgjkPtslxjMLIjyub3H9Dpc486cjpvMnQRGhsTpiQpEe
	 EYGdALLBXpwk2eqBtg+YLdOk9vIzQVgZueISZQuy+PmRfd0aw5kY3U8TttgproQtya
	 0FXw3thFb47JBziyQBvxRbbvzRFOMV4LLHJ07SmmnsR02NrhFjKIpEIdO/b3J1lJo0
	 HELKfrNWKSzQlMwc5nExdmhANzf2R5hf5f3H9CNr5IZNVixqjc6UNPhBZQI19+tJsa
	 ijE2LkJFaEBeQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 88E6237814B0;
	Mon, 26 Feb 2024 11:35:12 +0000 (UTC)
Message-ID: <a22b7703-2ee1-47dd-8933-4a72e64e9fe0@collabora.com>
Date: Mon, 26 Feb 2024 12:35:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] clk: mediatek: mt8183: Enable need_runtime_pm on
 mt8183-mfgcfg
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Pin-yen Lin <treapking@chromium.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20240108081834.408403-1-treapking@chromium.org>
 <20240108081834.408403-2-treapking@chromium.org>
 <CAGXv+5GoAauw77wVXx6SXsSma9zP_A1vXLRo=GH2ptjvY=kLgA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5GoAauw77wVXx6SXsSma9zP_A1vXLRo=GH2ptjvY=kLgA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_033515_136194_921B61EC 
X-CRM114-Status: GOOD (  16.77  )
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

Il 23/02/24 05:43, Chen-Yu Tsai ha scritto:
> On Mon, Jan 8, 2024 at 4:18 PM Pin-yen Lin <treapking@chromium.org> wrote:
>>
>> mt8183-mfgcfg has a mutual dependency with genpd during the probing
>> stage, so enable need_runtim_pm to prevent a deadlock in the following
>> call stack:
>>
>> CPU0:  genpd_lock --> clk_prepare_lock
>> genpd_power_off_work_fn()
>>   genpd_lock()
>>   generic_pm_domain::power_off()
>>      clk_unprepare()
>>        clk_prepare_lock()
>>
>> CPU1: clk_prepare_lock --> genpd_lock
>> clk_register()
>>    __clk_core_init()
>>      clk_prepare_lock()
>>      clk_pm_runtime_get()
>>        genpd_lock()
>>
>> Do a runtime PM get at the probe function to make sure clk_register()
>> won't acquire the genpd lock.
>>
>> Fixes: acddfc2c261b ("clk: mediatek: Add MT8183 clock support")
>> Signed-off-by: Pin-yen Lin <treapking@chromium.org>
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> Note that this compliments a patch [1] adding the power domain for the mfgcfg
> clock controller node, which has been floating around for almost 3 years.
> 

...but why does this happen *only* on MT8183 and not on any other MediaTek SoC?

I understand what you're trying to solve here, but if we explore a bit more, we
can maybe come to the conclusion that we don't need to add this flag, and perhaps
just enable PM runtime as regular flow for all clock controllers.

That would also be cleaner, to some extent.

Cheers,
Angelo

> [1] https://lore.kernel.org/linux-mediatek/20210414073108.3899082-1-ikjn@chromium.org/
> 
>> ---
>>
>> (no changes since v1)
>>
>>   drivers/clk/mediatek/clk-mt8183-mfgcfg.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
>> index ba504e19d420..62d876e150e1 100644
>> --- a/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
>> +++ b/drivers/clk/mediatek/clk-mt8183-mfgcfg.c
>> @@ -29,6 +29,7 @@ static const struct mtk_gate mfg_clks[] = {
>>   static const struct mtk_clk_desc mfg_desc = {
>>          .clks = mfg_clks,
>>          .num_clks = ARRAY_SIZE(mfg_clks),
>> +       .need_runtime_pm = true,
>>   };
>>
>>   static const struct of_device_id of_match_clk_mt8183_mfg[] = {
>> --
>> 2.43.0.472.g3155946c3a-goog
>>



