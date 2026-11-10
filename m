Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD98760A6F44
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 12:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DhhqFn8G;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=k0SFM+Gv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=IxhCvfJIBJyaA2ATxGs3fIk1vG0uQA62+MwfTqo1X0M=; b=DhhqFn8Gq5ZkZr
	lkNUgPLM/MQslXMV4uqyUYm45HxAY5SUobjKtii2dezSoM2V4iHI6pisIqWSGR7uvj9vidN/hAPOg
	AkrTcVJq1q43ZWOCQDcZbw3132v6FwPIr88+yMEdhO4AIPq/9UhdI+sWeQW6BbCB+BmKMIxTCJ1ag
	LQqeqda8Fo0lQVvvpagISlg5ZmZOpB0iLcT4Eg5p/ucQczl3vFtznoUTDOD9gmXFBfWzg8imW5XUE
	b8fzR5ap6sNtLJnApAkEKEPr151iku/n9BegR1mm9e+f4pIY8Kp+URTUVIyibE7I+BQwrbDE/e3z9
	7Xf3Y/SzHNQv/n3HP3/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQkew-00000003kmn-1V6w;
	Tue, 10 Nov 2026 12:09:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQket-00000003kiz-0fJi;
	Tue, 10 Nov 2026 12:09:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1794312541;
	bh=pc0gMmdXl/8SnyaG/cc7eHGzGbww5CJsVOxiPSb3ZG0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=k0SFM+Gv6dQieIs/4KcXVYUw8f0rvjSKjIpzcYwEgQPIMIPRzmCC/PyaUajFj0zzL
	 l08NMrI9z7Rec1YtfQ+G41byOpFHX4G7oUjpBudV6lrNKum5eA91B1UFMxVEimRzsB
	 zFSzDMX/geVAk40K2qekwyqBqhFRrma0DPGu0Nour2SEfQenBMsd+sIY7M8vDyn26Y
	 ndlwjV1lN1I1elUgpQH2P0EMOhV6MomMKbYOnEU6dw4/h16Uw+GdzqasUj2gFfLDQ0
	 sLahN35HOQV4rr3TIMXMLNacFji4NmRIZ9PdnEVBT1vWZwy5K0eE7xtROGQQBfYR9/
	 QPZzt+RuX3bgA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 136BD17E09AB;
	Tue, 10 Nov 2026 13:09:00 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 10 Nov 2026 13:08:49 +0100
Subject: [PATCH net-next v5 02/10] dt-bindings: net: mediatek-dwmac:
 deprecate rx/tx delay vendor properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261110-dwmac-mediatek-mt8189-v5-2-7d99d6292962@collabora.com>
References: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
In-Reply-To: <20261110-dwmac-mediatek-mt8189-v5-0-7d99d6292962@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Eric Dumazet <edumazet@kernel.org>, Eric Dumazet <edumazet@kernel.org>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794312537; l=2106;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=pc0gMmdXl/8SnyaG/cc7eHGzGbww5CJsVOxiPSb3ZG0=;
 b=4pVR8gdOK+gDzLPVy2w47hx8D9Hlwyz0LnuMLtD+uej6gZaiVAqYTOgBkdrU7ssMlVcvL+ds+
 NH4HcA+2lulDnYd+xO9gaCeeZlfRLrUepAXE25crSv20whyZYjl2VHI
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_040903_426235_C891749B 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Deprecate 'mediatek,rx-delay-ps' and 'mediatek,tx-delay-ps' vendor
properties because they duplicate standard properties from generic
Ethernet controller bindings and have the same unit (picoseconds).

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
index 14f9683f20fe..956240616638 100644
--- a/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
@@ -80,6 +80,7 @@ properties:
       interface and timing delay.
 
   mediatek,tx-delay-ps:
+    deprecated: true
     description:
       The internal TX clock delay (provided by this driver) in picoseconds.
       For MT2712 RGMII interface, Allowed value need to be a multiple of 170,
@@ -88,8 +89,11 @@ properties:
       or will round down. Range 0~31*550.
       For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple of 290,
       or will round down. Range 0~31*290.
+      Deprecated, this property should not used anymore for RGMII TX internal delays,
+      the standard tx-internal-delay-ps property should be used instead.
 
   mediatek,rx-delay-ps:
+    deprecated: true
     description:
       The internal RX clock delay (provided by this driver) in picoseconds.
       For MT2712 RGMII interface, Allowed value need to be a multiple of 170,
@@ -98,6 +102,8 @@ properties:
       or will round down. Range 0~31*550.
       For MT8188/MT8195 RGMII/RMII/MII interface, Allowed value need to be a multiple
       of 290, or will round down. Range 0~31*290.
+      Deprecated, this property should not used anymore for RGMII RX internal delays,
+      the standard rx-internal-delay-ps property should be used instead.
 
   mediatek,rmii-rxc:
     type: boolean

-- 
2.56.0


