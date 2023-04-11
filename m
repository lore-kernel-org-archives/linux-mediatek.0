Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CC2C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Apr 2023 10:13:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dP0c3dLu4Icazbs6E+wjr5dFUcmiddDq2BHhfJ67k38=; b=gEpvxg4uAZbQeU/owF0VyetY3X
	8ZIo0Wweo911KoOWVsjkFG6nx9RVZf7TolGjFmpTNJ24kdkNSbkfmsNczeMBKWdCGEY1BA8xCkBk1
	mNp6RWHTinYQTxlKFnnOph8tV34crNPpTsLscYRJHX5EDttblLSmF14mHnfUN9GGuli2tEyLwpw3F
	gNKR0pqb80wzwu8pApWvvv6sOUfbMA4xttPh0Iggw9l6RTX9se+zTyA+edLCyYHdXYa4JO6jje0PJ
	0Q6ARvLLGsFa+FuLKmDSWBz0EWEZr4LhSdFCGf2ULK0Lks6lvlAjzSo2Aps3ZwyieZ7eVh0NDD88M
	Ba/QAZyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmB0B-00HCWv-1b;
	Tue, 11 Apr 2023 10:13:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmB05-00HCS3-2Z;
	Tue, 11 Apr 2023 10:13:24 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7BCCC66031AD;
	Tue, 11 Apr 2023 11:13:19 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681208000;
	bh=H0bLhwmxJ3hfxq2cNw35YIq7xvlSowfBxBWvLLl7KxY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MQRpBPV4eSPWPJDxxo4hOC8lJfK7U2Gva6HAK8zfzSIzpyNgsiTuwAxLiNr6ZHrZa
	 tfNlGyd5PbPnKje6sfMwqZd1XQTnjcrgb+1AoK8szw1gpTZkpSTay+iT3dNC05mtpg
	 OdFJuQmxRYK7tBPAWs6hgyBNcsJ4rWruFYSLrxn9/XN2VH0Ttp88LbGht9ts0lAYVa
	 ZMwPwjChFGRc3ABfoqZlzDA89+1LNVQHXEyWcv5QjDoSBXHavL356lBytEVd3jcNxO
	 8q0VQJLIsYEfFeyjBFMZ0Uyj1KWaC9FZsygkBxsqMAO+E2Ry1ZBGIxRyOr+V3DHtir
	 dtppndF9pmLPQ==
Message-ID: <5697b1ba-262d-34d9-b853-a6c959fc29fd@collabora.com>
Date: Tue, 11 Apr 2023 12:13:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v7 09/14] iommu/mediatek: Set dma_mask for the master
 devices
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
References: <20230411093144.2690-1-yong.wu@mediatek.com>
 <20230411093144.2690-10-yong.wu@mediatek.com>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230411093144.2690-10-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_031321_961510_8906A674 
X-CRM114-Status: UNSURE (   9.80  )
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

Il 11/04/23 11:31, Yong Wu ha scritto:
> MediaTek iommu arranges dma ranges for all the masters, this patch is to
> help them set dma mask. This is to avoid each master setting their own
> mask, but also to avoid a real issue, such as JPEG uses
> "mediatek,mtk-jpgenc" for 2701/8183/8186/8188, then JPEG could ignore its
> different dma_mask in different SoC to achieve common code.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


