Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A79F4C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ujecUYXFQm1JNE00ukmOfUnv+i32JYy4oDbUUWD3z1s=; b=o+b8PAxuARFKsV+VrBo8fu2T22
	4/1N67HCbDmSLz9FD36x2j9zfDjX9iB/THkJmCvpzVpdeZ8fPwX4QpNGtGh86Q5wiXbr3S8uZTAxy
	EXKPNaK1TMXeAo90/hDKXOzFuN8LrAML+LhA7u0BPfK0B18xPZMUhTfd+1/cugKVVDVmIhLFG0+bE
	dPvTJmAPVt60/4OdbjHyjWhioy+JtsQofQ3PjWnRwlXxJHwvC5dKC18sFmU22VuGTSA2JanU+TtCb
	Weh6fIqr5H3nyNRqn49igdPGXr1GZUugWxFM2J9fdAZyd1N/feqPf/OWXhLlsusVO9qORc9sy/Of2
	jQJKNjyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mOP-00CCAy-MO; Tue, 04 Jan 2022 16:10:33 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4mA4-00C5Bu-L4; Tue, 04 Jan 2022 15:55:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 7B7DE1F43593
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311743;
 bh=upNEy1clIYcieEGkiHOyHnuE/MQhUsIdtvTzDimiz1s=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=V82sh8VWBO3wAJ+QOR8LOcH9EIWvCTmuyD2qd+snO29gmBATlO2D8yuxJeVR72uCT
 bQl8zAYDqIFzx5ez1wBEjI8COPnUhuLwxc5iox7C4JDh+6Z/Gb3VYkB9PPKiXA9KA7
 l9oGspH0ttOhoGDeMyqWSvDVylcU/mrr9ote+Usp7DKFo4NlYs1nsiDYCoJN8VBW4r
 +DmW5l+zdXInZcJxLb8LT8PHn3xdomfL5cG3Ec5F0lXJVJyw13xiWlSsL1Kse5z3uX
 2ba7tzfCA1MWgaE/RzOEso3yMSEWv6FCi2ilrCn4s8Y3mPZxcU2Yh794u4L4aEBwes
 PpqjD6VlLUNpw==
Subject: Re: [PATCH v3 12/33] iommu/mediatek: Always tlb_flush_all when each
 PM resume
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
 <20210923115840.17813-13-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <5228acea-3bf4-987a-caaf-11b90aa0beae@collabora.com>
Date: Tue, 4 Jan 2022 16:55:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-13-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075544_875040_7C1C7E34 
X-CRM114-Status: GOOD (  21.96  )
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
> Prepare for 2 HWs that sharing pgtable in different power-domains.
> 
> When there are 2 M4U HWs, it may has problem in the flush_range in which
> we get the pm_status via the m4u dev, BUT that function don't reflect the
> real power-domain status of the HW since there may be other HW also use
> that power-domain.
> 
> The function dma_alloc_attrs help allocate the iommu buffer which
> need the corresponding power domain since tlb flush is needed when
> preparing iova. BUT this function only is for allocating buffer,
> we have no good reason to request the user always call pm_runtime_get
> before calling dma_alloc_xxx. Therefore, we add a tlb_flush_all
> in the pm_runtime_resume to make sure the tlb always is clean.
> 
> Another solution is always call pm_runtime_get in the tlb_flush_range.
> This will trigger pm runtime resume/backup so often when the iommu
> power is not active at some time(means user don't call pm_runtime_get
> before calling dma_alloc_xxx), This may cause the performance drop.
> thus we don't use this.
> 
> In other case, the iommu's power should always be active via device
> link with smi.
> 
> The previous SoC don't have PM except mt8192. the mt8192 IOMMU is display's
> power-domain which nearly always is enabled. thus no need fix tags here.
> Prepare for mt8195.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
