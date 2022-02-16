Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15067C433FE
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 09:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KLPPCbDZAtL1Y5wBekHueKA1ptNZvKTBXD0JV5LrskA=; b=TaqzyafHDcyy/p
	ZS2XdaKyB91L9pAEV5Zu1ykzhMBDoes2zvLyIjgqgY675T8lJ7PVTDQW60IqWHiry7T12fjkZIRtI
	2eB0kDL9S/Kdf7KeIdQ9Y1Ch7cTv4pflLFp4+GCrq3i1E9pPYceyQ8Y7GaTZG3P4LpeXHlAH+Wypt
	roK/GYDt2mtIRqu5EOl7w0EjSbkK9UoBtEJf9vsjjDBupXae2dqv5TH7+ArKTFu/oHzsHF1mB0Uom
	fX9Azlcm6WCI/3tOcsjLFjwNioF9H1Rf7z2yCqbQmuf1AKWy/LJ6G+usfMblvdWTIUFydGG2gR2tG
	4pGEJ/27/3kEnK252X5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKGgv-006MF5-Fj; Wed, 16 Feb 2022 09:33:41 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKGgW-006M3x-LW; Wed, 16 Feb 2022 09:33:18 +0000
X-UUID: 47e8ed9a4d4646f88245d19170d4a94e-20220216
X-UUID: 47e8ed9a4d4646f88245d19170d4a94e-20220216
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1830288620; Wed, 16 Feb 2022 02:33:11 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Feb 2022 01:33:10 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Feb 2022 17:33:09 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Wed, 16 Feb 2022 17:33:08 +0800
From: <xinlei.lee@mediatek.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <jitao.shi@mediatek.com>
CC: <allen-kh.cheng@mediatek.com>, <linux-pwm@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Xinlei Lee
 <xinlei.lee@mediatek.corp-partner.google.com>
Subject: [v2,4/4] dt-bindings: pwm: Add compatible for MediaTek MT8186
Date: Wed, 16 Feb 2022 17:32:51 +0800
Message-ID: <1645003971-16908-5-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_013316_735011_301FE576 
X-CRM114-Status: UNSURE (   8.06  )
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

From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>

Add dt-binding documentation of pwm for MediaTek MT8186 SoC.

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index 768ab04d3764..1f45b1b8c3d4 100755
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -17,6 +17,7 @@ properties:
       - mediatek,mt6595-disp-pwm
       - mediatek,mt8173-disp-pwm
       - mediatek,mt8183-disp-pwm
+      - mediatek,mt8186-disp-pwm
       - mediatek,mt8192-disp-pwm
       - mediatek,mt8195-disp-pwm
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
