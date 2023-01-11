Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7056DC46467
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jan 2023 03:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JDatIFGfCYDp40epyQ6cVCFAB9XyGy7+db3Lps22ypY=; b=kxvdYh/37ywKiELjZOiUfUcOIZ
	DrbULZWRo7XVuZT626CDDQ2s9scNyMM5ZcwPUW70J32qiYf/Ap4cHI0YnOSEfuJG6/DCSs7GnvITl
	0q4JzlC6Jx6waJ6vy8+Q4cvy0MkIzl9pIwuDh0238OheZ7raUf1MmHavr4Ids8AMTIngPq1JMJ7xx
	VEsXRU6MiSx1ir8GoFl2HtwvnSSniHMblABdLUf5txZGijk10aeAnpj3Wtt4lINfrqgPuHCPUD6oF
	yUqe77IsT2WdT+jt/4TKC3PbbZzGLUR7qDwpNDAEee7CJJinZvVmhdMb0VND8mL6T2OvPSls+clyo
	LVmYyL9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFROL-009MFT-AN; Wed, 11 Jan 2023 03:03:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFROI-009MDy-5F; Wed, 11 Jan 2023 03:03:03 +0000
X-UUID: 6cecc612915c11eda08d4d6090ec5a5c-20230110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=JDatIFGfCYDp40epyQ6cVCFAB9XyGy7+db3Lps22ypY=;
	b=K+eRFK5b+Hb5DiyH9QVfdfzrxad3Q4ezcrin+70nVY80m2tkYnAgUEQjuCtH6BCav/ECUz2YjQaspnYgXU/HkZ1DgqZwSxZ+RjKq1jEENwJpLcbmS6/Nq4fvw9z4Of8TjHTrCWJKRaN7QEPYS7Wlj7HroA24mQSpz3UFfp6Qvz8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.17,REQID:7d0f6f5e-8673-45bf-a99c-7c64dac151d6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:543e81c,CLOUDID:23434b54-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 1,FCT
X-UUID: 6cecc612915c11eda08d4d6090ec5a5c-20230110
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <miles.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1852929662; Tue, 10 Jan 2023 20:02:46 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Wed, 11 Jan 2023 10:42:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 11 Jan 2023 10:42:44 +0800
From: Miles Chen <miles.chen@mediatek.com>
To: <angelogioacchino.delregno@collabora.com>
CC: <airlied@gmail.com>, <chunkuang.hu@kernel.org>, <daniel@ffwll.ch>,
	<dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	<matthias.bgg@gmail.com>, <miles.chen@mediatek.com>, <p.zabel@pengutronix.de>
Subject: Re: [PATCH] drm/mediatek: stop using 0 as NULL pointer
Date: Wed, 11 Jan 2023 10:42:44 +0800
Message-ID: <20230111024244.24295-1-miles.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <7cc4fe44-55b9-a80f-27a5-197070759760@collabora.com>
References: <7cc4fe44-55b9-a80f-27a5-197070759760@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_190302_220053_E3B4705D 
X-CRM114-Status: UNSURE (   7.82  )
X-CRM114-Notice: Please train this message.
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

Hi Angelo,

>Il 10/01/23 04:12, Miles Chen ha scritto:
>> Use NULL for NULL pointer to fix the following sparse warning:
>> drivers/gpu/drm/mediatek/mtk_drm_gem.c:265:27: sparse: warning: Using plain integer as NULL pointer
>> 
>> Signed-off-by: Miles Chen <miles.chen@mediatek.com>
>
>Please add the appropriate tag...
>
>Fixes: 3df64d7b0a4f ("drm/mediatek: Implement gem prime vmap/vunmap function")

No problem, I will add the Fixes tag and submit v2.

thanks,
Miles

>
>after which:
>
>Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




