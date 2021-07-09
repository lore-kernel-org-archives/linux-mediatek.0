Return-Path: <SRS0=yaqe=MB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5370CC07E99
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 03:43:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 210F961447
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Jul 2021 03:43:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 210F961447
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=I43bWgbSb7pWRA2SY6Ma+vLXK4VROW8WwAxXr80ehAs=; b=JM7sxMs+Ybbqen
	SJlZRAlbx1WLqTVksq0asLrp4OLnt8kareNShxAZI4NiwoJ1XUMMIwqwgHtKzYBtUBM69fl1eSVFc
	TyTV8zZb0L+nuJ3fN7VtwPkhK45HuSU3AIkP/DKHGB6aaZFfW6NRlbwEgFNNksXVX9eNbShCN0FP9
	1AxEqs1CZ015lra1dzz9DX/JdEScogRbqf8B95DAjUYYMwEZMFefGnUa6sPX2r1eF7f4eitvrmzXi
	rDLkLYyk+yY0JaDsywL7Ep3skYZgdOGIrOirL3OOyT/T6viL3zPYtIQPxtH471QXUFZQK7/LOwe9n
	PCDN9Rv11xRJS54vtJCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m1hQF-000hQw-9k; Fri, 09 Jul 2021 03:43:27 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m1hQB-000hQE-4U; Fri, 09 Jul 2021 03:43:26 +0000
X-UUID: de23e909b8254ccea7b5070639818f07-20210708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=8ZZgs221PXZ51/V5y3V/bkY8adkQ1XSpEe95RlUcwxs=; 
 b=j5bEKRc5dBLFwa8G4KqAAkkFsFm7OUJvSbgJUIU/B4lF0kNTj3EB6WRpEtNVwmkdYiGU2HBl6mOjV0smgk7V+fTG4BHQFIPhGSdRkkZOsPfWeUyaaJ12oxjgJ0tcl31XhnXht3mjsogaNVqVFdjkIfbXAy7j/Aa2Ir5kyWH4Qik=;
X-UUID: de23e909b8254ccea7b5070639818f07-20210708
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <jason-jh.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1958442529; Thu, 08 Jul 2021 20:43:15 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 8 Jul 2021 20:43:13 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 9 Jul 2021 11:43:12 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 9 Jul 2021 11:43:12 +0800
From: jason-jh.lin <jason-jh.lin@mediatek.com>
To: <chunkuang.hu@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <fshao@google.com>,
 <jason-jh.lin@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>
Subject: [PATCH v1] drm/mediatek: Add component_del in OVL remove function
Date: Fri, 9 Jul 2021 11:43:08 +0800
Message-ID: <20210709034308.21713-1-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210708_204324_639649_F2B3DCCC 
X-CRM114-Status: GOOD (  11.42  )
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

Add component_del in OVL remove function to make it symmetrical
to component_add in probe function.

Fixes: ff1395609e20 ("drm/mediatek: Move mtk_ddp_comp_init() from sub driver to DRM driver")

Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_disp_ovl.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
index 961f87f8d4d1..081c96aa7f72 100644
--- a/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
+++ b/drivers/gpu/drm/mediatek/mtk_disp_ovl.c
@@ -158,7 +158,6 @@ void mtk_ovl_stop(struct device *dev)
 		reg = reg & ~OVL_LAYER_SMI_ID_EN;
 		writel_relaxed(reg, ovl->regs + DISP_REG_OVL_DATAPATH_CON);
 	}
-
 }
 
 void mtk_ovl_config(struct device *dev, unsigned int w,
@@ -424,6 +423,8 @@ static int mtk_disp_ovl_probe(struct platform_device *pdev)
 
 static int mtk_disp_ovl_remove(struct platform_device *pdev)
 {
+	component_del(&pdev->dev, &mtk_disp_ovl_component_ops);
+
 	return 0;
 }
 
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
