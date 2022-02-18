Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D884BC433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 13:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RuXMZ+DRxSpJ3Bze+QSCgFVCOBNfU5pLBXoNJ5+QMN0=; b=H30+Q6lFOunYPH
	+YC6+uaeS8P/Cg9VxMrEMlJNdzZszNStYgS9v6bormGUcyUWjewgniDB1fQcWKP+KzLtSwz/emvmA
	jxDWG1khwFM4KCI5sElx4n+pYXj+stxHuBAcPHijcCqlYqGobOpby0WDlIsL1B1mDH5R29rXfblaF
	ud0H+3gWJR8eVvXkF1SfGMtkZACVMXvU39g+l4iB4cOM6zCP6u6CQiEl01fwcKIa4/ojX8G91J28C
	AsIdj7hmg9k4A1POANf+RuSKDLvvrRkM44RKtjyBx+ma+3+drnj5LO+OjkK0aS7vpnI1I6PW5aHlU
	B06DJGVO3gIVqmzDf7mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL385-00EUkP-Jd; Fri, 18 Feb 2022 13:16:57 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL2kX-00EKFz-4a; Fri, 18 Feb 2022 12:52:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id BB9231F46910
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645188755;
 bh=NFXnrBefp/J/5Gr6/ZFXtadzPDXIH73osHYu1ilvrI4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=T9yMUZQcsLCccMxiGNCW3eVpLugQ11wDo+tAUv6bZ4gs0UHcel9POp4VISzkzON0L
 dJOk2+ORvjNaNvEiQiUvatcRJMplsu2pVnHLcqoT356YzirB7LamiXv3jT+qinx5DE
 qnxBS6Z/bjpZ2pxHiHoMteRWww1ZTAof+bjqGBAEr6I/kI2GLQasjNrlykQYeRYnCi
 E6U2DxZQMjVhhP9eg7UsspUKqozH93Kp8d4kgqH/gNsrjSy8RyMDgcC2UO8vo0JrmU
 jolB5zRsIxdgFAIueGs6+FR3sUfVsiVfpF0jNWS9MODY2wYYsPOJs6R58Iw81W/iaY
 v+rmihOeKnUxw==
Message-ID: <325255a5-4ece-bf3d-a994-d19689b49c2d@collabora.com>
Date: Fri, 18 Feb 2022 13:52:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v5 26/34] iommu/mediatek: Remove mtk_iommu.h
Content-Language: en-US
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
References: <20220217113453.13658-1-yong.wu@mediatek.com>
 <20220217113453.13658-27-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220217113453.13658-27-yong.wu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_045237_397128_AE1BD5BB 
X-CRM114-Status: GOOD (  14.41  )
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

Il 17/02/22 12:34, Yong Wu ha scritto:
> Currently there is only compare_of/release_of/a suspend structure in the
> header file. I think it is no need to keep a header file only for these.
> Move these into the c file and rm this header file.
> 
> I think there should be a common helper for compare_of and release_of.
> There is many copy in drm, it should be another topic.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/iommu/mtk_iommu.c    | 25 ++++++++++++++++++++-
>   drivers/iommu/mtk_iommu.h    | 42 ------------------------------------
>   drivers/iommu/mtk_iommu_v1.c | 21 +++++++++++++++---
>   3 files changed, 42 insertions(+), 46 deletions(-)
>   delete mode 100644 drivers/iommu/mtk_iommu.h
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
