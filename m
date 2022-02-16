Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C46D0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 01:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w3oAPPo1FjfO9vsnjuuHfQ825n7sfoT829BN7z7f4i8=; b=X1QMvx9+eIcGEo
	aD5QkXM9Z8ZvddLnTaeuhaXTgE7fzSnK2T6Av1MgkVPfAVZ90ihLb4C/PpgGKTu56q+J5pM2zmq+l
	K8++gbJNAyaX7ulRf7rjOE5/AilVM6TXn7dBhcNxVE8Zt7ELKnfKQN740PnZyBPiFN91UznmtpSQp
	1XSqFxSmcsm/U3LRdUtqxakYYyx/IzkJWdOFRYJKE/G2U7+ug1LQc/kSKTJtn5tY9+tVTi2wPheU7
	G4GS3hWRI0tVSe11Py4OeDfRHKnE87V9fUKNwsFUY5uXHHpYCd9ZTMtBBjaRl/2sFTjIvnf4Lmzfj
	mrgIvBbtPkXTz/24BkJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK9V6-005F28-SO; Wed, 16 Feb 2022 01:53:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nK9V4-005F17-DU; Wed, 16 Feb 2022 01:52:59 +0000
X-UUID: 8214914c651a44fa92ae93fc3f698132-20220215
X-UUID: 8214914c651a44fa92ae93fc3f698132-20220215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1966070292; Tue, 15 Feb 2022 18:52:52 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Feb 2022 17:45:33 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 16 Feb 2022 09:45:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Feb 2022 09:45:20 +0800
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: <wim@linux-watchdog.org>, <linux@roeck-us.net>, <matthias.bgg@gmail.com>, 
 <robh+dt@kernel.org>, <p.zabel@pengutronix.de>
CC: <runyang.chen@mediatek.com>, <linux-watchdog@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Rex-BC Chen
 <rex-bc.chen@mediatek.com>
Subject: [3/4] dt-bindings: reset: mt8186: add DSI reset bit for MMSYS
Date: Wed, 16 Feb 2022 09:45:04 +0800
Message-ID: <20220216014505.28428-4-rex-bc.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20220216014505.28428-1-rex-bc.chen@mediatek.com>
References: <20220216014505.28428-1-rex-bc.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_175258_472394_0C41BF8D 
X-CRM114-Status: UNSURE (   9.62  )
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

Add DSI software reset bit which is controlled by MMSYS for MT8186.

Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>
---
 include/dt-bindings/reset/mt8186-resets.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/reset/mt8186-resets.h b/include/dt-bindings/reset/mt8186-resets.h
index 36e5764e2e6c..5f850370c42c 100644
--- a/include/dt-bindings/reset/mt8186-resets.h
+++ b/include/dt-bindings/reset/mt8186-resets.h
@@ -30,4 +30,7 @@
 #define MT8186_TOPRGU_IMG2_SW_RST				22
 #define MT8186_TOPRGU_SW_RST_NUM				23
 
+/* MMSYS resets */
+#define MT8186_MMSYS_SW0_RST_B_DISP_DSI0			19
+
 #endif  /* _DT_BINDINGS_RESET_CONTROLLER_MT8186 */
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
