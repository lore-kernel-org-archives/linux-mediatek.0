Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83461C77B60
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 12:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dKfODcBN3ZlyLforodu04x3k0xQODuVOuutFqjCc82k=; b=NrqSWVI6qynbIHGoAszhUlxpdH
	eQn5Yvgcm6ONgI2tsPPj4CLK15JcNm1otxAnTJkgrU7HXi+wbkG6As03aPScO7s2pmU+yi/HwC6rQ
	yI1b381xAePyEm1pPuyZMz5yZd6kDzVGp/1T0cEwXJEDrMMiZ4G6X1J8R8OL6fbBW3GBOR3kk62YH
	whY4SfF6vl4hSfFIG8KKUKbyojE1mz3GInO+G6KcN2UKWPZ771xMk4aKhXbV9fqhGUPOIUJuTQNXK
	W0L3UIICErvqWa0T70yE0tOUjceouHefCnv4siuSdYW2o0+2QTdhhnwgsZK43XXwnt3UJS0Hk7mZ0
	IzsaAIqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJLd-00FHLU-2P;
	Mon, 03 Apr 2023 12:31:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjJLY-00FHIM-0G;
	Mon, 03 Apr 2023 12:31:41 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 038ED66016BD;
	Mon,  3 Apr 2023 13:31:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680525097;
	bh=l+NahqCV5ZhkT4tyT9GA3FDFBy/pGstED610HeL/KXo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k91McU1K0wK3+baND3f+VfuBqfhpMzFOQZoiGKSqRZjmI6Gl+7yTxoJIqt4yTiF5X
	 HpnfunaFLgsN+3jAVGqUUMhLS+9T5OMNEkzwNz3yNbGTgn9Io1slDD+T3fIGN3RP80
	 wOTl/Tt711P+VpT4xhyvUPtkR5GJktuHYzIDDj2QmS1WWPfh/5P32pVg0BbUahZJj8
	 6IlafPaJum3vE1iKh3Z6XQiv77EWoyT2oSPThNNPiZxdXtnOzubYUBMYqwx2b+UjAE
	 TUXd+FH50NAyGat7laeysyriCTGuNAdqK72z+UkVOGhb8KFOgQeAYEPVFupOU1+WfN
	 bZul8W2NG1d4g==
Message-ID: <1cfde490-40a4-c83b-3bd5-c9baeba5187d@collabora.com>
Date: Mon, 3 Apr 2023 14:31:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/7] usb: mtu3: fix KE at qmu transfer done irq handler
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>,
 Tianping Fang <tianping.fang@mediatek.com>
References: <20230403025230.25035-1-chunfeng.yun@mediatek.com>
 <20230403025230.25035-3-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230403025230.25035-3-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_053140_244909_29799656 
X-CRM114-Status: GOOD (  11.30  )
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

Il 03/04/23 04:52, Chunfeng Yun ha scritto:
> When handle qmu transfer irq, it will unlock @mtu->lock before give back
> request, if another thread hanlde disconnect event at the same time, and
> try to disable ep, it may lock @mtu->lock and free qmu ring, then qmu
> irq hanlder may get a NULL gpd, avoid the KE by checking gpd's value before

KE == Kernel Error? I think you wanted to say KP == Kernel Panic instead.

Also, s/hanlder/handler/g.

> handling it.
> 
> e.g.
> qmu done irq on cpu0                 thread running on cpu1
> 
> qmu_done_tx()
>    handle gpd [0]
>      mtu3_requ_complete()        mtu3_gadget_ep_disable()
>        unlock @mtu->lock
>          give back request         lock @mtu->lock
>                                      mtu3_ep_disable()
>                                        mtu3_gpd_ring_free()
>                                     unlock @mtu->lock
>        lock @mtu->lock
>      get next gpd [1]
> 
> [1]: goto [0] to handle next gpd, and next gpd may be NULL.
 >
 > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

This is a fix and needs a Fixes tag.

Regards,
Angelo



