Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 456D1FA3741
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Oct 2022 16:40:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5iO8KHmbbjpD0edAAD18XYUlbSGy4UU+ld7nxMCDFQ=; b=0wknBnD73Rc7TjIDP/hxguwVwQ
	Z7WUh+yixL3k9O22C6ei1HMvQR/j3vDA/kNyhquK27BiVDwVZBHbWb02IxB9jbsEJlcPKPSbTFJdt
	xCKraniV+sZ0Uh632DyJ1Ngc+k3sH7UaerdDGRBOrMlvwuigYkt4EQMGijEwktSYzA1UUODqQr9vL
	j0qJkDiXLWqOnHiw68t0KOtHNR4tEAEnVg5Wcnh0rMtqWyPmfRdxVCSQrSrrVADKWdL4lggGFeeLV
	qIhAgDsrlMjcDG5e6NWUlE4OvpvURpw91V5/58QinWd0G/SMXO6Xa6WcVbtgk6pJjWnMh2zXFNIw0
	LZQzX4Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXpb-00D35S-GK; Mon, 31 Oct 2022 16:40:11 +0000
Received: from mail-pg1-f176.google.com ([209.85.215.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1opXpY-00D30k-GC
	for linux-mediatek@lists.infradead.org; Mon, 31 Oct 2022 16:40:10 +0000
Received: by mail-pg1-f176.google.com with SMTP id h193so2466825pgc.10
        for <linux-mediatek@lists.infradead.org>; Mon, 31 Oct 2022 09:40:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G5iO8KHmbbjpD0edAAD18XYUlbSGy4UU+ld7nxMCDFQ=;
        b=empvHonVMDUqiF5OAGIqly0cj4Tm70RkF2+qvglBe0fOnv5A/iI/+dsRey05hszq4I
         J7+slPRNyUr48NchVvhQTLhcy6Z1vJLff8Zy/izEsvFrb5EswX8BupgKqbvvJL4BLFrJ
         7ib8pcIHUmPISFekZtgIWj2HytKpvhS1x19rFEgexNK2RunQeZ1bdcvjERYp+08vWQKY
         c2ZwiQY3m4bSVExSULZ3vnTBO3dVZjPtbsWi0UW5CCsMNY/VMX1BQ5y2CD5QuSqGrCjk
         avDHdYnHFR0rA8S633ylWTRhe1ot5ksYKgo7vKT+c8ucw3HtwGGtVjGt9UcQ9U+ovcmc
         IywQ==
X-Gm-Message-State: ACrzQf3DBDw4q9AFDt2liJax6sTNqsQOJLpqFApVt6LFXM8pxFaiJ1+v
	xbKSRIN1R2cU4lGQE7w3lh5ZvkAII0Nll6GA
X-Google-Smtp-Source: AMsMyM4wbIhY06SY2nUR74pUKGuIl5gTFPk+xpQFABfA9XZzwdh1qCxm1jXpjY9c4HML23XPnl7EdQ==
X-Received: by 2002:a63:c146:0:b0:46f:c9e8:777d with SMTP id p6-20020a63c146000000b0046fc9e8777dmr4645744pgi.459.1667234405901;
        Mon, 31 Oct 2022 09:40:05 -0700 (PDT)
Received: from localhost ([75.172.140.17])
        by smtp.gmail.com with ESMTPSA id i63-20020a625442000000b0056be2a3c87csm4835445pfb.154.2022.10.31.09.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Oct 2022 09:40:05 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: bchihi@baylibre.com, sean.wang@kernel.org, linus.walleij@linaro.org,
 matthias.bgg@gmail.com
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [v2, 0/2] Fix broken SET/CLR mode of a certain number of pins
 for MediaTek MT8385 SoC
In-Reply-To: <20221021084708.1109986-1-bchihi@baylibre.com>
References: <20221021084708.1109986-1-bchihi@baylibre.com>
Date: Mon, 31 Oct 2022 09:40:04 -0700
Message-ID: <7h5yg02bh7.fsf@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221031_094008_553274_33C650F0 
X-CRM114-Status: GOOD (  11.71  )
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

Hi Balsam,


bchihi@baylibre.com writes:

> From: Balsam CHIHI <bchihi@baylibre.com>
>
> On MT8365, the SET/CLR of the mode is broken and some pins won't set or clear the modes correctly.
> To fix this issue, we add a specific callback mt8365_set_clr_mode() for this specific SoC.
> This callback uses the main R/W register to read/update/write the modes instead of using the SET/CLR register.
>
> This is the original patch series proposed by Fabien Parent <fparent@baylibre.com>.
> "https://lore.kernel.org/linux-arm-kernel/20220530123425.689459-1-fparent@baylibre.com/"
>
> Changelog:
> Changes in v2 :
>         - Rebase on top of 6.1.0-rc1-next-20221020
>         - Delete MTK_PINCTRL_MODE_SET_CLR_BROKEN quirk
>         - Add mt8365_set_clr_mode() callback

nit: subject of cover letter should also include "pinctrl: mediatek:"
prefix.  Also note that you're missing the word "PATCH" in all of the
subjects.

Tip: If you use `git format-patch`, you can just pass `-v2` on the
cmdline and it will create the prefixes for you automatically.

Kevin

