Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69C11C61DF7
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 13:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Soc/ZzEWIxbe6D+uqPQ+FcjofX8PzdKXCEaUlHfx4JM=; b=rMOAaptjWOfFTBtUQ4rbYfxTay
	4pwS/8GxBnCXZZrEJ8pI84fc0+dd5H/2u4LAN6YRXynNQpxMcOMe3AkvxTv97tQc+KWDzE6BHOoD5
	2Md/TmCiMtgr68yV7kiVPiw0LufU9QKIyT0ZUjTKEM7pxVHjpg+zv6n6QhyvjPK3x6KKuuj8CIzf6
	pN991AZZxcMEEApU/KuovBdNvgxu/Q0QsKexYuzDiokkkBZabZ7WD2OsBVOx6lXVSBAQrMAGJKT7w
	I4RwT4WVwrnWIYYhtaprEdQvxSzgRknPrDR46y+YUeOj87E05lUEWVSj5+cyfzrK1ZcLXa+1olDCX
	rKZk+F+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6A5f-004wmu-0l;
	Thu, 23 Nov 2023 13:49:59 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6A5Y-004wid-0a;
	Thu, 23 Nov 2023 13:49:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 77CE8614E2;
	Thu, 23 Nov 2023 13:49:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D77C433C8;
	Thu, 23 Nov 2023 13:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700747391;
	bh=Ran+HOMzMulZc35R1BVI8jtdePgjE69xnnBf17aaGis=;
	h=From:To:Cc:Subject:Date:From;
	b=dfs5dufT0A6i43Pq8Ams02vvkPNKqgEAwDU8PicNGDsRwqNvJU/WmQaQgLBcU2Pqz
	 +qP+JikYVTz8YFKtsGdE0CR6CYmsEntuHy8jCTCRsOGLE1WfYJcpuZbg4qoczBAAln
	 QymN3/qmMpw1liIoINoi1iUtHyqAHaWTI0rZwshr3cC1Y6huoTg7sPJg6UicQKJ+iG
	 Y5b4YmlcpH1ciq2nCl5/z7DSjQUT1iMhPO0M4klutAI8syKBOSmWLca87JtZfgFqHs
	 2NA4eFEVpRh3/h50P7nK1XkzGySPdVXCNezLny/gOePAPkeWmuqualXIA6iN8VMpEu
	 /ClSGPDj3ZX+w==
From: Michael Walle <mwalle@kernel.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] dt-bindings: display: mediatek: dsi: remove Xinlei's mail
Date: Thu, 23 Nov 2023 14:49:27 +0100
Message-Id: <20231123134927.2034024-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_054952_280557_201C4F19 
X-CRM114-Status: UNSURE (   8.82  )
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

Xinlei Lee's mail is bouncing:

<xinlei.lee@mediatek.com>: host mailgw02.mediatek.com[216.200.240.185] said:
    550 Relaying mail to xinlei.lee@mediatek.com is not allowed (in reply to
    RCPT TO command)

Remove it.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,dsi.yaml       | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
index 4a7a9ff21996..8611319bed2e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dsi.yaml
@@ -10,7 +10,6 @@ maintainers:
   - Chun-Kuang Hu <chunkuang.hu@kernel.org>
   - Philipp Zabel <p.zabel@pengutronix.de>
   - Jitao Shi <jitao.shi@mediatek.com>
-  - Xinlei Lee <xinlei.lee@mediatek.com>
 
 description: |
   The MediaTek DSI function block is a sink of the display subsystem and can
-- 
2.39.2


