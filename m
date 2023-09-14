Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EDE3EDE99C
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 10:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OdU6UcvYp3k3Ys6bcU7sDyazojvOlAu5btI6GYAg3pg=; b=BGvxwFC4gdB/psyiJ7Ozv+b+Xm
	90BO3/MS4KVO/WbHvMWcwWw0DEdKCUtcGhYeIYicSlNtKtGE6e3NeoJZH9/Nd7ju7XBWKBdJmSIMK
	6HJvDYUM9GG9lYNcBn7slx1XS9bsLNY8Ldzg9jnKzRx2wJwDd1btZTZD+QE+QTx22Msh9EDCjvhqs
	q+UioydQVaCZtI6B6XWBgT3N/D1aPBzs4qNRCiTbEz3axRHkRjOyDLS8COCVhpO5uK/0CnMJgrL3c
	H0ddzA60oP+8JQ0UDIiOIThL78E47WtULjt87PDlqrhLnNPZ9bvdQQkvSeFliN1NDr6S9Ld7Pphx5
	D0I3teMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgjE0-007vFD-05;
	Thu, 14 Sep 2023 10:05:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgjDw-007vEK-1m;
	Thu, 14 Sep 2023 10:05:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AAF1466072FF;
	Thu, 14 Sep 2023 11:05:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694685923;
	bh=b9dNXd4DNo/EkCMgek1U0ux67al2IZqZJ/o5s4IfKu4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BYSojtiQaZbENP/vhxCjm5/kWFmmzr8lP1XygN7e1gdIbP6cHG60aOmQAoL5LaaKn
	 GgBqfnPhYBL1mKaSPMH7E9jLPKSJ4u2AHHaTWzb213sPLlHqXcnbny4J41XjpRNS3Q
	 3rlDa8CGgSQH0+SNj9LkC13R7M1Jnz0PAJEL6BdfCxdlDlYo+/rwIAH0fCDOd1jbek
	 vm9JW0WHNkqjos50O1JSj/yvG9/iQ0ggka+CshJSdh1r7OKQO0qz79M6KsVV6lYTPG
	 gwOQTyMdrrsIocBiFq2jBj6rmkHvzyL4v3Wv9K5uLx/qGX9xPFxlyTPONhudu1ajt/
	 c23H3voGAJj6g==
Message-ID: <01cdd49e-2f11-d5bd-073c-916f7f36f2db@collabora.com>
Date: Thu, 14 Sep 2023 12:05:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH v3 1/2] dt-bindings: arm64: mediatek: add mt8390-evk board
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?=
 <bero@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>
References: <20230914061833.32288-1-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230914061833.32288-1-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_030524_715771_7D38F1A0 
X-CRM114-Status: GOOD (  10.68  )
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

Il 14/09/23 08:18, Macpaul Lin ha scritto:
> 1. Add compatible for MT8390.
> 2. Add bindings for the MediaTek mt8390-evk board, also known
> as the "Genio 700-EVK".
> 
> The MT8390 and MT8188 belong to the same SoC family,
> with only minor differences in their physical characteristics.
> They utilize unique efuse values for differentiation.
> 
> The booting process and configurations are managed by boot
> loaders, firmware, and TF-A. Consequently, the part numbers
> and procurement channels vary.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



