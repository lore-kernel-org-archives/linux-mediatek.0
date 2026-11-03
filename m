Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AC6606EEB0
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Nov 2026 10:12:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HeqMT60A;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=dKEWj3bT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=cAJcK6wWXyswA+ys5mhuqkoXL9U9AnrrgIBwujtRqPY=; b=HeqMT60AgnuuH6
	HnatM1ftJBkQnd1I3dcBNtGBLaNWTr2TrVVizwAsKly2/j9VZw8/pjhr4eSzWWrot/paZ56uhG4q+
	WF1K5q+xky0bldUbGuNJVabjxMi1AkyYLkhjqV4qr2d/0fGl2aNFu55vetU5y1wSyZW/cxHENApj1
	X1fJAedgDdPQw+iCUHOCvZZh2u5jrJEGg3Ceu1AZk7acGTyfJccqy3+Tu/hNtkP+3ucOX/9mJRmwK
	uVHi/kdT5318TY4YlQRJWIJo99JJk/CfEs/tiWV64VbEXUhR8uiEOhSpMJT0B9zX6aoOQE0sZye/v
	8MG4DPNPyZxz0dHmUs1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBVX-00000001tf3-2ZQP;
	Tue, 03 Nov 2026 10:12:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBVQ-00000001tZA-1Wqa;
	Tue, 03 Nov 2026 10:12:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1793700758;
	bh=9btp8D9CPqLhI6r9B18vL4l7TPjBWaSIYvAxgmvmR6c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dKEWj3bT/58KDBwd/Z8OpjUvDEx6ZjdQ0FbFeEf9w/dF0r94mgic1ld59ib3uO3rd
	 dJpT7qUluCDn+OyjMnCARsqs4v6UVRh09TEV1DuZc7B5Uat692H0xhziqywu1GSeCH
	 5C16AZZi09uOt41nq+DeyL1W7ygCPO9wm9P9gcsGuy53LaZkZZu111yqHvt8Teohl3
	 OXKqPZsFbSxdEZTvrcqKk2PnYkLxNcutv5Fx7hs7KybwRIqMeKPc057ZDZzbXvf8/J
	 4WVvswzqRMWQgpZoglVxj9fvgA15FnOG7kqCyKblGFW34iAiD4DW7LH/B3bmqXG/sf
	 d3f53IewUPPCg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 81B8C17E096A;
	Tue, 03 Nov 2026 11:12:37 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Tue, 03 Nov 2026 11:12:07 +0100
Subject: [PATCH net-next v4 02/10] dt-bindings: net: mediatek-dwmac:
 deprecate rx/tx delay vendor properties
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-dwmac-mediatek-mt8189-v4-2-c86c14fc50f4@collabora.com>
References: <20261103-dwmac-mediatek-mt8189-v4-0-c86c14fc50f4@collabora.com>
In-Reply-To: <20261103-dwmac-mediatek-mt8189-v4-0-c86c14fc50f4@collabora.com>
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
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793700755; l=2297;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=9btp8D9CPqLhI6r9B18vL4l7TPjBWaSIYvAxgmvmR6c=;
 b=cVxeY2ot/J+KDZxhQ7Pu1JpngY4IuWiFHFH/axsmnfTUmosKScVBrnx6wzkGfUkAfwjhzmyzc
 tx/3J9kpfMYAMUKkYy1r+F75Crm7QnmHHLi5nMNzBSH8VWNs3DbTRrW
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021240_561114_ED32EF17 
X-CRM114-Status: UNSURE (   9.33  )
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

The mediatek-dwmac bindings provides the 'mediatek,rx-delay-ps' and
'mediatek,tx-delay-ps' vendor properties for describing the internal
RX and TX clock delays.

The generic Ethernet controller bindings also provides standard
properties to describe the same kind of property with the same unit
(picoseconds)

So, ddd deprecated flag to these vendor properties and update their
descriptions to tell to user to prefer standard properties over vendor
ones.

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


