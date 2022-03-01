Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43CD7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Mar 2022 07:40:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hfoXAxuM4i4DgCxCCbSMABSNZC6NXfxjtPfbYSLNvq0=; b=bLOBDNko98fced
	riaNSjoPhyUNE9VebWDYTMu2ODYQPFNdck/KoTi71l5kDsIz4nGx23NI0CCD+W0kE7Xrf9VM3nVts
	u7mSlPutEcpJhp2ImXB68iN3UvszqahDdaRVtINweITWFc+Q2mef+W964Lqn5SEbJKSGKRLuLcaWZ
	Kmq1oNIfBA8GX3sP96heXNncPzIz1mWHVXbZ5wxiGX6ajrPnXzoT4PKS/j7mCvAQS8sXiuO+kPk8x
	GFMlw18c+gWM7ZqNrk+Q3xv+gdgdDWMfIFfQ48HDW0gcR7RVhsLhfnVbdA0vJth9m9pENsI2qFkgy
	tFEdtaYEHvqZDMVET/6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOx75-00FME8-Cc; Tue, 01 Mar 2022 07:40:03 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOx6h-00FM8W-Kj; Tue, 01 Mar 2022 07:39:40 +0000
X-UUID: 4b5b115b3b36484c9c37662115a50790-20220301
X-UUID: 4b5b115b3b36484c9c37662115a50790-20220301
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 232815280; Tue, 01 Mar 2022 00:39:32 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 28 Feb 2022 23:29:30 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Tue, 1 Mar 2022 15:29:29 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 1 Mar 2022 15:29:28 +0800
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: <broonie@kernel.org>
CC: <robh+dt@kernel.org>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>, 
 <tzungbi@google.com>, <alsa-devel@alsa-project.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.corp-partner.google.com>, Jiaxin Yu
 <jiaxin.yu@mediatek.com>
Subject: [PATCH 1/2] ASoC: dt-bindings: mt8192-mt6359: add new compatible for
 using rt1015p and rt5682
Date: Tue, 1 Mar 2022 15:29:23 +0800
Message-ID: <20220301072924.24814-2-jiaxin.yu@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220301072924.24814-1-jiaxin.yu@mediatek.com>
References: <20220301072924.24814-1-jiaxin.yu@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_233939_699853_9FE0EAAC 
X-CRM114-Status: UNSURE (   7.66  )
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

From: Jiaxin Yu <jiaxin.yu@mediatek.corp-partner.google.com>

Adds new compatible string "mt8192_mt6359_rt1015p_rt5682s" for machines
with rt1015p and rt5682s.

Signed-off-by: Jiaxin Yu <jiaxin.yu@mediatek.com>
---
 .../devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml   | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
index a781e7aaaa38..4b0b0478018a 100644
--- a/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8192-mt6359-rt1015-rt5682.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - mediatek,mt8192_mt6359_rt1015_rt5682
       - mediatek,mt8192_mt6359_rt1015p_rt5682
+      - mediatek,mt8192_mt6359_rt1015p_rt5682s
 
   mediatek,platform:
     $ref: "/schemas/types.yaml#/definitions/phandle"
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
