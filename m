Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B115C636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 04:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/MeUKjw33jpqilmmYXQEGFRb0OCD/4Vq8XY4qGuBOYE=; b=BwflZUfGnf7PmXtnH16Y24WaRH
	32wcdRbeuTkkvZaEo/RXBFP2lLus6+84ptCzhM8J2PCvjCJUDZ+EonzWAyqq9Cmwhasy4dFDt7q4i
	LO21iC/UEtYLpIfAYqGgBWGJarha1IfiFM24MObImefHOj/IN74UO28Rqv6FsPBc5pSPzHwsEliUi
	19R83pH5vTt5kI94uXSQowInNcdwP2Y6Hsf6X7c1CMex+5OVSUmbWPG8BHryWYnXcKAz/nkBZR9TK
	hb3/nb6AG9n7ZvkZuCFGnH/JJRydtvLcms1pkHsyOB/aUXJwUBCDpgbqICnNP/bnKo5sp4sI3Y1OU
	clY7edWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSsQk-00ChJf-55; Fri, 17 Feb 2023 04:33:06 +0000
Received: from mail-vs1-xe34.google.com ([2607:f8b0:4864:20::e34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSsQZ-00ChFg-T0
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 04:32:57 +0000
Received: by mail-vs1-xe34.google.com with SMTP id k4so4355787vsc.4
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 20:32:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=/MeUKjw33jpqilmmYXQEGFRb0OCD/4Vq8XY4qGuBOYE=;
        b=S3awRWKrbCT7SjUcPzd0fvwXvqP30sAmcHpK21MWzkpsEU2B2urrTaswMUoqohl8ga
         INOvkTG37BexzEthZigt9wfPn9w957TxMGKzEkEKfWRbUOA0LGE9fQ4hAEwSqECPuPkA
         MyRSsGcuD4OR3nHWt3NkGIuU3DUpogrjTdmVo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MeUKjw33jpqilmmYXQEGFRb0OCD/4Vq8XY4qGuBOYE=;
        b=KAtxrco4F8NI2NLYUb0rrWBNnz9oYlLVwzN/cHfMexpCV4+4SYamCqD/yJ0jNEOiqt
         r1dUJTlE0eJxoEV6KRJONYpxORv5bU6ejL0R0m7oolOnYWQdp+Zi13LvqqEnXGeq65Mc
         /PQXzcKGZ/zUhfsvNrMBhpvNoXLZy/++eKCUGmQ0EHngUfNyyAh5v4R5MCUjuYgCSFGU
         qmcdOtgrQkcqqEpuwy51Jf/k6l39AO+03Mxkqk5IOt5OM9yUMkD3fxSrzUGzcylGcc00
         2qocMwAcUI9k9zECw6a9ihNhSaQzoaO2irQxOjpI0hzeaPI54tmmFYS/ZVRk1x4tEQIM
         Z2Kg==
X-Gm-Message-State: AO0yUKUbKgdcVcfwoTfxp50MjaijUJrcBEchTQWHRSXDSTt0qaiQxrZh
	SspI2b1Ql6Vv6DEtqoM8+DzlCqK3thhlDZXT1+d48A==
X-Google-Smtp-Source: AK7set/cSGuBVDTCxSmRRGsS41MgtBnX0pHCKDtmZOdivWOY+N/IZzhla6F8qP11ESwesqemFfp/tlEhHshfqZsRNsc=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1532091vso.60.1676608374852; Thu, 16 Feb
 2023 20:32:54 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-40-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-40-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 12:32:44 +0800
Message-ID: <CAGXv+5FtWp8BvLHJmJvXe=eXvM10-LTjQo9PkH1xKMvzY6YiHA@mail.gmail.com>
Subject: Re: [PATCH v2 39/47] clk: mediatek: Allow MT7622 clocks to be built
 as modules
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_203255_960498_2C30B806 
X-CRM114-Status: GOOD (  13.95  )
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

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Now that all drivers are using the simple probe mechanism change the
> MT7622 clock drivers to tristate in Kconfig to allow module build.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  drivers/clk/mediatek/Kconfig | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> index b5636b3225e8..55727889ebf5 100644
> --- a/drivers/clk/mediatek/Kconfig
> +++ b/drivers/clk/mediatek/Kconfig
> @@ -336,7 +336,7 @@ config COMMON_CLK_MT6797_VENCSYS
>           This driver supports MediaTek MT6797 vencsys clocks.
>
>  config COMMON_CLK_MT7622
> -       bool "Clock driver for MediaTek MT7622"
> +       tristate "Clock driver for MediaTek MT7622"

Same as MT2712, mt7622-apmixedsys is builtin_platform_driver.

ChenYu

