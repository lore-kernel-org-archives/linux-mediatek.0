Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F00CC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 11:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEsh2zVbP3QKIW32rxsliGQMV6KTfJkiGRMHuKI16Gg=; b=EOMlJ3PPI427z455JF4hp+LI3Q
	p0cdaewQJeLLPy0/UV4abSovtQy4g1hHAdFlE0mlmsotUtgzbTdJsHGyafSn46qGpqOwfAggpmYsv
	W/+BXb6pe0tlJ7OFyOmicT2sUNHSmjGwpEfWPFQrWhBHfb+/udKeL/BIftFk0uyv68KCm3hvrXwDa
	xTBU57FbZTNDo2e3eycJ+qLIh8b+k/qPU8NIn3QDEZB5JMxt5DZfQkqBvsfL8FBw8izildD3JUv8K
	kcdfqiLWdCLnxSfESOoBbR5LCxXhCQmCsPXN1V70uqhhfMSmcRhkpkZMhDy2z+cbf3lPsJW5V32lP
	6EqTWifg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD2te-00FQF5-7U; Thu, 27 Jan 2022 11:24:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD2t0-00FQ0y-C3; Thu, 27 Jan 2022 11:24:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E612D1F450C8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643282656;
 bh=xoJYb7yLNdqcLOsJBRdXhk1XOETuJ9T5Y6SWYvR+lRs=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ACpOQoxj+c5UV+KWe8EZFPgr1ZsW6yaxb1gX7+tXDKMZ1oMHxWGguvHmprL3xI5EO
 KQ1DMMBKcz/anWkLRuY3an5gRWvNJBadkVUKG4DN1K+ZMBVKZjugEKR5EpntlqQXhB
 Sm7rBtosZc5tFlwrTVeMgAly3MVqBpaYlcem5nN+bTkoNU27k6VsBO6GVr1HNbpEhC
 90wPhdHiwpnalYIhSmwyx/2+dL1bf68Zi8Hdh43pWnemI3P/7khEnRfcDk5z8KGpEg
 PAykca/s0HG8ZTwbE4TR8l4aVXGwpe2DHhthmfpsjLWj7DS0vk45bHJE+4WekaKFXF
 ogP8vC1fWSWiA==
Subject: Re: [PATCH v4 34/35] iommu/mediatek: Backup/restore regsiters for
 multi banks
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
 <20220125085634.17972-35-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <471f2317-24eb-9d94-8ba2-1124cdc95ed6@collabora.com>
Date: Thu, 27 Jan 2022 12:24:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220125085634.17972-35-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_032418_600499_5EA475DD 
X-CRM114-Status: UNSURE (   8.85  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 25/01/22 09:56, Yong Wu ha scritto:
> Each bank has some independent registers. thus backup/restore them for
> each a bank when suspend and resume.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
