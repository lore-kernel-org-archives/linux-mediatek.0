Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDEDC369CA
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Apr 2025 06:58:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ACXz2+bNNW1XhrvLvXI8dB81fAjKSBVlGEniK8K933s=; b=S44vjJhzkxNaNxZW0nC43u1a4x
	Cy5tL5A92cWqBT101VQNaQaiBvGwja3q0h/K95U8Tmm+dJB3BR8FWtL1BuwkGOcMl7+UEeiJsNXZo
	iz5SB14JERFkyiVYgNZolnyC7G5RMyp2yC0wL3y2RzKd2qLm4ExEB35feam4jE6q+navD0Ret8FCt
	bLMRJGTOmbXGynU4yCbCM49R7UZpj43CC4rpJnSFnV3wjYclMRa9NfoaCRRfx7ln86ftRqz1s6yys
	Xs3jCQlCxkJWJ6dyj7oLLk0Fmuogi/preZJIDtR5YY2R10KikIulsxx665q8BXTm8MrkqoD55yVj0
	8EOxjl7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5JCK-0000000BzPs-1odQ;
	Thu, 17 Apr 2025 06:58:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5J84-0000000Bxuv-26Ky;
	Thu, 17 Apr 2025 06:53:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C85DD43472;
	Thu, 17 Apr 2025 06:53:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49EC6C4CEE4;
	Thu, 17 Apr 2025 06:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744872823;
	bh=C9PJP4UkeEpAAoNxz6hVCAneDrneZyGWwBSuhOWnKqI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S734jLaFHWX3qXivUZYGnlAgUCk2Gy0cVyeJrOiKNGdv9qgGEdqJhkDh1l5g2Pnh3
	 yLs2srVcPPP/1BMToiWz+WUtxyldKYdKM9NmgLfuMxw0y34g/bTbWj9vgIWJXkdUKo
	 zvmYPn7BSFU/42xvXranr/+PPnvnND5uKIpMsbK/sqJuuWWIRZWla5Sqa8vHa3aXnX
	 c6LnRWDzkUC0UHMEayez2PjbKMccKeuQRxb33jtWa0+86Mx1P3bfS4JStA6Sy7Rm3R
	 AoZ04Ol8pMkUPgZnRcyJSkngOIXaZIjK0cjseOuB5arh+BfXzg6GbNOT/gmvZBf6S1
	 MI74hhjTbfoxg==
Date: Thu, 17 Apr 2025 08:53:41 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [PATCH v3 3/8] dt-bindings: phy: mtk-xs-phy: Add mt7988
 compatible
Message-ID: <20250417-competent-gray-spider-4d9b2d@kuoka>
References: <20250416095402.90543-1-linux@fw-web.de>
 <20250416095402.90543-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250416095402.90543-4-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_235344_557173_ED0B0710 
X-CRM114-Status: UNSURE (   8.22  )
X-CRM114-Notice: Please train this message.
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>, Daniel Golle <daniel@makrotopia.org>, linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>, Chunfeng Yun <chunfeng.yun@mediatek.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Apr 16, 2025 at 11:53:55AM GMT, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Add compatible for xs-phy on mt7988.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,xsphy.yaml | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


