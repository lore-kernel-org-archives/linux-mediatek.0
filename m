Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBD19C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 15:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vz3UhWxezotCl6o/Ib4mvjxtVrtmaLqVAs82KGroauk=; b=JNQ4oNP1opxKPza+Qb92LM9XCl
	f0HiWevhe+xrPFAt0SsGjDcfc4qxv7iyooSZdkD9IpGHd9b4g+Xa6W5DZ3vNLXDI88TcToi4SMx45
	+9q6LzgM114KtSno2I77hpqQWCi3Kc0FQP3Hgu7g67V3W6KkopsJashQMC1M6eQ9N42ZYSMX0JoBs
	LvykI6ajFjR1QJjeo3Zp5wxAU16IZcBSahRw4zk9ikc9FJSTNFW6obtl4oR6v+LKitqmvT6qnMUcz
	6x1v0V4px2MnnYx0iBFhu9z3Tzj4jflyEYtlvyA7g2wkfN8JV3WUUKgKVdE3kCVB+7xPohHXlJdfr
	/gmGySgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mBG-00C5yA-KM; Tue, 04 Jan 2022 15:56:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m8r-00C4A2-V3; Tue, 04 Jan 2022 15:54:31 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id B8B151F43596
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311668;
 bh=I/TGeXshiIEtIXNbqSEavdV0+k3jnqVBRVJ7vhGUeSQ=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=HUQfvdW5xT38wE1W3MsaitIaEd8IBiUZn2xO+2pUmUGmuvG3KeiCr2yXQmhY3BzzR
 eQsOCgZA9hFGPvJfyaih9sW3DMvYoierZD2EMdGGGK5C2yqYkHZS6rNdARa82fQhIa
 akuN7P1Iow8fUV7UQzQstdJ+jAJMDaP1Wzc4Pttze4m+PSHfHppWNDbLklU1EHNI+p
 h8ftJc9e5bUIbmXgJlwuo9kITEGRq5GEcTZQ5rALqZV5nqQCV8PAemVsnHJxFItyoS
 cPSIbLrcscSl7S84K0jnF4QvEE+wsMmgIptTaVNaHC6KQ9rCXrnCbpyTGtshUzgFZc
 ZkS5V80/pilxA==
Subject: Re: [PATCH v3 16/33] iommu/mediatek: Add IOMMU_TYPE flag
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
 <20210923115840.17813-17-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <b51db2d3-2788-2d6a-ef40-d842c88eae27@collabora.com>
Date: Tue, 4 Jan 2022 16:54:25 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-17-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075430_194852_B0B5677E 
X-CRM114-Status: GOOD (  11.07  )
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
> Add IOMMU_TYPE definition. In the mt8195, we have another IOMMU_TYPE:
> infra iommu, also there will be another APU_IOMMU, thus, use 2bits for the
> IOMMU_TYPE.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>



Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
