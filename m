Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F63AC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 10:29:54 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCBED60FDC
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 10:29:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCBED60FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KjjZN+bhGcmBE20eR4jBUpPuy5OcAPO+McvLyCcSobI=; b=i1fnlpvrYYZbOCfQhh4RPvyt4
	MGztASRRXtkQfM0RllEpqqKEyWlwPRx8XE4b7bpqa/lCXBxZwJHRDs+T2R85hzQ4kxvsIQ4f6suci
	zzLed2pGEenrqZsacgsqeyG/5DmTpcj6USrmMqFUoaYepVKiA/Okl4yeG0bm3nlhtNjvo07evJTRs
	QUDY+ib2lJ9fSWr17MTSOi1PTtVIOGeCorb7+aMCaqsVD/BX+6jQYO2KAL+E6193jNJgIhbuICbjT
	FA4RFabkYZFC1JVdWy47sccExt+GKjkn3UI0eBNqfPU+xNvLqlwVFpSH966H0jswM/j1iKp9gCLMI
	1SKh8wf4w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbKyG-001Naz-Lx; Tue, 27 Apr 2021 10:29:36 +0000
Received: from bombadil.infradead.org ([198.137.202.133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbKw9-001Mz3-GW; Tue, 27 Apr 2021 10:27:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=uvxTCk9qFVRZeWu4OWV5nbuso6Js4+D7jvAIh37TJlk=; b=F3UFsXyCCXYAVrmGOmUBET5Hkm
 IoTWQhQY0Eq4+zfHTQVUAiBkupGuYeFBUMhe315TO/3/BnpYNrycZmUxqKhGKc7Z1BiIhGr0QoKGg
 lRETLRXtuE6jimz0xwUZW5AIErnam0IW0g3YR00k4t5gvQ6CftO1ErDJHCxljKSa/HlKyiiNIf165
 RpshU09ebQ2U3mbso1Je0bSebWqRr1B0Sj95GpJwcexcayz0iZi3xM28jfrwhHIZqMylaPbM2ZNOm
 uYywrc1qByl4UFbI/uZ8QGeWP9y4x6Knryuc83FUBSQt0RT5ji+B1KCn0Ne30fKz6m4bcYz0q8woo
 svyN6Z5w==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbKw5-00GdBE-HH; Tue, 27 Apr 2021 10:27:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 57DE2613FB;
 Tue, 27 Apr 2021 10:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619519236;
 bh=dO1gD2vCTyNaQMmr4CD5RrufRsq5HOpPc9z13n0Rohk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fbWvtVHWTAey+hipESaA7D/+JGsH4iHUJ5QUnJWbaQ90t2lqsJR8DxjhYJ4tZY9NE
 7sUWaQNJ58a/gx21g/v8U9+dTCqhpPqqvyzXz6440q615rfHwbz/ngOS98Gv1aUW1e
 6F85UFHzWeu9qFsabeZwnEBYC2YHI8XMNNVPWrkt/LdI19wuwtWCzlfILd1kFofYH6
 ZJwI2DHv0V03BLexWkLKicITH1k/ksrp8FrP+wEaIPMwLy8+d37OwN/pVWARJFLSgO
 m8PZs/ofoceMQDgm+qgcZRXyBjxHu7KWFqlqaWUu3rXaTFPxccq6ndoUYBczc2Vo12
 VxGae3nG6bBwQ==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lbKvv-000nzz-NK; Tue, 27 Apr 2021 12:27:11 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: 
Cc: linuxarm@huawei.com, mauro.chehab@huawei.com,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v3 16/79] media: mtk-vcodec: fix pm_runtime_get_sync() usage
 count
Date: Tue, 27 Apr 2021 12:26:06 +0200
Message-Id: <5ecb7c839255ae1b74a4f623cad05cc1a1ed3efe.1619519080.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619519080.git.mchehab+huawei@kernel.org>
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_032721_680854_1012EC11 
X-CRM114-Status: GOOD (  10.40  )
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

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
index ddee7046ce42..fe096fe61c9d 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_pm.c
@@ -92,9 +92,9 @@ void mtk_vcodec_dec_pw_on(struct mtk_vcodec_pm *pm)
 {
 	int ret;
 
-	ret = pm_runtime_get_sync(pm->dev);
+	ret = pm_runtime_resume_and_get(pm->dev);
 	if (ret)
-		mtk_v4l2_err("pm_runtime_get_sync fail %d", ret);
+		mtk_v4l2_err("pm_runtime_resume_and_get fail %d", ret);
 }
 
 void mtk_vcodec_dec_pw_off(struct mtk_vcodec_pm *pm)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
