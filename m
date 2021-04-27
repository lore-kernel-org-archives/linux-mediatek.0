Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A74CBC43462
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 10:28:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59B3B613CF
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 10:28:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 59B3B613CF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sINwvV7gle8EJNLTadDpJfeOfBPlP+WmQO5BxJ8JXY4=; b=ANQ6iUn7kZjYPWvGws4HzNWSZ
	nJaEL7uZCfOaVxe1Citp/eaoh1ZGzXhxIKM2IqvVsGInbZTWQyKCEcLbI+AdVhaq40IhrvizwElko
	7S8K7YJdY4EAI9lJlzjMlWkBzeSZH6/HczPyh/jL0MrAen8qFma4E3lQX0s1KE39lGYq1xjrUbJ9e
	kPgEVFKJO/tNyIZAnZnfMsgZIDoClriA5bo2HZnOY9na2sh3JscfVj8emRCJkt+uOORbR4gzvUxfj
	q88s0Vm2BR7VqVachwDmtTNaw75Ab3o1e3AomT8qNCsEVVhwDkyk28eP9PniCiwJRUkoceuzUPPzJ
	i8ayiC2fA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbKxF-001NHB-OW; Tue, 27 Apr 2021 10:28:34 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbKw7-001MyZ-P1; Tue, 27 Apr 2021 10:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=CkzDiRgPy8iejVwPrfGJj8JwW/3IpRiOAho8UUQxXuo=; b=pa7hZqyi+fiVH+o7hlCc0t8n/2
 0cvFPNBrgtxYjCo1zg9FGnbabAQIkQ4fSZmGkWKRX6A46vIG072suBH3XWHltsgW/vt9KkdUqIIc6
 EplmArN2TjT4TB0GkrIpSNaWmk6cXu2YJrqN7dV18gtLyrPAOcDErFvqTcsUQ+WwnarZwin53Ss47
 Ao7E3ggU7uDt+x8ZqJS1RhApUhyNiylD4ydkXWRr99lIQ3k3c8kCgS9jTSz6H9FgeTUFCmMPwCPhe
 uGrxMz7VgGUGH1TRVuPi+uJgqKk3OdKLYyj5UVovWUU0BtFQR6K27nifSfOmk96Nkx7qyP8gzPW9+
 Vz/5VlQg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbKw2-00Gd7l-Hq; Tue, 27 Apr 2021 10:27:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DFB3613D1;
 Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619519236;
 bh=XfZSeMotNFyXbfT608pw1ECU5JJkssXPopFyWbltzaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Rpva4pFFX1xfT9Qib5p16t22Qy4kyDXU+xli54LmAHrWSU6MjllDO6dkdX6bUVwZ3
 XoLxwUwncX8bHFaT1feMahtZ+mAAcCgw9eMbJTJMhv6vDhZT+n1hUnlfhyZNW6QpuX
 uuxSjuz+fpGbgDKpIH37kIytUd/fGeWmhKhmQg5QFKDuY5Cmh1qS4tZGW0VvvUXxth
 oriZ4yCj0cUbddMeU6OXQk9fijw0kueq02+0pTVgm7RzpgEpdKWiAgbCeANvwzjfBY
 MamIJdt/Tc8Zb3cUxVSGkFcdxolaDIRv0mmt4Bm7h8EAvOgY/7VZPekBppXj6EqtwA
 tJ+uYfo7qWX6Q==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lbKvv-000nze-9a; Tue, 27 Apr 2021 12:27:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 09/79] media: mdk-mdp: fix pm_runtime_get_sync() usage count
Date: Tue, 27 Apr 2021 12:25:59 +0200
Message-Id: <6f2e4b112f845f9be1de07cb8d73ff3173dec01a.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_032718_755427_FE375DC1 
X-CRM114-Status: GOOD (  12.91  )
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

The pm_runtime_get_sync() internally increments the
dev->power.usage_count without decrementing it, even on errors.
Replace it by the new pm_runtime_resume_and_get(), introduced by:
commit dd8088d5a896 ("PM: runtime: Add pm_runtime_resume_and_get to deal with usage counter")
in order to properly decrement the usage counter and avoid memory
leaks.

While here, fix the return contition of mtk_mdp_m2m_start_streaming(),
as it doesn't make any sense to return 0 if the PM runtime failed
to resume.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
index ace4528cdc5e..f14779e7596e 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
@@ -391,12 +391,12 @@ static int mtk_mdp_m2m_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct mtk_mdp_ctx *ctx = q->drv_priv;
 	int ret;
 
-	ret = pm_runtime_get_sync(&ctx->mdp_dev->pdev->dev);
+	ret = pm_runtime_resume_and_get(&ctx->mdp_dev->pdev->dev);
 	if (ret < 0)
-		mtk_mdp_dbg(1, "[%d] pm_runtime_get_sync failed:%d",
+		mtk_mdp_dbg(1, "[%d] pm_runtime_resume_and_get failed:%d",
 			    ctx->id, ret);
 
-	return 0;
+	return ret;
 }
 
 static void *mtk_mdp_m2m_buf_remove(struct mtk_mdp_ctx *ctx,
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
