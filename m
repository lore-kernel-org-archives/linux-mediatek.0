Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BAFC46CCD
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Dec 2023 09:23:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VRGqB+rpK2JtTATUiTfsiyokzdHpJCMrcXkOJidY/3Y=; b=KKJss2flPmSFqf
	SRYFdF6RPWppRpSEWqO2inN9CjXe3vANG27Hi1ykOElFiwFtMGOZ8CowpmquDCtpdz85rRJ7Q3Pb+
	ODwDGMAtahPLSmOjc6Z0DFQdRFWCjcjxG8H+gL297dNiXe1gN/mM6L9kaQKT+1l9EmYHbtJqLs2cZ
	+Z4gMPqjRmSz6ALQsK6QUvuxzAmZK3TUGSXbfXsshwHzBXk8KYLFKSGEi8lfdHg1Ny7QBZppj2k7W
	pqENvQP50yH5XPdp3UiCrTMmukTwFr8pzGuI6k9ktjMGuHz2UlPfqsElT9jGBswfI1QqoWP/170/Q
	yvmzCKZAAX8dGC4GkyPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFHJ-002FSa-0S;
	Thu, 21 Dec 2023 09:23:41 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rGFH7-002FM0-2z
	for linux-mediatek@lists.infradead.org;
	Thu, 21 Dec 2023 09:23:31 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5cdbc7bebecso230005a12.1
        for <linux-mediatek@lists.infradead.org>; Thu, 21 Dec 2023 01:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1703150609; x=1703755409; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VRGqB+rpK2JtTATUiTfsiyokzdHpJCMrcXkOJidY/3Y=;
        b=OavClNpDO78OroZSUkQ8/pvhAjsV3cU1FKztY/ULfnoEgd3l9TlTLHD86QxTRzDgiA
         UHywFn5OAHtIyIv7q8BVR97yvFGDX4/4di9N2rrKlPI6SqDGjjACCMSPsYsN/9EyfFLX
         fojmiE4FMAIDPji89YBH86DnUx71XxnIEeh24=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703150609; x=1703755409;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VRGqB+rpK2JtTATUiTfsiyokzdHpJCMrcXkOJidY/3Y=;
        b=HHq71g3hQtR25tb3VzLmZL+TykZMGKZuJjzaeYnxGA90GjMBCBctm+bBND6IGNPOiX
         0iS3yd1DgJcEWJuso+JofqZnW5lsOjKHrAiz176DdfDrwkzlr6wl2+RVEPSGoZsDBKMl
         Lr4Z2Dgo+zP00cghcp+5XF0kOcdW9fURj2BVEwgYl4Crx7W2LhlVlBq6LdWlubs3iUys
         avhPtx5eToetHbBQhqfzB960c32AdcQ6dcCUIxXFFL0IeTyf7FZqOCITjB/zPjDHGi/z
         NYvOlWcjAltW/FcfL5G/sho0RVdO2RWgIGsAMfQMsFeQHZhCZt/cstonw8smv8mHRbxW
         PKog==
X-Gm-Message-State: AOJu0YwlNwN5bhh69wNbr4byfw2RRuZ3dhWN/HV3aQbTXsVdRswKGgDc
	iv07NdULi2DbBGdElx9Sj4hGAw==
X-Google-Smtp-Source: AGHT+IGFWfj7wEYiXCBut673fAaKAyWsuJBDh1gl52c86wCwAWY5yMXd3rwbFvkIALXsD38i5TLGMw==
X-Received: by 2002:a05:6a20:8f1c:b0:190:7b07:b7c9 with SMTP id b28-20020a056a208f1c00b001907b07b7c9mr659230pzk.66.1703150608903;
        Thu, 21 Dec 2023 01:23:28 -0800 (PST)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:5d8a:fab1:933a:9ae9])
        by smtp.gmail.com with ESMTPSA id l6-20020a17090add8600b00274b035246esm1001915pjv.1.2023.12.21.01.23.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Dec 2023 01:23:28 -0800 (PST)
