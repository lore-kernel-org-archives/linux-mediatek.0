Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA343C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Mar 2022 12:49:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XJ4IqynfY0TaYymLOf9kA/W14h3QfNuT1g1gfCbYOTI=; b=x22z7oKpr8QBOc
	peeivXNMFobP/KclaKYyXDAz4JP2R3M2JhCrjobrn6Dnz+9Ub/y6ntUROklVwBUfbEdTSSeXZuNMa
	BQ1W12foDIjjIpnupImAfVUiQBpTk8cltZCIExsZaKKKerjbZgzF1OVNwi4lmIWMHMsyKg304tpoc
	B/NQUzrL7lmWk3YDVYanO1JQKelcPuWpP4QkaFahbNj0If6gfXpe69iIlVkxlA0SxWLwNDyopAzxS
	J0RnVSU7l5p2awDkrahs31eTbiAfTcS7dfM6uGevN8Gz5YY3i0r7Byhq+qIv+PGzQfczEakenQtrf
	AqRqN3ipzzAyFxELlCdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZuEz-002HbH-UZ; Thu, 31 Mar 2022 12:49:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZuE6-002HAK-6j; Thu, 31 Mar 2022 12:48:35 +0000
X-UUID: 41d48356fdf84af39574d3b6c2377355-20220331
X-UUID: 41d48356fdf84af39574d3b6c2377355-20220331
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <xinlei.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 633717036; Thu, 31 Mar 2022 05:48:29 -0700
Received: from MTKMBS34N1.mediatek.inc (172.27.4.172) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 31 Mar 2022 05:48:28 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS34N1.mediatek.inc
 (172.27.4.172) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 31 Mar 2022 20:48:25 +0800
Received: from mszsdaap41.gcn.mediatek.inc (10.16.6.141) by
 MTKCAS36.mediatek.inc (172.27.4.170) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Thu, 31 Mar 2022 20:48:17 +0800
From: <xinlei.lee@mediatek.com>
To: <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>
CC: <linux-pwm@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <rex-bc.chen@mediatek.com>, <jitao.shi@mediatek.com>, Xinlei Lee
 <xinlei.lee@mediatek.com>
Subject: [PATCH v5,2/4] dt-bindings: pwm: Add compatible for MediaTek MT8192
Date: Thu, 31 Mar 2022 20:47:51 +0800
Message-ID: <1648730873-18505-3-git-send-email-xinlei.lee@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1648730873-18505-1-git-send-email-xinlei.lee@mediatek.com>
References: <1648730873-18505-1-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_054834_309133_3E0C39DB 
X-CRM114-Status: UNSURE (   7.57  )
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

Add dt-binding documentation of pwm for MediaTek MT8192 SoC.

Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index 36f877f819fa..4bfa8eb42186 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -24,6 +24,10 @@ properties:
       - items:
           - const: mediatek,mt8167-disp-pwm
           - const: mediatek,mt8173-disp-pwm
+      - items:
+          - enum:
+              - mediatek,mt8192-disp-pwm
+          - const: mediatek,mt8183-disp-pwm
 
   reg:
     maxItems: 1
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
