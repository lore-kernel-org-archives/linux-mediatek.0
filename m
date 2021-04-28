Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14901C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 14:54:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B206A61441
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 14:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B206A61441
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sINwvV7gle8EJNLTadDpJfeOfBPlP+WmQO5BxJ8JXY4=; b=Ru9Qq9yvXGKSzpWpvdgjpR9Yf
	97pzgEUZyFxkYrO6clTPXOkOqDkIf6w+n0dn26MKnhdtYRKtr54FqQsUBAToXhIZ7aGMDwd0pWSO3
	eX7AUZyi4FGf5Zq1Rj6jldY1Qb1hugJehatLmcLvN5dAkHZ16KtHltyZjcQ7CmXwvgBjuTtvGlYmV
	GIx3k5WFwT1RJSC7hR1X6za5EBtiYZBmIf5Yk5ErDrUylqjwIcBnhLnrkL9seAciD+G+jt8Y+nLIW
	7BBdWqUZ+JjxLlzjVRxKM3bLrgMk397KZU3AoYJaYOPvOKOyJlAsRfjeZxsYKyIQWuRy4Gfq04122
	eyQHceE9g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lblaJ-003fvh-Er; Wed, 28 Apr 2021 14:54:39 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lblYW-003fPl-RT; Wed, 28 Apr 2021 14:52:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=CkzDiRgPy8iejVwPrfGJj8JwW/3IpRiOAho8UUQxXuo=; b=lnsM/mYf76c+BrcV/37xQR/og1
 6tdZ71S7BiUkkGlwKnrZF8ZeuIna3llM0HHhj61Rq5mrIzJDJVVZTn3d/66XwcG0vpxqr5pUBCMTZ
 tUhHLquGGscNFJc0iU//uNELUiC40eyL4V/NK185dhINpR8r0jqRdulNjw8yv2MxAkz+KtpnUSmPb
 Aft491w0R0XxwrjQdZg0IFcVzP/smHo9gdyL40SNZw68HCDCp7gMyl064WZtZsei5wbZxW8CbyX0P
 1ssSdIDBUKh1Y/qQKSnzX/ZpbOggE1yXjXWMtmRLds9ND0GaRyeco5yF8ukKnyDN+MGOcPdKsofF4
 cfAIDAWA==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lblYT-00HVON-ID; Wed, 28 Apr 2021 14:52:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D39F46144E;
 Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619621564;
 bh=XfZSeMotNFyXbfT608pw1ECU5JJkssXPopFyWbltzaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gQMN97eC7BEDIz1pxwojfxcjha4oPcG+hRlJfly/9mEn3EVUjF6A17eUhRaUV4Av6
 9llNqcINPObifS7R+KKJzcq9sElWMQUcLuEgUGm4dEcPAo7WPuTsJBo8FAKaKUj9Hk
 VsE0m0+uaGwgEcNcCKy4FE+EybZisDq15Xlqw+m72JjyXstPa88Kj6is8ypDBGKPdI
 X5k3QuLFiBcmGJ+6I0pWZTX0FzZ3AimINfu9/sQCxIkKFaooCIrQkh6kuh/y12/DqV
 q/M582iW3kDaTv+n6EwJSHs1PeakpZmbEzfwaSOI0e14HbJuwkIcKyqgVAiYfHvp5V
 b2Ttn7u9UJXRw==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lblYP-001Dq4-RV; Wed, 28 Apr 2021 16:52:41 +0200
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
Subject: [PATCH v4 10/79] media: mdk-mdp: fix pm_runtime_get_sync() usage count
Date: Wed, 28 Apr 2021 16:51:31 +0200
Message-Id: <39851c54046fa0d63f34549803df3388361828b7.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_075245_685247_9BD4CAEC 
X-CRM114-Status: GOOD (  12.94  )
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
