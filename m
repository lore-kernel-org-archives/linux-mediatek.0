Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0604DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jan 2022 11:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FTAX1csFyf3GQQAv09DsQeVylhLIbSb9kPd5x5Gm0rE=; b=Lbx45mt08f/RPuBu8/nmiCBu4I
	UX6GczgZ44sgWN5GEP2JVXMOZuERyDvNxKmDpuSzRtHxD2qegod93+3eiWiKv3Y8HQcH8WX038wcm
	uluk1mJSPvE0p+Rlo/ZiW054gP2yCA5Fohg86HDsARqCE+zjNX8Wzc225BdJpJIW1VYJvpTs4U90x
	Yh4rwbBsZxz+SmnlSQJIz1XQoHLBgKQGR1VUARGa6UQqU+8tYpgmAjvFhBn+9mx74z6lFDZrP//RL
	WgXxyux5ldaMMZRu9K5BuiYlA2v77VDERN63n8m5HMR6w/O+hd7Mrp1kNJHBtL8oBLTftYAssA3cU
	XWaZNOGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n6t6C-00BARl-L7; Mon, 10 Jan 2022 11:44:28 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n6t5a-00BA1a-B6; Mon, 10 Jan 2022 11:43:51 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 820AD1F41050
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641815029;
 bh=uuV0Epzk3gnedbGM5nYSmM92AIVHPp2psXKWjNKXehw=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=WREfHH3VNKZ3seg60JNQO3Fi3Dk/N7tcQ33MIfJeskUq2VJAqGKk7Udgz2sEjQp3i
 2e80eQSixi7eeAV7Z3NXxPVYylvhsRvqbKuPqa0kUNUmu1EaUr6zhIr7+a781648fM
 aPvHxOL7meGaspCUQ6woaS8+t74/0YJ40zPraeA1IIhSwNsXO8IcFS9jery6X4QaLi
 uG1Vo3JZ8TysSP1YaDmpUyWSlcUYSS6V5K6u8v/Eqwt/B+gasmiKhbD3B7k/IX2GhP
 H2kj3+sN9R20jQnWhJ91HGAX9m/pUlEs7W2zp6XBkzfnjV7VtTkXwSgEZx795Ii7nT
 JDU+TlY+gNUXQ==
Subject: Re: [PATCH v2 3/5] iommu/mediatek: Remove the power status checking
 in tlb flush all
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
 <20211208120744.2415-4-dafna.hirschfeld@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <10ca4eae-2959-a697-6818-308e04f88e14@collabora.com>
Date: Mon, 10 Jan 2022 12:43:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211208120744.2415-4-dafna.hirschfeld@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_034350_580240_9949F4BA 
X-CRM114-Status: GOOD (  13.97  )
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
> To simplify the code, Remove the power status checking in the
> tlb_flush_all, remove this:
>     if (pm_runtime_get_if_in_use(data->dev) <= 0)
> 	    continue;
> 
> The mtk_iommu_tlb_flush_all is called from
> a) isr
> b) tlb flush range fail case
> c) iommu_create_device_direct_mappings
> 
> In first two cases, the power and clock are always enabled.
> In the third case tlb flush is unnecessary because in a later patch
> in the series a full flush from the pm_runtime_resume callback is added.
> 
> In addition, writing the tlb control register when the iommu is not resumed
> is ok and the write is ignored.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> [refactor commit log]
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
