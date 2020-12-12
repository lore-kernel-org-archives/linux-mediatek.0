Return-Path: <SRS0=F1mA=FQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F308C4361B
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Dec 2020 04:13:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 567AA2313E
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Dec 2020 04:13:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 567AA2313E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=W7eXSrh8LCWHoS9zSwOYBtQ5PLRwK+fHyJzEXk2/TjY=; b=XxWgnoBThpmi+/sRa3QhPHacY
	ikXm+OVJ6kRfBd21EIQz1W8rkzlgrUN2ARF0XLZs8yaBgvpQ8gxlUYahj134fFnZMnw5XYPNP2+cw
	ND347ykjisKc1SuuEsMQ0ejY/b//3YsEYsnVMkQ4aGXrNsQqxJ2uHtoW0Fd3wGwiBzeDrKXXZHzF2
	lEKw6KH+4/XPRw53qvYGnQBut3+m/ETNy8pphwG8B+1cZ+XUZ1L2otsU700IWUVgoOxKp5sOmoFhB
	opb0U+u72URqY52B9x8kKAg/h443RxiikJwyzK53CrG5vr6JiM8AOhzGBWJcVp32HMg7dmASfKbPs
	kw66f151Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knwHc-0002cu-RU; Sat, 12 Dec 2020 04:13:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knwGX-0001up-Sc; Sat, 12 Dec 2020 04:12:18 +0000
X-UUID: 9b512221470d48c4ae21f0159d19b677-20201211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Hd7PkleTYGEg17HXbVnj0lSSsz/foVb0xlG11BV9Kro=; 
 b=FsBc04v89LvruaataBpeMZD+z/9zFd1XdMCjkgJ7LmQ7VxUUFVd73l4j83sit2pYaq0TEKoyAEmtxhb3Zn9fWGNo2JOl6NHev0UhILpa+jSpPDkJLZp2XZHCRrqvWeqyq6AZKzsHQLaH1SUFeAmwEhAyhLXE4B2NjAofLgDSbLE=;
X-UUID: 9b512221470d48c4ae21f0159d19b677-20201211
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1550497543; Fri, 11 Dec 2020 20:12:13 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Dec 2020 20:12:12 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Dec 2020 12:12:11 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Dec 2020 12:12:10 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2, 13/17] drm/mediatek: fix ccorr size config
Date: Sat, 12 Dec 2020 12:11:53 +0800
Message-ID: <1607746317-4696-14-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_231218_112100_18E3536B 
X-CRM114-Status: GOOD (  14.02  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

fix ccorr size config

Fixes: cefb6abfcc1c (drm/mediatek: add ddp component CCORR)
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 52b6fc7..c11de66 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -210,7 +210,7 @@ static void mtk_ccorr_config(struct mtk_ddp_comp *comp, unsigned int w,
 			     unsigned int h, unsigned int vrefresh,
 			     unsigned int bpc, struct cmdq_pkt *cmdq_pkt)
 {
-	mtk_ddp_write(cmdq_pkt, h << 16 | w, comp, DISP_CCORR_SIZE);
+	mtk_ddp_write(cmdq_pkt, w << 16 | h, comp, DISP_CCORR_SIZE);
 	mtk_ddp_write(cmdq_pkt, CCORR_ENGINE_EN, comp, DISP_CCORR_CFG);
 }
 
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
