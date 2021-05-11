Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC74C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:09:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A53A5613CA
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 13:09:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A53A5613CA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H81pVTIG4DEAUDzd960VptDpunW7/YC0bAI+ql/GJso=; b=cRC4TadohzbzUDWtHm26HKiDuv
	a8aUUZIJYhhhnUJ+a3CNP5r51biZ9hiCJBu3ah2sjukB5Ud9hPd6lmT4vbeZFcdJQYCWuYLc2UcG+
	/WgHTaKA+DbzqRfFzgCJNREx2vHvKgo0sr0LJrekAU8T2q3Z5DfIuWoi57dubapEiWLfXo1Aup/H5
	A6OMLLxOm6Smnefz/OeLAlM9839GOWwdmTjSUKWb0FFgOOcHKWw/qsoOV/8K1UDEmgFOWG9jUurqT
	gxZHOr25yVjiZlVnb2LyDeU5+YQO0rVZhBkuWCPvAQ+4kVUwMbsY3xnVEu5HqgG8HwQ+SZNEDf3Fj
	osNIlvGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgS8Z-00HaTr-ND; Tue, 11 May 2021 13:09:23 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgQcd-00H8nc-Vm; Tue, 11 May 2021 11:32:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=QECWY5awbDEe/b9jw0aJIsQYY/b/0ULgzBKzJFrrAxc=; b=Lt8UDSy0Gb50zz1EsDoxHsARtD
 CrcdZOHP7r2VNAP2TL8hxF+7xguuZP0ARBY8cQjNfrJdNgKNfahfVeWarBEmAGHzUuzYe5jVIlp9b
 8NNJuqfqQFntiViErdF3MxBYvWi6JgzN1RYbAsBmQTbEhKhi0Sbqce1B78PIOxHErYLJXKhkGntKP
 UoBFtEQdyGzdcjnx1fz2msu0mZslcxorZzqxPQVEmHRYczWoLTDST9B2dZ8nkivX/CdRo95Olgf9t
 q+DjIW6hFXYsi9CrdHsYTSTrMl5rczueFOAvYjfqVEac48Vz8hUerN2tVFHEJcYw0UjJ9bra7BkVY
 wPI6hxlQ==;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgQcb-009WRW-5c; Tue, 11 May 2021 11:32:18 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FfbL72Z5vz1BHtL;
 Tue, 11 May 2021 19:29:35 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 19:32:04 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] drm/mediatek: Remove redundant error printing in
 mtk_cec_probe()
Date: Tue, 11 May 2021 19:32:00 +0800
Message-ID: <20210511113200.5439-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_043217_396027_210E071F 
X-CRM114-Status: GOOD (  10.25  )
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

When devm_ioremap_resource() fails, a clear enough error message will be
printed by its subfunction __devm_ioremap_resource(). The error
information contains the device name, failure cause, and possibly resource
information.

Therefore, remove the error printing here to simplify code and reduce the
binary size.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/gpu/drm/mediatek/mtk_cec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_cec.c b/drivers/gpu/drm/mediatek/mtk_cec.c
index e9cef5c0c8f7eff..fd593ff99bfd447 100644
--- a/drivers/gpu/drm/mediatek/mtk_cec.c
+++ b/drivers/gpu/drm/mediatek/mtk_cec.c
@@ -197,7 +197,6 @@ static int mtk_cec_probe(struct platform_device *pdev)
 	cec->regs = devm_ioremap_resource(dev, res);
 	if (IS_ERR(cec->regs)) {
 		ret = PTR_ERR(cec->regs);
-		dev_err(dev, "Failed to ioremap cec: %d\n", ret);
 		return ret;
 	}
 
-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
