Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D824C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 09:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yefzC7bvIETkSiVK+iUmU4l4EGZaRBtm5bEKZ+jktbk=; b=W/Ywumr+6ZBy+gLnyzzLc6fi8c
	ManITqFiUdt7lm6GkrhoD1Jg/setJcOnWVihxba9srN9xSuWmgVGWqwxLcTqRHjK5QWah6M6YS11V
	pEdr3TS5Mv0L5iPybEkruL5vAkjwa88MijrBrHZfC1ByzQVRrkVIao422FjWCc1cBVzDyVxaTo5xn
	gLw5fN555Q0/5ydjUhWlzOpIgRSzpOLWW3qt9TLDgiSuAuWz8CLNZGpZjDr0+p4WCg3se73DpD2QF
	o3YHfH8ZAom6fc0+ATgTIUASBFzlm4gkoplETC5ilTkgmcl0GyY9oQ/nNq+n37BkB+5M/22Re9r4e
	0elQmbyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvb6-00D6t7-2L; Thu, 14 Jul 2022 09:57:28 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvaq-00D6dY-6N; Thu, 14 Jul 2022 09:57:14 +0000
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1oBvaj-0006rx-02; Thu, 14 Jul 2022 11:57:05 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 03A31C0493; Thu, 14 Jul 2022 11:55:42 +0200 (CEST)
Date: Thu, 14 Jul 2022 11:55:42 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rahul Bedarkar <rahulbedarkar89@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/2] MIPS: dts: correct gpio-keys names and properties
Message-ID: <20220714095542.GC10086@alpha.franken.de>
References: <20220624170740.66271-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624170740.66271-1-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_025712_402831_43B230A5 
X-CRM114-Status: GOOD (  12.13  )
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

On Fri, Jun 24, 2022 at 07:07:39PM +0200, Krzysztof Kozlowski wrote:
> gpio-keys children do not use unit addresses.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> See: https://lore.kernel.org/all/20220616005224.18391-1-krzysztof.kozlowski@linaro.org/
> ---
>  arch/mips/boot/dts/img/pistachio_marduk.dts   |  4 +--
>  arch/mips/boot/dts/ingenic/gcw0.dts           | 31 +++++++++----------
>  arch/mips/boot/dts/ingenic/rs90.dts           | 18 +++++------
>  arch/mips/boot/dts/pic32/pic32mzda_sk.dts     |  9 ++----
>  .../boot/dts/qca/ar9132_tl_wr1043nd_v1.dts    |  6 ++--
>  arch/mips/boot/dts/qca/ar9331_dpt_module.dts  |  4 +--
>  .../mips/boot/dts/qca/ar9331_dragino_ms14.dts |  6 ++--
>  arch/mips/boot/dts/qca/ar9331_omega.dts       |  4 +--
>  .../qca/ar9331_openembed_som9331_board.dts    |  4 +--
>  arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts   |  8 ++---
>  10 files changed, 37 insertions(+), 57 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

