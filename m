Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 282F5C38A2D
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 22:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stUhgmxHOajI9uqfx7NpPsmu7P60GiPKRF/7gBID+dg=; b=FrhInfU2IHas6pK5yXmtHLnXRW
	v9ZVNNkARnanzT2S/TKvtSHhoZDU5PKo8SDCYVvagmFkmu6ixJjefmPwnFQlS5vG8VBWj6nZOn6zT
	DehQlZv144u/hraXhvxbB7asLFFfrvVgkkCEQ5f2xaPECG+WEOWRGZIjDxcRNpSld2pkEfi3lnsZw
	Ct5ake/VorC8ROjRhUC6Y2bkHk5ciyLz5y5syC+WlhlUj89Se870gwf/C4AlEnHXFp8dlUodBOakv
	ZkkcUVAdHJLd7Jg+DNsXBov4dSE7UnYjsV4wjBQOE0rnIcoZoMVRgnXdrdOPLMgvjnuNBoho8k3aY
	t2MBDCzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5eJ-003EA7-Bi; Mon, 24 Oct 2022 22:10:23 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5eH-003E8e-BA
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 22:10:22 +0000
Received: by mail-vs1-xe33.google.com with SMTP id 128so9234304vsz.12
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Oct 2022 15:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=stUhgmxHOajI9uqfx7NpPsmu7P60GiPKRF/7gBID+dg=;
        b=aI7jghSe4eTqhLetWbp1CUXeviJT+nB0niZcj1EYJhDL5AD7HaUHBIBnjyFt5wHzMX
         kuoy1TdwweW1mYpeAVavBgwSy7Cv65g5xnnQB6RTCg6Ou9V1otGvwMjJixkYCFuabC5v
         yIqXOu/FOjlFETGXBPo0qK53a/g8ByJg0I/uI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=stUhgmxHOajI9uqfx7NpPsmu7P60GiPKRF/7gBID+dg=;
        b=gTGvAIPTc2vSqfJK0ktERfOLayOxPLgcb72LEENCOJSrsMaqnR60Re3iz/P9vZC/lm
         04EIv372Yy2zNGaCfN8y1438YL/bP23kEPAWU9bAkTVkRyTaEHHUmfzyZ8x63b9BKD5p
         g2V4N1aU2pWd7/X0YoO4rxWEp4s3hgg3w6/AentRcucFF/OQ99xJUgH2Br/hJ3Xg0YlB
         nCqXgEmjayyNCksLDdGmEZ6ZF+F1y8VcFKsAwF8+4c9AE1AdJBxP8zPY6Y5mwFdzlxb3
         tc1MplgVAFgJglfoLAhsB9ttfjlut7SOz3+4IRogv3m6YShHp+WTMTj6EIpc2gnhqpAl
         WZHQ==
X-Gm-Message-State: ACrzQf0zLJJTkKVZDpdZXaPaWXjMhiGDTwUPkkJ0LBjefrGJmxh0jVZj
	bkf0qtLvaZpZIMDy5IsllXtVOSdy9wbnv07PMzGX3A==
X-Google-Smtp-Source: AMsMyM4mF8OtH43I5lB0/0j3s/Xrw1R6qcOOGU77MvOGbIdfp4X/GbRrXsUymIVx+BbzSWL5HqwmMg4nQImm+z6TjYI=
X-Received: by 2002:a67:f684:0:b0:392:ac17:f9b0 with SMTP id
 n4-20020a67f684000000b00392ac17f9b0mr20569192vso.85.1666649420213; Mon, 24
 Oct 2022 15:10:20 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-8-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-8-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Oct 2022 15:10:09 -0700
Message-ID: <CAGXv+5GLWLcG8n0vVjKV2rNHpVOxGfz_63OmZSfjqk503gADLw@mail.gmail.com>
Subject: Re: [PATCH 07/10] clk: mediatek: mt8192: Drop flags for main/univpll
 fixed factors
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com, 
	miles.chen@mediatek.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, jose.exposito89@gmail.com, 
	yangyingliang@huawei.com, msp@baylibre.com, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221024_151021_425883_F262B510 
X-CRM114-Status: GOOD (  11.08  )
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
> The main/univpll clocks are used as clock sources for multiple
> peripherals of different kind, some of which are critical (like AXIs);
> a rate change on any of these two will produce a rate change on many
> devices and that's likely to produce system instability if not done
> correctly: this is the reason why we have (a lot of) "fixed factor"
> main/univpll divider clocks, used by MUX clocks to provide different
> rates based on PLL output dividers.
>
> Following what was done on clk-mt8186-topckgen and also preventing the
> same GPU DVFS issue, drop CLK_SET_RATE_PARENT from the aforementioned
> clocks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

