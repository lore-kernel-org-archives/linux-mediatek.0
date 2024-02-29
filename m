Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4933EC54E41
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 14:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xDG8l2SWrThETTz0X8GaI7q6C/OjXyr+z9ITCFXfGU8=; b=tmhuLSPiFWP6yK4anVWWhRz8t8
	LfUOPdJ0fdzGME8yldNogx38k8lxEMr307M8uURYi1cfFfwRlSsjKEAoDfctHxt/3LbEdJXQxsSR4
	mFLvDoT5hbBIL8BRAO7sP8ZAy04upwlUEqY9M85+Gr18st7LoqmPQ8JDl1VHKGql/M2y5UmBhe0W9
	Dmw0or/8kUPuGsymUv0XwfMQkyC/M3Qvcsj2zZOi7P0iP3FvFY9TgzpIrbhE57LnqjDkStpYk3SVW
	KutgNqX6SiIGjzWSVwCMOF2Hw2Wpml5QPD5JFXImpU/q0pwoqosMpQpHHce6sW8vdsZobK//2EwAc
	5BRaVIWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfhik-0000000Dvoe-3Qtx;
	Thu, 29 Feb 2024 14:49:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfhih-0000000Dvkk-3NbN;
	Thu, 29 Feb 2024 14:49:13 +0000
X-UUID: aebaf982d71111ee999fed2339b27864-20240229
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xDG8l2SWrThETTz0X8GaI7q6C/OjXyr+z9ITCFXfGU8=;
	b=t9X5t50NSLtuxE4JHRmOkY/JVkkTRaIs261nzQTHyRAHL+rzUNSPb2gmVJUb7V3BTtpUOk16YSdwBRXnaOoCXxM0+K3Fvi7sL7inYY0gUHiQ4Jf33QmK9/WdZOjv9wJAqFdHBxC9lMM4eX/cUYYZ8RGJtPSByLlqlKltBiSBE+c=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37,REQID:ab7fc9ab-3c47-4428-9c2f-a6aba2edac76,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:6f543d0,CLOUDID:ad075aff-c16b-4159-a099-3b9d0558e447,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: aebaf982d71111ee999fed2339b27864-20240229
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2087784356; Thu, 29 Feb 2024 07:49:04 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Thu, 29 Feb 2024 22:48:46 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Thu, 29 Feb 2024 22:48:46 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>
Subject: [PATCH v2 3/3] drm/mediatek: Add gamma support for MT8195
Date: Thu, 29 Feb 2024 22:48:44 +0800
Message-ID: <20240229144844.1688-4-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240229144844.1688-1-jason-jh.lin@mediatek.com>
References: <20240229144844.1688-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--5.629100-8.000000
X-TMASE-MatchedRID: 9EQCYzKTMIqGeTbGWdRz1q+dYEguu4aV6SXuwUgGH0iph3WXFw7gPvKC
	81FnsF5IThbvLLI8RvPxY0WGgfScA49oUcx9VMLgFEUknJ/kEl7dB/CxWTRRu92KvEVWmYr1BOK
	CpVgJA9x4D937VKhYB4w3t2bVuZQpkVlgDMhSSLYI5Nn50T/hXg==
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--5.629100-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 5EC83FE603B7E51A97315C15E93E9AAB287B3C02EFBFBA32B9D31BD516A6F8A72000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_064911_919952_E291170B 
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
Cc: devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy
 Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Since MT8195 compatible is in the single enum group, we have to add its
compatible into mediatek-drm component binding table to ensure that
it can be bound as a ddp_comp.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogiaocchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 14a1e0157cc4..93303bff8f34 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -707,6 +707,8 @@ static const struct of_device_id mtk_ddp_comp_dt_ids[] = {
 	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8183-disp-gamma",
 	  .data = (void *)MTK_DISP_GAMMA, },
+	{ .compatible = "mediatek,mt8195-disp-gamma",
+	  .data = (void *)MTK_DISP_GAMMA, },
 	{ .compatible = "mediatek,mt8195-disp-merge",
 	  .data = (void *)MTK_DISP_MERGE },
 	{ .compatible = "mediatek,mt2701-disp-mutex",
-- 
2.18.0


