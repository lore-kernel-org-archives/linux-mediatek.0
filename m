Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5595C67871
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Oct 2022 22:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vRmMvviWEKka4D3lrnvrAAXXSnpPgxlIxCd5d8ajOxA=; b=fdzWONle2DGTrO/aYt1JzKUbmw
	wqE89U0wFHj5l3kb4q0BqwpCWb4vkDJDIGqaF30vGVrM5dCFw/jJ2Hut7Zv4lWDWI+lom6PK+57Bg
	a4KYzsgxq5OOtvS5EALRJVY/uYV3begYz1VXMgu6nEfkADxyOGriq2g0jS88ShGGk52vppWyR9y0a
	02HWqXjC5D6gx8+BmCdfvOMmREnyBD2u9hGZVB4A9L6AhjCHk0ISdmZzMyophfAftMg+sBl3HxYLa
	C4LzuFYYMPLuzAa2rtvWyaSDc06zN2aDWS/o9sP7tGPkD56QtKtbc16CBKCX/mkwehB5SJbNnbrwu
	jQh6RBIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5Zq-003CdF-MA; Mon, 24 Oct 2022 22:05:46 +0000
Received: from mail-vs1-xe2a.google.com ([2607:f8b0:4864:20::e2a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1on5Zo-003Cbf-0I
	for linux-mediatek@lists.infradead.org; Mon, 24 Oct 2022 22:05:45 +0000
Received: by mail-vs1-xe2a.google.com with SMTP id 1so9212502vsx.1
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Oct 2022 15:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vRmMvviWEKka4D3lrnvrAAXXSnpPgxlIxCd5d8ajOxA=;
        b=A67982Iwiu+nKS3HmSgbb4omBV1yndzR+UlGQQ35HJQtbMRvvbqZPLw07SZkUDvOi1
         4k2oZtG80K4ZadZbBMhty3XVit5fXX2/UFyTf3fjwN5pN5HgaWMY1n858PDOJQ4gRb6N
         9rWxIK3MP9J44LaH+Xpz1sLYVE0LEw/ybcHPQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vRmMvviWEKka4D3lrnvrAAXXSnpPgxlIxCd5d8ajOxA=;
        b=xRcJB1PfiWW8DiEENHkJF4/z1FHF+KpRoLqijLNQ69ROoIJTqkFpVvxMYEqFJBB1UV
         a/m8lCoi5o7ubvPSgl+ZcC+fcHWfGMYtAlCaCiS8BxLpGE4toYKnXxrj/5QWli97bCcV
         8MV+cJoUMXxGSSEFkK+NDT8WCewphfQDfGsK/0qU3AqK5BvclVM0URbJZFrytMtBPK+6
         oKMfsccKsbLU+u+PFuay2JvtkQbtFDgJu1P6pWoDSt8alIP8z2YY6OdLt6HwIYN35wqP
         WpcQacI/kv70NpVchQRzrQ/nyjWIn/bD1WTn2YIpsSqAatClksy4oDqeQSOyOBZaspka
         V15g==
X-Gm-Message-State: ACrzQf20inJdN6VNfh0N/MgQBgRscD4Y62qU5eAy945BKwbFoxnsKK9/
	FPk4ur0CkYHOHKU9WoO3th6lw80M8pcQam/tdZm5PA==
X-Google-Smtp-Source: AMsMyM4ejiEt/3Clzr0qB4Xhl44cniyZH8Auxb0kyU4oXVS18eKRuwJRA9eSGi8jRlUeVbBw8It9KcG5DdVKmgSgCT8=
X-Received: by 2002:a67:ac0c:0:b0:3a9:e899:3b9b with SMTP id
 v12-20020a67ac0c000000b003a9e8993b9bmr14117825vse.9.1666649142869; Mon, 24
 Oct 2022 15:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20221024102307.33722-1-angelogioacchino.delregno@collabora.com> <20221024102307.33722-5-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221024102307.33722-5-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 24 Oct 2022 15:05:31 -0700
Message-ID: <CAGXv+5Gx0PHQdfrtrUicioP1VxuRd4U24PZV2kFLus_OyrP7fw@mail.gmail.com>
Subject: Re: [PATCH 04/10] clk: mediatek: mt8183: Drop flags for sys/univpll
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
X-CRM114-CacheID: sfid-20221024_150544_060200_8373C6DF 
X-CRM114-Status: GOOD (  11.13  )
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
> The syspll and univpll clocks are used as clock sources for multiple
> peripherals of different kind, some of which are critical (like AXIs);
> a rate change on any of these two will produce a rate change on many
> devices and that's likely to produce system instability if not done
> correctly: this is the reason why we have (a lot of) "fixed factor"
> sys/univpll divider clocks, used by MUX clocks to provide different
> rates based on PLL output dividers.
>
> Following what was done on clk-mt8186-topckgen and also solving the
> same GPU DVFS issue, drop CLK_SET_RATE_PARENT from the aforementioned
> clocks.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

