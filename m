Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AE92CED274
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Oct 2024 07:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nS71aCKNm3xfEoFq0Zvtza8h+C9shorY7KUEWPOULTY=; b=hQTo52JLosULiLfVJQ6BWIY2pA
	eQYyGRBsWzsZhvR19gn2UqfdwmA71KaCIyotirePY0PJnUayG12QkfmioF8d6cKG7lrANa6yUtAi0
	fFvj4vGYgNTXLQyyk0WV1IIPTp0+ENBYbEugMM9mL2NegZpwqwDbeElfCcizEW6ana243qkzQmlrL
	P1BpLOlg5qW4iKgqxAzVEWq4MZ9XJhFs4z8gZu0hQMp+P70YpG7wJHfi8bf2za0INZMaIs5Izz38M
	aonKlGOelGVNxAV+LF1rYFgCe4pWcX33E52pIuNaAR9OLiqY7iKdHJL4fq7Hqw+OlirvVJDsZiBO2
	iw1PWY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4zw-00000004sRY-0ZAm;
	Tue, 08 Oct 2024 07:51:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sy4qj-00000004qL5-3hKV;
	Tue, 08 Oct 2024 07:41:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728373299;
	bh=35lBvv2CjlMGxk3oBL24soVgpmlLJ5Mwe/JfBWF/hcI=;
	h=From:To:Cc:Subject:Date:From;
	b=QFoxrTOW486KUimq4VCS/qdNu49Grm6OwUq17dgMSgs2Cpk9oCTO2KsGEQtZjaeeP
	 4AR5QPJ7JAJDlIyqrairIs7gY4UFqayzgAMFs/pFCElkrsjD3sxqR5UoIZsvRZFYvd
	 JqHq72pXv6vBc6A6nhRb7FVkV0xNORnSMT+pHxd/mH/7ysmSTjfJsVlPYQArMic/Dk
	 tNA6us5bR9fPX+vAZB3GpFGDtiD2y35QrbZbpLBMlhA9F0uipaD4g1QJQeyg1Vl5mV
	 WsmG9WDZy8ye1FDLwot9zMTwGwcwgfn7x+9JLO1dqa5uhk7pW0ZjK38XVZJF1ddbEL
	 QHkRIb8JCQawA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 50A1C17E107A;
	Tue,  8 Oct 2024 09:41:39 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: dmitry.torokhov@gmail.com
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	chen.zhong@mediatek.com,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	macpaul.lin@mediatek.com,
	kernel@collabora.com
Subject: [PATCH] dt-bindings: input: mediatek,pmic-keys: Add compatible for MT6359 keys
Date: Tue,  8 Oct 2024 09:41:37 +0200
Message-ID: <20241008074137.20269-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241008_004142_141789_E874D89C 
X-CRM114-Status: UNSURE (   7.85  )
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

Add a compatible for the keys found on the MT6359 PMIC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 70567d92c746..bba55a81e6cc 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -28,6 +28,7 @@ properties:
       - mediatek,mt6331-keys
       - mediatek,mt6357-keys
       - mediatek,mt6358-keys
+      - mediatek,mt6359-keys
       - mediatek,mt6397-keys
 
   power-off-time-sec: true
-- 
2.46.1


