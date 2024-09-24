Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 233FDCF9C6F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 11:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HDv/s0tphP++G1YhW6WMEbdbTW7+oEw4btTGXOf+YTs=; b=16IacmwL/qHs1KRu4mzletOEbG
	x/RsB8OgoB0n+HB0glI2SLCMy0vOas/5cWQpTzJ4m+2kCFyWg/G3rRz70uc8MD1oFLQvUOGQEIjLM
	aGj0Hyu9wVsbqPe0IbFkHiiopZfJ56i1FuLh9II11WbRVvaF8puZti6M3o2wHPeeNqR/hiQBW3HQe
	KqvqHUzfXmVA9h2ejrkjcKh907LuwNI4P/nImSWfBWAXqTWZuB43ieCojO8fwuNxcp4QgoFjJccX+
	Mvtl1c96vsnOh+VGMnT3yZ4bU/ebxpwC8nkDHLniOqeblK27U3PZgQkVEXfvQ8IaC3C3ZSpsoYSsU
	rhkob1Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st40M-00000002Dih-3Vm9;
	Tue, 24 Sep 2024 11:46:54 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st3w6-00000002Crs-1t9e;
	Tue, 24 Sep 2024 11:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727178148;
	bh=vEVQ1f1TFqVzooCmasQpj1OQzFxx1dYbcywfThJVzsE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XgFCXLMqrcqtfoN3RKT49uczLvlSssCt+YWhHFYwmQiBihgZUB48mN8r9hgK+nvvI
	 Oi8Urng0owrUnadvk7pkdNBvqNHN6vMCTq4qWjlLvAU1HeMH9EELT6+T5ggZcS/Rgl
	 kD7YVlq7VbhzCbD8EhGMycN+nrD+iSlc9Yp8Nf8r/nGw8oMht4ynaDmr7hyxSe2FRo
	 wO5JVhlt/Q5/ISSUaP83Evlde+JkTlT5aopZ4CKwA8ze9sB7uLI/t31cL90nJXVUQx
	 pMr7czP5yTAWnz/74pmTo21E8ifLIgX7uzN7iuKU6dqduORvnYUv2GeYgapB/HToGp
	 ITTQyihtTO28Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C366B17E107A;
	Tue, 24 Sep 2024 13:42:27 +0200 (CEST)
Message-ID: <04280899-ceec-4083-8f94-0fe8535961d1@collabora.com>
Date: Tue, 24 Sep 2024 13:42:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] arm64: dts: mediatek: mt8395-genio-1200-evk: Fix
 dtbs_check error for phy
To: Macpaul Lin <macpaul.lin@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org,
 Alexandre Mergnat <amergnat@baylibre.com>
Cc: Bear Wang <bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>,
 Macpaul Lin <macpaul@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Chris-qj chen <chris-qj.chen@mediatek.com>,
 MediaTek Chromebook Upstream
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 Chen-Yu Tsai <wenst@chromium.org>
References: <20240924103156.13119-1-macpaul.lin@mediatek.com>
 <20240924103156.13119-4-macpaul.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240924103156.13119-4-macpaul.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_044230_676504_4B9B059F 
X-CRM114-Status: UNSURE (   7.99  )
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

Il 24/09/24 12:31, Macpaul Lin ha scritto:
> The ethernet-phy node in mt8395-genio-1200-evk.dts was triggering a
> dtbs_check error. The error message was:
>    eth-phy0@1: $nodename:0: 'eth-phy0@1' does not match
>                '^ethernet-phy(@[a-f0-9]+)?$'
> Fix this issue by replacing 'eth-phy' node to generic 'ethernet-phy'.
> 
> Fixes: f2b543a191b6 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK board")
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



