Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD63CC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 May 2022 11:34:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHoVU9gXDy/TsRxsnYfSIytwGGozZJjonOkiT9k3XQI=; b=F/NH2KV7sDNm+1
	FCaxjLxt5XoqRgrAGU7vPxTILSO4OBWuSGT52TB1SzfexDYft4dvmwA4bghfkQxRv3xx5qAmZ/2RE
	4ck8TDOubjNW+n5qDMUWMnwqOTziXvJwOtFrOy6gYe1AKDVM8C6bvfSYJn3tkmaWYSd8/+xNGMqUA
	hCqHelgAGt90EbEMDMYreD3Fj7iH2rSwkCSNnxN2KudZCk1K7aXqrY3bKtjIgnBF0R2PNjRcc+t2U
	IhwgA5hWGGOSw/nxA+X0n/tJncqxqWELBf9HQB6JLENrc+J34hk2r2WuSG0s5WUgtRPJpOXbAUU2b
	vLcP8NNGaLqsobzoT/ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrHx0-001a3X-LB; Wed, 18 May 2022 11:34:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrHnI-001VoT-7n; Wed, 18 May 2022 11:24:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F16C51F41F11
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652873080;
 bh=A9HSqY7N5tc05EjY65ztCb/z2+4AYlU8OBtRhwBVeKQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eVeP3KgyWZPtLKbKdoAEbgrDQeJPkxwa+ZZMxQOn0di5Y+dA9XUMb0e1cCvlJAMoJ
 4d7X1ZxswdrxNEEWWoIjypf2862J8HeY6tATnfK5pzAhYLHrlS8b6q110pwSu4Y9a5
 H8MVAeX7RO8JvhK0UpTkiDTuOTKDrD5Xl1bSr6k3OILWCOSBrFAsmC25ajVryCp5XF
 +3esnx9JlRZdgQv3OL+66KoKnVgUBAnOSwasyseQYfb7KoJ43q6IYqvo2is94HzQv/
 y3OfZokt2f+m6MUOXbi6j4zPfMy0oQQDhvJ7PEcyvBcgNRM6yJbcIu0bl6wTaqKbs0
 hdfU6FeNql8ug==
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
Subject: [PATCH v3 1/2] dt-bindings: timer: mediatek: Add CPUX System Timer
 and MT6795 compatible
Date: Wed, 18 May 2022 13:24:34 +0200
Message-Id: <20220518112435.241116-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220518112435.241116-1-angelogioacchino.delregno@collabora.com>
References: <20220518112435.241116-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_042444_548194_DC9EE8F8 
X-CRM114-Status: UNSURE (   8.75  )
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
index 6f1f9dba6e88..49706cbef45d 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -2,6 +2,7 @@ MediaTek Timers
 ---------------
 
 MediaTek SoCs have two different timers on different platforms,
+- CPUX (ARM/ARM64 System Timer)
 - GPT (General Purpose Timer)
 - SYST (System Timer)
 
@@ -29,6 +30,9 @@ Required properties:
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
