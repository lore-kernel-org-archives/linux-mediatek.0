Return-Path: <SRS0=4WJp=JV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2379C433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 06:59:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1A46054E
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 06:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC1A46054E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=UUV26tARk+pf2ec3VSP5u/CiGEh4nQWPaPp4xMmFi5E=; b=M8q1Gsx9tHEhgIhElXS5v0Oew
	sMpw2UyFIo6SzRk/6vtmRcGr6iVJJT35zMv6/M6p4E31uFmzQEb+0ZI5NW7UlElyKjVU1LHaPMYHd
	CM16NOXXXK4vxNkD06nA/ZTdm6z/SqB0hi4yZXZ0glWGq2nwFCF6ytLY0di7Zo6WvVn/WuGWHlLyT
	x1rJWMsRSwRutNyJ1iuUpijh856ufGrUqbJMLwB+Hw16u8Hao/GRuGymlWVskneZx0sxUXBqx4L/9
	zrb9EQTGHXSwTNgTcfd4j+2UCr1YExnRV+H7CMf+/EmicpkS8y4gcEvJ2Yr3X5YVm2x6JDJyKqp+V
	jHBs9FMKg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laCGK-003CQW-1Q; Sat, 24 Apr 2021 06:59:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laC48-003B17-7r; Sat, 24 Apr 2021 06:47:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6tWS5AWeHgEG14BxYeaqs+XN0hv2Iox9SZeAydDvL1Y=; b=WMvKg0LO6o1MF9KZHv06Vp4l0E
 Lh/6qtNn8gMVU9oKS/cQyJksjesQly7Ga2Qa0Ku+HG+yi6PR12SDk2TsGjn4s3/jkcH2aDvTjfxYJ
 +Omakaj5KR+2rsRyhgg11P4O0nPxcW2JKVwagneFu4P1pQah3FD5AzKXyoCshoLGz1CXUes649bKu
 doZGKVx5aOjFTqXqA0FTZAIbJSIWz87/jdo4AYmmp5xussQI37gPGyXg68LYACS9vfDbujOS35zWM
 hx8uuvl7qZOz2nMl3SIs5r3LAg1meKr7oSj0EbUOqVJwPQ6ngoReNQKK7zq12cqUVDJXzRhx1xD03
 jEVDOA3w==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laC2s-00EsNO-2N; Sat, 24 Apr 2021 06:45:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 66AF06162B;
 Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619246733;
 bh=tu2hhB6CHAZbCfvPd96Qq+9zsUaGe3IxV7AH+2XbuEs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=K+/V7LjGP5QNR/LozRTLlxP6rqFTNzKUtnPpZ5fF116wkN8e41wvxB7Hjiz1sl0ZW
 dfZAhn04YTu88YMwAshkldtBxB1ykXatkdrIXgvYS1fTUrvp+4jTChS5Y9mATQNCQl
 ENjr1t2N9jA/CNC1CkJSk/CL2JuLilyLEQyBYrQWw5uFEyqL48YmnvPjPAZnh2Nti4
 3fAZy/pEZ52FteSb5/ZZvFk1BtcRyhNGFb2ZhTPeMW6XeT/uPLHmYVHkHihuo6vsBd
 Kxgdq0evCxU1whI5y+qBHnSyq1it1BVnD9oAxhDmTp7LY4KszmC9cMkjoP9MaRtfLj
 C8m6rzO6fDdmg==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1laC2m-004JgZ-Jj; Sat, 24 Apr 2021 08:45:32 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Bin Liu <bin.liu@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rick Chang <rick.chang@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH 59/78] media: mtk-jpeg: use pm_runtime_resume_and_get()
Date: Sat, 24 Apr 2021 08:45:09 +0200
Message-Id: <eab8f44c9b31646771f00eb7b9a992b6f54bb529.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_234538_287115_3EDF384F 
X-CRM114-Status: GOOD (  10.36  )
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
