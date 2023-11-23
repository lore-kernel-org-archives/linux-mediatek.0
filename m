Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02021C61DF7
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Nov 2023 13:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rn9Jo3gBt4vTECMCu8N102MgemhFTq0y2rhkUsjTFxY=; b=HVDvVk+wMesIyH5Tv2R1NJRcT6
	ULohGq0SswGVS9dQvD/OxPFaPJqqHEcyJjOLR1diTKAigBna38C96d9KYiFJOTY+uxk+acE3uY8fv
	AItIb/sOANFuf8t37QVDL096l4PGUpC1rgdz1D6Weptg0kZOyK166xM/Eh9HmA3oKncz40qExHige
	FlFXIwI3iCAox9pbcs7GyLyQrAG+Ixe7gBEqfuIjg4gf1x51Rns742FcQ0wlk6eF9ac13e3M6M0e4
	uQc2BaGfCx7c+6Z+jTA8lvbYaLA2GDeF5qrmK2Vj+iSXgX8bHIefrMwCUEFBOQAoEuqa8HBG/+6bq
	dAvCLkrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6A3H-004wDX-08;
	Thu, 23 Nov 2023 13:47:31 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6A3C-004wCD-39;
	Thu, 23 Nov 2023 13:47:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 765C662163;
	Thu, 23 Nov 2023 13:47:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38256C433C7;
	Thu, 23 Nov 2023 13:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700747246;
	bh=Tksu6lTu40j+EZN0tFMOSHhEBbN9nqr7FRPKCBhoTj0=;
	h=From:To:Cc:Subject:Date:From;
	b=u0bpNOGXh6wXoJmvu24UNoROEX9mo2lQ36OS/28yua3mXZAToDDRW8BhBouOCoj22
	 UMf/7Vxo660dRPGFXxXoJgOi7I8c6JAObRyyvcHTOAXlsKPScykxdVUHTPR2XNYxmc
	 vWWSjHrVho+3H1Dx88FGv62CG8v58BSJPgSwIrEYtQerczlHW1DZFdzZyBSWgYLz1V
	 nqaqo25N3JbrdJGTV8mZCNdl0CtfN40RCcJYZYPJrSUs+M6P9pEnRLFU+mFHs1ZFOp
	 ch0Y6FHDldK0+6mehsABWKFoVUpnN8mEEc3QMOT8XEFR4OXHua61aOK0RNYQRl4ESV
	 k0PZfbakWzw0A==
From: Michael Walle <mwalle@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jitao Shi <jitao.shi@mediatek.com>
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Michael Walle <mwalle@kernel.org>
Subject: [PATCH] dt-bindings: pwm: remove Xinlei's mail
Date: Thu, 23 Nov 2023 14:47:16 +0100
Message-Id: <20231123134716.2033769-1-mwalle@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231123_054727_062514_E7C07A11 
X-CRM114-Status: UNSURE (   8.22  )
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
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index 153e146df7d4..afcdeed4e88a 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -8,7 +8,6 @@ title: MediaTek DISP_PWM Controller
 
 maintainers:
   - Jitao Shi <jitao.shi@mediatek.com>
-  - Xinlei Lee <xinlei.lee@mediatek.com>
 
 allOf:
   - $ref: pwm.yaml#
-- 
2.39.2


