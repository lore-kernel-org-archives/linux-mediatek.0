Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D571EC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PBWgyMSvkoo0kdDPnrf2wCtiPJKeB8ZGC+XCBFxmz5I=; b=fuwwvfxWtzVL9yCuwsr/4GPayH
	MAvxRgAXhlKwEvELbQ+0eWSyQtoFJcn0Hxl4mKPubG/2NgwE0OMuA7EGijFH8a8DtTql1ef0R/mMk
	KhYSaSfy4cUjdFGad2bpsZreCsiPbTqM1jEMHvVs+hlocAyG5r7hvZvs9fDFGOW28UGxOO7lLCl2w
	cCzyyAVjpbYJ2mIiBmV0si6A27z3kLaBGNkqrr5LSnCioK4hwz681gqkVmXi4dDlSgaXLqIwZbAgL
	Cuz/DPM7YGXX2GNnskI/lwRl8B1x1WV32vRjr+MHHVAu3MskRHox7aw4UHw3eezxK/r1XNBAPZCmR
	JfKl6t0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mML-00CB8n-9W; Tue, 04 Jan 2022 16:08:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m9l-00C4ve-Ez; Tue, 04 Jan 2022 15:55:26 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 595281F43595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311724;
 bh=mT55sEIhz+ZViNl1TjdLrnqAEkSGD0ha5i2STjrdvA0=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZNbkj8e6y+LgMWHeFEfa+iWF8ALjy7AZee0LzFDih7hG97iQr1CXdNT6ACwpPNc6u
 n56MyNtfhzWCw6KNdIOa8fYIB+bMAc8ho5eetsvJ3Fc45BGlJk9IDQSkW0GGq7mFEK
 vOjZH3a/yqiZASpAWCQlJoTF9mmNYOUZHdGCEvuqzG7OCcXzHJ8WGji3ypr+AGvJYY
 IJJ5ALJxaoBRmcmWU8X0oTeYNN6iSzMNA6EyKgxQa+7vaO9LfXign1/KG8Qy3YotsR
 6Vb0+0+puysGL07M7LfolZMhpKjckvMyRkfJVxft9bDQYGzCZKwgLDqZCmV5qPvObw
 QrtuPyHD8nHzw==
Subject: Re: [PATCH v3 10/33] iommu/mediatek: Add tlb_lock in tlb_flush_all
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
 <20210923115840.17813-11-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <4444ddfd-c028-9549-0a1a-a3380fdd2d54@collabora.com>
Date: Tue, 4 Jan 2022 16:55:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-11-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075525_692026_C4F9DFFE 
X-CRM114-Status: GOOD (  11.45  )
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
> The tlb_flush_all also touches the registers about tlb operations.
> Add spinlock in it to protect the tlb registers. since the tlb_range
> already hold the spinlock, move it a bit outside the spinlock to
> print log.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
