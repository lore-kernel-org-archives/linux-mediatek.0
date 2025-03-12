Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01EABC28B28
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 04:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WfyOLfn65hYG+XptUi0u0dhIqn1pfYDcX0HWhQRxIbw=; b=zWiX7ludn9aAXcJxhByE/hxzXj
	j+oDNYiN6XhCklZOQz6reu9JgL/Bxw8WqPU50dKkSKYQrzSMq0uYme4gYKsF6XkruyJDHm4S7/bZ/
	vhxxM6rDqWteRhCZQwL0sywmlKl0R78AQ/avWqdPDYruE4iW5uTXF4aaXymRYZxFBMW767QxTGWQH
	1JTlPdzCYK6UMwjJPTQ5w+kOJFtTnhpTVv3jlyZ1foJWXokT+rrlseoN++x2ESx6OxL1HQ8UWFrYs
	gUNmb9QGUzO4GzRCXXk52RZLjJRImzjRPCcNZ0hr5ge7F85pfXOLkj4HxuZ5yjwlUdZ0jMjYrwgk7
	V+2nb+KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsDZb-00000007SV1-1ijp;
	Wed, 12 Mar 2025 04:20:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsDZZ-00000007STr-0FzJ
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 04:20:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741753199;
	bh=Op82FnMA6ZPl41SuqG45nSPyrCAYqZpLWkb4fvJiVFY=;
	h=From:To:Cc:Subject:Date:From;
	b=MVU8lvmuywj2g9NPj5JTqM7VeNcV/IjOzcy3gM6He9cqODaXdC4BGprosVhZV50UO
	 JEOMFzVUR5IxM/LOqMKt1ymBPzV3ew/f6cDr+lsqI4EerKruGY7mBSIah5xHcb1A30
	 Hzv6xcGW0zOxT8KGznUx8qASyCwA14KfoK1gZ941IYqmaQs2f0Xw5cAoVprXYw3gU0
	 inIjvAGOSByxaEm7b5i4+aNBJsMa6lNlOsGXaP+p1iBylh7Ia4KnHb4PBPso+YYdlo
	 htSmeAZqTLcC6zbIuKQjW9+kylkFG8SepQ+Fro3GDASUlNebF3nq+yq38Gi0bFtypI
	 jJ3qtdwGZXOaw==
Received: from localhost.localdomain (unknown [171.76.87.92])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CE33717E0CA6;
	Wed, 12 Mar 2025 05:19:56 +0100 (CET)
From: Vignesh Raman <vignesh.raman@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de,
	nfraprado@collabora.com,
	angelogioacchino.delregno@collabora.com,
	krzk@kernel.org,
	daniels@collabora.com,
	airlied@gmail.com,
	simona.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] arm64: defconfig: mediatek: enable PHY drivers
Date: Wed, 12 Mar 2025 09:49:26 +0530
Message-ID: <20250312041943.25676-1-vignesh.raman@collabora.com>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_212001_259120_1CE28FC6 
X-CRM114-Status: UNSURE (   7.63  )
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

The mediatek display driver fails to probe on mt8173-elm-hana and
mt8183-kukui-jacuzzi-juniper-sku16 in v6.14-rc4 due to missing PHY
configurations.

Enable the following PHY drivers for MediaTek platforms:
- CONFIG_PHY_MTK_HDMI=m for HDMI display
- CONFIG_PHY_MTK_MIPI_DSI=m for DSI display
- CONFIG_PHY_MTK_XSPHY=m for USB

Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
---

v2:
  - Include board details in the commit message.  
  - Sort newly added PHY configs in defconfig.

---
 arch/arm64/configs/defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 1f25423de383..87e8cbd3fd26 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1572,7 +1572,10 @@ CONFIG_PHY_HI6220_USB=y
 CONFIG_PHY_HISTB_COMBPHY=y
 CONFIG_PHY_HISI_INNO_USB2=y
 CONFIG_PHY_MVEBU_CP110_COMPHY=y
+CONFIG_PHY_MTK_HDMI=m
+CONFIG_PHY_MTK_MIPI_DSI=m
 CONFIG_PHY_MTK_TPHY=y
+CONFIG_PHY_MTK_XSPHY=m
 CONFIG_PHY_QCOM_EDP=m
 CONFIG_PHY_QCOM_PCIE2=m
 CONFIG_PHY_QCOM_QMP=m
-- 
2.47.2


