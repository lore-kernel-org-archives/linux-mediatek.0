Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D96B8C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 10:16:22 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 822CD61185
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 10:16:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 822CD61185
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sINwvV7gle8EJNLTadDpJfeOfBPlP+WmQO5BxJ8JXY4=; b=YTGdZKC5PqpduVrFg3+G3R4Gu
	bgbjwouV+/lRQHO0knnxlr006wstivWH+qfNCnVPXqRg4BllgWcpRbC9fB5YW76GRkLATBmb9Q7N3
	yE1ssTbvUEUklEpJ+WPHpxNAYwWqS6USXdqXm8oaxCGe5t6AWaGqd+6PEj60il2tr/xmAh4+rQp0I
	Ntw1U7v9J+rgoF2V2HwQAkHXOEqjWU4PX3zHmloGA7DU5de25LlyvbhO9ZO65DePZbdDP3m3LBlQC
	e4dHB5oef6oc46+gDB6ZVVEGRCLMuGSqPv3HYq4gTnuyN1YJo+KEGnPGsI/s9OGjGUO0Lscha7B4l
	dxYUHmkfQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbKlB-001Jik-CY; Tue, 27 Apr 2021 10:16:05 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbKj9-001JBk-LD; Tue, 27 Apr 2021 10:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=CkzDiRgPy8iejVwPrfGJj8JwW/3IpRiOAho8UUQxXuo=; b=vhMDQLcclG25w1+7uL/BXRUL6p
 vGg0oP8oxahBpVmcNd7JA6DBoqdodVPbwrysQGszyLBMBw4PPm8FIq7lRhjH2qqcweW0n6+vH6dP7
 ZEf2cpS5AgnY2wZ5RARl5btC+cG7I/MuYamg5pdaHSQNY2TUXbOHdozFsSEdV49DFzH2y60BR9yNB
 IZSoyCZ6+NiUdZXlTShUwET1WESkZLPqg/4r/SQK/DG6gNcqRDPZ0dWLuSqWWW0POVDIFqFcfRA0o
 xjV2c4f9ErblRrShBN0MQ5ybYBqRD7YrqgnKXPMMlVAhyHdes06/hEONoNTdgeOn8WFzQFTfXTXOb
 XIi8zHLw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbKj3-00Gbm5-3i; Tue, 27 Apr 2021 10:13:57 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6F2B613C9;
 Tue, 27 Apr 2021 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619518431;
 bh=XfZSeMotNFyXbfT608pw1ECU5JJkssXPopFyWbltzaE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Nr2lUUMOHAMasRjwlY5qX3qVA4oegZ5AgUvpL6usdP7kYYZZZM6TsC32yW50v4n6u
 tcvNRQPCPk6KdTQhVAuWpm8L6wfnAnIjOKNjBAs6jwHBPaBboSwVTtHXpbVHICzTcc
 1lBOKpP8EbMRNwPR8QTTYS2F24GO8hT3AURqYHmbXcQqcXviY2sO/li0wDxoeiLi33
 nc5lIPv6zUXjHIDqnptAPfdDLqX7OdAffVBQPSFke/Wxl7TBV7w+dNNYe8y48V1rZU
 mz502CLIOs0MXwwcj+kyRx0Ho46obWLtWanADRaK/TUGgaFs6xRbkw6cpbsKRwfj97
 jsoJG5CIc2oSA==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lbKiy-000j51-J8; Tue, 27 Apr 2021 12:13:48 +0200
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
Subject: [PATCH v2 09/79] media: mdk-mdp: fix pm_runtime_get_sync() usage count
Date: Tue, 27 Apr 2021 12:12:36 +0200
Message-Id: <36568b7ce611dfaf4abc3233c76018a137f934c8.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_031353_212157_F12ADC04 
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
