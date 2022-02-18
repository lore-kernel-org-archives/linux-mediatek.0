Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49DE2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Feb 2022 10:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FBlYsbpzptAwOVM+PcVYerGisv45JA6npDXvQ+L+HmM=; b=ODqlKKzkiD7o8q
	VuVJNcn1xGnIUyMwEmwSkrziuY+1G7dYPC7R0I3awPGuWz7dl5hLWWmt5siCckZ+VD95EscKvJUTN
	mDqJpIlwK+kHHF/c0KEQqI5BbQ6sliy08rQFzsT3Qz3Zu/3+zOh/oMNrLsYpw5+L8lR6jaLrcK3fb
	CHvY28Y1EgJdY3Wt5S2ZsPncky/VKHRZWz87KxZToOUutljsgpcePLWtGirPSDJElE/+zfNoQZTYR
	SGn9MxWVd2aj+aTclrpnBTiasXbUI0vIAf9WrzfzN2WeQKZmyUI1JgfUFbmBjgdlucLjBprslncP4
	4oVkFOlPC4W9RqP9rE3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nL0Bm-00DkPN-F5; Fri, 18 Feb 2022 10:08:34 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nL0BU-00DkEV-Hi; Fri, 18 Feb 2022 10:08:17 +0000
X-UUID: a7db459477c841ea868dc9dc71115a45-20220218
X-UUID: a7db459477c841ea868dc9dc71115a45-20220218
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 250517703; Fri, 18 Feb 2022 03:08:12 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Feb 2022 02:08:10 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 18 Feb 2022 18:08:08 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Fri, 18 Feb 2022 18:08:05 +0800
From: <xinlei.lee@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>
CC: <dri-devel@lists.freedesktop.org>, <linux-mediatek@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <jitao.shi@mediatek.com>, <allen-kh.cheng@mediatek.com>,
 <rex-bc.chen@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: [PATCH v2,
 2/3] dt-bindings: display: mediatek: dsi: Add compatible for MediaTek
 MT8186
Date: Fri, 18 Feb 2022 18:07:48 +0800
Message-ID: <1645178869-18048-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1645178869-18048-1-git-send-email-xinlei.lee@mediatek.com>
References: <1645178869-18048-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_020816_618559_7CA43254 
X-CRM114-Status: UNSURE (   6.98  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Xinlei Lee <xinlei.lee@mediatek.com>

Add dt-binding documentation of dsi for MediaTek MT8186 SoC.

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 552a013786fe..cdacb2d0d11c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -17,6 +17,7 @@ properties:
       - mediatek,mt2701-dsi
       - mediatek,mt8173-dsi
       - mediatek,mt8183-dsi
+      - mediatek,mt8186-dsi
 
   reg:
     maxItems: 1
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
