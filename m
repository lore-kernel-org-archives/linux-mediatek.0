Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4725DC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 13:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jXl3rQFVb7DkEVgqzmFKsKRUY5uT0j6D4ia3MMYjA7o=; b=NJ2AmpaJbngVOt
	L3ClVU2gVr+7omgnuzn18yf2JjUmtJSPB33qLVCpcrbmJ4/fL57vkAnRfBFJ9EI62Oazs+m/4Jtk3
	ltePXbAUOg9JPGgIDp9wDsgom2PAGnSsEq+jOeye8DqsAVcqMdzh7ryIK83nqTVmowUILuqnzrqRT
	V4CfrSy4tCExMgi7s4Dr/Qcq2Cm5D+4SH+uNZAJf9dYHFWDxGgMTX3Hn7kNGtCF6ZoDg5ri80+xVj
	e2Fcb6ve2P5HaYJxoYBqH0l/AoxWAFln1HNm5z/cmgI0DpRZpEjtv1zLckqQYArYvq3WqHmRAk4mK
	JJNdTBXf4WAskjsHUKkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kHN-003tl9-2G; Mon, 13 Jun 2022 13:38:53 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0kGx-003tdX-1D; Mon, 13 Jun 2022 13:38:28 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6F44F660166E;
	Mon, 13 Jun 2022 14:38:24 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655127505;
	bh=gVWwzUQD324E96x3GSZda+R9Ken/Uibhk/lfU0iPevc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TWmX/XgYYEOcwHmYmMUJRVaFRF8wk/ZECf4svK6CwHtR4MXBb8DbOVGYqDfuwUAAY
	 2bsq17iIdFMhRO1PHr7iL0Bcp3mW9kPd80FDpfKXXhCZ/9e8qQ6FuqwVZaSs8bjvdO
	 1rCWx8dI0ULZ+Sg/dDIG/mVZcgjOa/jskqlPWz6k/g1lIA3LwilAycfjWMByyogQgH
	 3mOFxkLoMd9X30U28caPmUmAHMQId/G0Xmye/Kc1Qnke3LYWZVuP4DU9Xt6KI9YhBk
	 kGE0IzphD1fldvhjCI+ey+/QtNhlEho64RaIUrbfuUo+Msr0JUvuOJdsKfptW3ujWA
	 VumFyFpRaD3sA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: daniel.lezcano@linaro.org
Cc: tglx@linutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	matthias.bgg@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	konrad.dybcio@somainline.org,
	marijn.suijten@somainline.org,
	martin.botka@somainline.org,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	paul.bouchara@somainline.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: timer: mediatek: Add CPUX System Timer and MT6795 compatible
Date: Mon, 13 Jun 2022 15:38:18 +0200
Message-Id: <20220613133819.35318-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220613133819.35318-1-angelogioacchino.delregno@collabora.com>
References: <20220613133819.35318-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_063827_232859_2E2BF0B9 
X-CRM114-Status: UNSURE (   9.43  )
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
Acked-by: Rob Herring <robh@kernel.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 .../devicetree/bindings/timer/mediatek,mtk-timer.txt        | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index 6f1f9dba6e88..f1c848af91d3 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -1,7 +1,8 @@
 MediaTek Timers
 ---------------
 
-MediaTek SoCs have two different timers on different platforms,
+MediaTek SoCs have different timers on different platforms,
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
