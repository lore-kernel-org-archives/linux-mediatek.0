Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC4FC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 09:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=92IWFNETEjRnmftLO8FEQSJFw8yXWxVHfzWgFONxgbE=; b=Gwn9OCr0S6kuVsVYtI5qzpmfWF
	+QLAGr64Zal60cqcZgmyRegolL9OsfVTG8iviB0ZgoEWvj2kbIBzIduntNGDnbIPDaiI7gXv0KstQ
	ulPRsT+jmTfN0uyoAmqaD03oStRkmdNa8Ftq4CvVdHc+Nt8IlzHkvBAuWVr+y5pSQFF88l3SOyFQu
	hjmX9lq1B8ClDcQvnWZyEjW9BVSCYgTJFDvn7JWpaNwVH9XX4IocY3nvBfdRU+paoZudp+fESnNmG
	0VVHJTuOtdQPRMY/c/KX+V8wOlZQ/BCh2tXrgNBsErt+ubb5gsyHOHG/k1ZaITPk+xZ60CK1D2I2+
	nTAjWLKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvas-00D6ju-Rb; Thu, 14 Jul 2022 09:57:14 +0000
Received: from elvis.franken.de ([193.175.24.41])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBvaq-00D6dZ-6g; Thu, 14 Jul 2022 09:57:14 +0000
Received: from uucp (helo=alpha)
	by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
	id 1oBvaj-0006rx-03; Thu, 14 Jul 2022 11:57:05 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
	id 517A0C0493; Thu, 14 Jul 2022 11:56:03 +0200 (CEST)
Date: Thu, 14 Jul 2022 11:56:03 +0200
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
Subject: Re: [PATCH 2/2] MIPS: dts: align gpio-key node names with dtschema
Message-ID: <20220714095603.GD10086@alpha.franken.de>
References: <20220624170740.66271-1-krzysztof.kozlowski@linaro.org>
 <20220624170740.66271-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220624170740.66271-2-krzysztof.kozlowski@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_025712_412688_608D0CB3 
X-CRM114-Status: GOOD (  12.17  )
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

On Fri, Jun 24, 2022 at 07:07:40PM +0200, Krzysztof Kozlowski wrote:
> The node names should be generic and DT schema expects certain pattern
> (e.g. with key/button/switch).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  arch/mips/boot/dts/ingenic/ci20.dts                        | 2 +-
>  arch/mips/boot/dts/ralink/gardena_smart_gateway_mt7688.dts | 2 +-
>  arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc1.dts         | 2 +-
>  arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts         | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)

applied to mips-next.

Thomas.

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]

