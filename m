Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D7BC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 09:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xt79hQQV23QcCnNG/v4XySHrueSQggMBwUoko13DkdI=; b=ngLoe/qG5d/HPj
	GNpump8Vt2S2ZpJEReaLrUn9e1FMsUki5A2KC2L5qVh2q/AxvqQa1KD4QggYe4gTbWKuwejY5Ym17
	YYH1q65mlQCZ/Djz54+bodg/PYWEfV/freH7eBgdgxnnJuTwzQijPVaZwoK1Ge/FHb+wzfLyfDPKl
	3uVDLnDoUWWpZCdrOgeO3W+Of40/0txvBV8D9rcdN8ehzMlSrtBcS3y+e03+EC++eqlmMRBtESeKi
	VnzUVElJAaSBVY9NTnkxVIiOXttXzxYQd1YA6E4g5wWgWT3tRucnuKcEMneHMQzQSZtPhiM3ZbZip
	7CtuGvFxvjA5sIsq1rbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ4hN-009R9t-My; Fri, 04 Mar 2022 09:58:09 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ4eR-009Q35-Rn; Fri, 04 Mar 2022 09:55:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id F14D01F46484
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646387705;
 bh=5NfY/OJo8jqAhMoYvWFCELHiFzPVbvYo7BtN/XmNlig=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DPnVo17AchbcX1D6AJFR5p0tyDHCjx99Esxk+83qV7geF2q0lS2SLQp7ICsRZEZHb
 2O1WBR/t6S1KKLt4z05Bb28WIBfhQLkaqE7d7FSJJP5BtOMQW+yspONmpoz6SD8kwa
 mbw2HB9CHwyYwB1oOGgzbCG6zcFRLNnJbX0PwQOgzpnpmErvJtdqwxwI16I3h3AZ3L
 rmurszwu/YQhiMy1sy/pekCLuaLantfHqFCUxXYe7+Z5Sr9M21Z8kzZN+gPe3m5eOE
 NlXdWk5FVwohdv9m1p957p3qNgPrubrrPSkLCjbwAPTKZmNozxAYZygTNxQUAN5VTT
 B2nv9/mnJNOqQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski@canonical.com,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 matthias.bgg@gmail.com, ck.hu@mediatek.com, jitao.shi@mediatek.com,
 jason-jh.lin@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH 1/3] dt-bindings: display: mediatek, mutex: Fix mediatek,
 gce-events type
Date: Fri,  4 Mar 2022 10:54:56 +0100
Message-Id: <20220304095458.12409-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_015508_088375_6D8EBD7A 
X-CRM114-Status: GOOD (  10.91  )
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

The mediatek,gce-events property needs as value an array of uint32
corresponding to the CMDQ events to listen to, and not any phandle.

Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,mutex.yaml    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
index 6eca525eced0..842ba7b07a34 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,mutex.yaml
@@ -58,7 +58,7 @@ properties:
       The event id which is mapping to the specific hardware event signal
       to gce. The event id is defined in the gce header
       include/dt-bindings/gce/<chip>-gce.h of each chips.
-    $ref: /schemas/types.yaml#/definitions/phandle-array
+    $ref: /schemas/types.yaml#/definitions/uint32-array
 
 required:
   - compatible
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
