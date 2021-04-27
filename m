Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBFB3C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 10:17:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5C896100B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 10:17:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5C896100B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UUV26tARk+pf2ec3VSP5u/CiGEh4nQWPaPp4xMmFi5E=; b=kYXKSJW5PNtKKmh2feDsNf3iO
	5OeBk71/AnrvzVeq2TIwK8AqoCz8chBJr0xRb4YnTtZHag7ICYsBIBXpMLgArUyGRjPbb5qowjHj5
	lQSMAR5mb3wKYbm7F3l7ArBNMsozfJKMylGAlidBf/syyIfZW8A2++UGvSJbP5FHz4h2E9qiK1Y/9
	Y+O3xJe2JzV/tzgdTxQfhzTWYIRg9j7DVfay5g+wdsw3rSdo+AMFZPdfcQVXkHMMmaSRzpwY5gtoH
	kqjs74nmv5tbVftmHd1NJ49ACCszlZDGgxshptOqtFKqiE6EeHnlNfyYFAfIDL9enB+8ogCpLFWjW
	uq8YvdfdQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbKmV-001KG5-Pu; Tue, 27 Apr 2021 10:17:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbKjD-001JCz-3z; Tue, 27 Apr 2021 10:14:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6tWS5AWeHgEG14BxYeaqs+XN0hv2Iox9SZeAydDvL1Y=; b=Tbq2h8KkLajLj48zAWAogMGBq9
 6G8h0WMPlcg5VchzrzaTLsputwZQXyH0GubJMJ5slCVxNOSTxwmbNmXsj6evfQhb/ev6ZF/HQTsZ5
 5fs604f3waBNZczacWXjr6D5tmEquDG2Z2VFomQZpvXtnX89n7LvrSWAsoSU8j78X8wR0dH5ZS02+
 euwvY6rvZFVezV+cDBlUX45iPEfsyRI07cg0+Rfxfbv7SWeZkriUD3vY6erOBork2H1rMwjYFTtIw
 tkN0RnueCf7yU08ElJEk2QGjia6p+kXVxAmX8ni99Ir5lV+D2kiCJec1/bvmb0jcweEH98zewB7yH
 XhV9jv6g==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbKj7-00Gbt1-NF; Tue, 27 Apr 2021 10:14:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F1D46192A;
 Tue, 27 Apr 2021 10:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619518433;
 bh=tu2hhB6CHAZbCfvPd96Qq+9zsUaGe3IxV7AH+2XbuEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=s8v5HNvwglZGfeJ/zanLqWX6BYRnlg8cTv+FYXIptUe5TPaBW5KTXFhjtUpwp2lHq
 siVH7DddVKZmRoNQIcCgcnlCJA7++C6asnFY7HEcj8RWi9GEBl7/SHhftU2guuh5N5
 V1BAqbgUMDNac7KloMdVCUFtsXd4BAxVoLtr8vWrcr/Y9Uck2NGNWl3xP+GrwLFDcu
 51iNqNVef1aaIDFapLKKAQHg/Vk+UqMJF9IX3+3mE8MZ1GuCgICk23tZHMdUxGK3gd
 jOCidh4U/Nwgl/hhpjIb3HWsA0nLVp+Rs8akCEdQxoOpQCo37tZSsVsTp0PRYXHLHu
 HSiU+z/0wgP5g==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lbKj1-000j7g-IL; Tue, 27 Apr 2021 12:13:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rick Chang <rick.chang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 64/79] media: mtk-jpeg: use pm_runtime_resume_and_get()
Date: Tue, 27 Apr 2021 12:13:31 +0200
Message-Id: <6b9c896cd16a090b334dd657f8937cd436288ba1.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_031357_808939_1390F6C6 
X-CRM114-Status: GOOD (  10.96  )
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
