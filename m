Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE188C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PNZZz2XDrPAbDVE0rL/om8npbur8YcUTaqZNoBS2VFI=; b=xnV6lnOe9dyamj43m/CssWSFd9
	9mxws7qNDFk2s7E189FM6EsGbulrrAxvfPcUMRpRCrlS5CELAqer97scjbCBBikCzBvsTMDDCyAd1
	HhzHCAoaw22oxZebxCMOQNpoVimloqIt/j+pM5kN5XbZL6KOduVftrxvLcgBwlkOEuJcSz8JhUZMQ
	R6VWYHj0wZYpC996djnrM+0hToCy6WDbs8dzrzCp5+PVTQUa0WQqL4Pi1gSY4TR7lIjK95w1CuKgs
	9VlUGYcT082xaploaHxBiNl644jufw819PAN0hO2v1WGzvbLoSauebosCgedHaM1wa8Jf5n6StzLb
	Bd55Fryg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mKH-00CABr-Pw; Tue, 04 Jan 2022 16:06:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m9a-00C4l3-B8; Tue, 04 Jan 2022 15:55:16 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F32151F43595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311712;
 bh=/8hS6LpwGBUUv6Bdwdpig6occOMefCCzy4ycInHjP4Q=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MoyPcKM2zPie6sqOy7lKuFui5mjX8ibrAJNvWl3ML2rKF48WLGkJWcUO0Z4s4C9G2
 uAn187S3kPvHaqvHtjqerxZ09KdgZxj5BWxADGZ6LiHC7kHWAT3EceohFOIjQOIH0j
 53kdiXPAxeujVFJeEkRaTJ204HUuQtJBIi7xubo2GS2WQWO0YAI87QGDrCwovh1H8D
 yhI05ILRgCxcmbMwFuzRpqts1hZs+b03uPpJsKlyJ0iolooNCmUu0I94DYHHs+/Euh
 0oJ5JwvVlBIV6yBHoVyHvJuFLT/4Dd88nVUEj6/Zoe+6M+xi3AqH2hlNRDj1EnMYB7
 LsFQLlUCm4HMw==
Subject: Re: [PATCH v3 04/33] iommu/mediatek: Remove clk_disable in
 mtk_iommu_remove
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, chao.hao@mediatek.com,
 yen-chang.chen@mediatek.com
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-5-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <f18d8bc0-f6da-9c20-941f-3880ff0d60fb@collabora.com>
Date: Tue, 4 Jan 2022 16:55:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-5-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075514_575705_BF5AA0CC 
X-CRM114-Status: GOOD (  12.98  )
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

Il 23/09/21 13:58, Yong Wu ha scritto:
> After the commit b34ea31fe013 ("iommu/mediatek: Always enable the clk on
> resume"), the iommu clock is controlled by the runtime callback.
> thus remove the clk control in the mtk_iommu_remove.
> 
> Otherwise, it will warning like:
> 
> echo 14018000.iommu > /sys/bus/platform/drivers/mtk-iommu/unbind
> 
> [   51.413044] ------------[ cut here ]------------
> [   51.413648] vpp0_smi_iommu already disabled
> [   51.414233] WARNING: CPU: 2 PID: 157 at */v5.15-rc1/kernel/mediatek/
>                            drivers/clk/clk.c:952 clk_core_disable+0xb0/0xb8
> [   51.417174] Hardware name: MT8195V/C(ENG) (DT)
> [   51.418635] pc : clk_core_disable+0xb0/0xb8
> [   51.419177] lr : clk_core_disable+0xb0/0xb8
> ...
> [   51.429375] Call trace:
> [   51.429694]  clk_core_disable+0xb0/0xb8
> [   51.430193]  clk_core_disable_lock+0x24/0x40
> [   51.430745]  clk_disable+0x20/0x30
> [   51.431189]  mtk_iommu_remove+0x58/0x118
> [   51.431705]  platform_remove+0x28/0x60
> [   51.432197]  device_release_driver_internal+0x110/0x1f0
> [   51.432873]  device_driver_detach+0x18/0x28
> [   51.433418]  unbind_store+0xd4/0x108
> [   51.433886]  drv_attr_store+0x24/0x38
> [   51.434363]  sysfs_kf_write+0x40/0x58
> [   51.434843]  kernfs_fop_write_iter+0x164/0x1e0
> 
> Fixes: b34ea31fe013 ("iommu/mediatek: Always enable the clk on resume")
> Reported-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
