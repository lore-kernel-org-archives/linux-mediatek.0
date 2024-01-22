Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AA16C47DAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Jan 2024 11:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=H54sf77zoUR/UpY3cyQGZR9+WEa5LV+FEVcVa+NJ8yQ=; b=3jn8sozq+J+gVRoWqvDSJ8JQfN
	TdFWZXm6Repg+zkIF/4s7FWU9Cf7SAVrfVcGLD5IocFSA4o2y7akr2q03WD2Am2rTW6mFe4QQYBRe
	Z98f3gXFcHUIwb+I0M16mrxlUk+pjKnsm7yTVpoAA9OqHQHz8JaIyZj7Ux3M3gacL3xGuE+2HTc2X
	4FEO5I9DjfKbzaz1CLSFAIYYtG2Ocugst8hbVGhsaplmhGuAPIxOAEANvRjHv0NmYVmYbef5j5zDk
	jZ1SinSjuodeTnc5PKstKsYc2ncKrvN5ZnTqPCiXe7seDhaf/gHRdsIq48dJ2ILapS1XymkP2aj44
	sLrfra5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRsJo-00BiMZ-19;
	Mon, 22 Jan 2024 11:18:20 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRsJl-00BiL4-2G;
	Mon, 22 Jan 2024 11:18:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705922296;
	bh=vMwa77UO4uFeclhllLNti7h0zFg4x5xedkwHOsvwIW8=;
	h=From:To:Cc:Subject:Date:From;
	b=jriKl1Z0lFRP7Vj045GQrt14Sk0lUooKDfd47uejA2xDlo+LPom7GZyRlVej5ey7x
	 az3sE6ZS2UPo6VHkjCEbwKYk6hGAQMhnwVNQWAQJXWFwYTmC53IwSNqD7pBPslIS2G
	 IoQfCEmNX64nAQD51BRnnWBlPI0iaC2Br/FWDl1V5Rv0mYYy5KmHnQC5FUUXZiaQbL
	 uKpCAkl5qP0I69i+EkFoBqVDez/PBJ1ATHzY5y8elFXaLHibfMVa5ZlVvMl0jf4BcZ
	 wpQy+mIg/6RNbhwLSfgSc5WeZ/U7Kym3itVm3S3azykvinMnmF6Vfc5rzS2bVJjWe3
	 nIRDs4eoU91jA==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 60C7037810CD;
	Mon, 22 Jan 2024 11:18:15 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunfeng.yun@mediatek.com
Cc: gregkh@linuxfoundation.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-usb@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 1/2] dt-bindings: usb: mtu3: Add MT8195 MTU3 ip-sleep support
Date: Mon, 22 Jan 2024 12:18:08 +0100
Message-ID: <20240122111809.148546-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_031817_875126_26672D9A 
X-CRM114-Status: UNSURE (   9.03  )
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

Of the four USB controllers present on the MediaTek MT8195 SoC, three
of them (0, 2 and 3) are behind MTU3: add wakeup controls for them.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index a59d91243ac8..d4e187c78a0b 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -185,7 +185,10 @@ properties:
             2 - used by mt2712 etc, revision 2 with following IPM rule;
             101 - used by mt8183, specific 1.01;
             102 - used by mt8192, specific 1.02;
-          enum: [1, 2, 101, 102]
+            103 - used by mt8195, IP0, specific 1.03;
+            105 - used by mt8195, IP2, specific 1.05;
+            106 - used by mt8195, IP3, specific 1.06;
+          enum: [1, 2, 101, 102, 103, 105, 106]
 
   mediatek,u3p-dis-msk:
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.43.0


