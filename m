Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABDBCC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:37:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F4A66102A
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 07:37:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F4A66102A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ynp/xaKeux9sWXu+k7TDpb8ItsKu+6HZqb+buN7oOSs=; b=DxTjjXcYyF0agOn7sajhTPLCu
	1Fwh39eY6PMkG/7YIoSbJ4HA0xjdl728NxvXp3rxT0FMTs+xzPAXegjRwu/QEmRSdKbsLm1/1jRbt
	o4kXpW/xg6+j6PAYHp58xJ8twiCOYpLvaDpM+PKWUypxF/n89e9a3FRQm+V7o7WJ7c59EO67bwfvo
	Nm20QtxNIbZN0U1br9Aj69QoUO9g8rOXaILOAHyw7hPCLU6U4chexTk2Mov2KQNQuitP9JbpPfOf8
	w0InvvEn8MB/Tydh/gaXmk0lhAyHRuqy/Z6DZPFWUWv16V3lZ63eXR3+nCVK7noIcGE4qU/lwDhtE
	S/lh1jPgA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYOSg-009MZe-JV; Mon, 19 Apr 2021 07:36:50 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOSd-009MYj-G7
 for linux-mediatek@desiato.infradead.org; Mon, 19 Apr 2021 07:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
 Subject:Sender:Reply-To:Content-ID:Content-Description;
 bh=0+ERtxBLAKa344j/COpxgJf/tgpBFvh5Bj4l219hncw=; b=oSBGqjS0pwvBSLLPKHle2v0OQ3
 XaEOY5mitVEgFmpX2g6gdCAKH9cfZSMJIsGPiHcfpG7oLTghexCLRduG2WjKcCavFXR2GYs7pq5vp
 zqkdRxDzAf9UkYgBWk/hWozX7q5qoc0NpEDsCzlICDKba9mE2RWYD7f2QRKVhLdRFAOKyBSR0WCf3
 dhQtkDUCvXdtDS6mmGOvnhu1B8//YN5WYOJYLWobxLWz0GwoPrS24XXK22aSLRsRcGzaiq9NZQV1C
 KVMJLMIzE7PlXLnrJTjkG46A4EnK3Bv6vbcRgnIkxPXlC+s0bny3mX4vOWk8YrbC0mzaK02lFGv7y
 bhkvBmtw==;
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYOSY-00B8gu-RB
 for linux-mediatek@lists.infradead.org; Mon, 19 Apr 2021 07:36:46 +0000
Received: by mail-wm1-x32c.google.com with SMTP id w186so13052493wmg.3
 for <linux-mediatek@lists.infradead.org>; Mon, 19 Apr 2021 00:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:organization:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0+ERtxBLAKa344j/COpxgJf/tgpBFvh5Bj4l219hncw=;
 b=qrk6vf1EOZdLHLwAxVz1yLbK4ih6Ze0oyf5aUVfqKSeGfRpRrjHCeWDhSl0aK6r0G4
 uBLiywKB0tytKu40gqqeJOkf9hpfwC0J6TGEFhZAZsNQt3ldmpVBWKUC4D7WqHH1JMTu
 C7lp/oFtxQMQ7CyuaDlrdh+auWRZItDHFPiForkAdJsU/ElCedxw98+ajBOPNccur+7d
 uricePPL9tXoIUHIGDPwnC9COfraCyMam0tUHiEhovXZfQBxRm6r4cWYWFFMLTcQMlAX
 E3CSk6AfNuqq98koEPfaulkns9/dJcV3OduT/xwJ83x4GL9+CAMRZCOxRsGqDqbPSOQn
 lMuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=0+ERtxBLAKa344j/COpxgJf/tgpBFvh5Bj4l219hncw=;
 b=Vy+gCr72CcrREStOhZaWO3v3WI7l028E6yLTxfCGmwEZL8Pju0j5duerwtht/L31Tq
 hJvMRbLrr3x9ZhLheU9Jphn5DCvz7dYnIlfuYGos9I5jawiWskUn9KNdkkbiikk5BFON
 jBe9sJeW83kCuD+X1I5Gfo83XXe8qvQPzOK6f2czaeFTLojeVqSgOF+2DTduq9SArasW
 ugy7tFPtYe7jt9bhriEw8CLtKezSqmJ40DI86FXmF19VqrBWr6v6W8LdeOYbRfH55j83
 94lbWZUpNapxObxSfQ4coAb1lHJ03Oj90GTO7brvNwcomc7GhXhbGNUJnhDLQ+MI1Uv7
 A2cA==
