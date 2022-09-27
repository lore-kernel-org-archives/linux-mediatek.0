Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60B6C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Sep 2022 15:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38U60X3rFuXIRl4dzLCwDZAAhyNkDLbbp9ptltU3lik=; b=EnZGrhUzrntgou+yc9HpI6q5Dw
	EWhpd+ca0tBkdqzq63KSvMl2oVUgl8KAYGueuwu3JZnSWCfQ3kB873zvDMtk7dSFynAgB4zd0O4tc
	8RHB4LFVGZiyxTMrujVsF5XUfp7j12i2MXAaKWLq1OXJw+MykGhgeEs1yNlKkAQ3k8I6svJY1eYhY
	J0488dsFlPuPGDb9xGnI9IOrTSGN955CpccVggEeev+nWOB5MIZ2jl/IjmQSYjiyDqpFnzuzDzSxC
	qfadcaBNARaky5UzWhYWW2Zt21N0vW4ujxNs5CcAsp6+KAlmwrH1YdObAvDn1DL4UYfrFburSbCeI
	qqtAPXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odCWt-00BSNu-Fq; Tue, 27 Sep 2022 15:29:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odCWX-00BSIw-Ap; Tue, 27 Sep 2022 15:29:30 +0000
X-UUID: ee71673ac1fc42a882e7ee8bfe5dafbc-20220927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=38U60X3rFuXIRl4dzLCwDZAAhyNkDLbbp9ptltU3lik=;
	b=j1UMCHR3uG0lCkBHL7Y5+JkdOQmu4kEPKJPWp8nFUA/oB6Y6YgxmQzRK+soF2hL9cYYpdVoQmoVOIrPw067Y+oYpJQdEoQ+pcQXfUY79foz8Q1BqWppRxejWtygnGGC9bS0zW2X2kB/RzsPKdlvQ57N6UwNQiziqa/cqLcMgvSQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.11,REQID:777096f5-feb5-4709-bbd5-14ecb36cbba0,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.11,REQID:777096f5-feb5-4709-bbd5-14ecb36cbba0,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:39a5ff1,CLOUDID:423e67e4-87f9-4bb0-97b6-34957dc0fbbe,B
	ulkID:220927232902N32Q17BT,BulkQuantity:1,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: ee71673ac1fc42a882e7ee8bfe5dafbc-20220927
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <jason-jh.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 866727546; Tue, 27 Sep 2022 08:29:24 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 27 Sep 2022 23:28:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 27 Sep 2022 23:28:47 +0800
From: Jason-JH.Lin <jason-jh.lin@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
	<chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
CC: CK Hu <ck.hu@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>, "Singo
 Chang" <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
	<dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Jason-JH.Lin
	<jason-jh.lin@mediatek.com>
Subject: [PATCH v5 6/6] soc: mediatek: remove DDP_DOMPONENT_DITHER from enum
Date: Tue, 27 Sep 2022 23:27:04 +0800
Message-ID: <20220927152704.12018-7-jason-jh.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
References: <20220927152704.12018-1-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_082929_382392_79E6EE39 
X-CRM114-Status: UNSURE (   9.56  )
X-CRM114-Notice: Please train this message.
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

After mmsys and drm change DITHER enum to DDP_COMPONENT_DITHER0,
mmsys header can remove the useless DDP_COMPONENT_DITHER enum.

Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
Acked-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 include/linux/soc/mediatek/mtk-mmsys.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index d2b02bb43768..16ac0e5847f0 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -16,8 +16,7 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_CCORR,
 	DDP_COMPONENT_COLOR0,
 	DDP_COMPONENT_COLOR1,
-	DDP_COMPONENT_DITHER,
-	DDP_COMPONENT_DITHER0 = DDP_COMPONENT_DITHER,
+	DDP_COMPONENT_DITHER0,
 	DDP_COMPONENT_DITHER1,
 	DDP_COMPONENT_DP_INTF0,
 	DDP_COMPONENT_DP_INTF1,
-- 
2.18.0


