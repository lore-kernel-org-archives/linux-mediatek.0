Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70517C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 07:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=umf0socxYlj20UZshUuONaJviLuqEfqAwYTyzXh9e6I=; b=oqvJwXJ/yoNkX3
	OiAsxEolzTkeYvTdnABDyMFEfEDRsPTPn8WFXX4TPJqWKr0AGU6L2g33ukdVrtD2M0Y+H1HfIaTW6
	nnFtcoTLLvEkVcG5/3TkB5afgz+wJRuSBNz68lOS0Hv3todrpOTFEswzZ0axIyiNLwFGl6xbUHClC
	ffwGv2HaDxIQD/js5BVUy97CWFU6swrAxGdmPtYNR0WgnSr3sMsQ8Esyuz8AaCzGKtz4df43um5DY
	cub4fRbUJph8L1qqUP3iiwDUIkEmk1T4BpJCamPU1+szT1fjJnvvr0krY8tvHehz3vDFarZaQCeS5
	w6ZbdCfdiDS5uEEK+2lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mq8t4-006Z6D-Bt; Thu, 25 Nov 2021 07:09:42 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mq8sq-006Z4z-3Q; Thu, 25 Nov 2021 07:09:29 +0000
Received: from dggpeml500021.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4J087N5d5LzZd6Q;
 Thu, 25 Nov 2021 15:06:40 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggpeml500021.china.huawei.com (7.185.36.21) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Thu, 25 Nov 2021 15:09:14 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2308.20; Thu, 25 Nov
 2021 15:09:13 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <alsa-devel@alsa-project.org>,
 <sound-open-firmware@alsa-project.org>
CC: <broonie@kernel.org>, <yc.hung@mediatek.com>, <daniel.baluta@nxp.com>
Subject: [PATCH -next] ASoC: SOF: mediatek: Add missing of_node_put() in
 platform_parse_resource()
Date: Thu, 25 Nov 2021 15:16:08 +0800
Message-ID: <20211125071608.3056715-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_230928_363070_199D96EB 
X-CRM114-Status: UNSURE (   8.02  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The node pointer is returned by of_parse_phandle() with
refcount incremented in platform_parse_resource(). Calling
of_node_put() to aovid the refcount leak.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 sound/soc/sof/mediatek/mt8195/mt8195.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 40e5a25875a6..55d9812870a4 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -43,6 +43,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	}
 
 	ret = of_address_to_resource(mem_region, 0, &res);
+	of_node_put(mem_region);
 	if (ret) {
 		dev_err(dev, "of_address_to_resource dma failed\n");
 		return ret;
@@ -64,6 +65,7 @@ static int platform_parse_resource(struct platform_device *pdev, void *data)
 	}
 
 	ret = of_address_to_resource(mem_region, 0, &res);
+	of_node_put(mem_region);
 	if (ret) {
 		dev_err(dev, "of_address_to_resource sysmem failed\n");
 		return ret;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
