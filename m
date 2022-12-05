Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DD1EC4708C
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uxvv1vHwJk5g2JaM54dSYordzJVScCPC3rw+XxGYuSk=; b=LodRguIZvohlHL9LLXI65dXhYw
	euwR0fk1e5eEHfZqE5CGRP8ul5wbKyEmPYdfTtq9KcKB3W3RAEOu8gMhbHMOqPTrDIGcnyy2B8vVJ
	qqhcowAaKXT8pAp5dck9xbsXmFuvfM+tGfK3rHghn+yYGBP8RVrdUfonbhe4Dei+c1z+Y7tMsy3+i
	p5MiMQNw+bGlH/BzDHtRvhQkmWGIP0DQyYyBzeTz7q7ViPx+eD9yt4mFBIZP/wF2FQpaZ6OPjZ8bx
	xAz+m6rUsp2uFXg/XrvHyNGiyUGgJlRjHZylwik7ZhHG1cfMLX4y6mf7WZI6nnJ9MfwqaiPjl9Z5w
	BCUJP7uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CLf-0040Dr-EO; Mon, 05 Dec 2022 14:21:35 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2CLU-0040BW-MA; Mon, 05 Dec 2022 14:21:25 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 2BA8066015ED;
	Mon,  5 Dec 2022 14:21:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670250083;
	bh=nFlpekzLsks1mmWRutgqee7+5JHLJAzQnABl84xpqSM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LtJ478lmW5v4x7/kWAcQ3tDjWsxYKc+rpiXwQRd5RqAtazd62rQ1z7Db4xQu98E22
	 KBR28Q6vsSIWm6bxFMXGF0HJ0KEZrtMROhptjDcsEp93em05AenIN5dIyXrqm63/Pd
	 BK2UUoNiVUqFf52BXN4ZoG+n97IlJmZa4QWbR6oheLbr3wIDekAhxAjiSDWqaphTQR
	 SpWyO9G7R76y/cTcQydcXTXm+KlFM0i1iQtSJn2BZBUmzvbtXrcSr9W2QZ1uFaGyg6
	 SlFuOjrBDMHqdWJPSXO1fRFbG96k1p97WCJbNh76WmPDT/5DrE+/6ptTVf/geFgfTA
	 dYPnJ4suwweng==
Message-ID: <49870a0c-495b-c159-b5e0-2c47a92a906e@collabora.com>
Date: Mon, 5 Dec 2022 15:21:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 6/9] spi: mtk-snfi: Add snfi sample delay and read
 latency adjustment
Content-Language: en-US
To: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 Chuanhong Guo <gch981213@gmail.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 benliang.zhao@mediatek.com, bin.zhang@mediatek.com
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
 <20221205065756.26875-7-xiangsheng.hou@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221205065756.26875-7-xiangsheng.hou@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_062124_909631_95CC5D9E 
X-CRM114-Status: UNSURE (   7.07  )
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

Il 05/12/22 07:57, Xiangsheng Hou ha scritto:
> Add snfi sample delay and read latency adjustment which can get
> from dts property.
> 
> Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


