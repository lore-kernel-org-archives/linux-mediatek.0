Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DA73C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yJ0sQWtfGyF2krkWO8XTQttU7VSaxeRO1uMO3XDBh5w=; b=KZWytjPmuFTAbaypXQ+SNk5OAU
	ih14Q6FDVITSVpq/9fAHR5WThWKfQc072B9LrC+0EpzJVu+KNG0O1oHgLdjd033+DQR5kHlR7iVFw
	Lpx6a1zL+/fctIpg1J9amePCAF4nQxW8vH13btTbmNvflU/AJWoIEKk+bJ3Ta39zEAZnJb5HdvKXF
	7VWlwDJ528GhS4TtsGIYjWJm70HkvaN95KVY2K+J5LrqQbzio5L0Gag+jG4MtGuyLLZ4bQjylMDyL
	Dw5I21Pt32UbI5yK0wqP4niL3Dl1qo7YzAWUx/HlkCdSrSrRhB7/BLD4rsX6g+2IOBO6dtXCuwctB
	prhI0GcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mEy-00C7tL-Cp; Tue, 04 Jan 2022 16:00:48 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m9I-00C4VZ-MX; Tue, 04 Jan 2022 15:54:58 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 47BA81F43593
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311695;
 bh=nZtZOEtytaUQcxSF0fDujQOcByfRCuHgzsSYmEcHraA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=ZECJ1qAJpbp/5J99/GNFFYUnVXcBNUp1NkoItJ2S6Qk9Emdi8DIiBmmNOmkZSx0oJ
 IoVLOG2n9g42K/EDPtxIUrS8JSKEapnaZcUbTPfig1V8A84+J2cfYZSkdO88OsiWXh
 WsTQMVfIu1zz+4P5HE3Sd1V5WOgRRsBnwOcuX4rz1jPSRr3mlqqptssnIFpmUcDKmA
 ZVHGs+RUVJ/7mX5RKLgtzqPSeFGcKOg9r7EdA2zgpT+tHAgHSyCeL7L+G6/fEU7bNN
 5BlesiGLftMpWBgxTpc0UcXlXFkK9IAyWe1Hm/eVn+e/JKzO3oj2W4/oZmKWQJB9jh
 GuClj0bbWHQJQ==
Subject: Re: [PATCH v3 21/33] iommu/mediatek: Add infra iommu support
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
 <20210923115840.17813-22-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <f1e93e9e-cc89-146a-410f-13ea94445d31@collabora.com>
Date: Tue, 4 Jan 2022 16:54:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-22-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075456_928182_B4EB6ED2 
X-CRM114-Status: GOOD (  12.08  )
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
> The infra iommu enable bits in mt8195 is in the pericfg register segment,
> use regmap to update it.
> 
> If infra iommu master translation fault, It don't have the larbid/portid,
> thus print out the whole register value.
> 
> Since regmap_update_bits may fail, add return value for mtk_iommu_config.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>



Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
