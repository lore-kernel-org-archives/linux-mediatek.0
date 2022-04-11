Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32306C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 02:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s1JLLxE4+MmG9OtYPbCYkb4mIPvu6mDhVMWLDa0LYkY=; b=2o73SKIygHAv3H
	dkjrMtbpad9XGegmI8dQC6PqiUC1flHZQoQo1cBYoSyBXZMTObBkcYAq0AEUP4wPbnTbTQ9HTn598
	GCTu7WhnQITOTRxtRCcmUC5BgofPCPbHREWZ4KJ427XJsO4Zm3RowClx8eE4rcb+RhenAfdejcLOm
	dr1nKgOTFJW4QbBX5/9uzhjx3hNHVqNtvzNxUIusYd+VoDAfRnK61/Q+yYvIj80LImYR6XKLa2q1b
	Ovdpyg8a2T4dlzWa7+vaFJO7fmeaJF9fb1WNhr9s1hetPVKkZOI/d7pi3k8M18wZjmolzErJmyheN
	RAOZfmQ0iAvxVRrIRSOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndjwX-006GzB-Um; Mon, 11 Apr 2022 02:38:17 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndjwK-006Gtj-Cp; Mon, 11 Apr 2022 02:38:05 +0000
X-UUID: e0feb334d3cb4d02a62aab966c9997a1-20220410
X-UUID: e0feb334d3cb4d02a62aab966c9997a1-20220410
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <tinghan.shen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1860914569; Sun, 10 Apr 2022 19:37:59 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 10 Apr 2022 19:27:57 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 11 Apr 2022 10:27:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 11 Apr 2022 10:27:55 +0800
From: Tinghan Shen <tinghan.shen@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Johnson Wang
 <johnson.wang@mediatek.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Henry Chen
 <henryc.chen@mediatek.com>, Zhiyong Tao <zhiyong.tao@mediatek.com>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, <ryder.lee@kernel.org>,
 <wenst@chromium.org>, <chunfeng.yun@mediatek.com>, Tinghan Shen
 <tinghan.shen@mediatek.com>
Subject: [PATCH v14 1/2] dt-bindings: pwrap: mediatek: Update pwrap document
 for mt8195
Date: Mon, 11 Apr 2022 10:27:23 +0800
Message-ID: <20220411022724.11005-2-tinghan.shen@mediatek.com>
X-Mailer: git-send-email 2.15.GIT
In-Reply-To: <20220411022724.11005-1-tinghan.shen@mediatek.com>
References: <20220411022724.11005-1-tinghan.shen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_193804_492756_02331C27 
X-CRM114-Status: GOOD (  10.79  )
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

Update pwrap document description for mt8195

Signed-off-by: Zhiyong Tao <zhiyong.tao@mediatek.com>
Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
---
 .../devicetree/bindings/soc/mediatek/pwrap.txt         | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
index 214a34633824..0581dbda4828 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
+++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
@@ -31,20 +31,20 @@ Required properties in pwrap device node.
 	"mediatek,mt8195-pwrap" for MT8195 SoCs
 	"mediatek,mt8516-pwrap" for MT8516 SoCs
 - interrupts: IRQ for pwrap in SOC
-- reg-names: Must include the following entries:
+- reg-names: "pwrap" is required; "pwrap-bridge" is optional.
   "pwrap": Main registers base
   "pwrap-bridge": bridge base (IP Pairing)
 - reg: Must contain an entry for each entry in reg-names.
-- reset-names: Must include the following entries:
-  "pwrap"
-  "pwrap-bridge" (IP Pairing)
-- resets: Must contain an entry for each entry in reset-names.
 - clock-names: Must include the following entries:
   "spi": SPI bus clock
   "wrap": Main module clock
 - clocks: Must contain an entry for each entry in clock-names.
 
 Optional properities:
+- reset-names: Some SoCs include the following entries:
+  "pwrap"
+  "pwrap-bridge" (IP Pairing)
+- resets: Must contain an entry for each entry in reset-names.
 - pmic: Using either MediaTek PMIC MFD as the child device of pwrap
   See the following for child node definitions:
   Documentation/devicetree/bindings/mfd/mt6397.txt
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
