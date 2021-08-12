Return-Path: <SRS0=QG8e=ND=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91A02C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 15:01:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD0746103A
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Aug 2021 15:01:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD0746103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Cc:To:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gOdO/at/eLztX2edc7VqN8Lc8ER4icy5pzwqjSs9rJc=; b=Fq6oE2+ZeIowti
	aLmev7U2h1H/9NKdq8niH/RSQBaFoENrv8SDKC/PUiP7u/+AzgnQvFXCuk5RlgdXFBMuCXeffSDr0
	jWYJW2Mm1eeNtVovY0GKZKxl2IWXlYvhwGaJN3gndxH4jxobpEJ4gaVgy86EiSEeLSdjOI0tR/OHl
	6uTOTh4vvPmuEFSPFiiLiumvkfYgd9nk/xKw0juDjEdody6wZPuoa27UpVRChuncGRpav+aK7T7kj
	asa6eVd6b/pefMHeNDWBm+Fh0YcBjZ4WNB+D3QZoZHVzu8JaCJRNFii8DT6NUBGKaQTeinU71UKmM
	Q6l3vWpdihPARf/Nn2FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mECCT-00AVep-2B; Thu, 12 Aug 2021 15:00:53 +0000
Received: from www.linuxtv.org ([130.149.80.248])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEBEd-00AMRc-0k
 for linux-mediatek@lists.infradead.org; Thu, 12 Aug 2021 13:59:05 +0000
Received: from mchehab by www.linuxtv.org with local (Exim 4.92)
 (envelope-from <mchehab@linuxtv.org>)
 id 1mEBEW-00Cl6W-Qv; Thu, 12 Aug 2021 13:58:56 +0000
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Date: Thu, 12 Aug 2021 13:57:32 +0000
Subject: [git:media_stage/master] media: mtk-vcodec: fix warnings: symbol XXX
 was not declared
To: linuxtv-commits@linuxtv.org
Cc: Tzung-Bi Shih <tzungbi@google.com>, linux-mediatek@lists.infradead.org,
Mail-followup-to: linux-media@vger.kernel.org
Forward-to: linux-media@vger.kernel.org
Message-Id: <E1mEBEW-00Cl6W-Qv@www.linuxtv.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210812_065903_187335_B38E81A2 
X-CRM114-Status: GOOD (  10.61  )
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
Reply-To: linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is an automatic generated email to let you know that the following patch were queued:

Subject: media: mtk-vcodec: fix warnings: symbol XXX was not declared
Author:  Tzung-Bi Shih <tzungbi@google.com>
Date:    Mon Aug 9 15:19:40 2021 +0200

Fixes sparse warnings:
- warning: symbol 'mtk_vdec_8173_pdata' was not declared. Should it be
static?
- warning: symbol 'mtk_vdec_8183_pdata' was not declared. Should it be
static?

Link: https://lore.kernel.org/linux-media/20210809131940.2890108-1-tzungbi@google.com

Cc: linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, tzungbi@google.com # X-LSpam-Score: -10.7 (----------)
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h     | 2 ++
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 3 ---
 2 files changed, 2 insertions(+), 3 deletions(-)

---

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
index 9fbd24186c1a..46783516b84a 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.h
@@ -65,6 +65,8 @@ struct mtk_video_dec_buf {
 extern const struct v4l2_ioctl_ops mtk_vdec_ioctl_ops;
 extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
 extern const struct media_device_ops mtk_vcodec_media_ops;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
 
 
 /*
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 36ae3e6017f0..e6e6a8203eeb 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -372,9 +372,6 @@ err_dec_pm:
 	return ret;
 }
 
-extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
-extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
-
 static const struct of_device_id mtk_vcodec_match[] = {
 	{
 		.compatible = "mediatek,mt8173-vcodec-dec",

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
