Return-Path: <SRS0=4WJp=JV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12CB2C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 06:54:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB89A6146D
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 06:54:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB89A6146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=I0OLeS1UHLqqw9N1ACAHzfQt8acXBJKnsT3j4R4ENSY=; b=pN73kFE18CJ9HmJxln0Gb03dC
	UWpeF9oOmTgeBlGtp+972sNvbekvzaUO67GzxcWPaCZwlD4ccbwZYbloWgPK22+FBimgdUhi4qldH
	JD1bYioRTPtHTFK2m0A07mDzV1m5Qv4ej5zmRBbh1fl6UCMLvDknFQRTJBiUUt/1L78Zwrl1/Qo/5
	zGnTbI6VnZcpAZ60CxutUtHFrIr0tpYNLlN/WPVfaTYhc3ODlorafPVEZm77LNjetPc3PdgCbH5RO
	+WNLXAdRVCfPX5dx3qlZEXdJgaYHBjKefySLTat/p9CpsjYGihxkIAC1DfvMhCx9X9JPXsyU4aFf5
	NrIuYoBEQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laCBU-003BiZ-4i; Sat, 24 Apr 2021 06:54:32 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laC2t-003B18-0k; Sat, 24 Apr 2021 06:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=eLSt2iiQbupfLxLfJtIvPinKnLo+XDl1lIMtY6POuXA=; b=B3UFI5rqujbkFR0+eM7HbimNxp
 V0Bw3CHgeDAuCUCF594SO29aH+DdsWHaEDaE2OGUZ9//w6w0HXI6kuzSW9N3mwLjVweXQ6E804CeA
 kv0yHCz3bjet2uiPkP0H3Zya/FJLZeozzcdLhDEUIhDgj+70YhuWqVxaax0GzOtn3je55c4NN2HcA
 YABBA3LR53/bAMedco2hvRUJ/uC/b2h4wPzmtZvQAgoBZ7awc4aXnyE4JMCNVUMqtfQ6R3eatQAxX
 L7H2ww2bmPa6YmDYMnE9PP9C1/ecjTjRDV69ODbN9sE1KQzu957NYRn6DqgKZzDQZQc5IhS/ASYO8
 9loA/tVg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laC2o-00EsJb-Rv; Sat, 24 Apr 2021 06:45:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0C890614A7;
 Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619246733;
 bh=YlEqY5pc+hA5phvy8MwyUatVyMBo1evkBwuBpSmvG/M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eudcKq0s7hz/90ZTY5o/W+EkxN7U+wRN7i/h28mYwqD6m8UJjzKMHrwLoLyidK/y9
 ElMN37xIFXzAyaZgJzXebfbCwOIR/ZZo/2kc1k6jPF595U1f/ez0HXFxdYpwbkx73w
 SAVk37xTTYwFPFnKdMCcv0LNoDbw/StTPY6M2LAaFJ27A/vIW1uGf9EUPTT1bJdt8W
 2ghHUDAnaamVx0OfxmNwHveQfG6dxEMG/kvcrG10rn3sRTMNWBzUolw5wRc1VBVDx9
 eg+xDUyXdnbHR9wNhNZKRf0X5bsc13efOxO+Z9XfufX1WCipFpDii/isD684/T2cYq
 pWkfE466X70Ug==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1laC2k-004Jdp-Us; Sat, 24 Apr 2021 08:45:30 +0200
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
Subject: [PATCH 03/78] media: mdk-mdp: fix pm_runtime_get_sync() usage count
Date: Sat, 24 Apr 2021 08:44:13 +0200
Message-Id: <8b84cb38beeac55b21c8cbc9dc16e1319c5dc960.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_234535_044267_041E4FB0 
X-CRM114-Status: GOOD (  12.40  )
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
replace it by the new pm_runtime_resume_and_get(), introduced by:
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
