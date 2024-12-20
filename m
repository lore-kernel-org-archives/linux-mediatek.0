Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88E0FE7718A
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Dec 2024 09:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w9DuwFQ0DXzxxkCR0yJSCQmX6AfxPaWAOvtZmzKlLdA=; b=pN/c5Mvw48nIG9+feW+hgFDPoo
	+VeNJBFu/pzyW9UBt6jmvjsW++Laq946EmlTL3rVFMDwKDHvR7ComwGy7J8U6N+VFKb/pUE7Wm6Ef
	pXR+ZIxNAuzBavNiXKE6o9o+wlIMzKoaiLu9eiCXOBLvXRgCQIcCmTgTUiohp+BxgSNmp3yIE2y2W
	pi091bAq8u3GTP+SQIUTBoojRGkxzvIaHKjXT/qno426pCiyHPWPdSIAJCq/RBDMu4avPBHKAdG27
	i0MgYHXODjrrgt4SceJfo1kQokkkJG4IXl8Y9bdRYXNbozi+i3G86LaAopYZJkeP4MPFWSIn59f7V
	OemnoCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZkM-00000004V54-3yzK;
	Fri, 20 Dec 2024 09:56:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOZjD-00000004Uxb-0q7B;
	Fri, 20 Dec 2024 09:55:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1734688523;
	bh=WHChlDaqD1NI//1QWqx55kv+LHwkC4ZSA3jnQaPpveg=;
	h=From:To:Cc:Subject:Date:From;
	b=F60g8FrSwNGHo93KDtU2Wv8kJQTXl0IAw0LrR21/41ra8CZ88pfZ/XMFLt1ySfbHn
	 Dlnm6qVZNslF8Tce3qrXbyvrCJG11WAFjYanwPIDQSIVXSQWCbmolqoLqysr3vUhbl
	 +pEd62Wksz+i9pXbmQep7NDFs8lul5UQ5EplhzisQnDFKwgsvWm9cWlmR2Y4nyQNQ7
	 N0G1WDSU/p1MrkG4j2Qn/fzAiXGNXkXHNT7FnVCIR7ttqtaHLsoMR5/yJ6EPX90PvA
	 BhwwKbnD9nmkyc4hPZS91wyFn2gN3J9zjlRfDBrLgrAEhhXC9A38P3uWau9ZRiay0x
	 btt5JrhhdSMPQ==
Received: from beast.luon.net (simons.connected.by.freedominter.net [45.83.240.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2500A17E120F;
	Fri, 20 Dec 2024 10:55:23 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id CF3F7D8F3932; Fri, 20 Dec 2024 10:55:22 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: kernel@collabora.com,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: mediatek: Set ethernet alias for mt8365-evk
Date: Fri, 20 Dec 2024 10:55:06 +0100
Message-ID: <20241220095522.2026002-1-sjoerd@collabora.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_015527_413826_6D292FDB 
X-CRM114-Status: UNSURE (   9.77  )
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

Configure an the ethernet alias to match the ethernet controller (even
if it's off by default). This allows e.g. u-boot to configure the mac
address on boot properly

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---

 arch/arm64/boot/dts/mediatek/mt8365-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
index 7d90112a7e27..44c61094c4d5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8365-evk.dts
@@ -21,6 +21,7 @@ / {
 
 	aliases {
 		serial0 = &uart0;
+		ethernet = &ethernet;
 	};
 
 	chosen {
-- 
2.45.2


