Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB23C05027
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 11:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zw/GRPFAEWDGx6FPJvaGaDQ/FH8HuWIJVMHE5vC7GT4=; b=1f+RrO0SmWbLtx7fNZuO1e/xZP
	W7NYEejllCpXyRvzTp/WCdxXliSPNhLqwBQqUFyh4Uamu95SxiUJ0O/q6ARn/mBR1CM0Vl9aprIJ8
	zfUqXUn5cE7PJT5Svowj7ZxArOHnclGTHOwEbV8M2Qyp01VhuWb7ja0fH76TXV8ETWljdljE6kCmm
	GheQu0sYRIn4+VAoTdFG5poMVw2RFJrdg0fmTOgLJJtKUPuSZiik1BxTTm1qVRrPZ8p+v06RLD7+C
	iqt5YjyUfSHogbwhsiO8cD8MRlLE1jvmtkv+PR0+ol2M5dBOJSDZlrBxzjLUl6J8DeNoS/edNbLBx
	p7PXGvyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyYD-00DpH2-Mv; Fri, 17 Feb 2023 11:05:13 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyY9-00DpBq-J8; Fri, 17 Feb 2023 11:05:11 +0000
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1pSyXr-0008WE-00; Fri, 17 Feb 2023 12:04:51 +0100
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 0C3AAC2860; Fri, 17 Feb 2023 12:02:48 +0100 (CET)
Date: Fri, 17 Feb 2023 12:02:47 +0100
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: arinc9.unal@gmail.com
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Cercueil <paul@crapouillou.net>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	devicetree@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com
Subject: Re: [PATCH 1/2] mips: dts: align LED node names with dtschema
Message-ID: <20230217110247.GA7138@alpha.franken.de>
References: <20230211104915.116253-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230211104915.116253-1-arinc.unal@arinc9.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_030509_888741_A687CF63 
X-CRM114-Status: GOOD (  12.24  )
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

On Sat, Feb 11, 2023 at 01:49:14PM +0300, arinc9.unal@gmail.com wrote:
> From: Arınç ÜNAL <arinc.unal@arinc9.com>
> 
> The node names should be generic and DT schema expects certain pattern:
> 
>   mt7621-gnubee-gb-pc1.dtb: gpio-leds: 'power', 'system' do not match any of the regexes: '(^led-[0-9a-f]$|led)', 'pinctrl-[0-9]+'
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../dts/cavium-octeon/dlink_dsr-1000n.dts     | 10 ++++-----
>  .../boot/dts/cavium-octeon/dlink_dsr-500n.dts |  6 ++---
>  arch/mips/boot/dts/ingenic/ci20.dts           |  8 +++----
>  arch/mips/boot/dts/pic32/pic32mzda_sk.dts     |  6 ++---
>  .../boot/dts/qca/ar9132_tl_wr1043nd_v1.dts    |  8 +++----
>  .../mips/boot/dts/qca/ar9331_dragino_ms14.dts |  8 +++----
>  arch/mips/boot/dts/qca/ar9331_omega.dts       |  2 +-
>  arch/mips/boot/dts/qca/ar9331_tl_mr3020.dts   |  8 +++----
>  .../ralink/gardena_smart_gateway_mt7688.dts   | 22 +++++++++----------
>  .../boot/dts/ralink/mt7621-gnubee-gb-pc1.dts  |  4 ++--
>  .../boot/dts/ralink/mt7621-gnubee-gb-pc2.dts  | 12 +++++-----
>  11 files changed, 47 insertions(+), 47 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

