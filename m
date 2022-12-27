Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14241C10F1B
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Dec 2022 08:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LI6KXZZE/kkO7EEm4dWHUktdzH3RaSMlvcmGHH9Zdtc=; b=jBjndA2YPuF350MszEJrartXxF
	iBgwP5cc3esnTlPWVsAhMTpqK4xnr+XLnyit1bygglSnRNeRUSucpjIIkKbVQwWpG32Jb6mfppbH4
	0MgFrI9zqO0H5KCd6l98pHVkrQ84XB0aI9tkI0rY3Zp4505tbFsNgi59SYpyw3/x1nckWa5WDA64P
	0e8zF/63WSFrJyoiPoHN/iy6/068YXy64BV8NoYum7HjFDIfl8QdTzpByDU6MQjA4DAKMfIjrHc+x
	GVUWMtR3eed6wotvJv/WhWUOLGGyE78LXamxsjJ7vdZ6DJHzbX1W5Nu+Bmy0dc0sfZgf7mN3fWHvY
	OiutEOHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA5MU-00BNQ1-Nk; Tue, 27 Dec 2022 08:31:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pA5H9-00BKru-0w; Tue, 27 Dec 2022 08:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=LI6KXZZE/kkO7EEm4dWHUktdzH3RaSMlvcmGHH9Zdtc=; b=Drdd0jZ3AMkJQVpgBk8VFv4fYo
	GhDtGBScbcCQjxsyfw+5g1nRzIxzVKGceoc45VGVspQYWQOxnNZEC0zHaDyuvwHKrs7IZTf+arSD5
	wr7By1WFbcPtqCxKj/TCtRIhB66BTd0/uMog+5AcgKgpS8qCFlHrXUSc4ETH6LJSW3ht3zTUwlUB3
	3nnHQPijLIeLLFrMgDw6Q7Q3e9bNVyjPXoVlmww4Zay58XHd0XLgCq3v9SJ0Y7+l50wwhWFDF44YU
	A0fP4V1p1SOpNf51zSKYACa/SVDO1KIVabDCzi3jKfgipxicwTQYNOaFzINuZmwps4FbyKxmI7wE7
	TwhO9l/w==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pA5H2-00FaXO-1Y;
	Tue, 27 Dec 2022 08:25:26 +0000
X-UUID: f004aae4c34740f19a33a585b67021d4-20221227
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LI6KXZZE/kkO7EEm4dWHUktdzH3RaSMlvcmGHH9Zdtc=;
	b=A5KsqmHniuCQr/3r5TTy06+BYTchi51Z6iqgE47Ig2qyylxICTc3jyh7bKxRJGHOb79XItS9q3E0NIayVnAoREPOnyzmzektRCDFmPMNKCPrqukrrqPg/U5UJYCaF9QHcuIs6xVOytLWcYczYGKxNciG4WCWjl3t10I2rennh6M=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:fba50be6-f1be-4f3b-a444-c0e201187e26,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:3363e952-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: f004aae4c34740f19a33a585b67021d4-20221227
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <nancy.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 334325522; Tue, 27 Dec 2022 01:25:23 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Tue, 27 Dec 2022 16:04:45 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Tue, 27 Dec 2022 16:04:45 +0800
From: Nancy.Lin <nancy.lin@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, CK Hu
	<ck.hu@mediatek.com>, <wim@linux-watchdog.org>,
	<krzysztof.kozlowski+dt@linaro.org>
CC: Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers
	<ndesaulniers@google.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<clang-built-linux@googlegroups.com>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<singo.chang@mediatek.com>, Nancy.Lin <nancy.lin@mediatek.com>
Subject: [PATCH v29 03/11] soc: mediatek: add mtk-mmsys ethdr and mdp_rdma components
Date: Tue, 27 Dec 2022 16:04:35 +0800
Message-ID: <20221227080443.6273-4-nancy.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20221227080443.6273-1-nancy.lin@mediatek.com>
References: <20221227080443.6273-1-nancy.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_082525_066006_8B3F8733 
X-CRM114-Status: UNSURE (   7.11  )
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

Add new mmsys component: ethdr_mixer and mdp_rdma. These components will
use in mt8195 vdosys1.

Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: CK Hu <ck.hu@mediatek.com>
Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
---
 include/linux/soc/mediatek/mtk-mmsys.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/soc/mediatek/mtk-mmsys.h b/include/linux/soc/mediatek/mtk-mmsys.h
index d37fa6a426a2..d4b535a3383e 100644
--- a/include/linux/soc/mediatek/mtk-mmsys.h
+++ b/include/linux/soc/mediatek/mtk-mmsys.h
@@ -35,7 +35,16 @@ enum mtk_ddp_comp_id {
 	DDP_COMPONENT_DSI1,
 	DDP_COMPONENT_DSI2,
 	DDP_COMPONENT_DSI3,
+	DDP_COMPONENT_ETHDR_MIXER,
 	DDP_COMPONENT_GAMMA,
+	DDP_COMPONENT_MDP_RDMA0,
+	DDP_COMPONENT_MDP_RDMA1,
+	DDP_COMPONENT_MDP_RDMA2,
+	DDP_COMPONENT_MDP_RDMA3,
+	DDP_COMPONENT_MDP_RDMA4,
+	DDP_COMPONENT_MDP_RDMA5,
+	DDP_COMPONENT_MDP_RDMA6,
+	DDP_COMPONENT_MDP_RDMA7,
 	DDP_COMPONENT_MERGE0,
 	DDP_COMPONENT_MERGE1,
 	DDP_COMPONENT_MERGE2,
-- 
2.18.0


