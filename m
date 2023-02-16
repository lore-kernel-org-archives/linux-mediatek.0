Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6026C636CC
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Feb 2023 16:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9+xD6CgpHuj+3bXoxIyE/Y1C3b+r2lzOEQXMWBI7Hc=; b=GRTaF4nlL3fyTNJ8rwOwK9FQVU
	0/P+LW7z0pqzwbcLVAVL/gex7KvM1ZYt9l6KjyQUBYqqfrQkf2y/xR5FZkYQTC9XAk4OR1zn94oUg
	kersT2BwApOpZk2iJmpc0fK7juTZ5KDbGlFDjmB5X2x1xvyUQZIlI35E4zBXjneLTwwzTYeHs/FYL
	xYEn92qlR2XWeYkPq+20HyyNeSL1nKP6QYTFLYW0m2toQCNkJxoaUSDf0w1/JRLXbbERDMX6v5ZKH
	tCr+FXuety1+gXixSBn1FjbyiCuxMZwk6pS568k0ZIWISND4eJeQmXM/0gcPI6yHa4N37tAPbJg4n
	nLutIfjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSh6B-00BBJZ-6C; Thu, 16 Feb 2023 16:27:07 +0000
Received: from fudo.makrotopia.org ([2a07:2ec0:3002::71])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSh68-00BBHJ-9W; Thu, 16 Feb 2023 16:27:05 +0000
Received: from local
	by fudo.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pSh5w-0004pf-1E;
	Thu, 16 Feb 2023 17:26:52 +0100
Date: Thu, 16 Feb 2023 16:26:49 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Sean Wang <sean.wang@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Miles Chen <miles.chen@mediatek.com>,
	Edward-JW Yang <edward-jw.yang@mediatek.com>,
	Johnson Wang <johnson.wang@mediatek.com>,
	Fabien Parent <fparent@baylibre.com>,
	Sam Shih <sam.shih@mediatek.com>,
	Jianhui Zhao <zhaojh329@gmail.com>
Subject: Re: [PATCH v2 2/2] pinctrl: add mt7981 pinctrl driver
Message-ID: <Y+5ZSUURaK/hq1iq@makrotopia.org>
References: <cover.1674693008.git.daniel@makrotopia.org>
 <ef5112946d16cacc67e65e439ba7b52a9950c1bb.1674693008.git.daniel@makrotopia.org>
 <88ef812b-b8e8-f640-f9f7-a1579ea69d31@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <88ef812b-b8e8-f640-f9f7-a1579ea69d31@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_082704_355691_2D95A484 
X-CRM114-Status: GOOD (  18.02  )
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

On Thu, Feb 16, 2023 at 04:50:57PM +0300, Arınç ÜNAL wrote:
> Hi Daniel,
> 
> On 26.01.2023 03:34, Daniel Golle wrote:
> > Add pinctrl driver for the MediaTek MT7981 SoC, based on the driver
> > which can also be found the SDK.
> > 
> > Signed-off-by: Daniel Golle <daniel@makrotopia.org>
> > ---
> >   drivers/pinctrl/mediatek/Kconfig          |    5 +
> >   drivers/pinctrl/mediatek/Makefile         |    1 +
> >   drivers/pinctrl/mediatek/pinctrl-mt7981.c | 1048 +++++++++++++++++++++
> >   3 files changed, 1054 insertions(+)
> >   create mode 100644 drivers/pinctrl/mediatek/pinctrl-mt7981.c
> > 
> > diff --git a/drivers/pinctrl/mediatek/Kconfig b/drivers/pinctrl/mediatek/Kconfig
> > index fed02c6fea062..f20c28334bcbf 100644
> > --- a/drivers/pinctrl/mediatek/Kconfig
> > +++ b/drivers/pinctrl/mediatek/Kconfig
> > @@ -127,6 +127,11 @@ config PINCTRL_MT7622
> >   	default ARM64 && ARCH_MEDIATEK
> >   	select PINCTRL_MTK_MOORE
> > +config PINCTRL_MT7981
> > +	bool "Mediatek MT7981 pin control"
> > +	depends on OF
> > +	select PINCTRL_MTK_MOORE
> > +
> 
> Is there a reason why you removed these lines from v1?

Oh, that seemed to have happened by accident. Imho it'd be better
to have these two lines there as well.

