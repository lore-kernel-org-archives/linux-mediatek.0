Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CDFC27C75
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Jun 2024 07:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hw+kxJCCvx5a39LkBUzYc1g2DSK+tBA3dkxoYssYtvc=; b=2Ubb2LvJdCQ9aFgaNHWnTpje5z
	hjpFaUEjm+pqqkzGMl8YcO1S17c/bilP1RP25lYjib+7NqNpCQgFtXgkn2AGEZe3uhlLRrAzL1qnX
	Oa7ew3STQeTjSaOojhdHFs5ixHajtBxXN6h4ZT9ZS+U7hbqcS1Stvv/Kor5ds6P2JLjMlakzXRj3j
	hDhq99BohA/eqT5/VoZkpSMafooMbLu4Kml5ZorJKRYojBK363oYkjpoEHEw8+xbR5haF//hN6A+a
	DPrclcp7CwcSBPWaHfbvTKiH+dPbVQNzRpomsYcLjKs9jP8KTv24DvTCZ8aWmi4MM9514k7mbb6UC
	1Io/We+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIeh-0000000BUmq-084t;
	Wed, 12 Jun 2024 07:44:27 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHIdq-0000000BU82-1zih;
	Wed, 12 Jun 2024 07:43:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718178213;
	bh=06ggiwhMyGPpOHXWaG3DQjMS63EfxHCPMMxtiCYkegg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MzKAVqVwijk6mkNDVISGI0yOnt+0W/Gauxmgj64UBq12mPbsLQrt2lKDe+eey6KAF
	 4UZBr1kAdNv2VItZowPljl2vf3G8WxVZ3N1jFB3LZG/a2Dz0jS1c8kEcgDn00wDm6x
	 /TU9l1hinejjFoYGockEY7byW1MLeKsPFJxltG5y5lJKdiqbyp7Qkg6sy0WU8/arjF
	 6FknBeVwH+/5s2FInK9Qe+80nTOJbk3RPwR4fLkOSkuZtr9sRcX0AY639NgAVdmZxs
	 lfymeH25kLKEDoL6hlOl+2+3k0G51Ph3rydvNHFtuF2TwZXVfx2oKkPWATWFlxVIUZ
	 8wWlbiWeoK3Xw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id EBF2F37821A3;
	Wed, 12 Jun 2024 07:43:31 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-scsi@vger.kernel.org
Cc: alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	peter.wang@mediatek.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	michael@walle.cc,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v5 8/8] dt-bindings: ufs: mediatek,ufs: Document optional dvfsrc/va09 regulators
Date: Wed, 12 Jun 2024 09:43:09 +0200
Message-ID: <20240612074309.50278-9-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612074309.50278-1-angelogioacchino.delregno@collabora.com>
References: <20240612074309.50278-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_004334_706297_E2CFD2D7 
X-CRM114-Status: UNSURE (   7.98  )
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

Document the optional dvfsrc-vcore and va09 regulators used for,
respectively, crypt boost and internal MPHY power management in
when powering on/off the (external) MediaTek UFS PHY.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index 1df8779ee902..b74a2464196d 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -48,6 +48,8 @@ properties:
   reg:
     maxItems: 1
 
+  dvfsrc-vcore-supply: true
+  va09-supply: true
   vcc-supply: true
 
 required:
-- 
2.45.2


