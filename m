Return-Path: <SRS0=j19f=JZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35E3BC433ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 14:55:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D61D461008
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Apr 2021 14:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D61D461008
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KjjZN+bhGcmBE20eR4jBUpPuy5OcAPO+McvLyCcSobI=; b=ObkWfD93WWBrDZyKMiN1vas8c
	HbMXoV42Tb6HTbiGhZ6pvQgV5CdonY98Pro6qgAro0FmFZbSFtwjTEj9NIWfywMQpH0ceWDhQW2Da
	BnZrpNIznzClG/hH2AxMbsjyuSc6bW12bQ5EY8IwaI7A0CY0kL0lmqiRD762SO+700FOd6FjHjBTL
	scGIJ9CcbSJ6IHtLHr2L707azsyNLZz/c/ipgHEjjdXRanuzzJR6+yTr79Tif/hROPfR7KrOhSnqm
	ntWTAPUJwcKQMXVh+ERjlhERtA3qM9TeYLyZbNubAeZIqq9pK0QlCt3WJ2Awnuq5WcexJWIUUcmHI
	CJtjnYWGw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lblb8-003gB4-Du; Wed, 28 Apr 2021 14:55:30 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lblYa-003fRs-3y; Wed, 28 Apr 2021 14:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=uvxTCk9qFVRZeWu4OWV5nbuso6Js4+D7jvAIh37TJlk=; b=Vj0XLxQ8MFbTRNFQdjXQsntnPt
 e35+WSLRm1GzYtSof/Apoc3JGP++anGjC9pWLbjKF6zZw9XK25Q5UPaKf5m6cImmksj++v00KF6nc
 enASnybDIGlgwN5UJNvvyDMXT46/AMcwAF6dZYGljyWP/JIRG5+rG69zb/AGzk2/r0avgxAKRaq+9
 AEnK+zSQtZ/79D24/epUx2+v9RyMYO+0mKopVoj3ObZRGMiIJmsRj7eHzorlNykTdczh/Mf8ETii0
 /hD7hGkF7Ef2Tjv21q8kKY8uFWoWb0QmirSm50LASYxXvsDe+XzRfq4zN//4C7EWloJ65lAsa/hPt
 vp1LUB2g==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lblYV-00HVQU-Dw; Wed, 28 Apr 2021 14:52:50 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 22A4F61554;
 Wed, 28 Apr 2021 14:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619621564;
 bh=dO1gD2vCTyNaQMmr4CD5RrufRsq5HOpPc9z13n0Rohk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kCX5EGCo/+tl8FiqD+iNAbou4vWiupP08Ja8L3uTC65gi9JfE/CQToRBSiYRBXdk0
 Yw2U+kLbsDYq/XQzgAkCxFm72cVF/5JmFhTv1h4X1tfjAV/hScgHc2YCPzGWFCeGfQ
 JIT+/ymvxUOJ2xHTBMTy1xo8ACpTLPdnt0UYsDie+L4PRYifDpexKYGHf+2BrTWP+j
 3D47LMx6DT+8/l1DAYIjaWS8yV8QCKuXDo8vOibUBAyxBLTQ2oj6O/I64F6hSHNC5p
 ATCeTtSBNZo1zWs8rhdRgNsPwd7kiww9HFQS0W26E1NYNcGyjxuzjG2yeBylpJ3vC8
 XL4KE9+6Np9Kg==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lblYQ-001DqM-0u; Wed, 28 Apr 2021 16:52:42 +0200
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
Subject: [PATCH v4 16/79] media: mtk-vcodec: fix pm_runtime_get_sync() usage
 count
Date: Wed, 28 Apr 2021 16:51:37 +0200
Message-Id: <b2f5f6e6287d4b56530dcf51b25b5a1c009381f8.1619621413.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619621413.git.mchehab+huawei@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210428_075247_584200_4DAED4C9 
X-CRM114-Status: GOOD (  10.54  )
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
