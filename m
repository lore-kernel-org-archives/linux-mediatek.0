Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DF8C55179
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Aug 2026 14:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ptAA2UgbXk0GHtmmP9E3bbEDZbmeRKtWgtxlW5QXXyQ=; b=HM/PIPiIV1E7Oa3eGX+peiXgro
	N4kq6a81nI/T0ADqL0Vs1gHQ9sH0ZyzjyQmqKus7no2H47U7bvweMZMYNSs7mNXzRe/yI9LbsHBH8
	qiVxHamaolBte3EpJp/NE4K8dajPsFepoTUQl11eAug3oAnCWDAlA+C7LaSw2wTZdBC5wCrMu+p95
	YSrARghgYPL8nspQwYqaz033sj0kq11YONnyeZFaqiE4CaIX0ClDaA6OehGwpBy7TX2oKm/xtWyQf
	2laX9fl7+AggXo2bnS/S9dj+EN0jOxySxR9nQz+TcKbmgWQx2Gl5ONicwS2AKc2k7XHQaQU814sov
	2WXzANUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqttw-0000000HPy6-35B1;
	Mon, 03 Aug 2026 14:44:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqttt-0000000HPx0-1xyR
	for linux-mediatek@lists.infradead.org;
	Mon, 03 Aug 2026 14:44:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785768260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ptAA2UgbXk0GHtmmP9E3bbEDZbmeRKtWgtxlW5QXXyQ=;
	b=ISvwtKgbZpBhvK/UiLeEgpRKrxDwXilZzTvtnRwep+ZM0hgqOfoYOwLvC04eKPF3xqKgb5
	KPSKgNYkpSPSY4mj2KPKKzaGUd7dgwyA2r/XNlodiTv4wucErkeJ1q3JWIl3yMIhLjNSbl
	jOgmcjbDGVk0LD8CMH64W/V/Mc6b+NI=
