Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB0A2C77B73
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 May 2023 02:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=40AxZoQo5vpBD0hth6FJogHK6G/x3LmjXKvPz4h7t8U=; b=cdwDLQ6cz/6ok+5VrBQvr9MZDp
	NY+n69iRe7w8LvHULKlefSNAKQXeZWDKAsQ7jZwKNgIyaBu3x5TbI1anfuJpm7QbF//kY4ZGKCVQi
	2mGREFJXLT1azhUMfJ9Ev1eWqz5XbA6zoEWN5DXoRJO4UCW2nFWv+J/jgOdAiIVC9vkfTAqIqGMNA
	AGxyr0ezRiud7ItaLgFYd/K/2DYS7nTnrcLhLbX8uoUPHEStpHqDZ0vdCVNzDEILZ+nyKTn3OA+Se
	5RUQn754bcJcOFKtM8czdxXXM2tVIVbg3GisRbFmx7B4RfOxma48lmDHd1DAvcF/M6DBNZtgGzsc6
	OcG+vvjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Hd5-008fS5-1H;
	Tue, 23 May 2023 02:20:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q1Hcr-008fMb-2K;
	Tue, 23 May 2023 02:19:50 +0000
X-UUID: 43d289b2f91011ed83ed1395ce914268-20230522
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=40AxZoQo5vpBD0hth6FJogHK6G/x3LmjXKvPz4h7t8U=;
	b=Ip5LfXQ0JNuph1BP+qJET9UQLyafXXqfPuQdGRaOIC0me75z+I372dyGSIzeZCgH3c1sRp4y1qU9WXMw3Cp+5hLAEEEIXLwFYJSkQhse8oid9ostK7xVKQSQmV4ATr8QEEv5i+PRPoXsd8kmJr2mbyQ1eABuLH0c15jcR4XbbJI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.25,REQID:3c4de05a-f307-4691-9ac1-4747c608256b,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:d5b0ae3,CLOUDID:16cfab6c-2f20-4998-991c-3b78627e4938,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-UUID: 43d289b2f91011ed83ed1395ce914268-20230522
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <trevor.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 208556966; Mon, 22 May 2023 19:19:37 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Tue, 23 May 2023 10:19:34 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Tue, 23 May 2023 10:19:34 +0800
From: Trevor Wu <trevor.wu@mediatek.com>
To: <broonie@kernel.org>, <lgirdwood@gmail.com>, <tiwai@suse.com>,
	<perex@perex.cz>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<conor+dt@kernel.org>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>
CC: <trevor.wu@mediatek.com>, <alsa-devel@alsa-project.org>,
	<linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v2 2/7] ASoC: dt-bindings: mediatek,mt8188-mt6359: remove ADDA_BE from link-name
Date: Tue, 23 May 2023 10:19:27 +0800
Message-ID: <20230523021933.3422-3-trevor.wu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230523021933.3422-1-trevor.wu@mediatek.com>
References: <20230523021933.3422-1-trevor.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230522_191949_775675_7DA8F197 
X-CRM114-Status: GOOD (  10.43  )
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

ADDA_BE is used to connect to mt6359. For machine mt8188-mt6359, codec
for ADDA_BE must be mt6359 which are configured on the machine driver.
Besides, ADDA_BE is divided into two dais, UL_SRC_BE and DL_SRC_BE.
As a result, remove ADDA_BE from items of link-name.

Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml        | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 6640272b3f4f..3d2c01b693be 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -42,7 +42,6 @@ patternProperties:
           we are going to update parameters in this node.
         items:
           enum:
-            - ADDA_BE
             - DPTX_BE
             - ETDM1_IN_BE
             - ETDM2_IN_BE
-- 
2.18.0


