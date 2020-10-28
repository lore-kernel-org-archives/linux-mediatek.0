Return-Path: <SRS0=7lD3=ED=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01DB0C388F7
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 10:28:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59EDB2467C
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Oct 2020 10:28:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q8aFuLTF";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="II7y2sOO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59EDB2467C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T8KHxrTYa8DZAbzlsSe2NwOWKCc5+38Z94pY/3jUyYE=; b=Q8aFuLTFQ5vzACjUAYwc2od51
	poEiv+aOBUOT+r0s8rSWIrGIJflLZyMc9OZv2RvEK15cdnBUZP5oyQSlta7/9krJeV7JAWrrTKS0a
	mip80RpDn14UN9fQCKG+L/C0LVU958bUfiMD6Gy7sBF2vz15S/zB+CuPJ3hp12KfO9e3EBHXDSYzB
	5j6MQw9aNPQ/bUlj6zAYLCLpJ37w40zWlxDU4jUGhRlM4ghKykGjeR5rqrMjDZQ6pYlhnzjRY6DUX
	azSTmaQRsUQnjuKwddCw0BbQAmJXbjcir1X5VqQv2/8twWmiLLetTuBkFvY1qY7H7ob2H/yZ1s86C
	RQHPjePYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXigN-0008F9-2A; Wed, 28 Oct 2020 10:27:55 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXigI-0008DL-7U
 for linux-mediatek@lists.infradead.org; Wed, 28 Oct 2020 10:27:51 +0000
Received: by mail-il1-x141.google.com with SMTP id c11so4183358iln.9
 for <linux-mediatek@lists.infradead.org>; Wed, 28 Oct 2020 03:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=z2nv8ieGjS37fi1b03zMseQoHKsRO+D/JXqI8/WM/lg=;
 b=II7y2sOO4VBMYCA8hvox5v3rLsbjjK+ou6Wgnt6+3iHcpCSwOMEyDXIgGkXoT99fbl
 L4S+W94x43NMy8AhMMFEFxUbPf6VxLU6vVJ4V/dnEPIY3iyrqijWlNa6gtC6UsAt1F4y
 rFgaskObCDEblL5aTglXYq15v9S1R69bZWSOSlREpM6g8neG4WGYk3JPzGzs+EXjG/Gb
 NH/X3uC5QaXqb1bsS3s27HpvpOkfyfBCiHKYKJ4yi9AjOteWgzlPxAIFbRslJvXinP0O
 9U2uOEo/TpsTI4M/2a6VrRGYVOxx1TD4hfaW+zQ8N/MayGM7tDgmoUx/Zyrr5yoMShl5
 WkfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=z2nv8ieGjS37fi1b03zMseQoHKsRO+D/JXqI8/WM/lg=;
 b=ZJTd+LY3Jaw59IzbQjLa96Rax+zQK/G4Vpkv4usBeBx++hgnDEagdKTe+4VuKWl8IZ
 2CWu2rTcXcTELltoEbkdZu4IzIhyN3xU/k2PL5AQDS6xnC/hLRV2Y7TXoNhAKzDfDoyz
 zI4Ja16iY5RFUKFI+5obeqD72PlfJWETSfBNZfyhCjQImkruT4Jg6cUccYtpSeinKBAq
 ly+BehxIiIiKznK5DjcxBoXF/sG6f+H4fk8IANTzkL9qQZiCbE3t6u8TVYi/eOYsu5Jz
 1wEt10XpLa7Go9Q/kdAnUeo+jjbwr22HFgij1yP9wGbklrGZtHQVM4KjOq9nW1PrOQGY
 QzEg==
X-Gm-Message-State: AOAM530rf4q/jd1E/KiccD8FypyHj81IOfVlmqGQq2oqH7GFeCKVHJ+r
 0lgMW5rhhtZFpFhFlmdBzXjrGVtdNLQLmxZP3vwb8Q==
X-Google-Smtp-Source: ABdhPJz9PfM0Rg/BH/F/zTz+sEmqFR7fWaO1laj/CwdbRYwjhOTCkMQkThF45nzYh2RLYxT9cR9T15lxpMj5YrhhpnU=
X-Received: by 2002:a92:d8cb:: with SMTP id l11mr5348907ilo.88.1603880868118; 
 Wed, 28 Oct 2020 03:27:48 -0700 (PDT)
MIME-Version: 1.0
References: <1603371365-30863-1-git-send-email-weiyi.lu@mediatek.com>
 <1603371365-30863-11-git-send-email-weiyi.lu@mediatek.com>
In-Reply-To: <1603371365-30863-11-git-send-email-weiyi.lu@mediatek.com>
From: Fabien Parent <fparent@baylibre.com>
Date: Wed, 28 Oct 2020 11:27:36 +0100
Message-ID: <CAOwMV_xh0=D+sEDZM4AOqid6XtGCenyjdzm=Go77DBaiuwe1Lg@mail.gmail.com>
Subject: Re: [PATCH 10/12] clk: mediatek: Clean up the pll_en_bit from en_mask
 on MT8183
