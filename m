Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D5F6C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Mar 2022 06:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ok8ocTY7oJgzHgTRmtm/UdcMtTGKffi7TD4cZhTaxM8=; b=eaCDlch8rPXRXC
	7wrkRWexN3C8kNkMb3yDVm91IW0fhweTZA8Ef5iUryOE5JHcGzTUrWGuKMxfySq77Xes3TChPQtbC
	sY/jedOXOXd1CwNnj+foGhY4fCdVo0w/LzAZFd+99YTl2hsZIga6oBECSkRUZSU6m+9v1T9V0Tgnc
	zh9BBpTEPf2IIybhjQi/bxwOL+TDjONQfHQSrF/+Dyj+GAP+teZf6S1dLPxNVnBxF7YBOSQbhzZXZ
	XqQucdEaaAaCZYS16qvRP/IjX1kbuU1srFlFQQIBRtOMPSs/co1A0nBAbTsRvyHDroqspkUT0yUkr
	pLfhRg4S6hFMbawZj7pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nXGhU-00Fm9x-1t; Thu, 24 Mar 2022 06:12:00 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nXGhE-00Fm6C-Oi; Thu, 24 Mar 2022 06:11:45 +0000
X-UUID: 075757c44ee64c4aa3c3f1eb3a84173e-20220323
X-UUID: 075757c44ee64c4aa3c3f1eb3a84173e-20220323
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1801371441; Wed, 23 Mar 2022 23:11:41 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Mar 2022 23:03:34 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 24 Mar 2022 14:03:32 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 24 Mar 2022 14:03:31 +0800
From: <xinlei.lee@mediatek.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <linux-pwm@vger.kernel.org>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <jitao.shi@mediatek.com>, <rex-bc.chen@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, Xinlei Lee <xinlei.lee@mediatek.com>
Subject: [PATCH v4,
 2/6] dt-bindings: pwm: Remove compatible for MediaTek MT8167
Date: Thu, 24 Mar 2022 14:03:20 +0800
Message-ID: <1648101804-3584-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1648101804-3584-1-git-send-email-xinlei.lee@mediatek.com>
References: <1648101804-3584-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220323_231144_815452_DEC71049 
X-CRM114-Status: UNSURE (   9.14  )
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

Remove dt-binding documentation of pwm for MediaTek MT8167 SoC.
I did not find the compatiable corresponding to mt8167 
in the latest version of the pwm-mtk-disp.c driver file.
It may be disabled but not updated to the dt_binding file.

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index f844695d605a..f18e8bbd13d2 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -20,9 +20,6 @@ properties:
           - mediatek,mt2701-disp-pwm
           - mediatek,mt6595-disp-pwm
           - mediatek,mt8173-disp-pwm
-      - items:
-          - const: mediatek,mt8167-disp-pwm
-          - const: mediatek,mt8173-disp-pwm
 
   reg:
     maxItems: 1
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
