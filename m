Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD411C38142
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J6D3Z+rL/kSjDwtcfzqTjQkCgAcKq6mcuDqDjlB8tIY=; b=gy71lIJSqQNiQ+RxfmsacJlHZ7
	Mu2cWUtlf4jzDdvxbRMB6gMoT2+AjBW6qzV7ZGh3Wh+gad0nqJyy+un7/2n9FQ053Wh2Z6AAefHep
	5YuWAY+I2KK1UUEyu/5Y7ExBkmdgmPceJN5HGBxybVcb0efZUkjcMBZ/XTiIHOgVZllrhsPu1GuNl
	QMnleODzrjC/nFiMdUnIzC7rrlUXXJiKNPzL5k5APRuY2rTK9XkwWJwZ3naH1G5N3syBkUsQgiNon
	5Z1yZHEpmunnT8rkQJTRSortUqmgVH7TGByrSLIz9aTKoKbsznYmr32DuzzdO+UJAEdHWQlyLR9o0
	ABi0f/iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsuS-00GThL-LZ; Mon, 23 Jan 2023 09:14:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJsuH-00GTdr-7a; Mon, 23 Jan 2023 09:14:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B1E4A6600358;
	Mon, 23 Jan 2023 09:14:22 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1674465263;
	bh=4HIAtVi1kXnmDL51f6x/c8XKm1ukMWybodqRfMejQiw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PSyV1alFkTW/LzpaZHAERun4E/EE5RqgbuxQ+OGFaB4HiCcBm0d1WjO0KGf10g6cX
	 4VyJG1bdVrOlKf8MQMtlUv+hsy1qeEcRtB5g7PnAUN37XzkXwrPkN6MbYVyUh3j5aV
	 ewGbHhqizHo65ISbyU669XthMkgX6zof58KL7VuRr/D+GXxOfbvZ5c7N52giXu3OaG
	 Ct2vFwCGPClriB+6BTmWxuwdNkyIxj9fRUCeWnDRexreToCpS1OT+5s115ZZ2jpwJM
	 iOAK45DunHb4jo96QeMmuXVngR3sT7X3SVapsgmv0646faIkRWr5FvXdYRGZIsSSXs
	 nPSVF7yP9ajyQ==
Message-ID: <8b0d1a4b-a2d3-0e17-9b31-95258a855807@collabora.com>
Date: Mon, 23 Jan 2023 10:14:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 3/3] clk: mediatek: add MT7981 clock support
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>, Miles Chen <miles.chen@mediatek.com>,
 Edward-JW Yang <edward-jw.yang@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, Sam Shih
 <sam.shih@mediatek.com>, Jianhui Zhao <zhaojh329@gmail.com>
References: <cover.1674401764.git.daniel@makrotopia.org>
 <367cf74b038281d235681f6e7fd6f3f7046c962b.1674401764.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <367cf74b038281d235681f6e7fd6f3f7046c962b.1674401764.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_011425_451573_3D43CC3C 
X-CRM114-Status: UNSURE (   8.99  )
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

Il 22/01/23 16:44, Daniel Golle ha scritto:
> Add MT7981 clock support, include topckgen, apmixedsys, infracfg and
> ethernet subsystem clocks.
> 
> The drivers are based on clk-mt7981.c which can be found in MediaTek's
> SDK sources. To be fit for upstream inclusion the driver has been split
> into clock domains and the infracfg part has been significantly
> de-bloated by removing all the 1:1 factors (aliases).
> 
> Signed-off-by: Jianhui Zhao <zhaojh329@gmail.com>
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



