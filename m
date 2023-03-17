Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F82C74A5B
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Mar 2023 09:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+l1hZ9NzZ75D+jHT3PrwMcT35YLYHuxlN7ZxkIGBeVw=; b=sQsUKcdQo3/J5/JDeqajpSzA7w
	E8Z2uYjZNAUpo0y210wJozavG9alnjPwxRfo1Sx3FIZt3JcKx5J2IAkcd8eBy7ztHfpuuJOl9SJ48
	bXFzbiwbul2tCMsMkwLdtFyf+AjIMPj/TWIq+jmbTt9rKkx9cwnFwUJ+J7WgbfqBwS9AECTQ/e6UY
	hda6DBOPIsrIktzWOGEKxMK09XXt1+NBnFNlW9/crU4ITGCvKPM8LiiRS2fw45AXjkxqk0ePYQgWZ
	YkQXDZ0edtI8RcC/y6P6iMWrlxc9OuHkPai+zitRaBoGk2KjeifoF3W0D9NfhrlvoCiWg0rzBRxI9
	iFovNNIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6TR-001kTW-2b;
	Fri, 17 Mar 2023 09:34:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pd6TN-001kRM-2P;
	Fri, 17 Mar 2023 09:34:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 39E39660309E;
	Fri, 17 Mar 2023 09:34:03 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1679045644;
	bh=1yPL1wgWfhKqd3K689q3KbObv9DTbPB134duvaI4fJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FrsJg9aiznLOzH2cHpyWLfhbcT5t/We9O9cErP11nrMTVJs0W4iVqtccOKpt9eRPq
	 UyoMH2zkqbyx1nOmRv+ELsYz+ZPMTnhXAg331YeyQXLsrUwpdsnVags9JpgGET5jwH
	 P13gZdO7+lKLoBU4qkapRJoOex4NdqIejG5embgk7boN/kT+tnrH6pqbvFYsQ53laL
	 K8V5wb5SUrugbD+Oy5e+tzbTR2QDbn6g3aoaV5oePw1L+oqug4WMRbCg0iQ0vX66xO
	 b9WDOw26jv3wXcVkALD98n7niKP1jTErcTPljcO4plH7L5nWXm3nWoSJGkLDrl2xG8
	 0hB1/RwxJC6hA==
Message-ID: <47cac7a6-c069-64a2-7979-b879b075058f@collabora.com>
Date: Fri, 17 Mar 2023 10:34:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v9 2/7] iommu/mediatek: Fix two IOMMU share pagetable
 issue
Content-Language: en-US
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 iommu@lists.linux.dev, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, mingyuan.ma@mediatek.com,
 yf.wang@mediatek.com, jianjiao.zeng@mediatek.com, chengci.xu@mediatek.com
References: <20230317085541.20447-1-yong.wu@mediatek.com>
 <20230317085541.20447-3-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230317085541.20447-3-yong.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_023405_910596_14C1160C 
X-CRM114-Status: GOOD (  19.71  )
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

Il 17/03/23 09:55, Yong Wu ha scritto:
> From: "Chengci.Xu" <chengci.xu@mediatek.com>
> 
> Prepare for mt8188 to fix a two IOMMU HWs share pagetable issue.
> 
> We have two MM IOMMU HWs in mt8188, one is VPP-IOMMU, another is VDO-IOMMU.
> The 2 MM IOMMU HWs share pagetable don't work in this case:
>   a) VPP-IOMMU probe firstly.
>   b) VDO-IOMMU probe.
>   c) The master for VDO-IOMMU probe (means frstdata is vpp-iommu).
>   d) The master in another domain probe. No matter it is vdo or vpp.
> Then it still create a new pagetable in step d). The problem is
> "frstdata->bank[0]->m4u_dom" was not initialized. Then when d) enter, it
> still create a new one.
> 
> In this patch, we create a new variable "share_dom" for this share
> pgtable case, it should be helpful for readable. and put all the share
> pgtable logic in the mtk_iommu_domain_finalise.
> 
> In mt8195, the master of VPP-IOMMU probes before than VDO-IOMMU
> from its dtsi node sequence, we don't see this issue in it. Prepare for
> mt8188.
> 
> Signed-off-by: Chengci.Xu <chengci.xu@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

I'm not sure whether this is *not* a fix... if a specific platform wasn't
affected, this may still be a logic mistake... to be cautious, I would
still add a Fixes tag to this one.

Otherwise, I would reword the commit title and remove the "Fix" word, so
that it would look something like...

iommu/mediatek: Prepare for pagetables domain sharing

I'm sorry for noticing that only at v9, but the previous versions had a bit
more stuff to address and couldn't really focus on analyzing this one.

If there's anything I've misunderstood about this patch, please feel free
to explain.

Regards,
Angelo


