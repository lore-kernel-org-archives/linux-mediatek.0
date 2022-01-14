Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDCB6C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Jan 2022 10:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Oegye2HIIOPiMQxkJaFLLs7KI1IWdI4BK0GF35C1mJo=; b=DLJs9U1l+iSsNYSJd8B8jEtS1q
	0i217zY6MSiD17ja4YlxSO/ZfPge0NvmfOXZGy38QFlMxd5eaVYVhjRzeabnn9x8MmaloKnz3yoFV
	DwQyxI9xbvSF9SPp/iL79gdLdwGNdT6KmLcY3w+zy3o/SAko8DfD3cfqVgNz9F6+JnoTRa85oG6bm
	io0+gwfoN6G8EMPBH/YUrXAyVwzOK1RfaxlG3XKUgOuvqWd26AZ+zEncUvOHVmxdWrJc53i9hezBz
	ExIztZaPE/KLs0zyKdedxN2O1lw3P6QR3cd4rw3g4fy2EYdVnQbrOO09cfJRRJQpAG5MJ1rdCZ2Tb
	thPk6lJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8K18-008kbm-Eq; Fri, 14 Jan 2022 10:41:10 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8K15-008kb4-LB
 for linux-mediatek@lists.infradead.org; Fri, 14 Jan 2022 10:41:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 252581F46809
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1642156866;
 bh=7e8A6rfOaRMdSaAaDfTMrmxFIJ5XJYz6AqI9cF72UIU=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=icn9XlQmCD6NqskJdWvwLu9Z/Qrr9vQ2Tg5vbRkJBEx+srSWdlyi2k7kdthRQQ+ZC
 w5uSFWtWLqQEP4pBNb3gTB9xgUArYlp9RWMufgv1CBH/tzrdw+GtGO3BGvssgdoqoa
 Y01BnAZ8AIP+M1/8ifyjWiy5ZX8vNiR61w7V8iYF+NmZqx8OTSoTs4r1MgdQvo1Z/O
 5PkLwcDp7eEs24JMMVtcdKztu5h/QIZCx7dVJvGVsRdzSEn7kHnYqvfM0w9k3Rlx08
 cPaxPhVIHjHLHyOZ0EqgOSRGqD8amaOzZBlLYZODufAgDbdfAWNDl8wB5l8/xw+Mrq
 Qv+UWaXcdwWkA==
Subject: Re: [PATCH v1 4/4] spi: spi-mtk-nor: add axi_s clock for mt8186
To: guochun.mao@mediatek.com, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Zhen Zhang <zhen.zhang@mediatek.com>, Bayi Cheng
 <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 linux-mediatek@lists.infradead.org, srv_heupstream@mediatek.com
References: <20220114062408.9077-1-guochun.mao@mediatek.com>
 <20220114062408.9077-5-guochun.mao@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <9934126a-c363-f7d3-348d-1ab760322414@collabora.com>
Date: Fri, 14 Jan 2022 11:41:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220114062408.9077-5-guochun.mao@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_024107_859607_AB82EF9B 
X-CRM114-Status: UNSURE (   7.78  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 14/01/22 07:24, guochun.mao@mediatek.com ha scritto:
> From: Guochun Mao <guochun.mao@mediatek.com>
> 
> MT8186 needs axi_s clock for DMA feature.
> 
> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> Signed-off-by: Zhen Zhang <zhen.zhang@mediatek.com>

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
