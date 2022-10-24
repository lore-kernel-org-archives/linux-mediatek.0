Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D65AC67871
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 21:58:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BzSJYeJmaTtTxu26Xk7PIR207/FtZbc1yEGzfOkJ+8U=; b=wcwE321Nu19qAyQ63WnJJ83AGQ
	WngTzqaXIj3kvL8J85rbGn1UCxAy4FbDilmk+hyTlqU73zjDlyCBlETr3SwufUQKKUI77VD0G6cBI
	kltKC5EbX+GRGVmmyN5i9qF1odXfG2kXZLyxDd0ucKbOrXu4bzNKPFR9WCyon3oqQOTtfMpu1gd/v
	MGlBjD94TOWerfoyf6VdMPUxQvbxZKTbuCcT2/VlcI1jNNTH7TMLLpM5LDtL9YshK6ufvZZjZCK/u
	0rulzRoGLaQfYHrQbMLjuVc+Qf/IuQdzfZ11cqnu+ZMtCnxpUiUoI4b5+Wh6DP3zfmuMRK3MnP59Z
	FyjnrjxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5TA-003AoS-4U; Mon, 24 Oct 2022 21:58:52 +0000
Received: from mail-vs1-xe36.google.com ([2607:f8b0:4864:20::e36])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5Sz-003Am9-5t
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 21:58:42 +0000
Received: by mail-vs1-xe36.google.com with SMTP id 189so7944605vsi.9
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Oct 2022 14:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BzSJYeJmaTtTxu26Xk7PIR207/FtZbc1yEGzfOkJ+8U=;
        b=AFR5IkY1THjsaMBnZeQKwLYzIr9rrM6ni3gipAZKPDAEIe/ZGpVLpuD4pUFK0izrIU
         Iexsw5MQ6s8SqjK8P+TyE7pURsY+RfYmeh+5VhtJliGnTKLRWXxdcK3KfafIdF9EtDd5
         3ONuGx+5L5V0soyNKdJYLdTlJvp3MlQxIyxms=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BzSJYeJmaTtTxu26Xk7PIR207/FtZbc1yEGzfOkJ+8U=;
        b=xChvehBRCrLBr/AQlGj7KxpDEACuVR+ehtG5McloW+qkm0ZPR0fuXfltV6jZcHYHKO
         ML5uNcgHtmqVv68rwK8e9pb1QnFTHYUn7AioJO+9y0N2yx0FnYDSCG8E4CmDjUDfjdv9
         GS6QlFqrwKm1rHdMb/egy5VVJ955k2tOufZ9J4YGgz+loolMVI21Ty32ZaA7mOmc2yIb
         JFPcrr9KrTGsQDDCUTKqhjothGVYMM7Qu6c9uJtn1JFcknTt7bp1JZplsoSYBXDDWFOn
         mAjciPN8IMfATEyRklej05JsQh3ErDLWvXZrpU1d4LbS+NjEZxgJN4jXn/YHwIxbotEs
         bMxA==
X-Gm-Message-State: ACrzQf09uj2TLu6yFgt8VlTQDj4ImT8rJjlP8x1f12PstL57HsclHw6J
	kazOpwE42HDI84qnMv+HYXR/RZG5s0QwKTKvJGZ4kg==
X-Google-Smtp-Source: AMsMyM7xsfjKi9PBasDfAnPzuNevqgPkwVbkWIklAY6Btc1FAexcrTrDwOWAJj+nVch8ctcQNpEKCIhfuV4+G7aJBn0=
X-Received: by 2002:a05:6102:3a4d:b0:3aa:762:5933 with SMTP id
 c13-20020a0561023a4d00b003aa07625933mr9658131vsu.17.1666648719970; Mon, 24
 Oct 2022 14:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Oct 2022 14:58:29 -0700
Message-ID: <CAGXv+5FPUchS36ObBZQ73zh7cR5wyfk6bpNO4u5h3AH1GzSP0Q@mail.gmail.com>
Subject: Re: [PATCH 02/10] clk: mediatek: mt8186-topckgen: Drop flags for
 main/univpll fixed factors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	miles.chen@mediatek.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, jose.exposito89@gmail.com, 
	yangyingliang@huawei.com, msp@baylibre.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_145841_235304_3A39B6E7 
X-CRM114-Status: GOOD (  18.55  )
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

On Mon, Oct 24, 2022 at 3:23 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> The mainpll and univpll clocks are used as clock sources for multiple
> peripherals of different kind, some of which are critical (like AXIs);
> a rate change on any of these two will produce a rate change on many
> devices and that's likely to produce system instability if not done
> correctly: this is the reason why we have "fixed factor" clocks, used
> by MUX clocks to provide different rates based on PLL output dividers.
>
> Though, there's one fundamental issue that must be resolved somehow:
>
> When performing GPU DVFS, we get a rate request that will try to change
> the frequency of MAINPLL due to the CLK_TOP_MFG mux having clk26m,
> mfgpll (the GPU dedicated PLL), mainpll_d3, mainpll_d5 (fixed factor
> dividers) as possible parents.
>
> In order to solve that, there are two ways:
>  1. Add new "fake" mainpll_d3_fixed, mainpll_d5_fixed clocks, clones
>     of mainpll_d3, mainpll_d5 clocks, for the only purpose of not
>     declaring CLK_SET_RATE_PARENT; or
>  2. Simply drop said flag from the original dividers.
>
> After some careful validation, I cannot see anything calling a rate
> change request during runtime for MAINPLL, nor for UNIVPLL (which would,
> again, mean that we're reclocking lots of peripherals at once!), so it
> is safe *and sane* to simply remove the CLK_SET_RATE_PARENT flag to all
> of the main/univpll fixed factor divider clocks.
>
> Besides, if for any (doubtful) reason main/univpll rate change will be
> required in the future, it's still possible to call that on the PLL main
> clocks, so we're still covered anyway.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

AFAIK this matches what we do for some other SoC families, so

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

