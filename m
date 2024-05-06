Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 694C4C25B5F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 14:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ntC+Vfux6EY7gajVp/vbM+k8iM8zuBDqDds5zq5Lbk4=; b=gU7jbZu5Gn8rEc/EMWlTNmkj9F
	sBjv/A17sE+q0abBrvTLr1FPT+5t47DVvizV/HOL7W4N3uqqklrjfKO/p/eL/4kfFHVor/F/QK236
	kFDXgKr6xdtBT9ugrH2IaB0XS6LcFvbhEAbnfzhKrfKfHwNwGqdnnO2tGIhjZRnSLmMJ3M906z4fO
	lKZqp/U2Y9cyVwn5e25pbTNwVLtv5RL268vqZuW8uOIeug0z9ct6zC4CCYFuXUQw0SbdIn5VNObKl
	/ej9jEV+G4AB3CtBXSA30f1K5vAApfOzGlnhe502z4PkrQOwIfxV3iqFkeFvu615NECQRH4Rzytt4
	//wYXSwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3zaz-00000007inM-06Gl;
	Mon, 06 May 2024 14:45:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3yVB-00000007TBW-3EAI;
	Mon, 06 May 2024 13:35:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB6F3612B8;
	Mon,  6 May 2024 13:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38788C116B1;
	Mon,  6 May 2024 13:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715002532;
	bh=46hAq1PCM2INpFGrPzb+MElX1JVQQ10d/aQq2p0zy48=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HhS1pLRn3qUNaKrsNVT+K3AvOvWmUzJ0dJTt14Q3gc7LX6ZSjiLZhmPzq9sacIq5P
	 /RuAtzhq0ZYAnOqzx2hTZ/yk+AZsaWrRdnFmw2WsVQRNx3FfrS5mSPRv6rk9XxiZrf
	 a9GXaqorKyymQxJ6ML4AW9XWEWW3GSYFu6mVTkvH806yeep8NpVXVyJWtQFuWUdo3f
	 97KnrhIsWEpmtjcirMjoc1QspIcLEK6NcDmc9JJjfEpY+FH591lsfQeFzko/lZq4az
	 Jy+6R4jHiSUjuLmQyzHEG+b3lO/XOTDNpdwIHugcjbOIDpggKMW20VEnEYzgY4gvb1
	 4hlAD6+2n6Yqw==
From: Michael Walle <mwalle@kernel.org>
Date: Mon, 06 May 2024 15:34:35 +0200
Subject: [PATCH 06/20] drm/bridge: tc358775: redefine LV_MX()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240506-tc358775-fix-powerup-v1-6-545dcf00b8dd@kernel.org>
References: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
In-Reply-To: <20240506-tc358775-fix-powerup-v1-0-545dcf00b8dd@kernel.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Vinay Simha BN <simhavcs@gmail.com>, 
 Tony Lindgren <tony@atomide.com>
Cc: Daniel Semkowicz <dse@thaumatec.com>, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Michael Walle <mwalle@kernel.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_063534_233754_5D2E12E2 
X-CRM114-Status: GOOD (  10.16  )
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

Drop the FLD_VAL macro, just use bit shifts. This is a preparation patch
to switch to regmap and to remove the FLD_VAL().

While at it, reformat the LV_x enum.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpu/drm/bridge/tc358775.c | 36 ++++++------------------------------
 1 file changed, 6 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358775.c b/drivers/gpu/drm/bridge/tc358775.c
index 720c0d63fd6a..7ae86e8d4c72 100644
--- a/drivers/gpu/drm/bridge/tc358775.c
+++ b/drivers/gpu/drm/bridge/tc358775.c
@@ -124,39 +124,15 @@
 #define LV_MX1619        0x0490  /* Bit 16 to 19 */
 #define LV_MX2023        0x0494  /* Bit 20 to 23 */
 #define LV_MX2427        0x0498  /* Bit 24 to 27 */
-#define LV_MX(b0, b1, b2, b3)	(FLD_VAL(b0, 4, 0) | FLD_VAL(b1, 12, 8) | \
-				FLD_VAL(b2, 20, 16) | FLD_VAL(b3, 28, 24))
+#define LV_MX(b0, b1, b2, b3) \
+	(((b3) << 24) | ((b2) << 16) | ((b1) << 8) | (b0))
 
 /* Input bit numbers used in mux registers */
 enum {
-	LVI_R0,
-	LVI_R1,
-	LVI_R2,
-	LVI_R3,
-	LVI_R4,
-	LVI_R5,
-	LVI_R6,
-	LVI_R7,
-	LVI_G0,
-	LVI_G1,
-	LVI_G2,
-	LVI_G3,
-	LVI_G4,
-	LVI_G5,
-	LVI_G6,
-	LVI_G7,
-	LVI_B0,
-	LVI_B1,
-	LVI_B2,
-	LVI_B3,
-	LVI_B4,
-	LVI_B5,
-	LVI_B6,
-	LVI_B7,
-	LVI_HS,
-	LVI_VS,
-	LVI_DE,
-	LVI_L0
+	LVI_R0, LVI_R1, LVI_R2, LVI_R3, LVI_R4, LVI_R5, LVI_R6, LVI_R7,
+	LVI_G0, LVI_G1, LVI_G2, LVI_G3, LVI_G4, LVI_G5, LVI_G6, LVI_G7,
+	LVI_B0, LVI_B1, LVI_B2, LVI_B3, LVI_B4, LVI_B5, LVI_B6, LVI_B7,
+	LVI_HS, LVI_VS, LVI_DE, LVI_L0
 };
 
 #define LVCFG           0x049C  /* LVDS Configuration  */

-- 
2.39.2


