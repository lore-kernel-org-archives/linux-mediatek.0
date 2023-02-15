Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54720C636CC
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Feb 2023 12:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+tGiPFEimqSEfn+iN5r3ArN6S43cSTe+vjnpqb+g6E=; b=BWghY391iB1rg45yAGd46i9D52
	vy6nUQ+JvVTMkkh+pUrlXgyWWHEXocKrJ5ECV14MsT9lhQrO68knU/+hKqfndek8lLsjC1eiMKJLC
	5k86D2sUMYmqaSx7j9R3yuUFtPljaNmcLS5pjnA/wBWtTeweprmepAWJiCqac8n3YrU9GeBdxXIZS
	dPOuLQxcqd1GfgYbfs1SZ8V70n51ZNf4E7CUQz5YkuTHssodTCAof1Hbgedht8w7jj4dBYFNFYrCk
	jPrlU7w3BStSXtoe3kf9wONZSU+oaxKu7enX5fJLjXWx1Ua1KwtiMnZjzJ1ViuOeeTzv8WI1Ckoao
	Fohz/7NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSGyi-005m9m-5v; Wed, 15 Feb 2023 12:33:40 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSGyU-005m4O-Lp; Wed, 15 Feb 2023 12:33:30 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F1262660218A;
	Wed, 15 Feb 2023 12:33:23 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676464405;
	bh=XjKxrV8fXkRvrXBNe0Ydl7+8yd1Vv/vlPl9Gx+Y6YkM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Uz0hRl40VuK3a2d6yqRDVcl37/37u/4CNYCIrahSlkK3Qe/AgaAoIYZktt2jYp+qX
	 VzCjlnkCfmSPNJTf8YX7ktoBQYFx9jgc8AngZpMMdf0ZZQFbseN0nTKrcILXMxgkvl
	 zcCxOLRtJNVV4CNfmcffkjHu5BiXmX3i401ssgF20o8nb0o2NCGX14ineyve6n1TM3
	 mY1kIaBR2oFlGTVuRcdqJACoiDFb+8RuCvekS8sg7XKExX79wdU3RVp46Bra0iyzbu
	 KSx4tkMq82sOcb/lqqJWpw9dL2vUY6oliaA6zmK5+1Nx2TutiVJFbOaetU6lxyhQy4
	 EDByEb1blM8pQ==
Message-ID: <7a46706b-3de5-d8dc-6ea5-8e909e2b927e@collabora.com>
Date: Wed, 15 Feb 2023 13:33:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v4 06/11] iommu/mediatek: mt8195: Add iova_region_larb_msk
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Hans Verkuil <hverkuil@xs4all.nl>, nfraprado@collabora.com,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, jianjiao.zeng@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com
References: <20230215062544.8677-1-yong.wu@mediatek.com>
 <20230215062544.8677-7-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230215062544.8677-7-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230215_043326_889187_217FB64E 
X-CRM114-Status: UNSURE (   8.15  )
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

Il 15/02/23 07:25, Yong Wu ha scritto:
> Add iova_region_larb_msk for mt8195. We separate the 16GB iova regions
> by each device's larbid/portid.
> Refer to include/dt-bindings/memory/mt8195-memory-port.h
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



