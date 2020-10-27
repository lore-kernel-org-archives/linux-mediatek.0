Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BCB65C388F9
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 12:12:28 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2644720725
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 12:12:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="07C9o8zL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PDTzx3wA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2644720725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ueekJ89cpiDjgoauuBWXsViNPbrHfK9d1C7OQRAtY8E=; b=07C9o8zL2O4CJLbzOo00b+ch+
	RpK+JiBVql19E3xfNiSAs8TU8oQsyd+qG4TCmjTB+AK1MJE5Zhgs2ReDKIrgoAEDzf4myn5S029Ya
	0M46c3fYHr0o2Q01UOdBz0OHDIzqvG4M6Bm+G8SZYdvevMjFMqq3Ridp8xQOE2YAsZDRQvcruHtCj
	Cfmc53xMI68JPLud5DsArJVBGg3q2cEYVatJ5GzXOyeYIUL2m3zAXX3jbmQntRvzLSejhxNkDY+YN
	PSAcpXr0lSdYUWDuSFshcgitqZgrDEAl4rNJIInCfpM4gulDAd8xRVVYObv209NnX8pjegiiVX3OS
	2I3mjvlqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXNpq-0004w6-Ga; Tue, 27 Oct 2020 12:12:18 +0000
Received: from mail-vk1-xa44.google.com ([2607:f8b0:4864:20::a44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXNpn-0004uZ-3M
 for linux-mediatek@lists.infradead.org; Tue, 27 Oct 2020 12:12:16 +0000
Received: by mail-vk1-xa44.google.com with SMTP id z10so302278vkn.0
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Oct 2020 05:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V3hdAD2/SfSVH7mLkNbOazbZ1K7Ev/XT9ONQ25TQSDM=;
 b=PDTzx3wAmjvtMIqJLQf55wBX3zV38/E1NKQ5hbF9J37P08tWIczYGfMiDSri4xIg9+
 D9gol1nV6KVYi6Khf2wEMy5sYHrpUr86+CdjE4fqGO/REJGVUHnZUXG5c6vNYAxLrYwy
 3IoFi5UPd8B2S77Jp9ejkSanfGhEY8mCZhKnaNEp285Gp8oHExqo54MoOfC2hGyT7ghA
 lDgQ8iHU5tPmPNjJaCcADMi2qU3OqvBBPliNvYl52SLhS2icaiKPhg5V8e/LmAvonKhX
 x6e9HDTk4W8radGJrKEUVq1y91uAunqgLpmeNau7FcOO19Njbz7l1MaIDoV9Q3NDvpwu
 WMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V3hdAD2/SfSVH7mLkNbOazbZ1K7Ev/XT9ONQ25TQSDM=;
 b=fUdbHU+2KrYaRLFw5c1jHZhUXuixVAKw5Wpi3QF9aYXpPi8RMK1qrX6v2p6VcKqow0
 NDK1aGYwqKmM/FoYhkXGK1KhflrLR9nuOrQvOzfZPq7S+HA9bCdZJeOTQFB4Tz3VnXs5
 UetHKXIxbu2isgWs4Y9f1r9L7D0YZEWp8R5Oz9/GiMrhKCDALx6j0FOqR8CVe91OV9V/
 CjGIdxUPCUEc1FlSOFyWvngfAfsYfkV0LBgxwkwjlId/Cvzn9Fhyvph6B+5+eTs0i5Yt
 5lJY4y8XBufGZlqgez/VKbVpY0B9nrM0Y9lXEmhceogrR/bIdK6dblYcnx/fvV052aZv
 IN9A==
X-Gm-Message-State: AOAM533e6M/6hl4NhVXXz5y8cPToV1kvZKSKEWtimJZlwYrnJQNrxpsW
 oCkonhGDIJFFC6daC1tsI7IzVMiuKq+AhCv+LgtXKw==
X-Google-Smtp-Source: ABdhPJz9LZoiTJhx1SHZvE2wOEztXoNObRC3nyLzZpkAJKjEOp/2NEgP80ioL4M98sMqoh79lv2vrnEnNPppto8YuAU=
X-Received: by 2002:ac5:c1ca:: with SMTP id g10mr1144150vkk.6.1603800731083;
 Tue, 27 Oct 2020 05:12:11 -0700 (PDT)
MIME-Version: 1.0
References: <20201023122950.60903-1-fparent@baylibre.com>
In-Reply-To: <20201023122950.60903-1-fparent@baylibre.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 27 Oct 2020 13:11:34 +0100
Message-ID: <CAPDyKFrMwLeuQoFDgXYo_-T_e2AzfqM-rgp3-SgeuC6Qn6rxMA@mail.gmail.com>
Subject: Re: [PATCH] mmc: host: mtk-sd: enable recheck_sdio_irq for MT8516 SoC
To: Fabien Parent <fparent@baylibre.com>, Yong Mao <yong.mao@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_081215_186272_3E8F32BE 
X-CRM114-Status: GOOD (  17.14  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

+ Yong Mao, Chaotian Jing

On Fri, 23 Oct 2020 at 14:29, Fabien Parent <fparent@baylibre.com> wrote:
>
> MT8516 SoC suffers from sometimes losing SDIO IRQs, this makes SDIO
> devices sometimes unstable. Make use of the new property
> recheck_sdio_irq to fix the SDIO stability issues on MT8516.
>
> Signed-off-by: Fabien Parent <fparent@baylibre.com>

Maybe this is a common problem, thus I am thinking that potentially we
should enable the workaround for all variants?

I have looped in Yong Mao (who invented the workaround) and Chaotian
Jing, to see if they can advise us how to proceed.

In any case, I think we should add a stable tag and a fixes tag.

Kind regards
Uffe

> ---
>  drivers/mmc/host/mtk-sd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index a704745e5882..3dc102eefe49 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -524,7 +524,7 @@ static const struct mtk_mmc_compatible mt7622_compat = {
>
>  static const struct mtk_mmc_compatible mt8516_compat = {
>         .clk_div_bits = 12,
> -       .recheck_sdio_irq = false,
> +       .recheck_sdio_irq = true,
>         .hs400_tune = false,
>         .pad_tune_reg = MSDC_PAD_TUNE0,
>         .async_fifo = true,
> --
> 2.28.0
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
