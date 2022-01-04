Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C937C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRxUbUr8UAXhgu8DBY5/IpoNmZk78LiCMkXvwhR3WBk=; b=D+iCdg3jZprsGxTJbHvmS/4CWx
	ueuLrVmW2kObssUlPNgJTH3MwhLzbLzzAjOZGPcjhks+Y/JfnBQOq5dE/lDt9hzHgBOj9/5PoO2Bz
	SmiFk83i7w/VhZyw/MFq3wl/+Y5/D4p8o376+FRYulxQPt3XTHTSGaLQ7bICSZETmEAeOpyMIgP4Y
	tqnJ0nNAf3Kri6yluH0gHFOAVQdcgSYHi5twQwLxmerL5U7MP2avPH+x4MLeZ2m8GMJnRftKK6Ym6
	nVNv9v/+Rxoi24o9RZcwTaTshDb3N1TITTG/VcayQX2Kg+71TM3IPM5kC277S9U7aaE+Sgxjk+atg
	vT2AY1Qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4mI4-00C9MC-E6; Tue, 04 Jan 2022 16:04:00 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4m9S-00C4eA-Jq; Tue, 04 Jan 2022 15:55:07 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 79D5F1F43598
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641311705;
 bh=pq/JTgM1Y8Z1Sk0vY1Nt0JrvfIMu8/2rCeHaoTIWlBo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MW1aTru7IdhJQrd08iFNoIToZjPwU4YtogjfexL6Gp9MvQuPq+bgq5ZLbEzzzvlfM
 pclJo3CD5sSN20fBdRYdh8Z/P/hGnih6TWpNHPBzSLxc9foTNGAtUDX7gOkv3adbiK
 vJ9VelGnB7Iz732SQCgYsKN32enh4z5VxPqK8pdEEB2l1twYGg8K24opYSaEmSM4Nf
 c8Q7mSOQooGnrl65Edzt3QLxCeNKsJ1d58WNswPkFPmkikF3AfiHtSTV0isPsWUWPq
 zKTV4CBR3pxCHK54z8axAvPm8WqESnKMqEf5u0BL/ieNbAixyRgYR91lcrd4SEaWp5
 0ZPKe3PzSisLw==
Subject: Re: [PATCH v3 17/33] iommu/mediatek: Contain MM IOMMU flow with the
 MM TYPE
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
 <20210923115840.17813-18-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <9e65ac5b-1b8b-03e6-c7f1-7104e96e06d2@collabora.com>
Date: Tue, 4 Jan 2022 16:55:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210923115840.17813-18-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_075506_848442_713C0F67 
X-CRM114-Status: GOOD (  12.28  )
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
> Prepare for supporting INFRA_IOMMU, and APU_IOMMU later.
> 
> For Infra IOMMU/APU IOMMU, it doesn't have the "larb""port". thus, Use
> the MM flag contain the MM_IOMMU special flow, Also, it moves a big
> chunk code about parsing the mediatek,larbs into a function, this is
> only needed for MM IOMMU. and all the current SoC are MM_IOMMU.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>



Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
