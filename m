Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB8E9C76196
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Apr 2023 09:09:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjSGQK8p0TtO0uJOjtYu2KW083JJz2cWLPEk6QINBks=; b=vaREE0sreb+3OiiwuRZBC1o/f/
	eqe/3GI8YXaEKEcmU6CBM+WNoWQHOQb2qLmxL/KMzEaWj+NLg38S2GV59fLm7dWpPrUnLIgycbDs9
	/kYxGOPi3+WEQGGcgz7574kxGYLxEZqcPxQgzJpAvrPObGfdlBz4xovdzwYdHefXGoSyKhLFic+jO
	31DTjUwW7CqWdAad58d9/CfwXnpUQzY1gBstuHeU2zqOnlgluCbffLJCDd2r7PK9k7AxuH/CQ8jYH
	r9h2MTp68bsST+GdYccV1S2wsxmEUElOPDC7y1S7Iqv9ZnICsb5rmFBdkK6kSs4LWLXSGAvV9cMRZ
	RLvSWiaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pki5z-009c17-1B;
	Fri, 07 Apr 2023 09:09:23 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pki5t-009bwX-17;
	Fri, 07 Apr 2023 09:09:21 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 01E4C66031A4;
	Fri,  7 Apr 2023 10:09:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1680858548;
	bh=OmRy3BTQJvyb7zaP08nHY6cTSKkLTpfgKTbifvNowaA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jWw5BRxZILBXoMZf7owsL+geF1AUYnERBWyPL16Egb/i+Fio0DceOh4s50wEo5NMi
	 61Pm2tpXsy3V5i4rbsoN67yrlhjliUiaYqj+0rfhH8FNM0WWApeg4WK3s6QYrAVNk6
	 l07me0YDQuPhZ10eePPk7p61G9Avm0Rn2w4t23VpJV794uLsAml8DMuRFP/rzJF3QV
	 whw2GNMrlr48TfA7jhlbL6lJHTt1JdwXDEI98rNAML6NOMMcZt+lZb2/RWcMMJXev9
	 pVd6HNdDIYazyCvsvBnRYV9M/GX1pyzz7Ap2ZhWrrwqVKKxT4yYU+XzWCP28NDt8VR
	 XPfHYsqdE9vtQ==
Message-ID: <0d4162ea-e161-5afd-8b27-92f8e53b52aa@collabora.com>
Date: Fri, 7 Apr 2023 11:09:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 3/7] usb: mtu3: fix kernel panic at qmu transfer done
 irq handler
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tianping Fang <tianping.fang@mediatek.com>
References: <20230407082937.14558-1-chunfeng.yun@mediatek.com>
 <20230407082937.14558-3-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230407082937.14558-3-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230407_020917_548937_D3FB8C52 
X-CRM114-Status: GOOD (  11.13  )
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

Il 07/04/23 10:29, Chunfeng Yun ha scritto:
> When handle qmu transfer irq, it will unlock @mtu->lock before give back
> request, if another thread handle disconnect event at the same time, and
> try to disable ep, it may lock @mtu->lock and free qmu ring, then qmu
> irq hanlder may get a NULL gpd, avoid the KE by checking gpd's value before
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

NACK. You still miss the Fixes tag.

Regards,
Angelo


