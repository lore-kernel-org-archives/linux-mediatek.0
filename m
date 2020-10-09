Return-Path: <SRS0=0dL+=DQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DC82C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 12:35:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4EFB222B8
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2020 12:35:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="urNfR4Qz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4EFB222B8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=lH004DJ1nInS0TKWgDWUolHsvId/bPIQ/gupkJxSlLY=; b=urNfR4QzC218ositaMectKHZd
	YCdFi8mAr89UVoR3EfwnjBiEWkLSzLTdsoU5YkDu6+g9RM51aMk3q+uiLOv7OwaDww81RqtzmzXJA
	VXxY6PdeXihdXVIxChOD3KBsUkGT59yINP3tIo4mU1y782DfbcMjr7AIBS0rNcvPQUpDRyXnFuizT
	mP8QS9gytLa23fnGQlzPayAzyoEZS0d4TlsS78liIV945j6ncRkch7CekoZoanPB9tsP1+ulbFfE0
	MTOJXfBHs9z0KXjsORcnAcZa4QP4dIJoYLIuNSySuRXANC8VXXoBQJ7M30ADWcgHPbV2IAOhQsWP7
	kWLCzDPCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQrcd-0002De-Sr; Fri, 09 Oct 2020 12:35:44 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQrb9-0001HJ-UO; Fri, 09 Oct 2020 12:34:13 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 68A48B3592881A0403A0;
 Fri,  9 Oct 2020 20:33:56 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Fri, 9 Oct 2020
 20:33:46 +0800
From: Yu Kuai <yukuai3@huawei.com>
To: <rick.chang@mediatek.com>, <bin.liu@mediatek.com>, <mchehab@kernel.org>,
 <matthias.bgg@gmail.com>, <tiffany.lin@mediatek.com>,
 <andrew-ct.chen@mediatek.com>, <tfiga@chromium.org>,
 <xia.jiang@mediatek.com>, <hverkuil-cisco@xs4all.nl>, <jcliang@chromium.org>, 
 <minghsiu.tsai@mediatek.com>
Subject: [PATCH 5/7] media: mtk-vcodec: add missing put_device() call in
 mtk_vcodec_release_dec_pm()
Date: Fri, 9 Oct 2020 20:38:02 +0800
Message-ID: <20201009123804.3977562-6-yukuai3@huawei.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20201009123804.3977562-1-yukuai3@huawei.com>
References: <20201009123804.3977562-1-yukuai3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_083412_242671_8714310F 
X-CRM114-Status: UNSURE (   8.33  )
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

mtk_vcodec_release_dec_pm() will be called in two places:

a. mtk_vcodec_init_dec_pm() succeed while mtk_vcodec_probe() return error.
b. mtk_vcodec_dec_remove().

In both cases put_device() call is needed, since of_find_device_by_node()
was called in mtk_vcodec_init_dec_pm() previously.

Thus add put_devices() call in mtk_vcodec_release_dec_pm()

Fixes: 590577a4e525 ("[media] vcodec: mediatek: Add Mediatek V4L2 Video Decoder Driver")
Signed-off-by: Yu Kuai <yukuai3@huawei.com>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index f6a6b42865fb..ddee7046ce42 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -85,6 +85,7 @@ int mtk_vcodec_init_dec_pm(struct mtk_vcodec_dev *mtkdev)
 void mtk_vcodec_release_dec_pm(struct mtk_vcodec_dev *dev)
 {
 	pm_runtime_disable(dev->pm.dev);
+	put_device(dev->pm.larbvdec);
 }
 
 void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
-- 
2.25.4


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
