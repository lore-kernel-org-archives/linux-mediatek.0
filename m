Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476B1C25B7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 May 2024 09:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JDW82eIn/C0ony/dfBezSg2jy1A5DkIunbIZGEdM2k=; b=tBL2+PJ5poWinfiXXC5uZo17kX
	1MM6rT7jd3l1qzHJ1RNBlp1T79b0m6f6QoZndlNL4u05DjzA6CMw/DCQzO8tovWajgv8xkRuXaoZC
	iiudgbhQFXd61h48ljE6IsEI6xSBFy0bHlIIM2eu9En/7DECKygzpRYCPmUItAmggrtGYiHgIqeRA
	jENTknMwb9LLazNFJAcw1QvLZTID0AGpA9DUDFndhVTcHWz4We4xyucxDlvkTokv8ySt6ItvKyJlt
	HMrypmOasIXMfSmpvtu+ClFOw5Q/O7t0HNObPJQm5nXL62uRR3MG4pdZViNuEKf0S8rKmOpY7cPOQ
	2N3eymVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWpI-0000000ESm9-3Nyd;
	Mon, 27 May 2024 09:39:32 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBWp0-0000000ESa0-163w;
	Mon, 27 May 2024 09:39:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1716802752;
	bh=/Pi5oJU7aEoIDdHU8CS0oZMV/OUfjI2UVTwuZAZZZoU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uDju4ZopbhFdpJxkuzKCxrtzDM/whBB0cpilfSHMcBV0UbANXRP1PZ+MUeTHO5cmC
	 ZdLTy2m5HqdT7hcr0TrN0+vk6wpbJ15c8065nn4x8Rr9+imowysMod/LR84jjyL60H
	 tLkJcz1eA6Yp1U9KwMT0r/N7oa3q/icUO91W8JdtR+zpPZzVZg+Dm6QflXq3IgRVm+
	 FaqyRXSEAIuTxy+Zi9q1eNP9WRgcX9RoBPwIp6YOyUaqaBg5gGL02JYyqFJA7m/bxX
	 B7kPe3ArGKQbOauzIV1+XrlHbgk8CU8p77IGl0GCtlDTMv2WgaspNBMk9+T0I8pS4a
	 Hqi/jP8jh6ftg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DDFC3378203F;
	Mon, 27 May 2024 09:39:11 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: lee@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	mandyjh.liu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	jpanis@baylibre.com
Subject: [PATCH 1/5] dt-bindings: mfd: mediatek,mt8195-scpsys: Add support for MT8188
Date: Mon, 27 May 2024 11:39:04 +0200
Message-ID: <20240527093908.97574-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240527093908.97574-1-angelogioacchino.delregno@collabora.com>
References: <20240527093908.97574-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240527_023914_480019_19FD88F6 
X-CRM114-Status: UNSURE (   8.94  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add a compatible string for the scpsys block found in the MediaTek
MT8188 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
index c8c4812fffe2..a0d646dfec42 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt8195-scpsys.yaml
@@ -22,6 +22,7 @@ properties:
           - mediatek,mt8173-scpsys
           - mediatek,mt8183-scpsys
           - mediatek,mt8186-scpsys
+          - mediatek,mt8188-scpsys
           - mediatek,mt8192-scpsys
           - mediatek,mt8195-scpsys
       - const: syscon
-- 
2.45.1


