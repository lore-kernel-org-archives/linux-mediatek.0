Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2492FC47073
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 09:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtfKsUW5r6pYokxSXrqiO4WYhyFo2FSa/0ioZZfgWv8=; b=fUk2fISSRPsK7WsHqm7PWPCvOV
	vZUxHTKR5bbxBW6KZRW+ncWEAxPQqbRFoEV64508S/JMOT6ZPgYWaJDevjmnhW/1njwi8RdX1SDdN
	VQJXVDa0dbmawDi0yLfYdKuGJQ2kzk/qlU588B6wdrTyIr60MFXNlSAHM7BRJfe3rYUK+LQBG7eLx
	7anJmmYiFC9FFNjiBYEMe1t9/91Ca2VrDgDp9cgB76Ia7o6o0iUOtkUuDVsuSeVrFnawNiwEFDm5f
	jidQxwlxeoQksocs9W+n5jVhdK6vwrgWsQ4oNl9sAjsSkHZDONVsSozapyYC2ESkEgGdHaRKBfnFq
	6mzJyGuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKbHU-007UMG-0h;
	Tue, 02 Jan 2024 09:41:52 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKbHQ-007ULT-2e;
	Tue, 02 Jan 2024 09:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704188507;
	bh=FyLks047y5EHUM2OKY0gTkVd8p2xO2+y8kTMjKFijSg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vwpbM4EknSe+s+iyX71PYvZayhxWo+dUMoNsHsri18wj1l3ZS3hUxt9FFhZjr6tto
	 IC/7DUykfGCRE7vgGNQfeldwcVLsSRHO9HC37m/GO7h9P9wY9RKAlcU0kaguoFaX9r
	 3N3EzQbhdspbUtxvcJL7oehKuNPcUmSMvaE519+uZ4AXEJZJ472+3cHFuBWJIgg81c
	 R+XEmQz0hJMnn8MR5aIqAMxawvkyhlKy87lz5OUv0CQsBia6AGxKyiKgcnuYM2YJya
	 iqrngmitpclR0jCLy4wsH2RWqdpcze3Wpwp5jo23rTr8I5Vx32hfDJbm/PO4s+s66F
	 DLxraCut+Yl3A==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A82E63781433;
	Tue,  2 Jan 2024 09:41:46 +0000 (UTC)
Message-ID: <0bfa27e8-c173-4a2a-b453-9289f2eb1926@collabora.com>
Date: Tue, 2 Jan 2024 10:41:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: fix cppcheck error for uninitialized
 variable
Content-Language: en-US
To: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 kishan.dudhatra@siliconsignals.io
Cc: Chen-Yu Tsai <wenst@chromium.org>, Tom Rix <trix@redhat.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231225152806.3716898-1-user@falcon>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231225152806.3716898-1-user@falcon>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_014148_998366_AEDAA4C2 
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

Il 25/12/23 16:28,  ha scritto:
> From: Kishan Dudhatra <kishan.dudhatra@siliconsignals.io>
> 
> cppcheck reports below warning
> 
> clk/mediatek/clk-fhctl.c:206:27:
> error: Uninitialized variable: pll_postdiv [uninitvar]
> if (postdiv && postdiv < pll_postdiv)
> 
> This is due to uninitialization of variable pll_postdiv,
> which is now initialized as part of this patch.
> 
> Signed-off-by: Kishan Dudhatra <kishan.dudhatra@siliconsignals.io>

This is a false positive... the pll_postdiv variable is *always* used
and *only if* postdiv > 0.

P.S.: There was some problem with your email, as the From entry is empty.

Regards,
Angelo

> 
> diff --git a/drivers/clk/mediatek/clk-fhctl.c b/drivers/clk/mediatek/clk-fhctl.c
> index 33b6ad8fdc2e..b0e71e4fd938 100644
> --- a/drivers/clk/mediatek/clk-fhctl.c
> +++ b/drivers/clk/mediatek/clk-fhctl.c
> @@ -186,7 +186,7 @@ static int fhctl_hopping(struct mtk_fh *fh, unsigned int new_dds,
>   	struct fh_pll_regs *regs = &fh->regs;
>   	struct mtk_clk_pll *pll = &fh->clk_pll;
>   	spinlock_t *lock = fh->lock;
> -	unsigned int pll_postdiv;
> +	unsigned int pll_postdiv = 0;
>   	unsigned long flags = 0;
>   	int ret;
>   



