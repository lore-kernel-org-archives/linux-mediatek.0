Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14D84C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 09:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q84JdWMejX6gu3q/+SmW3gZBCLwnHOCSw1I0BK/EB4Y=; b=PCmNzz13rrqiLx
	8aQSz9mR4pjq+ZavxQ4ACjpTvl0jdzaMdN+VDDyYiI6k8R+1o8satTdVT0V5gfdAD6ZNyrDXRYiKI
	GRvPivhQy6LiD2VAZpilBR0KBtf6O0eajUgwmauKfI0gAz/N7Vd5g/36Om2k1qNSriWxc6mORQcrp
	34MedvRYS2zNjmEgaH0I0VFM1noWIJhlRwWhIZFGzxSm03ngTGNitufKAb9zWze+XThXslo8UfhZc
	r8P+gwR4TFSyQuR1ifZg/G2llqnZeZHgKM13mbEFdHYaMsbDQF91mkSSeovoeAOz9Xp59l9Tk1QMk
	2rCXUV81z7J0NXZmcubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQ4gB-009Qej-OF; Fri, 04 Mar 2022 09:56:55 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQ4eR-009Q3U-FF; Fri, 04 Mar 2022 09:55:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 3924D1F46486
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646387706;
 bh=e4C8wnAcuL8k5FwceR/IW4yZe9+rSJuGVPXQwJtpD1U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aUR/YCFlNX2e6vMy8tlrinUWThnwSawU1hOBQWS4mR9lrCsnEdKiPotxuyZSznHoW
 CuxSxQ+db6rQ/SknV8SZF4B3iV0XwDiQ7VKqxVuimOTDAJJRV5uJqj7oJHy/typqbs
 qpx0Sm0URGHzD99/nutjEt2AYZ+C+5/7Fx2C+EHp5+2Tbvo6kGuF3qeLb0rOhmHpe2
 VC1LRjx5/4DaxeSzPCai0uD5191p6KeXqNX7SEkK9ilbpTBR93J2YtkmYUVWUdHFWi
 mNNw6yzpAgEawpwBqgjcOp6pwzn+NgIfg3vjuZ7S+mec55/ePOaFn6I9Jh5C6wNXX3
 bCMDOHNO63iMw==
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
Subject: [PATCH 2/3] dt-bindings: display: mediatek,
 ovl: Fix 'iommu' required property typo
Date: Fri,  4 Mar 2022 10:54:57 +0100
Message-Id: <20220304095458.12409-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_015507_696323_0121F2EE 
X-CRM114-Status: UNSURE (   9.46  )
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

The property is called 'iommus' and not 'iommu'. Fix this typo.

Fixes: 4ed545e7d100 ("dt-bindings: display: mediatek: disp: split each block to individual yaml")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 93d5c68a2dbd..fc691d00c60e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -75,7 +75,7 @@ required:
   - interrupts
   - power-domains
   - clocks
-  - iommu
+  - iommus
 
 additionalProperties: false
 
-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
