Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6557C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 10:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZU+eb0pwei1iFKJkDCTOqCoshqt3FMAFSy++brHsjm4=; b=w6+k+5+PFhn0lxK52X/c466Lkp
	J2sdRxTLBx1ymtpl6+tMMDnX4PBObLgOLFWdUtgXO6nXtDipOuv2Lo6KewENDD6+41SaTX3N/EQ6R
	NonGUXiU7T4PQm6v4U9gJdOf441xCd6nPUSRuNLD3nbhTZR293XYbi9wQNL1bBlwj/F1jAwXszzD1
	7DmJJ6cwhHNI4IFVbpc1ET3bVOISU2wDGSXUzUUEo9pCfe9E+9QhMH17It41T0ImoU9gCWo0L/MGt
	EDxpw4CAkqLMVPPgrj1IhNlmNo704z3aQA0aNKyYYxcflCvXO10ABf5fLw+QZezc8vRyw3MWCgdhs
	UHYErtuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFAms-00000009Slj-1Fmb;
	Thu, 06 Jun 2024 10:56:06 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFAmn-00000009Ska-1ZP0;
	Thu, 06 Jun 2024 10:56:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717671359;
	bh=YgzEeSRn9SjAt09HXi0BbwcLxwl/BddzUZDCbdf390Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=coLYoUY//s6wa9jmOGWFcJFmosndgvzmNXIMsqq9uXubkcn9Y1qJ0Q3Z54G0FGq8K
	 gC8CWJ+K/bcyFPUO8lGMxg0HkqTaa5Q9uuYSZ2nZz4osYQvM+vsUIjoncFnfsH/fpq
	 8yJKrhqg4PQ/fPAQwsugMQLJCSITrYhQZ+hOtGR61zKVYBp04JgvyIozX4yEHZ0g4C
	 mCdZFludSE6yxpSnpFOhfP2WQmeKC30KpTQo3YSFLd8dIHOhnnUqPJUl2sYg//vJkU
	 mSK+ExpYi1wQlHdMFZGr+kFGQgxhFqax5RkLoFzfjQ58vK8qMwtiS/cNVkhgnRMXJo
	 mP5N6WKI7TCfw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B29EB3780627;
	Thu,  6 Jun 2024 10:55:58 +0000 (UTC)
Message-ID: <07664707-6482-4b17-91fd-251cf73cbee9@collabora.com>
Date: Thu, 6 Jun 2024 12:55:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5.10/5.15/6.1] clk: mediatek: mt8183: Add memory
To: Aleksandr Mishin <amishin@t-argos.ru>, Weiyi Lu <weiyi.lu@mediatek.com>,
 stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sasha Levin <sashal@kernel.org>, Markus Schneider-Pargmann
 <msp@baylibre.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
References: <20240606103402.23912-1-amishin@t-argos.ru>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240606103402.23912-1-amishin@t-argos.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_035603_371532_840DE089 
X-CRM114-Status: GOOD (  17.42  )
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

Il 06/06/24 12:34, Aleksandr Mishin ha scritto:
> No upstream commit exists for this commit.
> 
> The issue was introduced with commit c93d059a8045 ("clk: mediatek: mt8183:
> Register 13MHz clock earlier for clocksource")
> 
> In case of memory allocation fail in clk_mt8183_top_init_early()
> 'top_clk_data' will be set to NULL and later dereferenced without check.
> Fix this bug by adding NULL-return check.
> 
> Upstream branch code has been significantly refactored and can't be
> backported directly.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 

There's no fixes tag, and the commit title shall be fixed, you're not
"adding memory".

Please fix - after which, it kind of makes sense to add this to stable.

Cheers,
Angelo

> Signed-off-by: Aleksandr Mishin <amishin@t-argos.ru>
> ---
>   drivers/clk/mediatek/clk-mt8183.c | 5 +++++
>   1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
> index 78620244144e..8377a877d9e3 100644
> --- a/drivers/clk/mediatek/clk-mt8183.c
> +++ b/drivers/clk/mediatek/clk-mt8183.c
> @@ -1185,6 +1185,11 @@ static void clk_mt8183_top_init_early(struct device_node *node)
>   	int i;
>   
>   	top_clk_data = mtk_alloc_clk_data(CLK_TOP_NR_CLK);
> +	if (!top_clk_data) {
> +		pr_err("%s(): could not register clock provider: %d\n",
> +			__func__, -ENOMEM);
> +		return;
> +	}
>   
>   	for (i = 0; i < CLK_TOP_NR_CLK; i++)
>   		top_clk_data->hws[i] = ERR_PTR(-EPROBE_DEFER);



