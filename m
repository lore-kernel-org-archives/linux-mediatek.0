Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FE4BCD1297
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 08:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QSg65ax6Gdu9t5wWE/fzcEpRE8uM/nc8aZT4KzdijuU=; b=ETNRdDw1Hk0chPPhEjdwMxJlGH
	neuW1CUGkT5f8UvZnDFe8+I/GELauEypUh8MfoiLTeRHaZIIaBpY4h/K0pZ4/21CdCirwKdKE5rqO
	0F7eqx99x8OYH4SoZzAmTdaBUAz+zPunOutSY/KitmHyqqNIeOOOpl8mereuKroWDyFX3EweqYbHV
	sfd1+y4pZ+OcvySU6CMmSii1eo2ZTPe8qL4XgSM3WFUkHRrkSS4lZBNdi+Y4C6XAypCMOZ3Fc1tT1
	OigC74zT+w8Tzc+stJR1mjkt+tI/cgalQg2OF1MvKX5HDMOCCdBDEjKZx3Py1LUq5scgGp0RggqPB
	z531ozVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTLs-00000005sJg-2sQ7;
	Wed, 10 Apr 2024 08:30:40 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruTLT-00000005ryi-2uHy;
	Wed, 10 Apr 2024 08:30:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712737812;
	bh=DDjimJ60wn8VcBGQiRwLupdMEtQ+UOvMdvJ7mEWJSwQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OgzLBbgp3jJviltWg9d7VOkXZa+d+H5tGdI/r03Gb7MDUOSO2dp0902/lIH5n6HZI
	 fEUmFiBcYMR2Haq5A8EozQ/78OMyld51RsuQdrrk3RsrTPWzVEQiOuDzBQ3moAQzSF
	 sYrIKshCKWd5Z+UOiwZrX9LHld9WMjiITr+EYdIN8ZcEhUQY9PHJeTOAEgBdG8ExcH
	 StKK/wB39V+alkABl5b+5S9S27DWaH7lgT8GVus2wH0jcDt9mMm5syAmIqeQGeW5aL
	 aPKsoqg1b6rCpC98rUJc3CeLXk2tSp+00ExVAoVslvqv8carrv7UlmmTLaNgIZApVZ
	 A3naNNJ2msdVg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B197B37820FA;
	Wed, 10 Apr 2024 08:30:11 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bchihi@baylibre.com,
	bero@baylibre.com,
	amergnat@baylibre.com,
	nfraprado@collabora.com,
	michael.kao@mediatek.com,
	mka@chromium.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8192: Fix GPU thermal zone name for SVS
Date: Wed, 10 Apr 2024 10:30:01 +0200
Message-ID: <20240410083002.1357857-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240410083002.1357857-1-angelogioacchino.delregno@collabora.com>
References: <20240410083002.1357857-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_013016_077606_F8DBD882 
X-CRM114-Status: GOOD (  10.37  )
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

This SoC has two GPU related thermal zones: the primary zone must be
called "gpu-thermal" for SVS to pick it up.

Fixes: c7a728051f4e ("arm64: dts: mediatek: mt8192: Add thermal nodes and thermal zones")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8192.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192.dtsi b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
index f3b0da2399a0..1f0f076272a3 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192.dtsi
@@ -2236,7 +2236,7 @@ vpu1_crit: trip-crit {
 			};
 		};
 
-		gpu0-thermal {
+		gpu-thermal {
 			polling-delay = <1000>;
 			polling-delay-passive = <250>;
 			thermal-sensors = <&lvts_ap MT8192_AP_GPU0>;
-- 
2.44.0


