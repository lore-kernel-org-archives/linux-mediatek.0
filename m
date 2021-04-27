Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 598CCC433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 10:16:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F309960C3D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 10:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F309960C3D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KjjZN+bhGcmBE20eR4jBUpPuy5OcAPO+McvLyCcSobI=; b=Zv+48Dt1/KDDqlEoEBkeQpaQs
	RZ43I0NGwIFDUu4Zof/bGjjwWcbBeeCHfotz8FGB1owCJ6bOeixM2tkLDjezZdumpBUwdTt83rklC
	Z33J7nDvpPd+SMI54g1AqINKl0syTrhjrGsQZS7+jBqaSOx+n2N1HxqLVw+SG1x5ThqF1nJOKD2A0
	PYrcJ7Z4c4ttQ6+T11O/bfP9ivEa74WvBfWy4iObbtZ4hqHLGgDaTyJPLT2slgxI6TwLM89xlFuJd
	w84qjTOSRy7AOZUEXtYdjF/5ZcAhHy7UmEpnGOcfx5fnpF6sQJSUOA25sWuKcER2WxoMnqcAFdZFm
	gADAlSU8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbKlD-001Jjf-EC; Tue, 27 Apr 2021 10:16:07 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbKj9-001JBN-LE; Tue, 27 Apr 2021 10:13:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=uvxTCk9qFVRZeWu4OWV5nbuso6Js4+D7jvAIh37TJlk=; b=vvzihbN1sy/O7F4FRqC+uRnmh4
 W+Cwi9mL5FNv8rkoZ8hedDOCjuEsUtCcFTiA1APmhhLg2RVCY5vzB7919QV6//d1T47DCer8y+3MN
 YJImB4YWdAFbmPiwt9sWgNBM2JLXikYCOWwjoqRMXEOZqX2/PwxU5xRjdhAylM7lcf3PJTQn1UviB
 UGesh8fuUGhp8Zg4Cy8R1A5rj5HVO7w1MIKeFMtx7Ks8YPT9TdRXXbuirzjyMLWQEUdrLiXHEzmW2
 HvFR93Rv1Me5YrlzAZA+sgiRL34utb+pUiON47b+eKvAwuLHOuxsFYG+BfNx72k74XgbrffoCJtZS
 5XKM4PEg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbKj2-00Gbm2-R3; Tue, 27 Apr 2021 10:13:55 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 06263613D1;
 Tue, 27 Apr 2021 10:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619518431;
 bh=dO1gD2vCTyNaQMmr4CD5RrufRsq5HOpPc9z13n0Rohk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kreVFPQyyC+gt6dxASA1KwIHM7ks8tRyxNcLuXn/lmMuigpR+ad9uCR0tmJJFUZOC
 MPZLTG9gNZ2+lQzLNVApsxsJS+GTaIRD8vhzg8lXUqwGmjoQ8ZlOEqXoag/sjjtxWv
 uO6jW1O6Sa57Xnj2KY8FgESId3A3y+jwy4eXq6/9wJvZbgM4+oxcre+ReRdGj3nqT4
 0+CXXauGBWEmSZ/coF+VvxP7CJ3X23rxuQsVj6eisjF2AuBcf5L3Tc/79RcXEbzoBm
 Kjp+Gm+nH3MSvIKCO98uEPJ1b/BSDX/cGVMzBC3CbcY+MX/F79B8L6xKXbcbrTUl3W
 YLmslc9I4mHnQ==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1lbKiy-000j5M-QV; Tue, 27 Apr 2021 12:13:48 +0200
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
Subject: [PATCH v2 16/79] media: mtk-vcodec: fix pm_runtime_get_sync() usage
 count
Date: Tue, 27 Apr 2021 12:12:43 +0200
Message-Id: <e91e271160c17f6dbfc99663c735cfc9533cd7c2.1619518193.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619518193.git.mchehab+huawei@kernel.org>
References: <cover.1619518193.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_031353_029270_DB3E5798 
X-CRM114-Status: GOOD (  10.41  )
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
