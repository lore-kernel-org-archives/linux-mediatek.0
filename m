Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD2E3C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 11:43:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fpHvNGwF0tYAfblRGbhZhFq9/drxCrGxcXu+dOHm5b0=; b=K74VEZZWRn1DPaMhnml8WxcUYX
	TLcTeAm48dgFQo3BRqZ325BemmJHJBXIkaQ48RVq1dOmS7ICSSy2I/Nd2Afj4hfdSmmKGVbNv7HzK
	XtQhM+9tvhbMcjzt/mBw9xeHeHZhc0FripGpcOtxHA4Ce+kAuVt/EtXntQXZYJZ47FGLcCLzRs+6O
	GZa9cdfVsgoxSA85OvoDA/WVpOZ7ZFe8XV1uTQTFwZFmljYvo50iSKGyHfKNsq8xFJPkxAYjqhZBs
	HFyQCv19cubpnIItqw6+99nTdnUukx52sBCz7PZARnfQm56DfI6WJ5PC91QH1eDrNdS8+9V1LC3nf
	Xid3cZVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6t4k-00B9Wp-Al; Mon, 10 Jan 2022 11:42:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6t4W-00B9S5-CM; Mon, 10 Jan 2022 11:42:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id ADF631F436AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641814962;
 bh=aqM6eqxL/59SPD0eLrWoMsGRIH1ySplA/RdbUjqnt8U=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=GrzWeHv93tECgVuNmZxUxZC4fPMVBCiQo7mvSPzNZ3hg2p+QGENhVRjmQkSEDJfnW
 lKx0Ea9CeFfhLAThUhzRSS6ojKyuybjnRBt2Y7KoTUZ7tPAM9OcdAzFeRvGhNBMPqR
 QDEqwtA5Nh7h0AjAXkZ4bzrOXS7noHPeoHxbDybSDiMozZQkXMOfAD8ui/xgBR6KVH
 k/9yaqnBJdcEOaF9qtn94YIRutW5mQ+YKWBzxWpaYsMOaW/Pr9rV1E2fLyKTp9Wy0T
 FX58Lx66RLgCKxItga/eNE3Jm1mKdortyVFI7xCbTtGwWecg2JhsIJDjE9Jn6gIAdL
 7BXriwcntmLKw==
Subject: Re: [PATCH v2 1/5] iommu/mediatek: Remove for_each_m4u in tlb_sync_all
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 iommu@lists.linux-foundation.org, Yong Wu <yong.wu@mediatek.com>,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:MEDIATEK IOMMU DRIVER" <linux-mediatek@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, kernel@collabora.com,
 linux-media@vger.kernel.org, sebastian.reichel@collabora.com
References: <20211208120744.2415-1-dafna.hirschfeld@collabora.com>
 <20211208120744.2415-2-dafna.hirschfeld@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <41c17006-af5d-19ec-210e-f6f12542eb75@collabora.com>
Date: Mon, 10 Jan 2022 12:42:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211208120744.2415-2-dafna.hirschfeld@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_034244_621061_BEFD23C4 
X-CRM114-Status: GOOD (  11.38  )
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

Il 08/12/21 13:07, Dafna Hirschfeld ha scritto:
> From: Yong Wu <yong.wu@mediatek.com>
> 
> The tlb_sync_all is called from these three functions:
> a) flush_iotlb_all: it will be called for each a iommu HW.
> b) tlb_flush_range_sync: it already has for_each_m4u.
> c) in irq: When IOMMU HW translation fault, Only need flush itself.
> 
> Thus, No need for_each_m4u in this tlb_sync_all. Remove it.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> Reviewed-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
