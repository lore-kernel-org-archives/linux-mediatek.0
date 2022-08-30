Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26427ECAAD4
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Aug 2022 08:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dQW4QCTT02WxjfFEG6PvI/VnNUqoG56pHeJf1xcbM6w=; b=AaB4Wmyo/rP6NKHM6r9FLFsU6P
	Ia09rMYBtplkvmG+bTIszQJ91AOtGSJmEkS4LUquQiGJyrho8whdgHu900+mVf4YyNfmRNSG9hlyQ
	gLQK3KE8qUIUWSi61I0NLnhYOOtGm997pn44AUrIkOPtDn31YcPnr++lb5YDZ458WGweg4skX+cIw
	Lk/fyJtW5O6xIT3rUi6QAvqDLzxX22F3p0nrbXbs5/5TKHQDBJHyDdafasWTNoi4KSAvyjeTkFTx2
	zuEqvzvZo0d5o+wHaxsf1VQ7w8CYL+B4FPdfIFUe8xuiQo2L+St6z+9HR8nsuLQEfbc+EvQCShcXb
	aMsBe3uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwSx-00F8zf-QL; Tue, 30 Aug 2022 08:19:24 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSwQL-00F7fN-US; Tue, 30 Aug 2022 08:16:43 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5279A6601E8E;
	Tue, 30 Aug 2022 09:16:39 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661847400;
	bh=WZChgXoVHLOIRXF2mN0QrI8uplM6Fh3PZD9YJmLSqxo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MhBgXvtat6cy9ZP5JOiRoGu+XppJIYp2CuGoxhKEW4pV/eiv/C1CQhtRP51S75xP/
	 PG5ndYriiX4yRP8Ug++15ZBx3aaQqZ9no55ymFdKz1SsJBTWaHv73XTn9ZBPhzjiW1
	 lsbZv4W2xIxyiVf2gQhVHz2mj1cANDhr3v7A7NYKjPrMX8v4N/fYr0+7kWRmr385Xy
	 +26q3LS1uMnMiHbCdi7ukj+SfJhpCWkxeqYgabcGA+LnJOOwDkpEf3YIzU6ZMfnsMJ
	 S1d62v3QLYAvL3/GX5g9WL/SyT/1D33R3GM3DDHbtaIVi1+n3Hzb9E0l3Xu6B4ATzr
	 lpbRC9VgNbCzw==
Message-ID: <62b52d5b-26e7-a629-daa6-8c63265e62e0@collabora.com>
Date: Tue, 30 Aug 2022 10:16:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v4 1/6] iommu/mediatek: Add platform_device_put for
 recovering the device refcnt
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 mingyuan.ma@mediatek.com, yf.wang@mediatek.com, libo.kang@mediatek.com,
 chengci.xu@mediatek.com, youlin.pei@mediatek.com, anan.sun@mediatek.com,
 xueqi.zhang@mediatek.com, Guenter Roeck <groeck@chromium.org>,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <20220824064306.21495-1-yong.wu@mediatek.com>
 <20220824064306.21495-2-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220824064306.21495-2-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_011642_206970_8C9A7005 
X-CRM114-Status: GOOD (  10.00  )
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

Il 24/08/22 08:43, Yong Wu ha scritto:
> Add platform_device_put to match with of_find_device_by_node.
> 
> Meanwhile, I add a new variable "pcommdev" which is for smi common device.
> Otherwise, "platform_device_put(plarbdev)" for smi-common dev may be not
> readable. And add a checking for whether pcommdev is NULL.
> 
> Fixes: d2e9a1102cfc ("iommu/mediatek: Contain MM IOMMU flow with the MM TYPE")
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


