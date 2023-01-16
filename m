Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 469ACC46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 09:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8a9qpEIewqaqSAbQg7ntAUW7gDieheAG/80rlSxUSLE=; b=m+4Hh1gdhb4G//+R9mYcI9ErLk
	DrBM4zJg0YWAqrtrYLSuw1sNDrWwJsK8YYb/Ikt6BWXlHGEP1JFfmaZfXKx0qbZCEFI7GnVr025t9
	k6RObu8hTIIpznQ0H2NKnco4Yx5HVj1hknmnvfizLfbeFnUjOXPLBypLsoJS7kL/I8v0L/BDvc3ET
	7yMbIyw3f+bCE3eRsnuKkPBkgIwK4xstp0eCUTwjfhHUMNva7yz8vfYzKlivHJZmQrBRDSDUc0H0P
	P26n5x0TGnutqbTyCI04EZVZ6fy9ixIdIRrCkBLsIYFPZaNFxgt4Q/+X+sMl2GOY89zObVaGhTmvS
	qbb942SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHM5j-009Sst-C6; Mon, 16 Jan 2023 09:47:47 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHM5U-009Sm1-9p; Mon, 16 Jan 2023 09:47:33 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 30B6866029A5;
	Mon, 16 Jan 2023 09:47:29 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673862450;
	bh=33zIFHwmx9BzY/eZo1j7iwlJxGh1pbqYh9OLwq0AIO8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VU1ikWfY30pNkiJqE3XjwoKgR44syhpC/71YWMr5OFxsOcNB/z4aLE2aDesOeWB1+
	 1OhBFUG0uMCPAYZihjxzOndhOH4HcnDMH6Z3NNYRWYba7gkmK3UkhtDIsVCg29bFUP
	 XdeqtHlTY/XjseoQfuIrR6RC6RH0qZv4AHoXdFfciqrLDOF9CDgKvVd+twcxWlY33c
	 sqp7zDq9lTDBuosMn6mfyF8dJYKjSt7G2u9upE8YOO4bXqRus0rPafoZaBP0bRnh4+
	 9r6QLLSqzK1oAXdA8ntWHCBXf3vOeOEW/ZzrRsaSqQ4zaEPZvFW6gdhZioGC4p+cIl
	 yZmKVcQLdH39Q==
Message-ID: <6aa2d375-144f-c66d-0bf9-24d9f8226907@collabora.com>
Date: Mon, 16 Jan 2023 10:47:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 08/10] arm64: dts: mt8195: Add dma-ranges for the parent
 "soc" node
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
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com
References: <20230113060133.9394-1-yong.wu@mediatek.com>
 <20230113060133.9394-9-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230113060133.9394-9-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_014732_504469_3FF9EF93 
X-CRM114-Status: GOOD (  10.75  )
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

Il 13/01/23 07:01, Yong Wu ha scritto:
> After commit f1ad5338a4d5 ("of: Fix "dma-ranges" handling for bus
> controllers"), the dma-ranges property is not allowed for
> the leaf node. But our iommu/dma-ranges is 16GB, we still expect
> separate the 16GB dma-range like:
> a) display is in 0 - 4GB;
> b) vcodec is in 4GB - 8GB;
> c) camera is in 8GB - 12GB.
> We can not expect all the masters add a parent node for them,
> especial for the existed drivers/nodes.
> Thus, we add whole the 16GB dma-ranges in the parent "soc" node.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


