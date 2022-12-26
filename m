Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B43CC46467
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Dec 2022 09:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZGleIaBYERNkajXlfhlAeH0vGhKeQzSsh3GtRPBtCw=; b=Jte9a+QmfC2ZshWTN+RaE4FD/4
	yl4Vd9lzaEfIgfeahe/QrAr8sD0ZSgzDhtvlCid32waZe/rCFNe4IC1L9Wg3DKBV/l2GT9mq1JHkG
	GRLwDTNMogSTnPwSn18MphKVF6NK7grvadEAdP+0uDGOD0qQh7HfddEp5OMYdgM8PveD7FaFH+m+G
	3WfzLEw3PlJ/lFYO+CF0yDz6lCw9rrdBd4ncST6FWIQGQyz9w3faQbyGR9ssCVDBZB3yQSJmRTDIO
	X88NZWAMM9WhIA/mkXrKCQ7QZgDKMGZVB+bAzx4l8Q4f1m0GAx3DamXyppwLTI25d4zJNmpn089gI
	WmxpzDgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9k0n-002u6d-CM; Mon, 26 Dec 2022 09:43:13 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p9k0X-002u0M-CN; Mon, 26 Dec 2022 09:42:58 +0000
X-UUID: b51648716dcd40db89f48bf185ab11b1-20221226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=SZGleIaBYERNkajXlfhlAeH0vGhKeQzSsh3GtRPBtCw=;
	b=fhrzqXtxg3DXd9V9IqWVqLq1I8ZiUhVeLoKgfelcDKeyenKhAjQjKHhsUoKLa3gj7sfbLec1BBmmzGEhRdjIVas9Zf9NL3+XTm/Kddf5q+FupN6PemdygrcUhB4iv7A5rPPlLMIJMqJx02ME4n3QdrP6q3kr7BspgCJqmRSQ6wA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:e428c640-8d7d-4999-960f-4b71ef4af2b6,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:1510cf52-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b51648716dcd40db89f48bf185ab11b1-20221226
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <roger.lu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 122917646; Mon, 26 Dec 2022 02:42:54 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 26 Dec 2022 17:42:51 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 26 Dec 2022 17:42:51 +0800
From: Roger Lu <roger.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Enric Balletbo Serra
	<eballetbo@gmail.com>, Kevin Hilman <khilman@kernel.org>, Nicolas Boichat
	<drinkcat@google.com>
CC: Fan Chen <fan.chen@mediatek.com>, Roger Lu <roger.lu@mediatek.com>,
	Jia-wei Chang <jia-wei.chang@mediatek.com>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pm@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Shang XiaoJing
	<shangxiaojing@huawei.com>
Subject: [PATCH v1 12/13] soc: mediatek: mtk-svs: Use pm_runtime_resume_and_get() in svs_init01()
Date: Mon, 26 Dec 2022 17:42:47 +0800
Message-ID: <20221226094248.4506-13-roger.lu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221226094248.4506-1-roger.lu@mediatek.com>
References: <20221226094248.4506-1-roger.lu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221226_014257_598676_49850C02 
X-CRM114-Status: GOOD (  11.61  )
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

From: Shang XiaoJing <shangxiaojing@huawei.com>

svs_init01() calls pm_runtime_get_sync() and added fail path as
svs_init01_finish to put usage_counter. However, pm_runtime_get_sync()
will increment usage_counter even it failed. Fix it by replacing it with
pm_runtime_resume_and_get() to keep usage counter balanced.

Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
Signed-off-by: Roger Lu <roger.lu@mediatek.com>
---
 drivers/soc/mediatek/mtk-svs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index dacfee4a0b32..af3a12e29e78 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1326,7 +1326,7 @@ static int svs_init01(struct svs_platform *svsp)
 				svsb->pm_runtime_enabled_count++;
 			}
 
-			ret = pm_runtime_get_sync(svsb->opp_dev);
+			ret = pm_runtime_resume_and_get(svsb->opp_dev);
 			if (ret < 0) {
 				dev_err(svsb->dev, "mtcmos on fail: %d\n", ret);
 				goto svs_init01_resume_cpuidle;
-- 
2.18.0


