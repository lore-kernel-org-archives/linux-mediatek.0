Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3164DC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 12:22:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9F7060F9B
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 12:22:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E9F7060F9B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiOL/Wu8VdNDAKdFcZ2T1I8Mf+7I0Y2cANcV/qVKF1o=; b=n/jbbC/UaI7GXRO4bBrs4Z/LQe
	1HOHZZA2Yt+DpgItDzmLKC/uK8IqCww868WlLuus7yz4ibA7sJIm8i2auE525JqfNysPdx24QgiDd
	PYIlMwfLklFiA0gU+LhMjDugQr7cgyzkFHIGeCbfN+JAbq0Nt1nsFAt+Y3t8eGgBDRcxv+BCiVZyA
	e3Ss38LpfEGLAJX2BmkBWQglt8y/lNJnLncMBQKwR25kV0IPFNHfZwoke6CDGzU93ggObYOg8TUUz
	s1rBoD5s5IIirffnNEe2GdWvfeYpI8ied9bGaQpvA8ufP2zUg2D/u955v1D298nvA7uUF5swpXuBf
	dwHlXc5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkQ8Z-00209v-6j; Tue, 09 Nov 2021 12:22:03 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkQ8J-00204Q-KY; Tue, 09 Nov 2021 12:21:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: dafna) with ESMTPSA id F1CFE1F44D7E
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636460505; bh=icmFwD1DiBfEau8eUnScXn4nA4/iWPq/nH6eQjEm6v8=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=E985wN/8METi/vHeXCu7xQ7uLE6fvI8c5u7OyY5q5m1WILO849kR3+AL3VTBXW+c2
 stcVgAI/mhzmx4XX0wafjqBIh7cTH19y6mOTRN1n15zASFRNzWx6zm9Fbh1a+IpPwA
 9hBmXkt5n8G9m4xZkKXunZRj42g0XoJQDON4U2kBNG2kjQtRCO86eBvcqjeKJLR7J1
 cVqVZtwhYdqTOR25sSXIQ8cg8SF9wCZULE7Do3JLxRLSmz5LzSuG/ek21D5Sg8Ogz2
 RWhc2IzyQCO+eINdUl/w9OeP0WsTuAjIFVWC8c33RXWqurSflpMgSxJpICG6cpW55z
 SuHtylGB+Geuw==
Subject: Re: [PATCH v3 12/33] iommu/mediatek: Always tlb_flush_all when each
 PM resume
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux-foundation.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, chao.hao@mediatek.com, yen-chang.chen@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, sebastian.reichel@collabora.com,
 Collabora Kernel ML <kernel@collabora.com>
References: <20210923115840.17813-1-yong.wu@mediatek.com>
 <20210923115840.17813-13-yong.wu@mediatek.com>
From: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Message-ID: <c4be1a14-c257-81b7-4a2b-f7e68c32de88@collabora.com>
Date: Tue, 9 Nov 2021 14:21:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-13-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_042147_891928_DE0CE8EB 
X-CRM114-Status: GOOD (  33.68  )
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

Hi
This patch is needed in order to update the tlb when a device is powered on.
Could you send this patch alone without the whole series so it get
accepted easier?
I can resend the patch on your behalf if you want.

Thanks,
Dafna

On 23.09.21 14:58, Yong Wu wrote:
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
> ---
>   drivers/iommu/mtk_iommu.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
> index 44cf5547d084..e9e94944ed91 100644
> --- a/drivers/iommu/mtk_iommu.c
> +++ b/drivers/iommu/mtk_iommu.c
> @@ -984,6 +984,17 @@ static int __maybe_unused mtk_iommu_runtime_resume(struct device *dev)
>   		return ret;
>   	}
>   
> +	/*
> +	 * Users may allocate dma buffer before they call pm_runtime_get, then
> +	 * it will lack the necessary tlb flush.
> +	 *
> +	 * We have no good reason to request the users always call dma_alloc_xx
> +	 * after pm_runtime_get_sync.
> +	 *
> +	 * Thus, Make sure the tlb always is clean after each PM resume.
> +	 */
> +	mtk_iommu_tlb_do_flush_all(data);
> +
>   	/*
>   	 * Uppon first resume, only enable the clk and return, since the values of the
>   	 * registers are not yet set.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
