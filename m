Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 352D4105F7A8
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2026 13:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bbmpUbqD0N8VkUB+0HATgrDu7cmWh2fulphWKjIGSEE=; b=JMf4h7AAgOkyHCh0Ygut1k0v2l
	mEj2of3NcHLHfZmYq6xUHmiWpeoBKXjjJoKao1B3TiZmwDuZwTZ98SmKS8w9DZtPPP4BW6Vm+h9Vu
	M1CV0xZsNz8cwFrtmj/IZxrVSRFtc7G7N7Dsc9ka1feq9kGb6Venawi6aQwWFeqgaKuXJtNZVtgms
	9+25LdlDTdPNrwgM8geMeqfTxxi6EJsXfSu9GGVf1vcLnM0LukDAudFbeFnUZd+dTvpNnycz2xR83
	Nm+9fKGe+jOaOsDObXYXPY8SeNHQRhFB6qYanG9UxReK2MfjhpNq+J6i/5gZcFEgQyHujpIdRkTY2
	g8XHjMJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12jj-00000000ILg-0FVq;
	Fri, 13 Mar 2026 13:39:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w12jg-00000000IKY-26Oe;
	Fri, 13 Mar 2026 13:39:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D95564340A;
	Fri, 13 Mar 2026 13:39:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 346EAC19421;
	Fri, 13 Mar 2026 13:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773409167;
	bh=KWZSAbiyjrzLNM2qSo3Ip3kXkUGs7ZYJJB5Q/aqWnT0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mxNon3Ju/MbjR7gDaOoInJKcBn18JpU5KIrveljutUqMhVAnRGm6HSdGUiMWgptyT
	 ZbTiz8JcUO3YeEgTDVS/oIUOCTzW/r2vQ2YHBMziRlyG/ad1kBXO7BwoC27o5C/PaU
	 bRPajOTudgJvEoXwvxozIztPGvZT1cCkpqOegnBA4Ux1xgGfbstlyAbmygbBwvpKfp
	 PL7OfrRL5xxn0Bu5TwiY/NF8DclcRSs2t/Py4642WrLNnd4rlESzTJvWrDWJAx5hv2
	 BD0mv9+IFKxFFxLwUoHy1tJw1a0ws4LR5Yb4a0NrNqNg+Ek0DDsMII9E9HjmHhEjmf
	 yW+0Pwxf17pkg==
Date: Fri, 13 Mar 2026 14:39:25 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Akari Tsuyukusa <akkun11.open@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, sean.wang@kernel.org, 
	linusw@kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
	hui.liu@mediatek.com, nfraprado@collabora.com, linus.walleij@linaro.org, 
	mars.cheng@mediatek.com, andy.teng@mediatek.com, hanks.chen@mediatek.com, 
	sam.shih@mediatek.com, rafal@milecki.pl, ben.ho@mediatek.com, erin.lo@mediatek.com, 
	zhiyong.tao@mediatek.com, Jason-ch.Chen@mediatek.com, amergnat@baylibre.com, 
	seiya.wang@mediatek.com, tinghan.shen@mediatek.com
Subject: Re: [PATCH 6/6] dt-bindings: pinctrl: mediatek: mt8188: Fix include
 guard comment
Message-ID: <20260313-cunning-fresh-rattlesnake-ab8087@quoll>
References: <20260312041533.187553-1-akkun11.open@gmail.com>
 <20260312041533.187553-7-akkun11.open@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260312041533.187553-7-akkun11.open@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_063928_556209_1DD98B52 
X-CRM114-Status: GOOD (  12.76  )
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

On Thu, Mar 12, 2026 at 01:15:33PM +0900, Akari Tsuyukusa wrote:
> Correct the mismatched macro name in the #endif comment.
> 
> Fixes: 9f1bdd7e8221 ("dt-bindings: pinctrl: mediatek: add support for mt8188")

No bug here, otherwise explain user-visible issues.

> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
> ---
>  include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h b/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> index 2688da2f621f..66a451953838 100644
> --- a/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> +++ b/include/dt-bindings/pinctrl/mediatek,mt8188-pinfunc.h
> @@ -1277,4 +1277,4 @@
>  #define PINMUX_GPIO176__FUNC_B_GPIO176 (MTK_PIN_NO(176) | 0)
>  #define PINMUX_GPIO176__FUNC_B0_SPMI_M_SDA (MTK_PIN_NO(176) | 1)
>  
> -#endif /* __MEDIATEK_MT8188-PINFUNC_H */
> +#endif /* __MEDIATEK_MT8188_PINFUNC_H */

No, just a churn. This has no benefit, because it is obvious which if/endif
this corresponds to.

Best regards,
Krzysztof


