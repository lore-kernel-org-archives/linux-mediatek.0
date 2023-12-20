Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0382C46CD3
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Dec 2023 13:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4KIr75yGreDZ6UDFWDGyl1vwu6JH2AxXW9gmpNCvLzo=; b=youuyGiYc62LiPrRvVOQbmwAHE
	s4VsTw+80WElp4IKJE+BT6MbSOWmE/YNFHkZVBSVxshEEpN1LFsrCCm7isHmvVauUM22z85CmQCty
	M5694k5/2r7iBBke5jVvO2Qm7w99aLaHLb2pJh426EuiTYIwdqjU3/tusppOSfIuaDi3ey4iiWS+y
	B0vnZpu/WrKbJI/5qwugsnYLnQTN7HZ3PtKEyJI9lecTqUX9K9lOtOFHLYaJNjiNRsibYsY6mi6Vf
	zlllK75/8RFRpl5Kt+gWXE9Uus2Lz54WXQNZWgI/VWkkoADnPt61forbYxSDLWaM1zmyt6PNUw+1J
	G1Xnesbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFx4o-00HamN-2v;
	Wed, 20 Dec 2023 13:57:34 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFx4l-00HalD-2q;
	Wed, 20 Dec 2023 13:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1703080650;
	bh=A/T2H3Pnav/kaeyTjGJkiaCPRjpVDZjbOaOAd/HTgyA=;
	h=From:To:Cc:Subject:Date:From;
	b=zD0ufCVArTV94xPzQevsEKioHG68COMsHhrrur7IiyWtk/BwkHD/6NMGfi4lR2FGA
	 YJVL2VvS+bMVo+fTlTfT9jcuxc9vvNRIRhLC0eWfSxoz6PZYSbeK/VQ8cRuGwA1S9o
	 3dfzyJkXuNoyll8t0N1PK5CYQ22DjUtCLwURD8lvXDK4f1mkp0yCafDIVtr9QIu5qT
	 te0jFwxBO35GAMGFYcI1RkBDNhYLM8jKwqUVIqfnz4ECcw/kZM/odugQI+atSFPXyn
	 yAUZWEkHqu9mHMvyzjItYTbcAcUb6+LLAPHVxnxz9F3aJsL7wwlAV4JsDff4WRt1QH
	 lG9+ZhtfSIB0g==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id CA04A3781F8C;
	Wed, 20 Dec 2023 13:57:29 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	daniel@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v2 0/4] MediaTek DRM - DSI driver cleanups
Date: Wed, 20 Dec 2023 14:57:18 +0100
Message-ID: <20231220135722.192080-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_055732_043839_13807387 
X-CRM114-Status: UNSURE (   5.94  )
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

Changes in v2:
 - Rebased over next-20231213

This series performs some cleanups for mtk_dsi, enhancing human
readability, using kernel provided macros where possible and
also reducing code size.

Tested on MT8173 and MT8192 Chromebooks (using a DSI<->DP bridge)
and on MT6795 Sony Xperia M5 (DSI video mode panel).

AngeloGioacchino Del Regno (4):
  drm/mediatek: dsi: Use GENMASK() for register mask definitions
  drm/mediatek: dsi: Cleanup functions mtk_dsi_ps_control{_vact}()
  drm/mediatek: dsi: Use bitfield macros where useful
  drm/mediatek: dsi: Replace open-coded instance of HZ_PER_MHZ

 drivers/gpu/drm/mediatek/mtk_dsi.c | 198 +++++++++++++----------------
 1 file changed, 88 insertions(+), 110 deletions(-)

-- 
2.43.0


