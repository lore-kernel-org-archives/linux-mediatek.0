Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBB3BC77B61
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 10:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BvLa1Vn6ocoA4vzewCKEMqDF6kAcKPd9x2XkED7bhUs=; b=LTrmhUqFmA9txDTEoxqIRM3EWS
	j76e3BJZXjbqWBV+fDRZGBsHkNuV9hZkby2OK968N7oU999E4aFEEpeqEbTgTL+CIuwNFGzksVjnh
	q81J9DCX6Ina6g9Kk2wh2hlbTSUjYk1CV6+//2jW+rtMzU/wwNGzV7PBXN390A2ZJpTWDtjWNJ7MT
	sqdw9rmZUE+sjhdujOuwai74i9P9TYTsnbdWvLndHOnKbr1kUjl9Fp7wanjnYBYPTfHBvdMeCMxj4
	RfKziiDbQWtY3XAAIHgizhICyf3WKr2FbIUDW9fpQy+dIdFe/S0IAHwqxEKMgVvqJ7vxAOvGT7YRd
	P1dy3VmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmtkJ-005iBE-0A;
	Thu, 13 Apr 2023 10:00:03 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmtkF-005iA6-1S;
	Thu, 13 Apr 2023 10:00:00 +0000
Received: from 8bytes.org (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 809C8242A7C;
	Thu, 13 Apr 2023 11:59:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1681379998;
	bh=n0QJW4lfoz67Y+PljUooZl3qQdKxzEidqXgT7gCTOns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p7P++pYu0u5ZAUDr7m9Y3K32VnwYTUtaeIkOi+SP2qpJd3H1pIjv5fiKdGsvuICdP
	 oD9F5kPhUwZgRcFruMin1d5RaAe95EtzgwmWM9+hWaEt5xIc+LIvd7eXhfPoByVwoa
	 EspFxywwWpN8/ly+m+IzvyzMz5vH6RA6oQMKVYDjvDsr9AicYHV5Dpxbi7YIpJOrnw
	 wsx9UzHCjPQEHjd0a9yUAA/so51aftNC6agS//Yi+Xun3KR1pkXx+McsTN0kqnOo52
	 4KvehtZZb/UvV0qGtR3djbZOQGRLsfzF0PQXSo+UhyuzME5sTOti+cxDuoI6niMspr
	 hjvzH71h3XnDg==
Date: Thu, 13 Apr 2023 11:59:56 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, nfraprado@collabora.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
	jianjiao.zeng@mediatek.com, Yunfei Dong <yunfei.dong@mediatek.com>,
	kyrie wu <kyrie.wu@mediatek.corp-partner.google.com>,
	chengci.xu@mediatek.com, youlin.pei@mediatek.com,
	anan.sun@mediatek.com
Subject: Re: [PATCH v7 00/14] Adjust the dma-ranges for MTK IOMMU
Message-ID: <ZDfSnOXqqVP3MNg4@8bytes.org>
References: <20230411093144.2690-1-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230411093144.2690-1-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_025959_637755_F9A7485E 
X-CRM114-Status: UNSURE (   8.52  )
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

On Tue, Apr 11, 2023 at 05:31:30PM +0800, Yong Wu wrote:
> Yong Wu (14):
>   dt-bindings: media: mediatek,vcodec: Remove dma-ranges property
>   dt-bindings: media: mediatek,jpeg: Remove dma-ranges property
>   iommu/mediatek: Improve comment for the current region/bank
>   iommu/mediatek: Get regionid from larb/port id
>   iommu/mediatek: mt8192: Add iova_region_larb_msk
>   iommu/mediatek: mt8195: Add iova_region_larb_msk
>   iommu/mediatek: mt8186: Add iova_region_larb_msk
>   iommu/mediatek: Add a gap for the iova regions
>   iommu/mediatek: Set dma_mask for the master devices
>   media: mtk-jpegdec: Remove the setting for dma_mask
>   media: mediatek: vcodec: Remove the setting for dma_mask
>   arm64: dts: mt8195: Remove the unnecessary dma-ranges
>   arm64: dts: mt8195: Add dma-ranges for the parent "soc" node
>   arm64: dts: mt8186: Add dma-ranges for the parent "soc" node

Applied, thanks.

