Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E32DC54EE9
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 01:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MTgosqH3cM6tRY7+7QUh5eeeP+fTxZK2M7/kAsRs8f0=; b=A9RHV0qPfehlZoK7nCnp7WbMbU
	SLz227cTLI9xAisrE/r6V6XE2ryMDJRd8j8PggspPAONPRcsAHy5yvjAWe/8e96C3qyJm6y8YCvGm
	f6taaoygl0J5vQVPvArm/29jMMmygGItxu/ujTo5A7evT5Aw6v5rT7U4d8+nAU/iQLG3BVWF/oBgU
	i6OjT2y3JzmT8nVh9Ke2jC0OeCfz01yYdqtIrXsXbY9cgkjhczsPJx61nqEtOnoCCGGwHhNaLHlL5
	txrOURPT7p2Upr5MhBCLleXcXkglsZ61UqxGPoGnpOfXasaukGbnunY66a3MEFJBaSVgTWy2AvDTM
	wSIHsKmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYH0C-003HIA-HW; Wed, 14 Sep 2022 01:15:44 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYGzz-003Gkf-GR; Wed, 14 Sep 2022 01:15:33 +0000
X-UUID: acc6529a0dca4b7fad0d319562694fd6-20220913
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=MTgosqH3cM6tRY7+7QUh5eeeP+fTxZK2M7/kAsRs8f0=;
	b=XJawyV19zGwUbbtryySQK2VxKzwFcQ7yQy9METokfPKhmKqUOM0kUMXXG6jUKBMy8iw3Jgpbnt0M51GwLxr3hcv6BTtTMSPnm6ynJIPJDoM85h5RN0na2jKg1HJkW0ZNmmutijoge0EtvQ3jE/9oNHF5T4be8bCNgWASNpZneb4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:2a8fc8d2-3752-4829-a00b-7cc01fb59a07,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:39a5ff1,CLOUDID:9e4d8b5d-5ed4-4e28-8b00-66ed9f042fbd,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: acc6529a0dca4b7fad0d319562694fd6-20220913
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 107477821; Tue, 13 Sep 2022 18:15:17 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 14 Sep 2022 09:14:39 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 14 Sep 2022 09:14:39 +0800
Message-ID: <01a973c24276ff2e2919919d67f89fbc58cd071b.camel@mediatek.com>
Subject: Re: [PATCH RESEND v3 4/9] drm/mediatek: Add gamma support different
 lut_size for other SoC
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: Rex-BC Chen <rex-bc.chen@mediatek.com>, Singo Chang
	<singo.chang@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Wed, 14 Sep 2022 09:14:39 +0800
In-Reply-To: <e1945785da7c56bbb7fe94926c39fc6c3593cdb0.camel@mediatek.com>
References: <20220912013006.27541-1-jason-jh.lin@mediatek.com>
	 <20220912013006.27541-5-jason-jh.lin@mediatek.com>
	 <e1945785da7c56bbb7fe94926c39fc6c3593cdb0.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_181531_718376_6FFBB35F 
X-CRM114-Status: GOOD (  12.86  )
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

Hi CK,

Thanks for the reviews.

On Mon, 2022-09-12 at 11:14 +0800, CK Hu wrote:
> Hi, Jason:
> 
> On Mon, 2022-09-12 at 09:30 +0800, Jason-JH.Lin wrote:
> > 1. Add mtk_drm_gamma_get_lut_size() and remove MTK_LUT_SIZE macro.
> > 2. Add lut_size to gamma driver data for different SoC.
> 
> Separate these two modification to two patches. In the patch of
> mtk_drm_gamma_get_lut_size(), consider the aal driver.
> 
> Regards,
> CK

OK, I'll separate them.

Regards,
Jason-JH.Lin



