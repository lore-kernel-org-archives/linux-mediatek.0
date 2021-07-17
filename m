Return-Path: <SRS0=8BsG=MJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F50C636C9
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 08:23:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5B088613C0
	for <linux-mediatek@archiver.kernel.org>; Sat, 17 Jul 2021 08:23:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5B088613C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ef8Ib8Jj3Qk2TJX3GEYRpm4C09JLPGSPrBWqo7/p4Wk=; b=v5oMPaoulpJ2ak
	xamGKZhvbxuoHkjH9Au0akp90m99gJgi5ixW9GnClw/k+LEyzq/Q36PGs/+S3vrLBkUBvIFshV9u1
	VptV4u04w+kOU+XO8i8FrlYKag+uSlnQjTm0vm7QzdzAKknNWfmxDNwQedOWK2lwrmIItcgt6zo0t
	1hprZKBAd34gHvpFHL1x4jfzBWrmbYRRggRN2Wk7UuijKveHXldaYoEia6Y9OTsCtlkI4uWgRD5Ax
	jtYMSvjnp+gpaRL/o3KYRZH5Jj47KOX3xHNmRClVnZ4RwDGGYuK/rHQkGoT9zAK3clXSTkLPd36Qh
	kBYq5eXDqG4h2kut7slQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4fbO-006Chp-Su; Sat, 17 Jul 2021 08:23:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4fax-006CaO-Ab; Sat, 17 Jul 2021 08:22:49 +0000
X-UUID: 3980c04ec74c42f690fa6ceb333a81e0-20210717
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=L3iebr0dJvxiWIdykhBIXEOhfeLXdeOfJaGwyBoLFGY=; 
 b=n/z1iU39ULYEfDsrDhW5W566mO87cT8TWmUtEweR6YBi7254py+8UM3dUJr+JjWWEHc8OLW5xJoEpgT8X6LGfX6aNO2yMXKnggTfOm6ILnJ2HaLw0z++KzYT07UNoK4F6640VBOVth49923EyXXn/eVSM+qydKXpm+I2lUCR6AE=;
X-UUID: 3980c04ec74c42f690fa6ceb333a81e0-20210717
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 609083574; Sat, 17 Jul 2021 01:22:40 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 01:12:50 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 17 Jul 2021 16:12:48 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 17 Jul 2021 16:12:47 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, "Tzung-Bi
 Shih" <tzungbi@chromium.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Tomasz Figa <tfiga@google.com>
CC: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, 
 Irui Wang <irui.wang@mediatek.com>, <linux-media@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <linux-mediatek@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2, 10/14] media: mtk-vcodec: Add core thread
Date: Sat, 17 Jul 2021 16:12:29 +0800
Message-ID: <20210717081233.7809-11-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210717081233.7809-1-yunfei.dong@mediatek.com>
References: <20210717081233.7809-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210717_012247_427397_593B5226 
X-CRM114-Status: GOOD (  15.65  )
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

Core thread:
1. Gets lat_buf from core msg queue.
2. Proceeds core decode.
3. Puts the lat_buf back to lat msg queue.

Both H264 and VP9 rely on the core thread.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
v2: no changes
---
 .../platform/mtk-vcodec/mtk_vcodec_dec_drv.c  |  6 ++++
 .../platform/mtk-vcodec/mtk_vcodec_drv.h      |  3 ++
 .../platform/mtk-vcodec/vdec_msg_queue.c      | 32 +++++++++++++++++++
 .../platform/mtk-vcodec/vdec_msg_queue.h      |  6 ++++
 4 files changed, 47 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index 078daeeff576..e05224aca888 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -437,6 +437,12 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 		goto err_res;
 	}
 
+	if (VDEC_LAT_ARCH(dev->vdec_pdata->hw_arch)) {
+		vdec_msg_queue_init_ctx(&dev->core_ctx, MTK_VDEC_CORE);
+		dev->kthread_core = kthread_run(vdec_msg_queue_core_thead, dev,
+			"mtk-%s", "core");
+	}
+
 	for (i = 0; i < MTK_VDEC_HW_MAX; i++)
 		mutex_init(&dev->dec_mutex[i]);
 	mutex_init(&dev->dev_mutex);
diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
index 9207ce079960..3beba0e2ea91 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_drv.h
@@ -32,6 +32,7 @@
 #define MTK_VCODEC_MAX_PLANES	3
 #define MTK_V4L2_BENCHMARK	0
 #define WAIT_INTR_TIMEOUT_MS	1000
+#define VDEC_LAT_ARCH(hw_arch) ((hw_arch) >= MTK_VDEC_LAT_SINGLE_CORE)
 
 /*
  * enum mtk_hw_reg_idx - MTK hw register base index
@@ -480,6 +481,7 @@ struct mtk_vcodec_enc_pdata {
  * @component_node: component node
  * @comp_idx: component index
  *
+ * @kthread_core: thread used for core hardware decode
  * @core_ctx: core queue context
  */
 struct mtk_vcodec_dev {
@@ -524,6 +526,7 @@ struct mtk_vcodec_dev {
 	struct device_node *component_node[MTK_VDEC_HW_MAX];
 	int comp_idx;
 
+	struct task_struct *kthread_core;
 	struct vdec_msg_queue_ctx core_ctx;
 };
 
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
index 016a70416e55..60bc3796bb58 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.c
@@ -252,3 +252,35 @@ void vdec_msg_queue_deinit(
 			kfree(lat_buf->private_data);
 	}
 }
+
+int vdec_msg_queue_core_thead(void *data)
+{
+	struct mtk_vcodec_dev *dev = data;
+	struct vdec_lat_buf *lat_buf;
+	struct mtk_vcodec_ctx *ctx;
+
+	set_freezable();
+	for (;;) {
+		try_to_freeze();
+		if (kthread_should_stop())
+			break;
+
+		lat_buf = vdec_msg_queue_dqbuf(&dev->core_ctx);
+		if (!lat_buf)
+			continue;
+
+		ctx = lat_buf->ctx;
+		mtk_vcodec_set_curr_ctx(dev, ctx, MTK_VDEC_CORE);
+
+		if (!lat_buf->core_decode)
+			mtk_v4l2_err("Core decode callback func is NULL");
+		else
+			lat_buf->core_decode(lat_buf);
+
+		mtk_vcodec_set_curr_ctx(dev, NULL, MTK_VDEC_CORE);
+		vdec_msg_queue_qbuf(&ctx->msg_queue.lat_ctx, lat_buf);
+	}
+
+	mtk_v4l2_debug(3, "Video Capture Thread End");
+	return 0;
+}
diff --git a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
index 297aa1598788..27ce528cbe89 100644
--- a/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
+++ b/drivers/media/platform/mtk-vcodec/vdec_msg_queue.h
@@ -134,4 +134,10 @@ void vdec_msg_queue_deinit(
 	struct vdec_msg_queue *msg_queue,
 	struct mtk_vcodec_ctx *ctx);
 
+/**
+ * vdec_msg_queue_core_thead - used for core decoder.
+ * @data: private data used for each codec
+ */
+int vdec_msg_queue_core_thead(void *data);
+
 #endif
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
