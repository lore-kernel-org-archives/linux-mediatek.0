Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1916E60A6F4B
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 16:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=m/FbwS9u;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=isthHZTi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ol2hlcc5598bMEDNP4uuDIZoNqc9HuHW7HpgKbCTL78=; b=m/FbwS9uYj1GTu
	vvkqN4OrMi/IEXSVCVIIo1IjrsRpNgVcRYDvSHVuJO8Xo/MSARVLueQFlWFNgvrCNyYFfpFO2frSh
	+I37u/D4RTC4XvUfWk8MyMpJuW3zvz+P9qqiV4Nq+JYQrZOYMnn7TAa5MR8fnZk+5T9MYayaQlvLW
	zUdJhbjheIrijzfWgV0AjtddwJWuVHdkhhD7L6vobJcM0zqFUZ72ZGHfAMG3Vo1x2mWvlf0trY7S/
	hLaiOZtNNBoiCTcUqs4GbWYdGvLoPlmqy6rAqgvv5pX+rS2uXldxLimkF08vMspLun7Prz+dIKJaa
	sxbzr1kn7ko8rN4XxLFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyNT-0000000GxDZ-36xB;
	Fri, 27 Nov 2026 16:00:47 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWyNB-0000000GwwA-3K2u;
	Fri, 27 Nov 2026 16:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795795227;
	bh=U1zeAwNEL//sicJtqxondo4BHtzSFZlgKK37DWn7w88=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=isthHZTiFr8PVThzhYXwzGICHl0QzYi6CcDJKyMWKLBD5trQSQiN+f6tJInvPDE/j
	 XnVJpfkTNl8L6LpoNFB4vGfQjLXSYHU1YR+oHHR/Dt2p9L5edIxLCRlQbKWQn4eofy
	 6ukOl0lrFEQFuhu5ZrrcLS3y0qt8wEjtsC9xaQQG178TBF515GU3niBqBWq/nuB3ud
	 dR4zvYUbBV//DN3yeyHyMpFxmJNbZryKdgk6c9KiROd3oKk75OpuJkeO58DU0lsyDA
	 9UVWBwowXBg2sPr+7eVxK1nMvm5ynbLAu76nBVCy6aBetTpWEy2Coz9yvJe4NFQBZa
	 +OAljuWTE/9Hg==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6A32F17E0648;
	Fri, 27 Nov 2026 17:00:26 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 27 Nov 2026 17:00:06 +0100
Subject: [PATCH v16 03/23] dt-bindings: ufs: mediatek,ufs: Add mt8196
 variant
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-mt8196-ufs-v16-3-6f2568f7c119@collabora.com>
References: <20261127-mt8196-ufs-v16-0-6f2568f7c119@collabora.com>
In-Reply-To: <20261127-mt8196-ufs-v16-0-6f2568f7c119@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Peter Wang <peter.wang@mediatek.com>, 
 Chaotian Jing <chaotian.jing@mediatek.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Bart Van Assche <bvanassche@acm.org>, 
 Bean Huo <beanhuo@micron.com>, Stanley Jhu <stanleyjhu@google.com>, 
 Stanley Jhu <chu.stanley@gmail.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <mkp@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Chun-Hung Wu <chun-hung.wu@mediatek.com>
Cc: kernel@collabora.com, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-scsi@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795795222; l=2540;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=xYetkm5ojKAz5TE+HUTwvLMXsXEaLA55tRo5clUChbc=;
 b=5Yt3SC0ssEWZI8Q7ZSrRlG29ywyAzjR94Xu6tYMYymasXpVz0A45dOCih1YXEWGjHYOWW1NYO
 dv220z152g8B1b7NAhBslx+rP+70PRwx04d/YGRuG3ogHsaGsbkFhO7
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_080030_008420_2E4F5227 
X-CRM114-Status: GOOD (  10.48  )
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

From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

The MediaTek MT8196 SoC's UFS controller uses a different set of supplies.
It is therefore not compatible with the MT8195. It also have an additional
0.9V supply pin (AVDD09_UFS_1), that is specific to this SoC, thus not
currently described in the binding.

Add a compatible for this SoC and new property for the additional supply,
and modify the binding correspondingly.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Reviewed-by: Chaotian Jing <chaotian.jing@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../devicetree/bindings/ufs/mediatek,ufs.yaml       | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index 945cb986b06b..99181ec9dda0 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -16,6 +16,7 @@ properties:
       - mediatek,mt8183-ufshci
       - mediatek,mt8192-ufshci
       - mediatek,mt8195-ufshci
+      - mediatek,mt8196-ufshci
 
   clocks:
     minItems: 1
@@ -60,6 +61,9 @@ properties:
   avdd09-supply:
     description: Phandle to the 0.9V supply powering the AVDD09_UFS pin
 
+  avdd09-1-supply:
+    description: Phandle to the 0.9V supply powering the AVDD09_UFS_1 pin
+
   avdd12-supply:
     description: Phandle to the 1.2V supply powering the AVDD12_UFS pin
 
@@ -104,6 +108,7 @@ allOf:
         clock-names:
           items:
             - const: main
+        avdd09-1-supply: false
         avdd12-ckbuf-supply: false
   - if:
       properties:
@@ -119,6 +124,7 @@ allOf:
           minItems: 3
           maxItems: 3
         avdd09-supply: false
+        avdd09-1-supply: false
   - if:
       properties:
         compatible:
@@ -131,6 +137,21 @@ allOf:
         clock-names:
           minItems: 10
         avdd09-supply: false
+        avdd09-1-supply: false
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt8196-ufshci
+    then:
+      properties:
+        clocks:
+          minItems: 10
+        clock-names:
+          minItems: 10
+        avdd18-supply: false
+      required:
+        - operating-points-v2
 
 examples:
   - |

-- 
2.56.1


