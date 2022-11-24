Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08583C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Nov 2022 07:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tezZEnRxCXnJZvkUHrlzpBLzjhQvVPCWNva2zWt94L8=; b=Xc0jRrhfM/MyI63gnZUrXPYUA6
	/3CdtZuxAbg65TtqXDyh9Fe8uGzc8/5elwGUPOjRjNx62vmgZeUod3p4WRp4mlyXk/Sr1fgrVu06/
	W1gMjdp9gbagUX7RIO8zfCCk66p0hUFGyEzfe2HpF9gVALAwWG3rkJrKj7WozThy6QpqLP+Zd6hSx
	A2f7Ca5WEqVflCy3DspEAL16OsfC68excxFB1rUaz01v+nA3dNPdXoWanFEA++0/15jBN0EZAa8Ax
	wz8N2bVAsn10oDBVD/c6jlqv/tRz4p4sS8oTZotuOAUQ+wyUqhmWk+UvZjFOghj/SnUwiZpyKKIf3
	ZXmacPmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy6WE-00658N-HU; Thu, 24 Nov 2022 07:19:34 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oy6W2-006519-QM; Thu, 24 Nov 2022 07:19:24 +0000
Received: from kwepemi500016.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4NHq9C3YbSzmW62;
	Thu, 24 Nov 2022 15:18:39 +0800 (CST)
Received: from huawei.com (10.175.100.227) by kwepemi500016.china.huawei.com
 (7.221.188.220) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 24 Nov
 2022 15:19:11 +0800
From: Shang XiaoJing <shangxiaojing@huawei.com>
To: <matthias.bgg@gmail.com>, <roger.lu@mediatek.com>,
	<angelogioacchino.delregno@collabora.com>, <khilman@baylibre.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: <shangxiaojing@huawei.com>
Subject: [PATCH] soc: mediatek: mtk-svs: Use pm_runtime_resume_and_get() in svs_init01()
Date: Thu, 24 Nov 2022 15:17:25 +0800
Message-ID: <20221124071725.22869-1-shangxiaojing@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.100.227]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemi500016.china.huawei.com (7.221.188.220)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221123_231923_046723_1506CACE 
X-CRM114-Status: UNSURE (   9.41  )
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

svs_init01() calls pm_runtime_get_sync() and added fail path as
svs_init01_finish to put usage_counter. However, pm_runtime_get_sync()
will increment usage_counter even it failed. Fix it by replacing it with
pm_runtime_resume_and_get() to keep usage counter balanced.

Fixes: 681a02e95000 ("soc: mediatek: SVS: introduce MTK SVS engine")
Signed-off-by: Shang XiaoJing <shangxiaojing@huawei.com>
---
 drivers/soc/mediatek/mtk-svs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
index 0469c9dfeb04..ad1300cd82c6 100644
--- a/drivers/soc/mediatek/mtk-svs.c
+++ b/drivers/soc/mediatek/mtk-svs.c
@@ -1324,7 +1324,7 @@ static int svs_init01(struct svs_platform *svsp)
 				svsb->pm_runtime_enabled_count++;
 			}
 
-			ret = pm_runtime_get_sync(svsb->opp_dev);
+			ret = pm_runtime_resume_and_get(svsb->opp_dev);
 			if (ret < 0) {
 				dev_err(svsb->dev, "mtcmos on fail: %d\n", ret);
 				goto svs_init01_resume_cpuidle;
-- 
2.17.1


