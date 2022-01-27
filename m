Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF995C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 11:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AfA5OUAPFGwJR6PTnnxgbz8O4DP5alyu7cTIcddNBIQ=; b=HaG5BuqVlWAxLpghAkFIlxWHe9
	5wHQHKVFt0k07a9D3y07YeGEo3CyqgbQfLSGn5PMgAkUUNQDvqKZCrCupkWTry+oyN5I7Cx5gGEIO
	+2NnCD3GLJ430kwz2jI9Yp5DH/M0eNB/GnS2VygVtTMQhZufsFqbQ3IdHXyBVM7sE5GqW5ZcKeU8j
	IWlD3736xVFxc2DOzFfKH6mAjY2ddHMhjqdFZ1H37We7w0sQufDQzQMWHXKkCxVvkKIrSZb32k9tv
	wCWYoRM/i8ODnSIK6rb0ugh8nCvutBqMpBhESgNM8vMogEGZYMxiMY49mO9ZXbrIPcT5KpAkuyw8H
	6V0RI62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2ob-00FO3H-K3; Thu, 27 Jan 2022 11:19:45 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2mD-00FMxL-36; Thu, 27 Jan 2022 11:17:18 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B033F1F45091
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643282235;
 bh=wZVt4wJ3ZIXwm5J3WkeI7DmuycE/6AgP9kxAmGl4MHk=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=RNpe9lY8NzKzJx8wUI+P77Ig0n7bSCYdR9WTVZzouOFw6c+LfKA1Kt6KIFOmCSjO3
 avcutdFnsOoW1N8IruruloGhYR9o1NgPvQA9mABR7Hq6ejP6NEhREHIAebGIbyhdth
 JWEWY7k+uAPjmo6BIPgOdD+0ZBOteQayMekEJAe/9ShguNUg/kwbt+LaRquKUT+Xwo
 GqBDAk/5+240cemf8Zn5kFDGKBolI2674mKtm4AnCwRaX3x0EM8gzJrDz8iH5chhlT
 Wxkpzu2KUmN92wCeUPl7swGx4YViUtqUfuuLRXa7vr8vZjpUjx4IjJLsuKQta7zGgw
 6/0p+2qKt+SYA==
Subject: Re: [PATCH v4 29/35] iommu/mediatek: Add mtk_iommu_bank_data structure
To: Yong Wu <yong.wu@mediatek.com>, Joerg Roedel <joro@8bytes.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, Hsin-Yi Wang <hsinyi@chromium.org>,
 youlin.pei@mediatek.com, anan.sun@mediatek.com, xueqi.zhang@mediatek.com,
 yen-chang.chen@mediatek.com, mingyuan.ma@mediatek.com, yf.wang@mediatek.com,
 libo.kang@mediatek.com, chengci.xu@mediatek.com
References: <20220125085634.17972-1-yong.wu@mediatek.com>
 <20220125085634.17972-30-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <fd39758a-b5a7-c6d9-3d29-0c6221d0c533@collabora.com>
Date: Thu, 27 Jan 2022 12:17:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220125085634.17972-30-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_031717_322970_4527ACAB 
X-CRM114-Status: GOOD (  13.04  )
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

Il 25/01/22 09:56, Yong Wu ha scritto:
> Prepare for supporting multi-banks for the IOMMU HW, No functional change.
> 
> Add a new structure(mtk_iommu_bank_data) for each a bank. Each a bank have
> the independent HW base/IRQ/tlb-range ops, and each a bank has its special
> iommu-domain(independent pgtable), thus, also move the domain information
> into it.
> 
> In previous SoC, we have only one bank which could be treated as bank0(
> bankid always is 0 for the previous SoC).
> 
> After adding this structure, the tlb operations and irq could use
> bank_data as parameter.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
