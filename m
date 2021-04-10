Return-Path: <SRS0=+aVJ=JH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A7BAC433ED
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 09:24:44 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3CD961182
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Apr 2021 09:24:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3CD961182
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zZ/KidhM0WJsAi7HURh/io33XgDPvPaGfDDrYotmNAU=; b=GD+WwvvT3FkDyHr/uigygpj9q
	v4El9Jl6cWJmKkqJuT+vugYVN6Z0nnE1NlTQZgC7zyHCipxmhpuQxhOQk8uE1jzLJbCgtN6ZQWggR
	8gFDKPOjrLaldri1NT0utYD0grmiogUNwsdOZC51LgOrtIPLpMo1LcsQSFA9J4AD8Z6Th6wwu7Z3Q
	Ggu6WdE+WBzG9S2DruZo8woGi5ciXbd6/pzylHjZKvmfuNY4SsAIvPrz2QjhM25dGeYJs+lyN6JCt
	ZDlHf+2JUaTWFOsedtub5URvW7oQaCKRur5J7ulLRlB5zzuf3WDDBF3TCpRVB9dh5GsRczoLSbTDn
	zVIndOmLw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lV9qw-002X4j-KG; Sat, 10 Apr 2021 09:24:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV9pe-002Wmy-3I; Sat, 10 Apr 2021 09:23:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=exJOtquVZHo5YbWjmCRIp9GvARnRFskp+6YaOKQ7Jr0=; b=ryiqdHWcV2AiMFIyJrdeaGJI6+
 58YbNw7+mlzVsKY6cYtwgGnGvKPsi1J6/GKoxm8OTQpRgLj/N+pviHoqF6RSyE7wtzqT/MtvnndNP
 W8dMpaocmK71Q2G7eW6iI+V0TC9Exxzj9/2Bzwdn+4tS31zI+gXm3fyu58ijKlfTfiT4s1IOAGJmb
 q/W7lF6pcurLCuQ+RbgPfxs/rbP+Nj1j2Xh+yZs6ssVpRdx1svBi+CorblCcLO5D7LKD8Ye6YJ2KB
 mFsCNgxp937/ddLy4O2ofiM8OoD23BJE8ahq17ugFRWN2F9YEt0uYPrbaEkEBNgqUb0UDsycXVQc4
 xzzNMcmA==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lV9pb-0050kK-N6; Sat, 10 Apr 2021 09:23:08 +0000
X-UUID: 02241ceb1da848d588ce573a6cd629eb-20210410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=exJOtquVZHo5YbWjmCRIp9GvARnRFskp+6YaOKQ7Jr0=; 
 b=j/l4E49trg5MVOGDB+FH8XzsnHujyrkop4BilWX9wgw+JVp/YhBZ1vkeWaBXdTJg3PF3eaVl84ZaclUKC9UMTW8QCd0WkfVlIvLbt9PFkGOzaxe4cZJrfJqt8BINW7V+Al9APWYRw1NaC1nTQjpqSPb4JoOthqHqTjcDSVPzOkM=;
X-UUID: 02241ceb1da848d588ce573a6cd629eb-20210410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 170570816; Sat, 10 Apr 2021 02:23:02 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 02:13:00 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 10 Apr 2021 17:12:59 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 10 Apr 2021 17:12:58 +0800
From: Yong Wu <yong.wu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Evan Green <evgreen@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, Will Deacon <will.deacon@arm.com>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux-foundation.org>,
 <yong.wu@mediatek.com>, <youlin.pei@mediatek.com>, Nicolas Boichat
 <drinkcat@chromium.org>, Matthias Kaehlcke <mka@chromium.org>,
 <anan.sun@mediatek.com>, <chao.hao@mediatek.com>,
 <ming-fan.chen@mediatek.com>, <yi.kuo@mediatek.com>, <eizan@chromium.org>,
 <acourbot@chromium.org>
Subject: [PATCH v5 07/16] media: mtk-mdp: Use pm_runtime_resume_and_get for PM
 get_sync
Date: Sat, 10 Apr 2021 17:11:19 +0800
Message-ID: <20210410091128.31823-8-yong.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210410091128.31823-1-yong.wu@mediatek.com>
References: <20210410091128.31823-1-yong.wu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210410_022307_776473_B626398D 
X-CRM114-Status: GOOD (  12.47  )
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

pm_runtime_get_sync will increment pm usage counter even it failed.
This patch use pm_runtime_resume_and_get instead of pm_runtime_get
to keep usage counter balanced.

Signed-off-by: Yong Wu <yong.wu@mediatek.com>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
index ace4528cdc5e..93c9df15084a 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_m2m.c
@@ -391,9 +391,9 @@ static int mtk_mdp_m2m_start_streaming(struct vb2_queue *q, unsigned int count)
 	struct mtk_mdp_ctx *ctx = q->drv_priv;
 	int ret;
 
-	ret = pm_runtime_get_sync(&ctx->mdp_dev->pdev->dev);
+	ret = pm_runtime_resume_and_get(&ctx->mdp_dev->pdev->dev);
 	if (ret < 0)
-		mtk_mdp_dbg(1, "[%d] pm_runtime_get_sync failed:%d",
+		mtk_mdp_dbg(1, "[%d] pm_runtime_resume_and_get failed:%d",
 			    ctx->id, ret);
 
 	return 0;
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
