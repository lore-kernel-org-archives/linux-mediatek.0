Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B58B1C5B572
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 06:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Kkgq7eu8HAKBFteuuyOkTLLBpK2efv//c5IEuEolUjA=; b=R93Qklx0HuxreqfGt5CjEos9dv
	uA97y7oK48e6qwj3wJg7++PIHnk6/oIIhvsLJhg7SUWJPOa+jpzrmfqBCQ/ni9FRPyx59+XixwYpo
	dhdLejf0EHhVgKw/EtyWoE+hjvHh4HOIBsWnCsbqh4AITmwtJvDxp8s7cvEVG4DMw6ZwPIq0ZI34B
	cgXJvfW8YKY/Jk5ZJTtDwegaOCrFXLz9HHYxIuXGUGhWlN0VtjrfqWx6l+yFrreL55tF/A3e0aFS/
	biwfd/1RI45MlXryLLLbpK06Qis6tDtXJwAL2eRz8X8Lw4vCHxayaJqzAZcs2x//NToZWspgXyYfu
	j8WhIa2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaEV-000000098pL-01ty;
	Wed, 19 Aug 2026 06:57:07 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwaEP-000000098oc-2fkJ
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 06:57:05 +0000
X-UUID: 258fe27a9b9b11f19a56ed5b684f684d-20260819
X-CTIC-Tags: HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_UNTRUSTED, SRC_UNTRUSTED, IP_UNFAMILIAR, SRC_UNFAMILIAR, DN_TRUSTED
	SRC_TRUSTED, SA_UNTRUSTED, SA_LOWREP, SA_EXISTED, SN_UNTRUSTED
	SN_UNFAMILIAR, SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_BAD
	CIE_GOOD, CIE_GOOD_SPF, GTI_FG_BS, GTI_RG_INFO, GTI_C_BU
	AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:14351af9-7b94-451e-b8b2-97d7ef248d47,IP:10,
	URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-15
X-CID-INFO: VERSION:1.3.19,REQID:14351af9-7b94-451e-b8b2-97d7ef248d47,IP:10,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-15
X-CID-META: VersionHash:7db8b62,CLOUDID:bf9deac3ab9311691c320776cfe18c39,BulkI
	D:260819145651KAPDYLPA,BulkQuantity:0,SF:19|38|66|72|78|102|127|850|865|89
	8,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:nil,QS:ni
	l,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:
	0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_FSD
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 258fe27a9b9b11f19a56ed5b684f684d-20260819
X-User: lihaojie@kylinos.cn
Received: from localhost.localdomain [(223.104.132.130)] by mailgw.kylinos.cn
	(envelope-from <lihaojie@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 405249312; Wed, 19 Aug 2026 14:56:47 +0800
From: Haojie Li <lihaojie@kylinos.cn>
To: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Haojie Li <lihaojie@kylinos.cn>
Subject: [PATCH] drm/mediatek: Add missing IS_ERR check for ovl_adaptor platform device
Date: Wed, 19 Aug 2026 14:56:42 +0800
Message-Id: <20260819065642.136222-1-lihaojie@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_235704_688581_CE4A15C5 
X-CRM114-Status: GOOD (  10.19  )
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

platform_device_register_data() can fail and return an ERR_PTR, but the
return value is used without checking, leading to an invalid pointer
being stored in ddp_comp[].dev and passed to component_match_add() and
mtk_ddp_comp_init(), which could result in a kernel crash.

Add an IS_ERR() check to jump to the error handling path on failure.

Fixes: 0d9eee9118b7 ("drm/mediatek: Add drm ovl_adaptor sub driver for MT8195")
Cc: stable@vger.kernel.org
Signed-off-by: Haojie Li <lihaojie@kylinos.cn>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index c86a3f54f35b..667d7fdbfbac 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -1112,6 +1112,10 @@ static int mtk_drm_probe(struct platform_device *pdev)
 							    PLATFORM_DEVID_AUTO,
 							    (void *)private->mmsys_dev,
 							    sizeof(*private->mmsys_dev));
+		if (IS_ERR(ovl_adaptor)) {
+			ret = PTR_ERR(ovl_adaptor);
+			goto err_node;
+		}
 		private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR].dev = &ovl_adaptor->dev;
 		mtk_ddp_comp_init(dev, NULL, &private->ddp_comp[DDP_COMPONENT_DRM_OVL_ADAPTOR],
 				  DDP_COMPONENT_DRM_OVL_ADAPTOR);
-- 
2.25.1


