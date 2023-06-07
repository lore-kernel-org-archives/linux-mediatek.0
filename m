Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB8BC77B7A
	for <linux-mediatek@archiver.kernel.org>; Wed,  7 Jun 2023 08:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7J44CPJLVuQmKx8uRsJDBq0OUSEiyngOmORztKqfS/o=; b=ObMAFyKrgFvWJz5nLjtyfzlmi4
	2JsBtaNPIb1mfF8FyuPRV6AKK3duu3qVg8Kkcq3ZKN4udlCGBr/9cbap9dC+bs/mr1T6GiO2b+Vmt
	6YkhJDpkaas8iU3YwtJUBegkCDDBUa1LfFeJLZNDj28vMIkJ3yI9PxcaJ5hjiKdjlT3PBSu3UZdnn
	hI/G8lhITSbQoswXUk8OaBY7cnFvUlKO5ipwQUE2QB0tc75iIbSx+z+6aNLY5NAIfupbwQoWO/j/9
	6NOg/k3OhV8rIHYcg+wNnABVBqF/n10W+9p/fSIIVPj2NA0K5ZUN3i15SUGfnsyYSw8Ox33YU3zPu
	y/kglPJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6oro-0053ZW-2u;
	Wed, 07 Jun 2023 08:50:08 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6ord-0053OL-2c;
	Wed, 07 Jun 2023 08:49:59 +0000
X-UUID: 421c21a8051011ee912e1518a6540028-20230607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=7J44CPJLVuQmKx8uRsJDBq0OUSEiyngOmORztKqfS/o=;
	b=qVv++o11ZbmleZDb9BcDItCsh8tPMbRGQ6W7mqKhtP6qMfiAtRkyYTMW/jRXrwwNC6CVuMO6mcti+pT7y/DDAjCJrsUA7Fm9OLsbuLxL3SBuaiJWg0ffWAY7CtrjCibU0yXgkvQcmBxTdwZB+721aoQO20tPzrCTuvvi0bvCGmE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:ff968723-dfdd-4059-81ca-99cdd2a46e6a,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:70
X-CID-INFO: VERSION:1.1.25,REQID:ff968723-dfdd-4059-81ca-99cdd2a46e6a,IP:0,URL
	:0,TC:0,Content:-25,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTI
	ON:quarantine,TS:70
X-CID-META: VersionHash:d5b0ae3,CLOUDID:138f4d6e-2f20-4998-991c-3b78627e4938,B
	ulkID:230607164950L6KI78I7,BulkQuantity:0,Recheck:0,SF:48|38|29|28|17|19,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
	,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: 421c21a8051011ee912e1518a6540028-20230607
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw01.mediatek.com
	(envelope-from <yunfei.dong@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 663294856; Wed, 07 Jun 2023 01:49:48 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 7 Jun 2023 16:49:11 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 7 Jun 2023 16:49:10 +0800
From: Yunfei Dong <yunfei.dong@mediatek.com>
To: Chen-Yu Tsai <wenst@chromium.org>, Nicolas Dufresne
	<nicolas.dufresne@collabora.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?=
	<nfraprado@collabora.com>, Nathan Hebert <nhebert@chromium.org>
CC: Yunfei Dong <yunfei.dong@mediatek.com>, Hsin-Yi Wang
	<hsinyi@chromium.org>, Fritz Koenig <frkoenig@chromium.org>, Daniel Vetter
	<daniel@ffwll.ch>, Steve Cho <stevecho@chromium.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v2,08/10] mediatek: vcodec: fix unreasonable parameter definition and style
Date: Wed, 7 Jun 2023 16:48:59 +0800
Message-ID: <20230607084901.28021-9-yunfei.dong@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230607084901.28021-1-yunfei.dong@mediatek.com>
References: <20230607084901.28021-1-yunfei.dong@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_014957_877365_C7BB465E 
X-CRM114-Status: GOOD (  12.73  )
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

Fix unreasonable coding style.
Fix unreasonable parameter definition.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
---
 .../media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.h   | 4 ++--
 .../media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.h   | 8 ++++----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.h
index a18ba8f32d41..1a0375dd5b6d 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_drv.h
@@ -19,7 +19,7 @@
 #define IS_VDEC_INNER_RACING(capability) ((capability) & MTK_VCODEC_INNER_RACING)
 
 /*
- * struct mtk_vdec_format_types - Structure used to get supported
+ * enum mtk_vdec_format_types - Structure used to get supported
  *		  format types according to decoder capability
  */
 enum mtk_vdec_format_types {
@@ -258,7 +258,7 @@ struct mtk_vcodec_dec_dev {
 	const struct mtk_vcodec_dec_pdata *vdec_pdata;
 
 	struct mtk_vcodec_fw *fw_handler;
-	unsigned long id_counter;
+	u64 id_counter;
 
 	/* decoder hardware mutex lock */
 	struct mutex dec_mutex[MTK_VDEC_HW_MAX];
diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.h b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.h
index a88ef9078848..4804d8531a4e 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.h
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc_drv.h
@@ -32,13 +32,13 @@
  */
 struct mtk_vcodec_enc_pdata {
 	bool uses_ext;
-	unsigned long min_bitrate;
-	unsigned long max_bitrate;
+	u64 min_bitrate;
+	u64 max_bitrate;
 	const struct mtk_video_fmt *capture_formats;
 	size_t num_capture_formats;
 	const struct mtk_video_fmt *output_formats;
 	size_t num_output_formats;
-	int core_id;
+	u8 core_id;
 	bool uses_34bit;
 };
 
@@ -208,7 +208,7 @@ struct mtk_vcodec_enc_dev {
 	const struct mtk_vcodec_enc_pdata *venc_pdata;
 
 	struct mtk_vcodec_fw *fw_handler;
-	unsigned long id_counter;
+	u64 id_counter;
 
 	/* encoder hardware mutex lock */
 	struct mutex enc_mutex;
-- 
2.18.0


