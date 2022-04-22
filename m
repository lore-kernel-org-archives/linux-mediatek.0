Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EBF2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 03:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P6Yq8ABvubGnvNEK6FLGNOXo0UQO1Z0h7lYVNumjF2w=; b=2BNZvfS0GcPCdf
	qoKh7llui/nkQdWRlgnBJig3hcYsp9n64NX/NiEViLpKaRuMXEc9h0ncn0QEE7l3cfUeFXf58sLnT
	0O2c7h28WN/Ro/IyOBMcaPCuCN7yZ0Xs7jq7sEI6r6tJNWeJs5be+d5WaJ/888GAXIgnyrGz3bdHC
	6kaeHqrcsqicb/K8i8awyiIvKqGB2e2AbHXxYwvG7sUvPB+1oNIj97Az2zJRTi6qJeYWSsnHx4mgl
	FuIJYw5g0s77LJ7lbN2/Q+n9+fQyAEzcgjjJFaYOdjvMdEGaviG0LBVfAFXUjLXV7UdqU/AG4PLrH
	8WZmGiqxUsvZajMOo8ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhk4X-00Fu6J-Fj; Fri, 22 Apr 2022 03:35:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhk4D-00Fu2L-9r; Fri, 22 Apr 2022 03:34:46 +0000
X-UUID: 7a92d51ba1cc49bea63859d3a712eb96-20220421
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:90ec6c22-c5b9-4aea-bda1-43b560aa3790, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:54c7b7ef-06b0-4305-bfbf-554bfc9d151a,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 7a92d51ba1cc49bea63859d3a712eb96-20220421
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1394006947; Thu, 21 Apr 2022 20:34:36 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 21 Apr 2022 20:34:35 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 22 Apr 2022 11:34:28 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 22 Apr 2022 11:34:27 +0800
From: Zhiyong Tao <zhiyong.tao@mediatek.com>
To: <lee.jones@linaro.org>, <robh+dt@kernel.org>, <matthias.bgg@gmail.com>,
 <lgirdwood@gmail.com>, <broonie@kernel.org>, <eddie.huang@mediatek.com>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>, <fshao@chromium.org>
CC: <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>,
 <tinghan.shen@mediatek.com>, <zhiyong.tao@mediatek.com>,
 <hsin-hsiung.wang@mediatek.com>, <sean.wang@mediatek.com>,
 <macpaul.lin@mediatek.com>, <wen.su@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH v2 1/1] pwrap: mediatek: fix FSM timeout issue
Date: Fri, 22 Apr 2022 11:34:23 +0800
Message-ID: <20220422033423.11702-2-zhiyong.tao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220422033423.11702-1-zhiyong.tao@mediatek.com>
References: <20220422033423.11702-1-zhiyong.tao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_203445_385508_533A4042 
X-CRM114-Status: GOOD (  11.52  )
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

From: "Zhiyong.Tao" <zhiyong.tao@mediatek.com>

Fix pwrap FSM timeout issue which leads the system crash on GFX VSRAM
power on.
Add a usleep delay to avoid busy read for the H/W status.
For avoiding the system behavior(ex. disable interrupt in suspend/resume
flow, schedule block task)cause if (time_after()) be turn first,
we change it after sleep delay.

Signed-off-by: Zhiyong.Tao <zhiyong.tao@mediatek.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)
 mode change 100644 => 100755 drivers/soc/mediatek/mtk-pmic-wrap.c

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
old mode 100644
new mode 100755
index 952bc554f443..ac7139a67e87
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
+#include <linux/delay.h>
 
 #define PWRAP_MT8135_BRIDGE_IORD_ARB_EN		0x4
 #define PWRAP_MT8135_BRIDGE_WACS3_EN		0x10
@@ -1197,10 +1198,13 @@ static int pwrap_wait_for_state(struct pmic_wrapper *wrp,
 	timeout = jiffies + usecs_to_jiffies(10000);
 
 	do {
-		if (time_after(jiffies, timeout))
-			return fp(wrp) ? 0 : -ETIMEDOUT;
 		if (fp(wrp))
 			return 0;
+
+		usleep_range(10, 11);
+
+		if (time_after(jiffies, timeout))
+			return fp(wrp) ? 0 : -ETIMEDOUT;
 	} while (1);
 }
 
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
