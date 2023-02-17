Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BEAC05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 15:19:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=28m85WAnnpLbewBzTbhGeA+5WhnAGWrMfNOGOaniYvg=; b=OdgSMARQ7OiN3LIc9KTNdY56GK
	+vDEAMChF4tn3wmcCOAShROooI5mTWNceB/5uk81ZBGTx4TeYakCP4E6pYXvm/rp4e5UOYwvH9gUq
	V2pXBNif94bDDgP7w1jmTtjDvswiQBMoolmKt9T4bQAjhH72TKY8v+FRiB//Y9HlSJxwgMSD7eZwt
	iNljz8TgLfqKXALLGFn/j4n//xPCtyGTEB0f8xVspd61/mi8FOBXxWe5grEdw8Zmn+fUiNfkqHVJO
	12pEPCbDerT/UMUfT5VNWizUMzf3P40ylBtnJcmOWLpTWk0WUtaMwC33Or1oHYJcbFNOYAIU9H+7P
	mOvmXZ3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT2WD-00EqEo-NW; Fri, 17 Feb 2023 15:19:25 +0000
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT2WA-00EqDF-Iw
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 15:19:24 +0000
Received: by mail-io1-xd2d.google.com with SMTP id h3so593864iow.10
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Feb 2023 07:19:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=28m85WAnnpLbewBzTbhGeA+5WhnAGWrMfNOGOaniYvg=;
        b=iTru555DCJcpPNOjU2/mVZu3LtQWSUYUAdKx5txJDVaFEE+NyIgC/P/XwyueRf+4do
         7Yz+08J0QeVNBWxztiyYiioFfvMUrEuBB4AmC0Z3DpkFXaTd0jRfUUXDfymbuGl4ntV2
         JKwmE3iszmEVGb4VRciHCQmkRcgZoqezEIapM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28m85WAnnpLbewBzTbhGeA+5WhnAGWrMfNOGOaniYvg=;
        b=N7Rwrxb2qN3HgFX02RnSte6SE/QRIgG6l0kmpRS5X3ddu47JNa+nJFVyAyl0IZGZTx
         1CSa99ke+TnUd6feQaspplQpp5NNCZZ0gKPfYXsuEhAfnIwbGvY52nBqYotGnvudAY4L
         2Kuoz5xv5mTlY5H80vZzmGW4Y4sic2RdH3tHMZfn+W2uLNOQN0b4SYAe29hDTYJgNEqQ
         ofrhdyWJ1WZC4jt94JKWabM6OAkcrIeFuL8mI3wGabxcgKo5o9PYghWpirCHZeA3sOa0
         oeXEj4cZgTE01w2CMfR0E5svv3vJpcfDIT3FEwrdUUur9RcMWhJl3cKfi+gqAHztPq2+
         CoJQ==
X-Gm-Message-State: AO0yUKWh7zw3P/k9s0hq7KiZsQH1IS1pTxsRukjotvGtp0duE2+vS/dK
	RHMyQ5raQovXTEvvOM4qxdW8feOxwB00mrnaqnse8w==
X-Google-Smtp-Source: AK7set8yV0jmr30XFE4rM1GZt6qlKEkgdKldV2tS6LZdcI//mJo2pc20sn2fQPNhGqIKrveAS4/pZnYJaRxzTdtVSm4=
X-Received: by 2002:a6b:e70e:0:b0:740:66b5:12c1 with SMTP id
 b14-20020a6be70e000000b0074066b512c1mr3255468ioh.19.1676647159803; Fri, 17
 Feb 2023 07:19:19 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
 <20230214134127.59273-37-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FxnsJaVw2MzeH+-Z3yEPzPCRtTukp7FDhsBoKHfx=m=g@mail.gmail.com> <37690521-4d24-ce55-f81e-30ad931dfe95@collabora.com>
In-Reply-To: <37690521-4d24-ce55-f81e-30ad931dfe95@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 23:19:08 +0800
Message-ID: <CAGXv+5FM_pxu4Ms1mbvpdJLxkOZe2ZXjNoiOCfANpdxLme+_Lg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230217_071922_662424_98C2F83D 
X-CRM114-Status: GOOD (  21.07  )
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

On Fri, Feb 17, 2023 at 7:25 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 17/02/23 05:24, Chen-Yu Tsai ha scritto:
> > On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
> > <angelogioacchino.delregno@collabora.com> wrote:
> >>
> >> All of the mt2712 drivers have been converted to platform drivers!
> >> Change the Kconfig options for all MT2712 clocks to tristate to allow
> >> building all clock drivers as modules.
> >>
> >> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> >> ---
> >>   drivers/clk/mediatek/Kconfig | 16 ++++++++--------
> >>   1 file changed, 8 insertions(+), 8 deletions(-)
> >>
> >> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
> >> index b9c0a9e21cf1..45b7aea7648d 100644
> >> --- a/drivers/clk/mediatek/Kconfig
> >> +++ b/drivers/clk/mediatek/Kconfig
> >> @@ -75,7 +75,7 @@ config COMMON_CLK_MT2701_G3DSYS
> >>            This driver supports MediaTek MT2701 g3dsys clocks.
> >>
> >>   config COMMON_CLK_MT2712
> >> -       bool "Clock driver for MediaTek MT2712"
> >> +       tristate "Clock driver for MediaTek MT2712"
> >
> > Hmm... How does that work out if mt2712-apmixedsys is a
> > builtin_platform_driver?
> >
> > ChenYu
>
> That doesn't. Thanks for catching that, I've added a .remove() callback
> and changed it to module_platform_driver() for v3!

Actually, I thought that if it were built as a module, then the
builtin_platform_driver would then expand to a module_init() without
module_exit(). So it would become a loadable module that cannot be
unloaded.

That was just looking at the header files, so I could be mistaken.

Side note: IIRC a missing .remove() driver callback doesn't actually
block driver removal or unbinding.

ChenYu

