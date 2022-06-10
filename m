Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A545BC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 11:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X9vNYldKBntHWhtvgnPKPOsRK8JAu+nP9jCC/EVbmy0=; b=hP+cY3uwkc1lBt
	yMEeovyrIml8eLacg4cz+PgrUtzRZcBHwqe7OwSDQdetJ3v/a89HDMjdzmAb/bsU4K86wy0w8XLQ/
	TJEBJ5m9SLROJk66gmIRume1XqMNNfl8Aa36s7y/YAGEWvblXa281X7Rx2ndUNxa7L3HCC8ipF4NS
	tzGkI3c0TTDtbFxzgJT7hL0B9C4/aISYNCcpuA07dCnEJYvEvxQzGMomHVyLg4NJt8TfWBHWdhcRC
	7x/8QRn38thyCjK733hh/aVyybq3jFOYkDDEWqR7ZSI6TuPq/sIvvL4gkECpeCS9RK4FQ0y2QI31X
	Sf+dVWBV2Lz8tVgHZ+vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzcSj-007kWA-2v; Fri, 10 Jun 2022 11:05:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzcSN-007kQp-H9; Fri, 10 Jun 2022 11:05:37 +0000
X-UUID: 19c27bc8f8e44936bfaa828699bb092f-20220610
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:e62d25a3-77f1-4f4e-9fbf-ee6f5e97b389,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:0a1168e5-2ba2-4dc1-b6c5-11feb6c769e0,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 19c27bc8f8e44936bfaa828699bb092f-20220610
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
	(envelope-from <rex-bc.chen@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 2265272; Fri, 10 Jun 2022 04:05:26 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Jun 2022 03:55:25 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 10 Jun 2022 18:55:23 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.3 via Frontend Transport; Fri, 10 Jun 2022 18:55:23 +0800
From: Bo-Chen Chen <rex-bc.chen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <daniel@ffwll.ch>,
	<robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>,
	<mripard@kernel.org>, <tzimmermann@suse.de>, <matthias.bgg@gmail.com>,
	<deller@gmx.de>, <airlied@linux.ie>
CC: <msp@baylibre.com>, <granquet@baylibre.com>, <jitao.shi@mediatek.com>,
	<wenst@chromium.org>, <angelogioacchino.delregno@collabora.com>,
	<ck.hu@mediatek.com>, <dri-devel@lists.freedesktop.org>,
	<linux-mediatek@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-fbdev@vger.kernel.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Bo-Chen Chen
	<rex-bc.chen@mediatek.com>
Subject: [PATCH v11 02/10] drm/edid: Convert cea_sad helper struct to kernelDoc
Date: Fri, 10 Jun 2022 18:55:14 +0800
Message-ID: <20220610105522.13449-3-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_040535_670703_9A1149EB 
X-CRM114-Status: GOOD (  10.82  )
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

From: Guillaume Ranquet <granquet@baylibre.com>

To illustrate the cea_sad helper struct more clear, we convert the
driver comments to kernelDoc.

Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
[Bo-Chen: Add commit message and modify reviewers' comments.]
Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 include/drm/drm_edid.h | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index b2756753370b..c2c43a4af681 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -359,12 +359,18 @@ struct edid {
 
 #define EDID_PRODUCT_ID(e) ((e)->prod_code[0] | ((e)->prod_code[1] << 8))
 
-/* Short Audio Descriptor */
+/**
+ * struct cea_sad - CEA Short Audio Descriptor.
+ * @format: See HDMI_AUDIO_CODING_TYPE_*.
+ * @channels: max number of channels - 1.
+ * @freq: See CEA_SAD_FREQ_*.
+ * @byte2: meaning depends on format.
+ */
 struct cea_sad {
 	u8 format;
-	u8 channels; /* max number of channels - 1 */
+	u8 channels;
 	u8 freq;
-	u8 byte2; /* meaning depends on format */
+	u8 byte2;
 };
 
 struct drm_encoder;
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