X-Gm-Message-State: AOAM533y9PpOlXCxepSXzD1osSGd8559m+kqMr/kD8lvvP7Zw3C5vqFH
 MsM32C9cENZLsJ53Nck/m3jQwQ==
X-Google-Smtp-Source: ABdhPJw2g0pS+qOTAkbmbUZIhuDHi3UKmV+q/ol9tb6YWfNBVWi/V+7tn1DJrHP6PL03s7jfw/PZHw==
X-Received: by 2002:a7b:cb82:: with SMTP id m2mr20362725wmi.105.1618817800987; 
 Mon, 19 Apr 2021 00:36:40 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:90c:e290:2e82:31e6:67f1:4f33?
 ([2a01:e0a:90c:e290:2e82:31e6:67f1:4f33])
 by smtp.gmail.com with ESMTPSA id i12sm18382688wmd.3.2021.04.19.00.36.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 00:36:40 -0700 (PDT)
Subject: Re: [v2,PATCH 1/3] drm/mediatek: dpi dual edge sample mode support
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, chunkuang.hu@kernel.org,
 matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jitao Shi <jitao.shi@mediatek.com>
References: <1618407316-10042-1-git-send-email-rex-bc.chen@mediatek.com>
 <1618407316-10042-2-git-send-email-rex-bc.chen@mediatek.com>
From: Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
Message-ID: <a1ffcce8-621e-7493-22d4-e28ff09c31a4@baylibre.com>
Date: Mon, 19 Apr 2021 09:36:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1618407316-10042-2-git-send-email-rex-bc.chen@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_003642_933505_0DECB100 
X-CRM114-Status: GOOD (  19.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

On 14/04/2021 15:35, Rex-BC Chen wrote:
> DPI can sample on falling, rising or both edge.
> When DPI sample the data both rising and falling edge.
> It can reduce half data io pins.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index b05f900d9322..21a3a7b78835 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -83,6 +83,7 @@ struct mtk_dpi {
>  	struct pinctrl *pinctrl;
>  	struct pinctrl_state *pins_gpio;
>  	struct pinctrl_state *pins_dpi;
> +	bool ddr_edge_sel;
>  	int refcount;
>  };
>  
> @@ -121,6 +122,7 @@ struct mtk_dpi_conf {
>  	unsigned int (*cal_factor)(int clock);
>  	u32 reg_h_fre_con;
>  	bool edge_sel_en;
> +	bool dual_edge;
>  };
>  
>  static void mtk_dpi_mask(struct mtk_dpi *dpi, u32 offset, u32 val, u32 mask)
> @@ -380,6 +382,15 @@ static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
>  	}
>  }
>  
> +static void mtk_dpi_dual_edge(struct mtk_dpi *dpi)
> +{
> +	if (dpi->conf->dual_edge) {
> +		mtk_dpi_mask(dpi, DPI_DDR_SETTING, DDR_EN | DDR_4PHASE,
> +			     DDR_EN | DDR_4PHASE);
> +		mtk_dpi_mask(dpi, DPI_OUTPUT_SETTING, dpi->ddr_edge_sel ? EDGE_SEL : 0, EDGE_SEL);
> +	}
> +}
> +

By using the downstream code as reference:

-       clk_set_rate(dpi->pixel_clk, vm.pixelclock);
+       clk_set_rate(dpi->pixel_clk, vm.pixelclock * (dpi->conf->dual_edge ? 2 : 1));

is missing in mtk_dpi_set_display_mode()

>  static void mtk_dpi_power_off(struct mtk_dpi *dpi)
>  {
>  	if (WARN_ON(dpi->refcount == 0))
> @@ -518,6 +529,7 @@ static int mtk_dpi_set_display_mode(struct mtk_dpi *dpi,
>  	mtk_dpi_config_yc_map(dpi, dpi->yc_map);
>  	mtk_dpi_config_color_format(dpi, dpi->color_format);
>  	mtk_dpi_config_2n_h_fre(dpi);
> +	mtk_dpi_dual_edge(dpi);
>  	mtk_dpi_config_disable_edge(dpi);
>  	mtk_dpi_sw_reset(dpi, false);
>  
> 

Neil

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
