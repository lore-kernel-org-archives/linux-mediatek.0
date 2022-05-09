Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3550C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 May 2022 10:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAAC1fqdc3FS1AjmeRAbaEM14H/QQZ+Zy4JQpUHwFm4=; b=kGE9saKafKLuWq
	8foCaW10Pe0gG0AgD/8nd76JcLs8GQJ4+Yb44dOA+cxj/vNO22/+Skryc5tqbTPfbybPiZBPHvo3o
	KKinnlF0uTATMBXf8bnspXaiys1GpELNi3dz9ctt6Mw3xb5HJ/IuqV73yXPXtciUH8QXwAwhMJec9
	e3/vVvEW1JogWNUpMfkzKQfh/xMsC+Q3FRRC4Eex8K2zqj7gx/vdEsuok1G/WMOcrHW5cqUggUGUB
	3pDKr3cCkP20ZQZ8M4oUP3XldlywcCRZHaWv3mn3N3liV/NQ5q4baM6HAcHib584RC1yYIG4b46aD
	YNykKPcxtSfJR8gv1zJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no0WR-00DjI3-Of; Mon, 09 May 2022 10:21:47 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no0Vr-00Dj1x-5s; Mon, 09 May 2022 10:21:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C5C011F4376E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652091669;
 bh=olbInTBcsJ7OBs0Az64gQWO87DN9MjbVGnMzsKIcrgw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lvi3SIcfXeRf4XU7UFmELdSoDYNvwzyS+GodMXAeztXY501u1tqhVvhHK5ok97XaR
 NJTLdS9FxXSHmbeoOkHfxfGyRROOOLGktuQYN6qL4XGPYFVyW4mNkDEvpfAfAN5hDE
 YsQ8jVB+BdjEQphUehmPmxRibikOUzaBKYAWOtYulS1KGWQdQCh5uTRIcXFcm8k2AQ
 SUEa5i1SzrSJWrJ8sx6nmcaa8bHcl9y2+oLResDfgece6cPW9nFdo17gtwFD8ehmzU
 hwJgL3Wld7ukzwGviCsC9GcU4uIkX6RQmUFx7okjDOy8Yp6QqxXCBOZDegZ9mppqxQ
 3s/kCoV9quA6w==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: daniel.lezcano@linaro.org
Cc: tglx@linutronix.de, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 matthias.bgg@gmail.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/2] dt-bindings: timer: mediatek: Add CPUX System Timer and
 MT6795 compatible
Date: Mon,  9 May 2022 12:20:57 +0200
Message-Id: <20220509102058.3064215-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509102058.3064215-1-angelogioacchino.delregno@collabora.com>
References: <20220509102058.3064215-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_032111_470110_2703A1BD 
X-CRM114-Status: UNSURE (   8.89  )
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

Document the "CPUXGPT" CPU General Purpose Timer, used as ARM/ARM64
System Timer on MediaTek platforms and add the MT6795 compatible for it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/timer/mediatek,mtk-timer.txt          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index fbd76a8e023b..2d139d24e535 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -2,6 +2,7 @@ MediaTek Timers
 ---------------
 
 MediaTek SoCs have two different timers on different platforms,
+- CPUX (ARM/ARM64 System Timer)
 - GPT (General Purpose Timer)
 - SYST (System Timer)
 
@@ -28,6 +29,9 @@ Required properties:
 	* "mediatek,mt7629-timer" for MT7629 compatible timers (SYST)
 	* "mediatek,mt6765-timer" for MT6765 and all above compatible timers (SYST)
 
+	For those SoCs that use CPUX
+	* "mediatek,mt6795-systimer" for MT6795 compatible timers (CPUX)
+
 - reg: Should contain location and length for timer register.
 - clocks: Should contain system clock.
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
