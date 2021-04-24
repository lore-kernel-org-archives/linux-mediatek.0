Return-Path: <SRS0=4WJp=JV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EFB9EC433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 07:02:46 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8CF16146D
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Apr 2021 07:02:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8CF16146D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kpk8AMwpdOKDJUKQBueypCnr69Nzt5CTxnAsyDE1TEg=; b=L0zmXJPKbfrhrBQg7aSIlUEAH
	DVWYsVvmjLP8EJwdmBl1AHTXG23wsOzGg3JenCr5vSBMikxhZ1qai8CX5SUK7gLUs7m4HGbGvTTNZ
	aTmAtaiqNjuwvumc06sbXYjImC6lGbk6POtRmuWC4oVXNggYsITxyNm5YKytgVXOCoCIV7NKiIwV0
	gAknzLjF0ugpL6aF9vyPklsMOuwe2sgVWU7lLy/bmwXrpOrjsRD7aywOzuCHKvBnEs5y7bPwRg4JO
	KeeRJbolAcpc4chPv5DbmfHFH9Msr2XSq4Lf92MfBI+GJcx3v9N7xjk7CCr9gskHTS+jm7RHdaAmP
	4hQFcbIJw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1laCJG-003DPu-Mk; Sat, 24 Apr 2021 07:02:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laC5G-003B1A-Lz; Sat, 24 Apr 2021 06:48:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Sender:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 Reply-To:Content-Type:Content-ID:Content-Description;
 bh=q4Px9mXkiV8qcuZkZIuP53Q5ILd9wZRzriOgLa15afg=; b=wfMM5QIzcILFDJ7Go/II4N0u1X
 1R/Xs0A5Xv3mmS339QR0D7a4RrDLBzSnYVGlOFqwugZKd+idcWtL4Nec531tP0A1b7QBL+MQv3qQQ
 hzRBbe9hAFgaWCND0K8jlW0lbfLZCLJLHwgfH9B/9WC014nTw9P/u3g1az9wyyMHGDgo3fZSjAzRd
 REYGWFSLvZp45Ik8pjMNbMrn5adCIxZ1cgMY0lNp2ORL/pkQQRNGam/l9ROCFKxy7xQFENBAi467B
 QBGMCmaNjVtte8Mbknj3ICygrN8DdSdv6jUliZrfUMczTyFI7sTlqxcRxTAAupaQcDYqqkCspoezw
 7PZfLVhg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1laC2r-00EsNF-UF; Sat, 24 Apr 2021 06:45:40 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 454076161E;
 Sat, 24 Apr 2021 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619246733;
 bh=+UVQLbAwUBo3UU1F0075Iv595HgVTLhRfgrIPgnhUE0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=BivJEy9zCCeSFE2A1Si3diboItZlT++oy90qX+KxcKQkZTg1bAseNAvYOofN81hYl
 dR1InB4kajF5CZg2+ge2iwnBbI2deReU3cl0X065Pd+l5cDGTRIy+m1Kt0OjDQsRlb
 hXCiHU2wyFG4zuzal3MP1r5EiHkoxySYiURx085NdoEqlLSxkdsZviXtd0tRl8RfRh
 JK40nz4xHsnina8h8VZKSnxg6yx+Sc9zOKdsSAhHUyVGAAY2pNcElmFqARLieEhmFn
 oZmw5DbtWSzvUGl72pCFsD06N4MncZ0TC7kAJTFj1B+Ioij9xx2JVAV4/7ymx0etuU
 xHnQ+bIKIx8tA==
Received: by mail.kernel.org with local (Exim 4.94)
 (envelope-from <mchehab@kernel.org>)
 id 1laC2l-004Jeg-Eu; Sat, 24 Apr 2021 08:45:31 +0200
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
Subject: [PATCH 20/78] media: mtk-vcodec: fix pm_runtime_get_sync() usage count
Date: Sat, 24 Apr 2021 08:44:30 +0200
Message-Id: <f4906ceabe4bbc6a6b10c2409a44b7a14f5c0926.1619191723.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619191723.git.mchehab+huawei@kernel.org>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210423_234538_093704_66106774 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
