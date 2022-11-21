Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E450C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Nov 2022 09:00:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OThHDuqdrncgzWCFJ4dVz24H4DTeQOtJYkUgtaoXOrc=; b=4HQfIVvSlABeodgOovB5yIMypM
	kdBW4jrG2Zs5+GeoGoJTpbDo29kHYy/d2QqrXBpttewMQBcF2l+WQ3gnXTDmYDH/7wddDtk0oHnF5
	BDvdNnR4ObBEwqnwwcVH+D1s9C8M9MTW7llISJaUbdGrAsBXl4VwOjYcACWrF+6Co9WOih72uWuHy
	QUJ9b3ovZGPvG9n+8BTCCK5eADyua4J6K0Ol550yrMxsx4eYhKAExNG4UVDco34JXt2ewgSQ4NYL7
	VJWmWHRv6EeOTREpEqEChBzY5O5hs3uAknNEQ6bFdmOAJYDTaqHenkThs7JszEsACoBO6rShfiDog
	81/Detag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2fU-00BZxC-8H; Mon, 21 Nov 2022 09:00:44 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ox2fH-00BZjz-Oc; Mon, 21 Nov 2022 09:00:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D3067660038D;
	Mon, 21 Nov 2022 09:00:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669021228;
	bh=OLC5n8rMO8cL4cOzXJeaC3lc4DpogYcvqSb8tEpen0I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nDaQPn9KqSX5P/x90vSUwqTmUcmVXixAl7jdAg/b3MxtJlHikebrgJhT0Jp/IsZ5c
	 8qD6K29wrxtlRkg2gxZXAHIuRHac7eOQwpBy3jmiDR9RGfXsoOWykzAMcqQM9QuvIL
	 CPjelZ3d2GC/Ca1WdW9cNflME7M8jeO2YHl0vus43KwCzb5FRrwwSV7mo4J9Au7Tse
	 KAbv3/+FD8RPawQqP0Uf+nxCQuvczzhsu4ilpoVlSFGVogQEllxlOcDmfOnZbO1f/Z
	 4haR662w/esT40sNsdvujn80pf89UQUK8z9qCDN3fMkJijeiwqjFgJ9DpMtvUmFgs1
	 LvPAmkko9t4cg==
Message-ID: <9135f1ea-5896-391c-12fc-849bea3b93cc@collabora.com>
Date: Mon, 21 Nov 2022 10:00:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 6/9] ARM: dts: mediatek: Remove pins-are-numbered property
Content-Language: en-US
To: =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 devicetree@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, krzysztof.kozlowski@linaro.org,
 khilman@baylibre.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, matthias.bgg@gmail.com
References: <20221121015451.2471196-1-bero@baylibre.com>
 <20221121015451.2471196-7-bero@baylibre.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221121015451.2471196-7-bero@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_010032_016341_2B2202C9 
X-CRM114-Status: UNSURE (   6.35  )
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

Il 21/11/22 02:54, Bernhard Rosenkränzer ha scritto:
> Remove the unnecessary pins-are-numbered property from
> Mediatek ARM DeviceTrees
> 
> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



