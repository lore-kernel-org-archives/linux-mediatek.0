Return-Path: <SRS0=4nm1=B6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFE20C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:17:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A3B0B207DE
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Aug 2020 06:17:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U1cz2hBx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fYqxSo8g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A3B0B207DE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=56wLSe7IhsOewqvzUjnGoyy23dQcYvLwNzSqibKMSFU=; b=U1cz2hBxV6XbgxGNqhn4MEvsg
	f8zaf/Ch/cUheoCU1Mr5Cv+zDnt/9rwGB0eVV8NRIEluqVvJBSJhVi8/I9gV7YcRikskhnLCUdg1F
	CMpjvHJWHkvX23XNHQO9P1c3JlB5Au9RjxVOSwdaxByXJNSwX7KVA48uDnHmXcm9XJfWbBIFq93K/
	vWkkt+9tYBAvpuafdVk/vScKpneLvoyvQSleL2A2up5VG9Pv8d0lGeykYVsTnPu6B6HzfMMmN+y/E
	0LsSo//MJhi3MFVLMUNF/Lt2UaFXmXYQpIWevTIYyfdOBbs51ihNqacaYzHyedP6AKr9cw6OjRhRq
	uAomJJA7w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8dsh-0008Or-OX; Thu, 20 Aug 2020 06:16:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8drW-0007vz-Ng; Thu, 20 Aug 2020 06:15:49 +0000
X-UUID: 6d9b79ea6e144f26a503f386afd4b4e5-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=QLvmhk/7LpbICAGpkbfWVn3/Wuqwv5iyOTD2cZ1uZTw=; 
 b=fYqxSo8guHYh4N4Q+QMhwsU5nEfAur78sTXIntde4M8cPHz/EfPwUVTXsOBZhH1uiM6DgHBh1OXsQ1DmCBHnpIRibYJVHUbGCaK6I4J2pJ62IBIiqQKbMhIFRcNQ4Y4x7w3BJHzNVs7Z/JKHVwdiqGjumOwXt+6fRiYhel0+y68=;
X-UUID: 6d9b79ea6e144f26a503f386afd4b4e5-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yongqiang.niu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 258259090; Wed, 19 Aug 2020 22:15:38 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 23:05:36 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 20 Aug 2020 14:05:34 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 20 Aug 2020 14:05:33 +0800
From: Yongqiang Niu <yongqiang.niu@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, "Rob
 Herring" <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v1 03/21] drm/mediatek: add component RDMA4
Date: Thu, 20 Aug 2020 14:04:00 +0800
Message-ID: <1597903458-8055-4-git-send-email-yongqiang.niu@mediatek.com>
X-Mailer: git-send-email 1.8.1.1.dirty
In-Reply-To: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
References: <1597903458-8055-1-git-send-email-yongqiang.niu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200820_021546_997211_63D25F6E 
X-CRM114-Status: GOOD (  14.51  )
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

This patch add component RDMA4

Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c | 1 +
 include/linux/soc/mediatek/mtk-mmsys.h      | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
index 8b9fb5e..c90d2ee 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c
@@ -439,6 +439,7 @@ struct mtk_ddp_comp_match {
 	[DDP_COMPONENT_RDMA0]	= { MTK_DISP_RDMA,	0, NULL },
 	[DDP_COMPONENT_RDMA1]	= { MTK_DISP_RDMA,	1, NULL },
 	[DDP_COMPONENT_RDMA2]	= { MTK_DISP_RDMA,	2, NULL },
+	[DDP_COMPONENT_RDMA4]	= { MTK_DISP_RDMA,	4, NULL },
 	[DDP_COMPONENT_UFOE]	= { MTK_DISP_UFOE,	0, &ddp_ufoe },
 	[DDP_COMPONENT_WDMA0]	= { MTK_DISP_WDMA,	0, NULL },
 	[DDP_COMPONENT_WDMA1]	= { MTK_DISP_WDMA,	1, NULL },
diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index cc22c3e..8ef3eaa 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -38,6 +38,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_RDMA0,
 	DDP_COMPONENT_RDMA1,
 	DDP_COMPONENT_RDMA2,
+	DDP_COMPONENT_RDMA4,
 	DDP_COMPONENT_UFOE,
 	DDP_COMPONENT_WDMA0,
 	DDP_COMPONENT_WDMA1,
-- 
1.8.1.1.dirty
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