To: Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201028_062750_439509_9BC4539D 
X-CRM114-Status: GOOD (  16.91  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Weiyi,

The clock driver for MT8167 has been merged in v5.10-rc1. Can you also
apply the change to that driver.
Thank you

Fabien

On Fri, Oct 23, 2020 at 2:44 AM Weiyi Lu <weiyi.lu@mediatek.com> wrote:
>
> remove pll_en_bit(bit0) from en_mask to make en_mask a pure en_mask
> that only used for pll dividers.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> ---
>  drivers/clk/mediatek/clk-mt8183.c | 22 +++++++++++-----------
>  1 file changed, 11 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/clk/mediatek/clk-mt8183.c b/drivers/clk/mediatek/clk-mt8183.c
> index 5046852..608108c 100644
> --- a/drivers/clk/mediatek/clk-mt8183.c
> +++ b/drivers/clk/mediatek/clk-mt8183.c
> @@ -1121,34 +1121,34 @@
>  };
>
>  static const struct mtk_pll_data plls[] = {
> -       PLL_B(CLK_APMIXED_ARMPLL_LL, "armpll_ll", 0x0200, 0x020C, 0x00000001,
> +       PLL_B(CLK_APMIXED_ARMPLL_LL, "armpll_ll", 0x0200, 0x020C, 0,
>                 HAVE_RST_BAR | PLL_AO, BIT(24), 22, 8, 0x0204, 24, 0x0, 0x0, 0,
>                 0x0204, 0, 0, armpll_div_table),
> -       PLL_B(CLK_APMIXED_ARMPLL_L, "armpll_l", 0x0210, 0x021C, 0x00000001,
> +       PLL_B(CLK_APMIXED_ARMPLL_L, "armpll_l", 0x0210, 0x021C, 0,
>                 HAVE_RST_BAR | PLL_AO, BIT(24), 22, 8, 0x0214, 24, 0x0, 0x0, 0,
>                 0x0214, 0, 0, armpll_div_table),
> -       PLL(CLK_APMIXED_CCIPLL, "ccipll", 0x0290, 0x029C, 0x00000001,
> +       PLL(CLK_APMIXED_CCIPLL, "ccipll", 0x0290, 0x029C, 0,
>                 HAVE_RST_BAR | PLL_AO, BIT(24), 22, 8, 0x0294, 24, 0x0, 0x0, 0,
>                 0x0294, 0, 0),
> -       PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0220, 0x022C, 0x00000001,
> +       PLL(CLK_APMIXED_MAINPLL, "mainpll", 0x0220, 0x022C, 0,
>                 HAVE_RST_BAR, BIT(24), 22, 8, 0x0224, 24, 0x0, 0x0, 0,
>                 0x0224, 0, 0),
> -       PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0230, 0x023C, 0x00000001,
> +       PLL(CLK_APMIXED_UNIV2PLL, "univ2pll", 0x0230, 0x023C, 0,
>                 HAVE_RST_BAR, BIT(24), 22, 8, 0x0234, 24, 0x0, 0x0, 0,
>                 0x0234, 0, 0),
> -       PLL_B(CLK_APMIXED_MFGPLL, "mfgpll", 0x0240, 0x024C, 0x00000001,
> +       PLL_B(CLK_APMIXED_MFGPLL, "mfgpll", 0x0240, 0x024C, 0,
>                 0, 0, 22, 8, 0x0244, 24, 0x0, 0x0, 0, 0x0244, 0, 0,
>                 mfgpll_div_table),
> -       PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0250, 0x025C, 0x00000001,
> +       PLL(CLK_APMIXED_MSDCPLL, "msdcpll", 0x0250, 0x025C, 0,
>                 0, 0, 22, 8, 0x0254, 24, 0x0, 0x0, 0, 0x0254, 0, 0),
> -       PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0260, 0x026C, 0x00000001,
> +       PLL(CLK_APMIXED_TVDPLL, "tvdpll", 0x0260, 0x026C, 0,
>                 0, 0, 22, 8, 0x0264, 24, 0x0, 0x0, 0, 0x0264, 0, 0),
> -       PLL(CLK_APMIXED_MMPLL, "mmpll", 0x0270, 0x027C, 0x00000001,
> +       PLL(CLK_APMIXED_MMPLL, "mmpll", 0x0270, 0x027C, 0,
>                 HAVE_RST_BAR, BIT(23), 22, 8, 0x0274, 24, 0x0, 0x0, 0,
>                 0x0274, 0, 0),
> -       PLL(CLK_APMIXED_APLL1, "apll1", 0x02A0, 0x02B0, 0x00000001,
> +       PLL(CLK_APMIXED_APLL1, "apll1", 0x02A0, 0x02B0, 0,
>                 0, 0, 32, 8, 0x02A0, 1, 0x02A8, 0x0014, 0, 0x02A4, 0, 0x02A0),
> -       PLL(CLK_APMIXED_APLL2, "apll2", 0x02b4, 0x02c4, 0x00000001,
> +       PLL(CLK_APMIXED_APLL2, "apll2", 0x02b4, 0x02c4, 0,
>                 0, 0, 32, 8, 0x02B4, 1, 0x02BC, 0x0014, 1, 0x02B8, 0, 0x02B4),
>  };
>
> --
> 1.8.1.1.dirty
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
