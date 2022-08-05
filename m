Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C44C00140
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Aug 2022 22:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7HDmje7hMCl5NV+G0CT0UMQAVeQZFrphIEsYJbLbSJI=; b=Pxj7RVi6675tUqOR5svTDT+Hu4
	sZ1UMo0pHXXz1oKOCeG4WyWWoDKRxK33U0/A3PCWaVndGpNyN4+8Up1wJp4ENdjYgW/H5kG4nIPnK
	3jaVhY/Iqo8PnhBecTEyB9iYN/BMSSIBGgPfQF76vXz0MoZx6vNZJtpionNrCB356hpJ4HXnf5WmL
	NOBeh8jlipisyIb4AbYaeTPWLdxSNpnkvJSKNSPoNPGIVDMcqzjoBqcTTxg25adrxVjHbh6fkRaaf
	TJGBlkRD2daE5Jb00Rp6HpMPkAMPZJSjVTDu3CaVFy99YdLWoq6uYGv1GhCbwW/+SwlSPowuN2BMz
	qTxfuDHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK64h-001O9s-VA; Fri, 05 Aug 2022 22:45:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK633-001N5d-ID
	for linux-mediatek@bombadil.infradead.org; Fri, 05 Aug 2022 22:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=7HDmje7hMCl5NV+G0CT0UMQAVeQZFrphIEsYJbLbSJI=; b=MSWFJF2GmKpxhL0/J96LyhIuk8
	/A7eL23DoewGKnxY8fVJrpPTfybaReCMdeUtyOxFeLWWbKUdri3ygb58tnsoT/ruOjDnDqTr84IFd
	tUhqMy63Wmax0DHDSOS/2N/E5yHMs+aA+NAzJKUMmk3bNaEl+8SUQ11eF/KMwgN4s8t9ZQzwIJQ7M
	aOfyQe3J0jZvnjtSu4aZ99waxMIqhxzhpmB16UcYdF5jNLjw7DG/ZWdwg6pMeKT6B3MmPb431coCF
	v9dpT+SuzMFEtsksXR5/KNqHjC438MepAiwhXtcFvLfYZstRBjxiIvotCVhp8MeyBfkFthnvUEy6u
	3vcxcIWQ==;
Received: from smtp06.smtpout.orange.fr ([80.12.242.128] helo=smtp.smtpout.orange.fr)
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oK5HA-003LQ0-Js
	for linux-mediatek@lists.infradead.org; Fri, 05 Aug 2022 21:54:51 +0000
Received: from pop-os.home ([90.11.190.129])
	by smtp.orange.fr with ESMTPA
	id K59foKolUKOP1K59foWKJI; Fri, 05 Aug 2022 23:46:53 +0200
X-ME-Helo: pop-os.home
X-ME-Auth: YWZlNiIxYWMyZDliZWIzOTcwYTEyYzlhMmU3ZiQ1M2U2MzfzZDfyZTMxZTBkMTYyNDBjNDJlZmQ3ZQ==
X-ME-Date: Fri, 05 Aug 2022 23:46:53 +0200
X-ME-IP: 90.11.190.129
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Matthias Brugger <mbrugger@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] soc: mediatek: pm-domains: Simplify some error message
Date: Fri,  5 Aug 2022 23:46:49 +0200
Message-Id: <e6ba80d8e27fdb2b1527c7eae6687e481960c81d.1659735996.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_225449_175482_8B06C98B 
X-CRM114-Status: GOOD (  10.27  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

dev_err_probe() already prints the error code in a human readable way, so
there is no need to duplicate it as a numerical value at the end of the
message.

Fixes: 123e8b4fd0cd ("soc: mediatek: pm-domains: Add subsystem clocks")
Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
 drivers/soc/mediatek/mtk-pm-domains.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 9734f1091c69..09e3c38b8466 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -393,7 +393,7 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
 			dev_err_probe(scpsys->dev, ret,
-				      "%pOF: failed to get clk at index %d: %d\n", node, i, ret);
+				      "%pOF: failed to get clk at index %d\n", node, i);
 			goto err_put_clocks;
 		}
 
@@ -405,8 +405,8 @@ generic_pm_domain *scpsys_add_one_domain(struct scpsys *scpsys, struct device_no
 		if (IS_ERR(clk)) {
 			ret = PTR_ERR(clk);
 			dev_err_probe(scpsys->dev, ret,
-				      "%pOF: failed to get clk at index %d: %d\n", node,
-				      i + clk_ind, ret);
+				      "%pOF: failed to get clk at index %d\n", node,
+				      i + clk_ind);
 			goto err_put_subsys_clocks;
 		}
 
-- 
2.34.1


