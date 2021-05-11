Return-Path: <SRS0=qC7P=KG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D243C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 12:41:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C8D76191A
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 May 2021 12:41:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C8D76191A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=omyy0YXCSEnBC0VZMNhz2iVVIqmF0g/LBNtwcCXNFdM=; b=JOrO3igloDDPzTesToP9r7WHbS
	Rpo8hfDuFVhoqCv8ekq0LOGTiFz05CbWHTx8W/SbnTPZL1Hq8CTiNv5V3yX3wbT+yKXGU4VYIIZSa
	EgJDDKsBdVy5Psji7esdZpx9LFRr27yx2N8jAYn5MB0OYp2ZGzvaplE+rigzxTXy5q6leUwyOCIVI
	91qpid+nUsFeZJMi/On/GEjGY7Ph/Z/5uTZL8Vudc89abNVVVzAF/X9DoLlH6+CEixz+eiD6mZ9rF
	1EEAZjwlKR2AytX3UOENK/dN/RnSm6U7kLBSCzdXQLOcOcJZPjD5Ql/w4VcrgPLl1aV6ikL9BgZHZ
	FgE5scGw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgRhQ-00HRIY-TJ; Tue, 11 May 2021 12:41:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgPBh-00Gnyv-Mp; Tue, 11 May 2021 10:00:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:
 Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
 Sender:Reply-To:Content-ID:Content-Description:In-Reply-To:References;
 bh=sfI6btkjV3+aPJL3iwJpp0x72HxkYXU9Ly0DbNoOu2k=; b=MpHOKU0kdGNyLKo9mjofVg/sCf
 KEnad3X1fO4yv7azigzZP8kfGrFej7b/rx9tbG5w6kWPxCcf+uMWp/yB+K4qfTFv1J89AnspapRtz
 WWNTydf+t5irXgss9AG0Ue5QlF/E2hbkvlXFrPtmiUv7V5Rb6YgtZ35Uyv+CdQh76kniHnhRgmY1c
 KfuqjxVRzpnM0WkG567+X7Gt7WDT74rQu6i8cJU+CkLrW299e5Eosjv7e/rTRlXgD1tdun37abSFB
 P+TpyKNJ9WRC713Muw6GORz032z2TcXGqka8vJ5eHUEoOACGvzCeyp6UiIwZw6BQcRGdxKvI8Lbbm
 JmjtqojQ==;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgPBe-009SBI-Ts; Tue, 11 May 2021 10:00:24 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FfYHD5Fq4zPwtw;
 Tue, 11 May 2021 17:56:56 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 18:00:08 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, dri-devel
 <dri-devel@lists.freedesktop.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>
CC: Zhen Lei <thunder.leizhen@huawei.com>
Subject: [PATCH 1/1] drm/mediatek: Remove redundant error printing in
 mtk_dsi_probe()
Date: Tue, 11 May 2021 18:00:01 +0800
Message-ID: <20210511100001.5047-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210511_030023_144908_52CE953A 
X-CRM114-Status: GOOD (  10.21  )
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
 drivers/gpu/drm/mediatek/mtk_dsi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index ae403c67cbd922d..89e351dfab88177 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1062,7 +1062,6 @@ static int mtk_dsi_probe(struct platform_device *pdev)
 	dsi->regs = devm_ioremap_resource(dev, regs);
 	if (IS_ERR(dsi->regs)) {
 		ret = PTR_ERR(dsi->regs);
-		dev_err(dev, "Failed to ioremap memory: %d\n", ret);
 		goto err_unregister_host;
 	}
 
-- 
2.26.0.106.g9fadedd



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
