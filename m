Return-Path: <SRS0=IDfX=PQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 672F3C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 11:05:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33C3F60F9C
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Oct 2021 11:05:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33C3F60F9C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BshvG1KLVsjs171H9XW5NkRSTK7jMNhKe6zRXe8zU7E=; b=0YJbw5oowCB0ji
	DFl+uvx7l9wiaI+xBZNBRGA+rxpBk4EQRiDfhM/oqcUdKpm2BvoWdag2/jabmKkpCgc6Q2U3X65SW
	VausVPwQcPj+tIW5OqX1WoW48YUSGioTfqkAxda2uVBqx8wbVbPLjdcG27aVAsF7XZeGky09etDU4
	pIz4gOF1AvrpbierM0wVwQ5MDdPlHhW3tJ/ytDWd9UXg1/ksMrPmBeDcj7GvOcpjuZEf2UWBZT2l1
	TsoTm3gL1HjfKlOb+egblr2Us3xu3O7nuJzXF2E9gPkfYvB2+PokKbyfySDBetBAAA/Jy7A7Pm+Ik
	6HlKecZZeyGKXbvqxtMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mg3Dz-007dBo-Ts; Thu, 28 Oct 2021 11:05:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mg3Dh-007dAm-IM; Thu, 28 Oct 2021 11:05:24 +0000
X-UUID: 7f8cd31ee8934f0d9fa16dc4f177db9c-20211028
X-UUID: 7f8cd31ee8934f0d9fa16dc4f177db9c-20211028
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <chun-jie.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1912494540; Thu, 28 Oct 2021 04:05:12 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 28 Oct 2021 04:05:10 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 28 Oct 2021 19:05:09 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs10n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 28 Oct 2021 19:05:09 +0800
Message-ID: <ea5121081d94962e7f73691d7394e2939e45f222.camel@mediatek.com>
Subject: Re: [v5 0/5] Mediatek MT8195 power domain support
From: Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Enric Balletbo Serra <eballetbo@gmail.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, "Rob
 Herring" <robh+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Thu, 28 Oct 2021 19:05:09 +0800
In-Reply-To: <20210913102232.26344-1-chun-jie.chen@mediatek.com>
References: <20210913102232.26344-1-chun-jie.chen@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211028_040517_646879_22D03BA4 
X-CRM114-Status: GOOD (  16.94  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-09-13 at 18:22 +0800, Chun-Jie Chen wrote:
> This patch series adds power domain support for MT8195
> and is based on 5.15-rc1.
> 

Dear Matthias,

Do you have comment about this patch series?

Thanks! 

> change since v4:
> - rebase to 5.15-rc1 (fix conflict at patch 4 in this series)
> - change license
> 
> change since v3:
> - remove redundant bus protection steps
> - remove unused power domain
> 
> change since v2:
> - move modification of wakeup capacity to single patch
> 
> reason for resend v2:
> - miss patch version in series
> 
> changes since v1:
> - fix signed-off name
> - describe more detail in patch 3
> - move modification of removing redundant macro to single patch
> 
> 
> Chun-Jie Chen (5):
>   dt-bindings: power: Add MT8195 power domains
>   soc: mediatek: pm-domains: Add wakeup capacity support in power
> domain
>   soc: mediatek: pm-domains: Remove unused macro
>   soc: mediatek: pm-domains: Move power status offset to power domain
>     data
>   soc: mediatek: pm-domains: Add support for mt8195
> 
>  .../power/mediatek,power-controller.yaml      |   2 +
>  drivers/soc/mediatek/mt8167-pm-domains.h      |  16 +-
>  drivers/soc/mediatek/mt8173-pm-domains.h      |  22 +-
>  drivers/soc/mediatek/mt8183-pm-domains.h      |  32 +-
>  drivers/soc/mediatek/mt8192-pm-domains.h      |  44 +-
>  drivers/soc/mediatek/mt8195-pm-domains.h      | 613
> ++++++++++++++++++
>  drivers/soc/mediatek/mtk-pm-domains.c         |  12 +-
>  drivers/soc/mediatek/mtk-pm-domains.h         |   8 +-
>  include/dt-bindings/power/mt8195-power.h      |  46 ++
>  include/linux/soc/mediatek/infracfg.h         |  82 +++
>  10 files changed, 862 insertions(+), 15 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mt8195-pm-domains.h
>  create mode 100644 include/dt-bindings/power/mt8195-power.h
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
