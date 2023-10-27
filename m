Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE80CC25B47
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Oct 2023 07:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y+JySH3ZB2Aney3wtdhCHlPipGfVc31X1rm/qFcDcqU=; b=bIDoOie4opkuEWgQnAWgSYLZkv
	jRqPzHlfakJrT/9yWeGhYA4U+LQEXJ4Ck8vJj2BFJi6bkadrKO+PkvC0McnzfirchzHklumHH+haw
	bDtURDxwIcx8bJZrUG1rTp3BI+BiiaPtJ1DiF2Jd1ndzOngNH5OBcHGwEKDVLtYzPj0GBp2QILir7
	9UHcFnXTbTVn1wTAtMAIbaUg7n3qt3fhjYfeGgCbmwNrmdIajSkYO0n8FdbX6sIw/at0IEsmnR1XR
	H1EU5/Cx4TNHVyFqlBYPCiejAZzcCN+xYdvm8DOkLio319LQPdY8ZAjk52j3vmPouOa0KGxsokWRt
	9ghI/G1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHOA-00FoYQ-2v;
	Fri, 27 Oct 2023 07:36:14 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwHO8-00FoXQ-1Z;
	Fri, 27 Oct 2023 07:36:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B4A2266071F1;
	Fri, 27 Oct 2023 08:36:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698392171;
	bh=8y44yu4wGhcDZt7TkrqxTUv6GQp7e4Mxq/vdmbg2nWw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PZpOPxQLzZ7mbfoYGpKlKWzlYcusoL/mrsQ8IEUgs99QDzhkqnM41b5buUWfkm8Fl
	 0PdwpS6rdbzJCnvMW4r46vRY7ClH4/2fQr3RqgxsgojrPb6Oas//Dcibcb/yINMhR/
	 YkyNupYWkEH8+3dJ3UM5TvJCwU3faZeT5/KpNHqp5Cr8Ejnl+7MTtU4uyMRJqIcw8a
	 qjCfC8hMaA6tkR900vCC0g5Gyfs2cvUrryhkmRaYUgRZnv+qHUBdhsUVJczeuovSxF
	 RsENk0vXpJW73L2mlTieA+HAeENn7lYsSGlr6RwH8bYBCqZuYbwq0WHOw9DccrmosZ
	 MyHBzldPFjbzg==
Message-ID: <aac3419e-0b21-47e3-b1dd-f7ca5c4bf871@collabora.com>
Date: Fri, 27 Oct 2023 09:36:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] dt-bindings: arm64: mediatek: Add
 mt8183-kukui-katsu
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231026191343.3345279-1-hsinyi@chromium.org>
 <20231026191343.3345279-3-hsinyi@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231026191343.3345279-3-hsinyi@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_003612_651851_8B87695C 
X-CRM114-Status: UNSURE (   5.72  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 26/10/23 21:09, Hsin-Yi Wang ha scritto:
> Add katsu sku32 and sku38 which uses different audio codec.
> 
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


