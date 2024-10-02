Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73802CF3196
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 06:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NbfbcKJ+nxdW6aoE2L6ftp0UNR+goacaijEj26fgX9U=; b=2PilJbiXuExc7AhHYmqHn8+7v7
	jhjKOsZrDrkV42CEAG80bJ3SaWY3L1GLpN2Au7PrrH1gSeSLfWx/jfRLm8Z46qt5nvJ/LnuiH/ZVC
	dUvsXYkhHT7lXtxZvXGX5oV3lU8nJ/wy2zVbNfSrps42q9Nqr8AYbdbfQzRSvghaN/1zpexNCQ2i+
	5VbF8fM4nNZuwUyQsg69bxUemBo3T7tXsjKf+B1t+t7AX5ZOMW6IacI0z+V+q+vkjYspO+qEbktLK
	Ca8gYMxBA9e2KZib6kyTyimqz16iiHxnZ6VE7u2sE73/2fs9zA+DM4fX1KuFHkviwUjmz3N88+RDY
	EAGket1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svsPD-00000004tGw-0kCL;
	Wed, 02 Oct 2024 06:00:11 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svsNy-00000004t6P-12R8;
	Wed, 02 Oct 2024 05:58:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 39D0EA41441;
	Wed,  2 Oct 2024 05:58:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 688A0C4CEC5;
	Wed,  2 Oct 2024 05:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727848733;
	bh=UOTl03DOOV7SlDAksJvetAb0xk40DOwnob6rAZ9l/5M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qOhJ05Yp2U95NcHq5xvxPz524T5XJsV5gyevoSqlBBh0itjEHf16irh8ZyafHjjGh
	 2A3DpmbsPH64CkqRUKyGSgLf0xciig5zUAaHn1KVHBSelzV6KS3fPrcbl3VayNnJjT
	 lYtWDR++NzQ2/+KGhZ8mxa02trqG+sfiuDKoaFotDg5ypzTpfBk4eBzzUToOv+z7af
	 rhGmViMIEa4WqPUcLNdEE1nzyjDV8F9Eveu3Ud5jlxg6h2StQGESDAHPNqdNOuFage
	 ROkL56BAuEJHTCNbPoiUD5PolPneZdyH7fQmHCj6MSwAxmA7gvLOQa7lkh5wsO+JmE
	 Yn8+ln5kheKhw==
Date: Wed, 2 Oct 2024 07:58:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sen Chu <sen.chu@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, 
	Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean <olteanv@gmail.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Sebastian Reichel <sre@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-input@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org, netdev@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sound@vger.kernel.org, 
	Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
	Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v8 2/3] ASoC: dt-bindings: mt6358: Convert to DT Schema
Message-ID: <kofbpvthmbzynfq2l4x3sxznuzrfcp6qiy4dddfuomdyjpbons@xoze6bxytw56>
References: <20241001104145.24054-1-macpaul.lin@mediatek.com>
 <20241001104145.24054-2-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001104145.24054-2-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_225854_373993_E8FEF0BC 
X-CRM114-Status: GOOD (  12.35  )
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

On Tue, Oct 01, 2024 at 06:41:44PM +0800, Macpaul Lin wrote:
> Convert the MediaTek MT6358 Audio CODEC bindings to DT schema.
> 
> This change implements the following updates:
> 1. Compatible property: Added the const 'mediatek,mt6358-sound'
>    to ensure alignment with the schema in the actual (DTS) file
>    "mt8186-corsola.dtsi" with 'mediatek,mt6366-sound'.
> 2. Example: Removed the example section, as it should be relocated to
>    the MT6397 PMIC file 'mfd/mediatek,mt6397.yaml'.
> 3. Use filename 'mediatek,mt6358-sound.yaml' to align the compatible
>    name.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