From: Fei Shao <fshao@chromium.org>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 4/4] media: mediatek: vcodec: Only free buffer VA that is not NULL
Date: Thu, 21 Dec 2023 17:17:46 +0800
Message-ID: <20231221092226.1395427-4-fshao@chromium.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231221092226.1395427-1-fshao@chromium.org>
References: <20231221092226.1395427-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231221_012329_983244_423D5FD9 
X-CRM114-Status: GOOD (  13.41  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Tiffany Lin <tiffany.lin@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the MediaTek vcodec driver, while mtk_vcodec_mem_free() is mostly
called only when the buffer to free exists, there are some instances
that didn't do the check and triggered warnings in practice.

We believe those checks were forgotten unintentionally. Add the checks
back to fix the warnings.

Signed-off-by: Fei Shao <fshao@chromium.org>
---
I had discussion with Yunfei, and he also thinks that the developers
just forgot to wrap mtk_vcodec_mem_free() with the checks back then.
We believe it's safe to add those checks.


 .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 22 +++++++++++++------
 .../vcodec/encoder/venc/venc_h264_if.c        |  5 +++--
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
index 2b6a5adbc419..b0e2e59f61b5 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_lat_if.c
@@ -1023,18 +1023,26 @@ static void vdec_av1_slice_free_working_buffer(struct vdec_av1_slice_instance *i
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(instance->mv); i++)
-		mtk_vcodec_mem_free(ctx, &instance->mv[i]);
+		if (instance->mv[i].va)
+			mtk_vcodec_mem_free(ctx, &instance->mv[i]);
 
 	for (i = 0; i < ARRAY_SIZE(instance->seg); i++)
-		mtk_vcodec_mem_free(ctx, &instance->seg[i]);
+		if (instance->seg[i].va)
+			mtk_vcodec_mem_free(ctx, &instance->seg[i]);
 
 	for (i = 0; i < ARRAY_SIZE(instance->cdf); i++)
-		mtk_vcodec_mem_free(ctx, &instance->cdf[i]);
+		if (instance->cdf[i].va)
+			mtk_vcodec_mem_free(ctx, &instance->cdf[i]);
+
 
-	mtk_vcodec_mem_free(ctx, &instance->tile);
-	mtk_vcodec_mem_free(ctx, &instance->cdf_temp);
-	mtk_vcodec_mem_free(ctx, &instance->cdf_table);
-	mtk_vcodec_mem_free(ctx, &instance->iq_table);
+	if (instance->tile.va)
+		mtk_vcodec_mem_free(ctx, &instance->tile);
+	if (instance->cdf_temp.va)
+		mtk_vcodec_mem_free(ctx, &instance->cdf_temp);
+	if (instance->cdf_table.va)
+		mtk_vcodec_mem_free(ctx, &instance->cdf_table);
+	if (instance->iq_table.va)
+		mtk_vcodec_mem_free(ctx, &instance->iq_table);
 
 	instance->level = AV1_RES_NONE;
 }
diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
index a68dac72c4e4..f8145998fcaf 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
@@ -301,11 +301,12 @@ static void h264_enc_free_work_buf(struct venc_h264_inst *inst)
 	 * other buffers need to be freed by AP.
 	 */
 	for (i = 0; i < VENC_H264_VPU_WORK_BUF_MAX; i++) {
-		if (i != VENC_H264_VPU_WORK_BUF_SKIP_FRAME)
+		if (i != VENC_H264_VPU_WORK_BUF_SKIP_FRAME && inst->work_bufs[i].va)
 			mtk_vcodec_mem_free(inst->ctx, &inst->work_bufs[i]);
 	}
 
-	mtk_vcodec_mem_free(inst->ctx, &inst->pps_buf);
+	if (inst->pps_buf.va)
+		mtk_vcodec_mem_free(inst->ctx, &inst->pps_buf);
 }
 
 static int h264_enc_alloc_work_buf(struct venc_h264_inst *inst, bool is_34bit)
-- 
2.43.0.472.g3155946c3a-goog


