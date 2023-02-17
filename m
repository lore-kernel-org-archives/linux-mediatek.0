Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52210C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 05:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i/LoJUyP6LIWBGDbBIfrVpo/ZcUi8rR5q545T8LMRsM=; b=nwUqz5+hDxqiXd99YYM4M7aqpT
	RpbcDmyhNLOW5DdK4w/98plR97wp8UH9nWpHh3CpuyPr5l3tixwpw9Ml2BCxxslcAOFIgk8varZ3H
	FPGPCap4NRV5OO9RIbl7CcYlSjeV0JoNQsgr8/axVkTOW9uaxWMXHy/VeyRCSEuuLyceIGl3BvfMd
	wwnQ8gc9slWRc31PeejNZ8FtaEwJhqB3Ty+OQTXfqsgL9wo3SKtNCPKTQjYE6JDUeZemNwYnD7RAa
	gNI8WYUffdbeaME0Py16iesd69KSwlDXUzyS/LYEDz/skzP57FhVuvAaQW5j3C1BxoNGr3JVntyNB
	djBWsTIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSst5-00Clej-94; Fri, 17 Feb 2023 05:02:23 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSst3-00Cldi-8R
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 05:02:22 +0000
Received: by mail-vs1-xe29.google.com with SMTP id d66so4380375vsd.9
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 21:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=i/LoJUyP6LIWBGDbBIfrVpo/ZcUi8rR5q545T8LMRsM=;
        b=QW9jmwdqQetQtJ4m+DAPg2UMM3M8eQrqOiUf2cFhGvdmRC1Q8IVxeWd3vvYTVM4Kg7
         4NG7rEiSnVe0bmqG1eg/qDu59Zl2rDcdmyFtTec1Amp2ZFCV1gA7bSSVafcsJiA00Plv
         FkF6BK54sGad4++sAH5L/X8W79Kx7/gg1Bmsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i/LoJUyP6LIWBGDbBIfrVpo/ZcUi8rR5q545T8LMRsM=;
        b=mwwdDOCz+Y9AzGQucK2cEFlsjHA44oa4lbZZ8Fl+3+WFW4LE2SYnPTBQqw82PPuj4X
         EoVEUXoq2mxHCndXp3I82C0OeJ6Idzn5Ft1qis6qFL87z9wlq80E32vWev2axzk600ol
         37Tapr++mBXGolYicDJMBlavz8xoMLTQ4OsxWF95pAubHSTMODBhIAQ0/XvfbfEgmYdo
         Z6KVGJypvrlH03+DJ0vQtZSFqXDyFarJHs/7X98I4an96ewBXzvQuobOOnURWBkqpL7L
         ZTUZA2mzp3SU1nfwTKPosLmI96SKMJbUbGjAvOIivi6rV3MNn5C3vEbQZWNFyRipXwuN
         Pglg==
X-Gm-Message-State: AO0yUKWUn/SwdIP5R1I/RMXqRxfmkjXVqMb6jgZrixD0A7pAq1yI8axi
	yn3StrFTlH/nCOLSdZ3Jh61MDmwdyeJaJXZXpB1/ig==
X-Google-Smtp-Source: AK7set++VQifD1GEuW1izZhS6MZDE6Ea7vwpiMNICqDrdAHn1j+yeN310Pi4k4OdPcpmKFqoprypxB/1QcYFV1t/SH4=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1542797vso.60.1676610140223; Thu, 16 Feb
 2023 21:02:20 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
 <20230214134127.59273-40-angelogioacchino.delregno@collabora.com> <CAGXv+5FtWp8BvLHJmJvXe=eXvM10-LTjQo9PkH1xKMvzY6YiHA@mail.gmail.com>
In-Reply-To: <CAGXv+5FtWp8BvLHJmJvXe=eXvM10-LTjQo9PkH1xKMvzY6YiHA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 13:02:08 +0800
Message-ID: <CAGXv+5Hs+dB0dN6tCmLdQX+srcAzavk39fis0hMjf0ZC6UqX1w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230216_210221_317472_E995A463 
X-CRM114-Status: GOOD (  15.57  )
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

On Fri, Feb 17, 2023 at 12:32 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > Now that all drivers are using the simple probe mechanism change the
> > MT7622 clock drivers to tristate in Kconfig to allow module build.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/clk/mediatek/Kconfig | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> > index b5636b3225e8..55727889ebf5 100644
> > --- a/drivers/clk/mediatek/Kconfig
> > +++ b/drivers/clk/mediatek/Kconfig
> > @@ -336,7 +336,7 @@ config COMMON_CLK_MT6797_VENCSYS
> >           This driver supports MediaTek MT6797 vencsys clocks.
> >
> >  config COMMON_CLK_MT7622
> > -       bool "Clock driver for MediaTek MT7622"
> > +       tristate "Clock driver for MediaTek MT7622"
>
> Same as MT2712, mt7622-apmixedsys is builtin_platform_driver.

I figured it out, so

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

