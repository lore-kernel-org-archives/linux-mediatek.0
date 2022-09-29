Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2C50C07E9D
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 06:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YI1zZfxac4tCJibwnL4J9lXHvkx5ulDsGyMM0uD184w=; b=d8F3jUlPvaVapOnbTCnR6vcTra
	pMkyJiHzN/8Zv2XY7GjJ6CdpUUGo5JqUj+igiMw284ofTCD/vYJiQ1vvE0+BJMa3jrmYx66GXEeQS
	3jKlXtccu4VPuD07EGH2IkuxrkJQW+wl1vzL9WnnxFiP1bzpiTgd0AU9yyRVuBNZ0Gwlq/EjjkdBo
	UhuML0mg2BlHQPrHFowNMLuDsm8RdLF9rvGS0ksS9OJ87lYB2PnzcLKMsfqmogVTPBprcgCNaSFzQ
	si6xNJeVgUs8eBoRqp23FcXqkYFYzs7DpOuAx8/SfLjcgythZ1lugG7hKy70gwmPZWGPMLIJleTNg
	x15pNjfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odmnP-001LEV-8v; Thu, 29 Sep 2022 06:13:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odmnL-001LCA-JK; Thu, 29 Sep 2022 06:13:17 +0000
X-UUID: 90fb21e42fef46bc9375e2e015097532-20220928
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=YI1zZfxac4tCJibwnL4J9lXHvkx5ulDsGyMM0uD184w=;
	b=VOZOFACEsHI49YLjAmOycGSVcBmtYtMfj+FRNvZ+XHlPiDpqBvgcXSVdu9N6uKuBxtTho+zx+wQ2VxlkqyoCE/sbDTH699aYBnrVm8CN6t0VHD0zl/haAGzNNlgLHAQjNv768V3LcTIITQmS6vIGUvAL1l3KrGRcy7HtsP5dylE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:cb2c8ed2-6485-4d8a-9a71-57bff05983e8,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:cbe275a3-dc04-435c-b19b-71e131a5fc35,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 90fb21e42fef46bc9375e2e015097532-20220928
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 510617501; Wed, 28 Sep 2022 23:13:00 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 29 Sep 2022 14:12:24 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 29 Sep 2022 14:12:24 +0800
Message-ID: <425623b6368ffb1193033cfbd6256d1eb77fec80.camel@mediatek.com>
Subject: Re: [PATCH 2/2] phy: mediatek: tphy: add debugfs files
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Vinod Koul <vkoul@kernel.org>
CC: Kishon Vijay Abraham I <kishon@ti.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-phy@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, Eddie Hung <eddie.hung@mediatek.com>,
	Tianping Fang <tianping.fang@mediatek.com>
Date: Thu, 29 Sep 2022 14:12:23 +0800
In-Reply-To: <6ae64f49-5ab9-0b37-ae2c-5519c21a5d73@collabora.com>
References: <20220928093041.31481-1-chunfeng.yun@mediatek.com>
	 <20220928093041.31481-2-chunfeng.yun@mediatek.com>
	 <6ae64f49-5ab9-0b37-ae2c-5519c21a5d73@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_231315_686950_71EEF143 
X-CRM114-Status: GOOD (  16.17  )
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

On Wed, 2022-09-28 at 15:35 +0200, AngeloGioacchino Del Regno wrote:
> Il 28/09/22 11:30, Chunfeng Yun ha scritto:
> > These debugfs files are mainly used to make eye diagram test
> > easier,
> > especially helpful to do HQA test for a new IC without efuse
> > enabled.
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> 
> Even though this won't be interesting for the vast majority of the
> people
> out there (the users!), it's still nice to have it for IC testing
> performed
> directly on upstream, as that opens new possibilities for you and
> ODMs/OEMs,
> so I agree on getting that code upstreamed.
> 
> For that reason, I think that the best approach for this one would be
> to
> enclose it in a configuration option like CONFIG_PHY_MTK_TPHY_DEBUGFS
> or
> CONFIG_PHY_MTK_TPHY_DEBUG, so that this very low level debugging code
> doesn't end up in end-user builds, as that may, in some cases, be
> even
> dangerous.
Yes, It seems better, I'll modify it, thanks a lot

> 
> Regards,
> Angelo
> 


