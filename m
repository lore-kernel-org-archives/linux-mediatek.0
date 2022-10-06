Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1659C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 11:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BDnSL/JPjtSGprjeE4z6z5WlilRjfZmxNugqgexPmCE=; b=01qVvC37+ONIXbAIFdkylTVQHB
	oclzmKPspP/5kXQbL920rBqqnXb+oKH+QMNyiS9G9qg3f20paJlMvCVx3fOiyDp9JMBMoTLWZfDS8
	pMAnHy4LjQ8OorZH9RLAn5g0eZ9cqhl3YomUviEaARV36oksGMKcwUST5WKp5cuEMR5btwHFFglsp
	t8faKDWG646smsCEPfjZtEUd8XO1MDxS6AnaIiHBH0Wkwc4UyVjc+sCP51RXq4+ObXlz+MnoKg44D
	BEQ3FDeE0ZXNtsOvlXnBOikBR6gZmUvpDNYCxYP5qZ7bPdGKCExB0bYZj4UcuypZw+h3aNGBhRYwA
	tu8bDpTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPJ8-0020d4-Ee; Thu, 06 Oct 2022 11:44:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogPIf-0020KZ-IA; Thu, 06 Oct 2022 11:44:28 +0000
X-UUID: 0c25bdea56774f1a9e8d37dfd47204ce-20221006
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=BDnSL/JPjtSGprjeE4z6z5WlilRjfZmxNugqgexPmCE=;
	b=GRUB3WnCBotxWZGQ9en4RcbKV2Z86Al12y7pJkeCzq1kiu0HAAcVFXSEgOP+RJC08sUfrSpRAKVq6+RPn5VLXPpnk57cXCK/2W/dINl8iD/bNE1nGHgAnbPAPfjzEVpZgwrMjABM/Qt2gxrJb/cyKOtWxshN38lFtiLDGglIvWA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:d264124f-70a6-4351-84aa-31263e1d6c17,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:39a5ff1,CLOUDID:8cd872fe-ee8c-4ff7-afe9-644435e96625,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0c25bdea56774f1a9e8d37dfd47204ce-20221006
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 779311926; Thu, 06 Oct 2022 04:44:15 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 6 Oct 2022 19:43:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 6 Oct 2022 19:43:39 +0800
Message-ID: <b15a1fdfaf6d40be8abaa3b0f60a8931c3c356fa.camel@mediatek.com>
Subject: Re: [PATCH 0/8] soc: mediatek: mtk-svs: refactor and cleanup the
 driver
From: Roger Lu <roger.lu@mediatek.com>
To: <matthias.bgg@kernel.org>, <jia-wei.chang@mediatek.com>
CC: <nfraprado@collabora.com>, <khilman@baylibre.com>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<angelogioacchino.delregno@collabora.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>
Date: Thu, 6 Oct 2022 19:43:39 +0800
In-Reply-To: <20220928155519.31977-1-matthias.bgg@kernel.org>
References: <20220928155519.31977-1-matthias.bgg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_044425_676366_B46E2DBD 
X-CRM114-Status: GOOD (  17.24  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Matthias Sir,

Thanks for sharing these great ideas to improve MTK SVS driver. I've added some
feedback to this patchset. However, should I just submit the v2 of these patches
for you to review? Thanks very much.

Sincerely,
Roger Lu.

On Wed, 2022-09-28 at 17:55 +0200, matthias.bgg@kernel.org wrote:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> Mediatek SVS driver got accepted upstream but has coding style issues
> which were overseen in the review process. This series is a first step
> to clean up the driver. It basically cleans up the SoC specific probe.
> As next step we will need to clean up the 'struct svs_bank'.
> 
> This series should be a mere cleanup with no functional change. I'm
> happy to recieve tested-by tags to make sure it does not break anything.
> 
> 
> Matthias Brugger (8):
>   soc: mediatek: mtk-svs: clean up platform probing
>   soc: mediatek: mtk-svs: improve readability of platform_probe
>   soc: mediatek: mtk-svs: move svs_platform_probe into probe
>   soc: mediatek: mtk-svs: delete superfluous platform data entries
>   soc: mediatek: mtk-svs: Move SoC specific functions to new files
>   soc: mtk-svs: mt8183: Move thermal parsing in new function
>   soc: mtk-svs: mt8183: refactor o_slope calculation
>   soc: mtk-svs: mt8192: fix bank data
> 
>  drivers/soc/mediatek/Makefile         |   3 +-
>  drivers/soc/mediatek/mt8183-svs.h     | 113 ++++
>  drivers/soc/mediatek/mt8192-svs.h     |  64 ++
>  drivers/soc/mediatek/mtk-svs-mt8183.c | 235 +++++++
>  drivers/soc/mediatek/mtk-svs-mt8192.c |  98 +++
>  drivers/soc/mediatek/mtk-svs.c        | 882 ++------------------------
>  drivers/soc/mediatek/mtk-svs.h        | 279 ++++++++
>  7 files changed, 853 insertions(+), 821 deletions(-)
>  create mode 100644 drivers/soc/mediatek/mt8183-svs.h
>  create mode 100644 drivers/soc/mediatek/mt8192-svs.h
>  create mode 100644 drivers/soc/mediatek/mtk-svs-mt8183.c
>  create mode 100644 drivers/soc/mediatek/mtk-svs-mt8192.c
>  create mode 100644 drivers/soc/mediatek/mtk-svs.h
> 


