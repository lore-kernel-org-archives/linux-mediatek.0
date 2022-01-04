Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D511C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 15:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVtQiPhfS+t3mFPMI145Hc53xLzkKsmheANlJK3a34s=; b=O/3O0KBSRT57rtzZ5N7Gp6gXMH
	0jFKPvryEH2Ttzbmn30taGDRzowufK5S4MFZRy0mthkS0fXxte60s2FqI9nU0dK//kFJpLWAZKm1F
	8D7HtRJ46bK0jWU0GhGTh5jh0os+/9y0nNbr9z9IwmmhzdaXrThDIeIeoiQPkH65HgIr4yerTO5AL
	manhJrcwCTI8HQ1YPyEczx1YyUSND4iig/haoELHGD/A8h6HpJ+nSbpEt7n9M8nlJRdB5jt3QcqVF
	/G6hve7mYFgaQklei70Z8OkuJ2PVx4BsZyPFLji5Lvbw8E9IYpBs+guU3ZQovJl/e/C0edaA0Am16
	reDSxvug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4m8e-00C42Q-Vj; Tue, 04 Jan 2022 15:54:17 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m80-00C3hR-LX; Tue, 04 Jan 2022 15:53:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 9B5961F434D9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311615;
 bh=cNd00AijAfU8AatU+tmQmAubCvXlTu/1+TRUQDeo7LM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=g6GxEklG4TK7WDuq2pOGWIgsJtmf/+d2GHHTWjJqo/k62gdnCM4B5DAwJABs1ZseM
 3UtMnPU2JL/kaqN0H1hJzeWHmmhtJnjNXoYoeDuZElLzWXq0IV0ju8o++FA3aGD4Cu
 yolSNexqk4GIrSLDpWPTGrRKBkiY5jz01m1C7Niui2CDC+/Gw5fbi85aRvZX1a/vT+
 FmDN3IHE9S9DO12KsnDSG2iXOrMYPp2LxeSv8WrbusQJBz7B8M46rTpGMs0HZG+YCg
 Qu2XWsKK9QjpzGD+5DrqAbn4pHzY2IJUD6GAKHLEhyN12SyAw30L6D+8F9swCc2R0T
 hOZas5YenRVgg==
Subject: Re: [PATCH v3 29/33] iommu/mediatek: Change the domid to
 iova_region_id
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
 <20210923115840.17813-30-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <bd0a2a6f-5edc-e036-d82a-81dffe31e293@collabora.com>
Date: Tue, 4 Jan 2022 16:53:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-30-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075336_866645_EBA161E3 
X-CRM114-Status: GOOD (  12.02  )
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
> Prepare for adding bankid, also no functional change.
> 
> In the previous SoC, each a iova_region is a domain; In the multi-banks
> case, each a bank is a domain, then the original function name
> "mtk_iommu_get_domain_id" is not proper. Use "iova_region_id" instead of
> "domain_id".
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>



Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
