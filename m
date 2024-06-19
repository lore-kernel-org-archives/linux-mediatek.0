Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C40CC27C53
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jun 2024 08:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+oPLTB4zchciu+stO5D6864hKOKkSygK8HlQ5g0jBHI=; b=jBIu2SMsTvRJYTmUDXINX8BMrY
	IpGUhnmZd6pgH/eLRaGOZD6yoO+ApCNy1IpW8f2gPZN5QBWN7yBtpkYlKObChABP/MMEDsF1LiycQ
	iV+SmxZQ0pWNCqJWbliGANegiMqmXnURLtq7JETU1KJXhmH+OmRhFjVauKSGLiyz32oIrOopwrIVy
	e8L+1FCZw2Qoa4aEc+EEzMx2X+O9gcuVW0V8eDV+zokG0Xfug51YMr+4/CG/0stTKb3R17m40L7lw
	3L1VBOypgCPHT7ASnIqe9mHnzHZJvVS/w+tEWNUTUwHDngDJQDDCHemTmmEC4U14ij6BZUDWM5lDf
	e1XL3Gug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJr4j-00000000Snu-2v2q;
	Wed, 19 Jun 2024 08:53:53 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJr4P-00000000SaO-23lh;
	Wed, 19 Jun 2024 08:53:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718787212;
	bh=IuOjjnE7/JrOSwZhq2h99WsYClEcZOw4C24NtZSA/0o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nMDm5Lng3xQg3UXdS7i794m5nt2CTE76H5thEstpbtBboh3nQsktGx3HUKU/7eD6u
	 cDmBHP/bAD32qrGFhH0yrfQBKb6GoXaa9bcfzmYM80fJ0Z60RiDdwkzSv/5cRTKCcz
	 AwWd8ExsaTWcxLPJ13oDD7Br/2Xuc1MtdXTPW9pV1i3D+wTeMluBhUmg4DM5XXwEjB
	 e3/+L1F5ds/NI6jAfIB18hsaIfj2tttiza6OhyY3Izoml6sEPvIhwEPUsKTvtR+22g
	 dcJiOPArMDG4OPgIgn1Ls51YpiirbOZcwdYWJV9atkGuZjJC83AJLcG7vED39iKzOm
	 JasMKkPNGRJbw==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E6B7237821C0;
	Wed, 19 Jun 2024 08:53:30 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: krzk+dt@kernel.org
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	jassisinghbrar@gmail.com,
	garmin.chang@mediatek.com,
	houlong.wei@mediatek.com,
	Jason-ch.Chen@mediatek.com,
	amergnat@baylibre.com,
	Elvis.Wang@mediatek.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 3/3] dt-bindings: mailbox: mediatek: Avoid clock-names on MT8188 GCE
Date: Wed, 19 Jun 2024 10:53:22 +0200
Message-ID: <20240619085322.66716-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
References: <20240619085322.66716-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_015334_225476_A417647C 
X-CRM114-Status: UNSURE (   8.93  )
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

Add mediatek,mt8188-gce to the list of compatibles for which the
clock-names property is not required.

Fixes: f2b53c295620 ("dt-bindings: mailbox: mediatek,gce-mailbox: add mt8188 compatible name")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
index cef9d7601398..55d4c34aa4b4 100644
--- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
+++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
@@ -62,7 +62,9 @@ allOf:
         properties:
           compatible:
             contains:
-              const: mediatek,mt8195-gce
+              enum:
+                - mediatek,mt8188-gce
+                - mediatek,mt8195-gce
     then:
       required:
         - clock-names
-- 
2.45.2


