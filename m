Return-Path: <SRS0=imyo=KB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 560A9C43460
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 15:27:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2348F61988
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 May 2021 15:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2348F61988
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UUV26tARk+pf2ec3VSP5u/CiGEh4nQWPaPp4xMmFi5E=; b=aYxuNABPPGhgTSjqezf7OuEW7
	9B+qSU6nYJ4q56NaSFgFeANEMnnjatvR6sgl2LFYT08ZYdZi36SsUMmIpLU0Nko6wBQ5pFm4CrC0T
	ouP+fTfj5kQqfhSelLjR20Rp1ZNg6rN7QKY01euMFmSNzgeck9QI3yD80iISHhO3BdnhITclQqmq/
	e7TTpk6+mprEHWpTHqGUENXmxdw0TyYkp2A9faRaZZQ3S6AgeyDl661+9hXU28OsQatoweyAKOafK
	LJRyMaY6jPtSN4VWl6OrBoRFQV9cINzsUTYpEBtMUcSLoCl7fyjG/m/T1uSUD05bMdrh/tzaduize
	ze7rtZSvA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lefu9-004XyY-8T; Thu, 06 May 2021 15:27:09 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leftW-004XoK-7r; Thu, 06 May 2021 15:26:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6tWS5AWeHgEG14BxYeaqs+XN0hv2Iox9SZeAydDvL1Y=; b=FOOVPP0pJccZM/xuxTKyLM/XbU
 FVwpo6tuRXSubq3IdAgRxedx9PcKdZPdwbM/zfnJEp+x8ZKpJ/LGrW0hAmJ+JyOPdIF+hdU6AfYLr
 n3EsWvMDr4Cq31Nl5dEaYm9FiNsyniTq0bbwk7WsPf0IXkt9b8qalBVT0SQmL4NAucPZkZUNscw4M
 n7WUmgXjs2QDdX9jwlazvfChJ4lvevLnohqLwPrCK0Mtbohvgo2LkQ+/K4yakcz0nFa9QGNj6gEt7
 4u36w3LZmtQjTLFOy89X9Ca7Z4RsGtVBZJSARXP14U27TquzuBYloPxJjPA6xiVxX23hw9Oxh22gE
 opFOhL6w==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1leftQ-0068lr-5Y; Thu, 06 May 2021 15:26:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9FD526193D;
 Thu,  6 May 2021 15:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620314783;
 bh=tu2hhB6CHAZbCfvPd96Qq+9zsUaGe3IxV7AH+2XbuEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QSv5FyWJT/GViSc6Q+heyZ8j7KBHQdYNi702iuXY93QpbIK8+cnC1/xs1fPqbG58v
 e6vroDclZEHhpG8z930B+6RnjE6pxRdRheOjDERiTlCPXYw0dKRl/osJFl0dJ7sNUE
 Px1nspje6+TNsaj4136ofXsWxxFYjDH8U2ju5L0Ojvt8dgSf3V+v+vdWvuSEjDzgYY
 YQdcBHMVRkrubGz4B1AyJvqKTdLgyZmSVHYaOIx4vmCVvThySszg6LE8Qrp3L79A9H
 3GL58F3a3RcFjqPKkSMJWLi/vuQgglOYJp7SqiW4X+yffj71IIwTNDgVkuUFH2bA9A
 rhVu2sLFjEiDw==
Received: by mail.kernel.org with local (Exim 4.94.2)
 (envelope-from <mchehab@kernel.org>)
 id 1left8-000SBj-0I; Thu, 06 May 2021 17:26:06 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rick Chang <rick.chang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v5 11/25] media: mtk-jpeg: use pm_runtime_resume_and_get()
Date: Thu,  6 May 2021 17:25:49 +0200
Message-Id: <55b1ee0dc3c77c721eb7773666578cdf37908ee2.1620314616.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1620314616.git.mchehab+huawei@kernel.org>
References: <cover.1620314616.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_082624_323038_5EEDDB22 
X-CRM114-Status: GOOD (  10.70  )
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

Commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
added pm_runtime_resume_and_get() in order to automatically handle
dev->power.usage_count decrement on errors.

Use the new API, in order to cleanup the error check logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 88a23bce569d..a89c7b206eef 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -920,7 +920,7 @@ static void mtk_jpeg_enc_device_run(void *priv)
 	src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
 	dst_buf = v4l2_m2m_next_dst_buf(ctx->fh.m2m_ctx);
 
-	ret = pm_runtime_get_sync(jpeg->dev);
+	ret = pm_runtime_resume_and_get(jpeg->dev);
 	if (ret < 0)
 		goto enc_end;
 
@@ -973,7 +973,7 @@ static void mtk_jpeg_dec_device_run(void *priv)
 		return;
 	}
 
-	ret = pm_runtime_get_sync(jpeg->dev);
+	ret = pm_runtime_resume_and_get(jpeg->dev);
 	if (ret < 0)
 		goto dec_end;
 
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
