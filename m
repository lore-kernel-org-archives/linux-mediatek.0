Return-Path: <SRS0=F1mA=FQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82A2BC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Dec 2020 04:13:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4F5842313E
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Dec 2020 04:13:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4F5842313E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=evS0lmts9lJ2tvm858vLGWeDfyefTnI6JDePfz/sFFI=; b=gxeK7ThESseKgfiKnqO2OD0Az
	05zg9pNS+vczBgdZdPhi0kYVWox84WhD0ZLxlFcV+DUK8Xtpoyi41X79afoXvXl/fCwScZSjBcQ9Y
	EgtfGbvD2WakzUgncXmLbgdBUjsCnCC6u2PFJ0yt8Fj24fNj5Th+Oyx+V3Xytuo0dRfDDRfqsSLDf
	yLV+uAiVVFQayRnmTDGZvlT7P+s2NLMIxwn9XgDIE3yISTX1wjiFWcKah4WByJfD4S0M4PgIrLHJn
	GelBsCbCbx6P17zuNL/r6siGyNsGQIYFobuAYDJcsGUei1G1l6eIuoXhkCniT5ruQjdG0OlR8dlzh
	IYpaH7IPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knwH3-0002D3-RC; Sat, 12 Dec 2020 04:12:49 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knwGS-0001v2-3Q; Sat, 12 Dec 2020 04:12:13 +0000
X-UUID: b575809382954946a9ec8ea6f1fbfc78-20201211
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TWRqZnq3f9eroqPF7glUmqIDuZpG8BlSAK6obS8Rf/M=; 
 b=h/Z4+mF9TWpragE2O9Owy+c3xVXwAfai7e13k5CvZEEPJCB+Nq0qHMkXcYzNO2vx1vC3R5mqTz5sdBd6gGJBNw1T3QJG2qvhfXT9rPbLWkNvlqOtuYztdrhxp7vl6jOX8GcBY6FmijmTu+CpIPtoPVG7bzPLxgg/QZaCPVqZv+w=;
X-UUID: b575809382954946a9ec8ea6f1fbfc78-20201211
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2052391660; Fri, 11 Dec 2020 20:12:07 -0800
Received: from mtkmbs05n1.mediatek.inc (172.21.101.15) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 11 Dec 2020 20:12:04 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 12 Dec 2020 12:12:04 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 12 Dec 2020 12:12:03 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2, 04/17] drm/mediatek: add component OVL_2L2
Date: Sat, 12 Dec 2020 12:11:44 +0800
Message-ID: <1607746317-4696-5-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1607746317-4696-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201211_231212_574089_378C028C 
X-CRM114-Status: GOOD (  13.54  )
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

This patch add component OVL_2L2

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 include/linux/soc/mediatek/mtk-mmsys.h      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 8eba44b..8938554 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -403,6 +403,7 @@ struct mtk_ddp_comp_match {
 	[DDP_COMPONENT_OVL1]	= { MTK_DISP_OVL,	1, NULL },
 	[DDP_COMPONENT_OVL_2L0]	= { MTK_DISP_OVL_2L,	0, NULL },
 	[DDP_COMPONENT_OVL_2L1]	= { MTK_DISP_OVL_2L,	1, NULL },
+	[DDP_COMPONENT_OVL_2L2]	= { MTK_DISP_OVL_2L,	2, NULL },
 	[DDP_COMPONENT_PWM0]	= { MTK_DISP_PWM,	0, NULL },
 	[DDP_COMPONENT_PWM1]	= { MTK_DISP_PWM,	1, NULL },
 	[DDP_COMPONENT_PWM2]	= { MTK_DISP_PWM,	2, NULL },
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index 4b6c514..42476c2 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -29,6 +29,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_OVL0,
 	DDP_COMPONENT_OVL_2L0,
 	DDP_COMPONENT_OVL_2L1,
+	DDP_COMPONENT_OVL_2L2,
 	DDP_COMPONENT_OVL1,
 	DDP_COMPONENT_PWM0,
 	DDP_COMPONENT_PWM1,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
