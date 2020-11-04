Return-Path: <SRS0=xu2G=EK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25280C4741F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 12:38:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9657223FD
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2020 12:38:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="PGPf/s9x"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9657223FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wBpEmpDLoHv+GD8Sk7yPPxzFtVm/gDp5Rg2Nnsbua2Y=; b=PGPf/s9xmAyzEfao7yXhP8/RR
	ySHj3yhndK64S8Z5q9oxf1UezseCHOFPtNwOj9ZE4cbU/4gkJaRl065u/Ysof6RfCjR29oq02pDQJ
	BxHD7J5pEnwtmGgGJivCEhRT0lJ1EGGni6gkqgGhmf7N+12CwnoAcNuX1j7UVWXJ8uAbP6wOqdAYo
	zTFVa8PxV9ZHM+dHZ6/x7xBPclKzhkw0Iqw4MFKGh3B3xOXC3T4rjudIjs9p+e5GqcKHHWqVBmnYE
	Xm2g3InuLiu/l2Z0j8UaY9oxtZ/zkziKwGTr/xQdjKxKwoo9wN5Umzv2rOZV2TmEvshbf0STbpEtg
	PTdcmqtjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaI3m-0001et-Gb; Wed, 04 Nov 2020 12:38:42 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaI3R-0001Tz-F4; Wed, 04 Nov 2020 12:38:23 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CR5m63xJDz15RY4;
 Wed,  4 Nov 2020 20:38:14 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.487.0; Wed, 4 Nov 2020
 20:38:07 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <rick.chang@mediatek.com>, <bin.liu@mediatek.com>, <mchehab@kernel.org>,
 <matthias.bgg@gmail.com>, <tiffany.lin@mediatek.com>,
 <andrew-ct.chen@mediatek.com>, <xia.jiang@mediatek.com>,
 <hverkuil-cisco@xs4all.nl>, <tfiga@chromium.org>,
 <minghsiu.tsai@mediatek.com>, <jcliang@chromium.org>
Subject: [patch V3 6/6] media: mtk-vcodec: add missing put_device() call in
 mtk_vcodec_release_enc_pm()
Date: Wed, 4 Nov 2020 20:41:40 +0800
Message-ID: <20201104124140.3443309-7-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201104124140.3443309-1-yukuai3@huawei.com>
References: <20201104124140.3443309-1-yukuai3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_073821_846972_41CE736D 
X-CRM114-Status: UNSURE (   8.98  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, yukuai3@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

mtk_vcodec_release_enc_pm() will be called in two places:

a. mtk_vcodec_init_enc_pm() succeed while mtk_vcodec_probe() return error.
b. mtk_vcodec_enc_remove().

In both cases put_device() call is needed, since of_find_device_by_node()
was called in mtk_vcodec_init_enc_pm() previously.

Thus add put_devices() call in mtk_vcodec_release_enc_pm()

Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
index 1a047c25679f..3b7c54d6aa8f 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_enc_pm.c
@@ -108,6 +108,8 @@ int mtk_vcodec_init_enc_pm(struct mtk_vcodec_dev *mtkdev)
 
 void mtk_vcodec_release_enc_pm(struct mtk_vcodec_dev *mtkdev)
 {
+	put_device(mtkdev->pm.larbvenclt);
+	put_device(mtkdev->pm.larbvenc);
 }
 
 
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
