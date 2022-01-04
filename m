Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50625C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 15:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lLND8mFKp2rV3NHopmrfvHiKdpJhyqUseKAg4sh0OoQ=; b=0D51UPHaMPP6ZyR9V/TF6s5jYu
	HMxtwVo1aww4u6k64RhX0ujDCEFnCyTlRXmlvoC2YpgSdCy91G+8GC5hRE13tICmla4NrLZB4LL4k
	rP8r47aQ3v4gNTS3T3XLWKupgdNAEaZQibb1iCdbX8V/X4wzkBB1CXBOHNH5Ok/KO7KxizdA7FnOF
	jGVGJfH8tz2kE4yhEiW0nxateyHzvWdPO8q+GM/ApG3ekZT3wAkceVsI5CNd7dTsVK10ggXFiBPPp
	tLEshVi5wPDl7kftAjJEZP7oroeZ68hDMrsaMMNLt1oKANRjAZ7mocNRyQvYpSG5CC4GOhHwH/3qU
	lOEPficg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mCm-00C6pE-Sn; Tue, 04 Jan 2022 15:58:32 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m97-00C4LI-U4; Tue, 04 Jan 2022 15:54:50 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A745C1F43593
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311684;
 bh=htPv31qeleLONszyTBV6VHZP/int/iV0NZD4zdhGC3w=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=PNjmaFmhDh1B1oA3OZ2qRiTKOXyLO9Va9evMvCLECIobU+2Np9rjDMbKK0V8+LqRa
 cTbDRhZkehescMPqhkUYrjA2uBfUvKMH5yShtbnc36y5K3Qq62P/r1fGvrzqIaNmb9
 hAcuxUMGVebkD4TEpubxAA7WawtLmZSMOtwol7VgO++0BefFUWEVzKTxNjPKoZrOjd
 0zBMOQJtg7QxdtqjcfhR8as2VppmtIYDM0QBBNFTvbDSYiUyp3K3Xrf7r0VAvjmJoH
 Jy28C8BZRRflyLFGta+cwynjSd4CpVGWVfQwkqqlzwLdDTKg2Au7OecJijGDOG2Y5f
 GOSn1YShJCHEw==
Subject: Re: [PATCH v3 23/33] iommu/mediatek: Add mt8195 support
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
 <20210923115840.17813-24-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <64436ab1-064b-3a99-8ce0-6af6e23d4db8@collabora.com>
Date: Tue, 4 Jan 2022 16:54:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-24-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075446_227660_E2627759 
X-CRM114-Status: GOOD (  10.46  )
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
> mt8195 has 3 IOMMU, containing 2 MM IOMMUs, one is for vdo, the other
> is for vpp. and 1 INFRA IOMMU.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
