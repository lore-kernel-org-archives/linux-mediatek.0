Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ECBAC4167D
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Nov 2023 13:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=52Yxhex5XZ08whjXNtw4nYvYbWMJN846VFcwarBExsk=; b=M8fN4zq7nfpDvXRVZ8a5D403SP
	hqsgD/kn5N464BJKY//Eqytr5Krkw6PpbQ3rvAuyGtffjzIFr4wjv0tWgtg2d5uu7gATTVOYvtCw8
	bMjfGuGZ25kT1HsaQ/sEm94ibz00moNbLjvYHM6ZG6BTS1A9jlLrDMwW7M9o7e9OwjWXe1Vj3FauZ
	kcUoUYC8APIZrlPviRkNr/NE36nt/hOP134Nw4P/ROpYLFKq3HxS8bUfjjqUobZl3vlcdar5sO+iV
	KRfTdu92+jyGhAms21MQm0x7FdXPMNRbQckXDM/RzFwbHORruPdkUA85z7dIKqFqOVxtQeQJi2+Zm
	L6U0RKng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0MY4-001g2Z-18;
	Tue, 07 Nov 2023 13:55:20 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0MXv-001fyv-2t;
	Tue, 07 Nov 2023 13:55:16 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F0FC666074CF;
	Tue,  7 Nov 2023 13:55:06 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699365308;
	bh=t+HcwzzdP0EmPq5p4rIAi7MQzNNURloc/LR1PJVAFxg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QC5U2jngIN5RD27TfTsXzdUgLAzLn3b6MspIt0QmVH1+awm4vQ0rSd7B3V0BT6VPw
	 k4j9LoJ+w0moNKDvQQyMUc7FSg+LIRYnomTIRdCau8QUW5ql2+nEokyVkM4GzNwjfG
	 71dAp20Lkp0kLsZiiyrfYEWpW3WPcnhUyvPL4IPQrifJlWrJqcxEvowl0K1PSzeyMt
	 xptRn+iJGKETLugIw8iDFw/V9CLwIAK8ox4aHthOcsUjnTReep6QpthLFUjQPrT7fs
	 Z6DZb8IoSKlCjPo3Xlth6FqwEJBJssymZ0tSbTn0tTbOYHIlkSFqIb5qCi/n+/gKsN
	 H2W9q6QlzfObw==
Message-ID: <c6af0adc-4ecd-4be3-934e-621a9166a499@collabora.com>
Date: Tue, 7 Nov 2023 14:55:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ASoC: SOF: mediatek: mt8195: clean up unused code
To: Trevor Wu <trevor.wu@mediatek.com>, pierre-louis.bossart@linux.intel.com,
 peter.ujfalusi@linux.intel.com, yung-chuan.liao@linux.intel.com,
 ranjani.sridharan@linux.intel.com, kai.vehmanen@linux.intel.com,
 daniel.baluta@nxp.com, broonie@kernel.org, lgirdwood@gmail.com,
 tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: yc.hung@mediatek.com, sound-open-firmware@alsa-project.org,
 alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20231103095433.10475-1-trevor.wu@mediatek.com>
 <20231103095433.10475-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20231103095433.10475-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231107_055512_125768_21D743E0 
X-CRM114-Status: UNSURE (   7.09  )
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

Il 03/11/23 10:54, Trevor Wu ha scritto:
> Since there are some variables that are no longer being used, we remove
> the code that was implemented for those variables.
> 
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
> Reviewed-by: Yaochun Hung <yc.hung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

On MT8195 Cherry Tomato:
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


