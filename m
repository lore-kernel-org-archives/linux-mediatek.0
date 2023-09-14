Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E223AEEAA4C
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Sep 2023 14:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v1lZAtFoQnK2kCEzZqot8hfAcxzjv3LQNPpmSw+m+wQ=; b=EcH5+52lvcseCtZ7g2tT6ewB3S
	YBSeHS27rt3lroDFhGWpQDYoqIR3cOqqq1nRcLju3KNhT56SNg07Gu5hPyZzBPYP8BhHwuxbE0E/L
	S5vUp+Wnxgir/ni9ATJfyNWiZaFViHskmFjmai+WoOv6WM1YOEGTljDD/V6zPeyMvHNWQTwR5QzYx
	m99eDD4tjjUZQ1UERJTblpwMvOv+ctnNUpT083UpUGsp6et/CsdwIwcj/OVe0tZr7hmcJV1CEoiM0
	ZYyY/YlAdubmcUHVm8wgHAEpnFNoi1vaqMP6o38jJuAJXmshilUvj7uwHcazPyAtYiRJexNdOJQjO
	CB0PifDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnV1-008ecq-3D;
	Thu, 14 Sep 2023 14:39:20 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgnUz-008ebb-10
	for linux-mediatek@lists.infradead.org;
	Thu, 14 Sep 2023 14:39:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id A8A5DCE2712;
	Thu, 14 Sep 2023 14:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9260BC433CB;
	Thu, 14 Sep 2023 14:39:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694702354;
	bh=EsVzeIyCHOXl6PgzNuGZeoWesA2vqyz58aq8GZxby6s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=h6EL81IoUl36SYq+3PUnwJ8BDPeUGtghxPazqu3ODXRMQzzxs76wGqeEqdU/AjZz4
	 E9OE3ESf6j9F13Ke14qmcyFMAzAvhPgNfp2CDhNLMqqby+sc2MXmUOpabwDt3AUwco
	 yqehV3docffvWnldk82A4RD2vLMbAFjwdFH98jnnsByzVYWW7uKi1sadmU+Syx/sZA
	 Tlby2fqiIw5qMp6fmsQI+WYZQ91qrgiFGEdCdd73FvWjbgEEYufT4qci+Frljb4HVh
	 iF5GbKJoqCEf9MLk/OKqnLvrO/FeT+AZHboHKotYaWulrIGgE0sQ57cxzVpZTmowUa
	 VekFCZi3eyJLw==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: lorenzo.bianconi@redhat.com,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	linux-mediatek@lists.infradead.org,
	sujuan.chen@mediatek.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH net-next 02/15] dt-bindings: arm: mediatek: mt7622-wed: add WED binding for MT7988 SoC
Date: Thu, 14 Sep 2023 16:38:07 +0200
Message-ID: <9b84b6b9641a2eebc91e763e2ba9a341e3de1071.1694701767.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1694701767.git.lorenzo@kernel.org>
References: <cover.1694701767.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230914_073917_519668_7852A54F 
X-CRM114-Status: UNSURE (   7.75  )
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

Introduce MT7988 SoC compatibility string in mtk_wed binding.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
index 28ded09d72e3..e7720caf31b3 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
@@ -22,6 +22,7 @@ properties:
           - mediatek,mt7622-wed
           - mediatek,mt7981-wed
           - mediatek,mt7986-wed
+          - mediatek,mt7988-wed
       - const: syscon
 
   reg:
-- 
2.41.0


