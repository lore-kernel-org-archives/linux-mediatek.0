Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEC7C636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 05:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lmq1AX4l7BfT40HlVrRZjM9eenWjOvLvEux3RFmEoWg=; b=jNtaYm3D77IRbvKPBa4+MM8Tiu
	GsYQ4YsTdMl/AqSau7jWsgjtFcy0oVHgyRyB6UEYLBMSVH2XolBekY9JbNrcqJXXA+CBnDCQy6uFf
	Ciz5RIAlWyvUlBP9zf4+1c2gUI+ShK+q4y1VYAnIe1P95Hl5mR+VlbFKzDzNfN1rk0r+Vy4NpZNlt
	LbZsVW2wpQmJOWuxJAnmU81CLRvVaPxzLMdl5zk+j5OtatKfrmOEQWYyeiflRjUdHkhfb1zw3D5V9
	ULtN23OkGsrgdExiemwtDAo06GKoMdaKNpszwSHFoYGJheVOKG1Vplbng5qg6yHS7R+iXLEsNgcol
	XwHdlS9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSssD-00ClSp-8d; Fri, 17 Feb 2023 05:01:29 +0000
Received: from mail-vs1-xe33.google.com ([2607:f8b0:4864:20::e33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSss4-00ClQW-Az
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 05:01:21 +0000
Received: by mail-vs1-xe33.google.com with SMTP id j40so2388998vsv.2
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 21:01:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lmq1AX4l7BfT40HlVrRZjM9eenWjOvLvEux3RFmEoWg=;
        b=mzfynhcgrkOoplyuqlL2AI4eBdkAFhrskPqgnwuDnkU6xR9Fyn93xP2Mhe52MNdxeB
         YbOAgDZoZ5AnITUtUgQtg6cilK0KeJfJKi2P/7sN3sJAOfcaPCdJNQdAyJ/eRGWVsFcP
         Zngo++3RtvgTitafOGLblUpXpCW7gPqR4iyCg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lmq1AX4l7BfT40HlVrRZjM9eenWjOvLvEux3RFmEoWg=;
        b=JsFYRb64Q+9GQUZXbx/MV0mLc56Dfg1gVdoixoQ+ssheId7GArsrUF/J3OE9Wdbrgm
         cmIpO7CLu9zJ5qV1ubzUdjLyH+V08UiT4cb8je10iJ4u169DisA47ngz/a1E4RvluG3q
         0IeuVuI2d1LJITLqx2X9Ng8cxvNSXWtJ+yZWtnX9DJPo/UJLOTd8l7LYUVOoTh2uRc8b
         j049FBG4zGKXA0WkSA0Wog35QLFaJE2dBglnZP+dLG2MNisTsBJISZAYjL6Db9PiPrH7
         Ydo2sBFPMmaDrRXmyRy1Z9nKoAAILpILT9RuntNHxGcnP8kmiAo+BS09syArFkmFX0XZ
         +KLw==
X-Gm-Message-State: AO0yUKWmC6InYZYzori4C+hJwDKLxWck+yifpGZE2aTRxbYtjuiH0env
	gku41Jz9o0nejsrNozVaHECpqPpos2zxR1wqw1uorg==
X-Google-Smtp-Source: AK7set+rIxXTdLszssQwjrPl/zffBSJASXRC2NxpmWZXPFmaNCb2uW0LmSshMzR+1Jfc6cjYctj08T5+Ubbk9qYPm0g=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1542200vso.60.1676610077504; Thu, 16 Feb
 2023 21:01:17 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
 <20230214134127.59273-37-angelogioacchino.delregno@collabora.com> <CAGXv+5FxnsJaVw2MzeH+-Z3yEPzPCRtTukp7FDhsBoKHfx=m=g@mail.gmail.com>
In-Reply-To: <CAGXv+5FxnsJaVw2MzeH+-Z3yEPzPCRtTukp7FDhsBoKHfx=m=g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 13:01:06 +0800
Message-ID: <CAGXv+5E_kwn+9HLt0Y0BOyk-msXiU3W0N5woKenqVzK-GG_yQQ@mail.gmail.com>
Subject: Re: [PATCH v2 36/47] clk: mediatek: mt2712: Change Kconfig options to
 allow module build
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
X-CRM114-CacheID: sfid-20230216_210120_382997_858BDA4C 
X-CRM114-Status: GOOD (  17.46  )
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

On Fri, Feb 17, 2023 at 12:24 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
> >
> > All of the mt2712 drivers have been converted to platform drivers!
> > Change the Kconfig options for all MT2712 clocks to tristate to allow
> > building all clock drivers as modules.
> >
> > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/clk/mediatek/Kconfig | 16 ++++++++--------
> >  1 file changed, 8 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> > index b9c0a9e21cf1..45b7aea7648d 100644
> > --- a/drivers/clk/mediatek/Kconfig
> > +++ b/drivers/clk/mediatek/Kconfig
> > @@ -75,7 +75,7 @@ config COMMON_CLK_MT2701_G3DSYS
> >           This driver supports MediaTek MT2701 g3dsys clocks.
> >
> >  config COMMON_CLK_MT2712
> > -       bool "Clock driver for MediaTek MT2712"
> > +       tristate "Clock driver for MediaTek MT2712"
>
> Hmm... How does that work out if mt2712-apmixedsys is a
> builtin_platform_driver?

Nevermind. I figured it out.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

