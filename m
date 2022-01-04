Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF343C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:11:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iSGRKFS+7kdZWe8mP6YePh9v7nPtYSI53e0ax6/l4Ik=; b=Pi/52qP2/R92BgzS8agarfot48
	P27syb7wx6blLc5z0NWSaw3iL+W4T2nEEV22b5cIMbo3W1IDKfXbFXBMqIeEX+yhXBtcJFmTsGy2R
	nI3T7Ppnk+IVwJ6R0S96w2+X11nlaDI1RRrlCfIR1fLzu3amxFQsZ9oe3T7g/BVhYyOBIVGQ9QUiB
	GpW+QlbZQCvxh4EmxkUbDqfdQxWNr11wzQiZNz7oD95NdBmZ2IC4fhdMGWCPzJTdQpV6R5LUZleZZ
	YxtS0E1coBprPj+N+eY6btA+BRGSbk1a+S7dNfOcQdWShTS9ZnL9lpiBjErQIarK1j84As2LpR8YE
	Z+m0ndaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mP1-00CCVR-1C; Tue, 04 Jan 2022 16:11:11 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4mA7-00C5EM-Bs; Tue, 04 Jan 2022 15:55:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6AD791F43595
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311746;
 bh=qtsUEmGD51j+2uo99ESXu0PQjwuGLjPJy+zkSz7EjSE=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=JICc5cF8qNAmaxQsDW8LUiAiHhoETf7CyEZg6oD2u22vte6wYc3YwTwLW8iJT41Ox
 8Wq32QlhyYM2ayl0M1/5K4FhgV7lnyWT6yO3d0VMxAhz2NQxvTyfyzkQe0UfJkHrkk
 uwkwNdpwdD1bGGpCPLqMdIANj2ecRLmyvc7XN/uv31b/fTuo6SLJIHNMvTW+aAMARq
 pvUSH89KDRK68wTSI5gfwygf4HhnR0P6i32j5MbBN2IfgvKz/Cw84dxZhSmDxuk7gv
 xNkwOKeS6sXswvjMl2TcnjAI1pyCwKYCPLmnjcCpJwfKpvU5Cz5I21LtuIvFS8NpmZ
 JPtjpLKX1Myaw==
Subject: Re: [PATCH v3 05/33] iommu/mediatek: Adapt sharing and non-sharing
 pgtable case
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
 <20210923115840.17813-6-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <06b124b3-fadc-da03-648f-907c622e2272@collabora.com>
Date: Tue, 4 Jan 2022 16:55:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-6-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075547_593187_710DC4C8 
X-CRM114-Status: GOOD (  12.69  )
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
> In previous mt2712, Both IOMMUs are MM IOMMU, and they will share pgtable.
> However in the latest SoC, another is infra IOMMU, there is no reason to
> share pgtable between MM with INFRA IOMMU. This patch manage to
> implement the two case(sharing and non-sharing pgtable).
> 
> Currently we use for_each_m4u to loop the 2 HWs. Add the list_head into
> this macro.
> In the sharing pgtable case, the list_head is the global "m4ulist".
> In the non-sharing pgtable case, the list_head is hw_list_head which is a
> variable in the "data". then for_each_m4u will only loop itself.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