Received: from mail-yx1-f72.google.com (mail-yx1-f72.google.com
 [74.125.224.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-107-3yo25ejLPTakHJKTwEdI6w-1; Mon, 03 Aug 2026 10:44:19 -0400
X-MC-Unique: 3yo25ejLPTakHJKTwEdI6w-1
X-Mimecast-MFC-AGG-ID: 3yo25ejLPTakHJKTwEdI6w_1785768259
Received: by mail-yx1-f72.google.com with SMTP id 956f58d0204a3-667c0eadf4aso11357345d50.2
        for <linux-mediatek@lists.infradead.org>; Mon, 03 Aug 2026 07:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785768258; x=1786373058;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ptAA2UgbXk0GHtmmP9E3bbEDZbmeRKtWgtxlW5QXXyQ=;
        b=cK7Zr0RTjvdFsucnysyNTNqquYEsBMES4ooCppJOiCQzavN5imDxw6wJ5LhfEIMUkm
         Icxqeq0d0xS+KX6UjBmnSF+2RJ54pTBWAFTJULn6vkBl3d4rR/2bJHlaGu6P/d0YH++M
         tJp3onTij8u1TsHo5Cy136l6wRYmPy8QARAjvFzphaSwN2+8lFqO2LOEHho72D6zaC9j
         KUwj/O0kT0HOapTjGzOuuA6phYJLTcwteJZsUL5YuJz6XI3lUGkig9/ZtsTXkuUyM+6q
         u8jYsGC+To6Y3oJlAyolQPqBUcoWJH71S7/5VIWI7JhgoacFgTOruHe+3JqcE+IxShBx
         u58g==
X-Forwarded-Encrypted: i=1; AHgh+RoutMuvG7ZWqQ7PZgxnZdj3xEzg0mCYlSdpSrDMYj4lYD6Ubuvfoi9DT5LsDBpioc2EEQHki2ipaMYUXKI3kQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6sExdTHFy09DpR+gINHkm2mhTIsjPuWMckp53QiQAtFPPL/ns
	47FDVe0uxNe6mFPtjy0mkTcBOmqB5MgWIevxAlJpDOKk23DWbYa185aYBrhsH1n4CXucXKYqLwO
	TBGItGBI1M11H8qsJgRqYoX6znB9QhGKYOAfGeWvfFxvl0f4ULIN1xFzbyeZnYNVm/X5j0IW2GA
	==
X-Gm-Gg: AR+sD13x4LZVtkqnnpU17eVr/uWE+VOJTMLC3Y3T76KhjfRWhHQ6dUd+Srnzdo/WE5/
	Mv88J9I1VX8abizMhjNH+qSyUiUimVdOPY/ZF42IbCUuuurH4Y+mdvozQ1nqQociAUlks/wXZ4n
	w5vRxB33bquujD2Gn5bkHKN3zjyeop5SCZDT9H8SBMfVafxg5b+QWzuOPtVoYdKMSkasNslQtP/
	HEbZV6atRkyIo1C0vyHfaQ+8Tyi8AAmZjILY6RkJiDriUYU3G/mtWk08oSPPe8dCbCzREmWEWFS
	bAxWlz7rUAlqHe5cf0k7PSJseTzdMmbUdnssVDMIpdZhZidZBQ1Y3Qe0BvpcYvQJJIYQ3E5jwkI
	14LYVl18Yso4kZUW/j5zGKUaCmpfKS900jDA=
X-Received: by 2002:a53:ef09:0:b0:664:e66e:f955 with SMTP id 956f58d0204a3-6694efcd46cmr9652576d50.4.1785768258638;
        Mon, 03 Aug 2026 07:44:18 -0700 (PDT)
X-Received: by 2002:a53:ef09:0:b0:664:e66e:f955 with SMTP id 956f58d0204a3-6694efcd46cmr9652545d50.4.1785768258248;
        Mon, 03 Aug 2026 07:44:18 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66948fcb3acsm5643561d50.10.2026.08.03.07.44.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:44:17 -0700 (PDT)
Date: Mon, 3 Aug 2026 10:44:15 -0400
From: Brian Masney <bmasney@redhat.com>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>, kernel@collabora.com,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH v5 13/25] clk: mediatek: pll: Add ops for PLLs using
 set/clr regs
Message-ID: <anCpP0FlwHdomb_e@redhat.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
 <20260801-mt8189-clocks-system-base-v5-13-ac4410697cc2@collabora.com>
MIME-Version: 1.0
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-13-ac4410697cc2@collabora.com>
User-Agent: Mutt/2.4.0 (2026-06-19)
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 9ITNRuvxAsEqOC7ks2BZ4VLLkWh2ViXmaKvLg_D9u5I_1785768259
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_074421_600414_A9560148 
X-CRM114-Status: GOOD (  25.22  )
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

Hi Louis-Alexis,

On Sat, Aug 01, 2026 at 01:20:59PM +0200, Louis-Alexis Eyraud wrote:
> MT8189 SoC uses a new combination of status and set/clr registers to
> control its PLL enable state and perform BAR reset, that are different
> than the current default clock prepare/unprepare operations are using.
> 
> Add new set of PLL clock operations to support this logic that relies
> on the following registers for prepare/unprepare operations:
>   - en/en_set/en_clr, rather than en register, for PLL enable
>     control
>   - rst_bar/rst_bar_set/rst_bar_clr, rather than default rst_bar
>     register for BAR reset control
> 
> Also, handle rst_bar register setting/clearing with a timeout, to
> verify the operation was correctly performed.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  drivers/clk/mediatek/clk-pll.c | 66 ++++++++++++++++++++++++++++++++++++++++++
>  drivers/clk/mediatek/clk-pll.h |  5 ++++
>  2 files changed, 71 insertions(+)
> 
> diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
> index 9a197a657dce..3118f68aa9ac 100644
> --- a/drivers/clk/mediatek/clk-pll.c
> +++ b/drivers/clk/mediatek/clk-pll.c
> @@ -9,6 +9,7 @@
>  #include <linux/delay.h>
>  #include <linux/err.h>
>  #include <linux/io.h>
> +#include <linux/iopoll.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
>  #include <linux/platform_device.h>
> @@ -32,6 +33,7 @@
>  #define INTEGER_BITS		7
>  
>  #define PLL_STABILIZATION_DELAY	20 /* in us */
> +#define RST_BAR_TIMEOUT		20 /* in us */
>  
>  int mtk_pll_is_prepared(struct clk_hw *hw)
>  {
> @@ -301,6 +303,60 @@ void mtk_pll_unprepare(struct clk_hw *hw)
>  	mtk_pll_power_off(pll);
>  }
>  
> +int mtk_pll_prepare_setclr(struct clk_hw *hw)
> +{
> +	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> +	u32 val = 0;
> +	int ret;
> +
> +	mtk_pll_power_on(pll);
> +
> +	writel(BIT(pll->data->pll_en_bit), pll->en_set_addr);
> +
> +	__mtk_pll_tuner_enable(pll);
> +
> +	udelay(PLL_STABILIZATION_DELAY);
> +
> +	if (pll->data->flags & HAVE_RST_BAR) {
> +		writel(pll->data->rst_bar_mask, pll->rst_bar_set_addr);
> +
> +		ret = readl_poll_timeout(pll->rst_bar_addr, val,
> +					(val & pll->data->rst_bar_mask), 1,
> +					RST_BAR_TIMEOUT);
> +		if (ret) {
> +			mtk_pll_unprepare_setclr(hw);
> +			return ret;
> +		}
> +	}
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(mtk_pll_prepare_setclr);
> +
> +void mtk_pll_unprepare_setclr(struct clk_hw *hw)
> +{
> +	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
> +	u32 val = 0;
> +
> +	if (pll->data->flags & HAVE_RST_BAR) {
> +		writel(pll->data->rst_bar_mask, pll->rst_bar_clr_addr);
> +
> +		/* ignore return code to continue unpreparing the PLL if
> +		 * a error occurs on register read poll.

Use proper kernel comment:

  /*
   * Ignore return code...
   */

Also s/a error/an error/

With that fixed:

Reviewed-by: Brian Masney <bmasney@redhat.com>


