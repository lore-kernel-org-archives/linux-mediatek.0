Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA5ABC00140
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 14:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEyu2cAsI6Clc3vxXVuPEHOMTtwvEPd4AnIi76vds8o=; b=fbESm9as2NDrqi3tdWtHD/vNSN
	pCic6BXKNexfWIif4+rDRH4eosnfddpKvgrwMIHKMBvuWrxt2rwpzmBbEfz7vCw0H+YYR48doTai4
	vx5vHiykEaiAvZNQH4XOdLi75DBhnIMzvI/ocjhYGlofOe+pNcw+hMDYxbAFwBcdxhm/M/hZNko8A
	zAVZLROpb+Yw+oZ2FM+5gY+7ov8D5HFldEiE//bVMnkpdHaVpQ8ukzws7woRbMXvD53WhDGSGR3wo
	uwRJiMaTmgwrazQ2YrAeLStAndUkhHbem17QemZdIP9iutDeZFdsVRyrSCLSBz6ZPCbvDsPLmiAVY
	BIoU1Ghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLSC-000AOr-AN; Tue, 26 Jul 2022 14:22:32 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGLRq-000AEN-1P; Tue, 26 Jul 2022 14:22:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4D1FA66017E7;
	Tue, 26 Jul 2022 15:22:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1658845328;
	bh=4zmP1FrOBGWRTxzO5xPnrH9vexzpAmeNeZdmwxjZBQY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=I33YrZIMdevJsy17cxsuWq4ptnwFrYml93lqWkg7Uu/N3xR5hbaAEE0xoVtFNUnDg
	 veh64GYs9lfg6OmryApl6rU7FC45SyB2+yXzrZLWH4/GzFyR0K9lMZH6jGknLuyKxw
	 ZMj4rriRSc5p4q53137JzbeKZAbB/qFzZv8/WB7TOaaQB71LiFlpj4xh7nX6WG7fVP
	 K7INGCKoEq0F20PQ2mVP1HEq7Plq+lhSOfHfkF6XcPgTNGE2upHjXrWqzrmPgaHzAW
	 i3eT5LB4M/BXoQuyZNXodOyFKKs9BIDVQDYqrom0uV0RdOebaXLQqoqJzqcOSRDbkz
	 MyztuzqZuuyqw==
Message-ID: <c9441276-34ae-19dc-8a19-5e03dc14628e@collabora.com>
Date: Tue, 26 Jul 2022 16:22:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/6] soc: mediatek: Cleanups for MediaTek SVS driver
Content-Language: en-US
To: matthias.bgg@gmail.com
Cc: roger.lu@mediatek.com, khilman@baylibre.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com, kernel@collabora.com
References: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220726141653.177948-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220726_072210_260686_8F0183D7 
X-CRM114-Status: GOOD (  10.83  )
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

Il 26/07/22 16:16, AngeloGioacchino Del Regno ha scritto:
> This is a cleanup-only series for the mtk-svs driver, enhancing the
> usage of standard Linux macros for bitfields for better readability
> and register set/get safety, switches to devm_ functions variants
> where possible and other general cleanups, getting this driver in a
> better overall shape.
> 

Sorry, I forgot to write in the cover letter that this series depends
on [1] adding MT8195 and MT8186 support.

[1]: https://patchwork.kernel.org/project/linux-mediatek/list/?series=660955

Regards,
Angelo

> AngeloGioacchino Del Regno (6):
>    soc: mediatek: mtk-svs: Commonize t-calibration-data fuse array read
>    soc: mediatek: mtk-svs: Switch to platform_get_irq()
>    soc: mediatek: mtk-svs: Remove hardcoded irqflags
>    soc: mediatek: mtk-svs: Drop of_match_ptr() for of_match_table
>    soc: mediatek: mtk-svs: Use devm variant for dev_pm_opp_of_add_table()
>    soc: mediatek: mtk-svs: Use bitfield access macros where possible
> 
>   drivers/soc/mediatek/mtk-svs.c | 325 ++++++++++++++++++---------------
>   1 file changed, 176 insertions(+), 149 deletions(-)
> 

