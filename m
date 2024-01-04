Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3722C47074
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Jan 2024 18:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cK395isGrAma+OOXpsB9bl6jtmaMPzcERJWwriy8w4=; b=DGU3IsnBBTqJMkMJjtm3uWooEM
	Ndx2u+DmCvpsZ8+senIJtMituPFyHu8nfNy1gkfFYug5I4Kxlx3hJ5jtUgbP5RzOQ5toEvMWyDJZ5
	yelHoIWITohs6NtnmnhwwkAv5TfLYwr0TGXuKzXRqTO4Sm3DLHh4m3Cg3VpMUWPf4ebKAeptR4TW2
	BpGCcdKyNXiYiUD//GezmsZD/KVNz8Ezy5lBTyZGYsz1/TqdDkX4ahC+mf1xOl0ZHLPPqS+O4F4Bu
	bElvqS554kdhN+S4b9FEStLuAVntgL2cyBBa7FJiKJbNUUPUM1GOr877k9yDGLcyHMQwAShd56kkV
	cHh8l4ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLSFD-00Ew7F-2W;
	Thu, 04 Jan 2024 18:15:03 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLSFA-00Ew2y-0h;
	Thu, 04 Jan 2024 18:15:01 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1rLSEx-0003UN-12;
	Thu, 04 Jan 2024 18:14:48 +0000
Date: Thu, 4 Jan 2024 19:12:10 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH 1/2] dt-bindings: reset: mediatek: add MT7988 LVTS reset
 ID
Message-ID: <ZZb0-pFWxuQlEm7q@pidgin.makrotopia.org>
References: <20240104173930.13907-1-linux@fw-web.de>
 <20240104173930.13907-2-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240104173930.13907-2-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_101500_252096_49DC28D1 
X-CRM114-Status: GOOD (  16.67  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Stephen Boyd <sboyd@kernel.org>, Sam Shih <sam.shih@mediatek.com>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Frank,

On Thu, Jan 04, 2024 at 06:39:29PM +0100, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> ---
>  include/dt-bindings/reset/mediatek,mt7988-resets.h | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/include/dt-bindings/reset/mediatek,mt7988-resets.h b/include/dt-bindings/reset/mediatek,mt7988-resets.h
> index 493301971367..3f1e4ec07ad5 100644
> --- a/include/dt-bindings/reset/mediatek,mt7988-resets.h
> +++ b/include/dt-bindings/reset/mediatek,mt7988-resets.h
> @@ -10,4 +10,8 @@
>  /* ETHWARP resets */
>  #define MT7988_ETHWARP_RST_SWITCH		0
>  
> +/* INFRA resets */
> +#define MT7988_INFRA_RST0_THERM_CTRL_SWRST	9

I suppose this argument applies here as well:

"IDs should start from 0 or 1 and increment by 1. If these are not IDs,
then you do not need them in the bindings."

https://lore.kernel.org/all/59629ec1-cc0c-4c5a-87cc-ea30d64ec191@linaro.org/

As a consequence, as what you are describing there are hardware bits
rather than IDs used by the driver, you can just use a numeric constant
in device tree instead of adding dt-bindings header.
Or change the driver so RST0_THERM_CTRL_SWRST could be defined as 0.


