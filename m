Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48560C636CD
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 13:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+qbv0n0dKcwpBoP7NvIb165bwtTu0lYmwjiFWAV1Qec=; b=v7WawbYbqHI7oK
	fMo82cvsE3GcP+2SbbyaTp38zMQPNFVC+RDizN8FYYI88HQ1V4vrrPMOkyeOpWWbNtxN6jDya7LcD
	LwGM6ZHK7DvCdixsezhmkKEs+yagCZDPR7KT47zBnLEDpx0uonEu8OOGVP45Z+h8tkQalc0tH/vWg
	l3icv7xOl3R7T+/SeyTDgE5UON0U7CXk6nUXzKTKe3KIetTx7UjAjDhRWN4xhYPu+IO5gGm0v8Kjr
	nvo1HVCvAXpmusqL9cHIVtfii3dBXcnqZrP1aWgQvhZZbGrlJu32fNmPrrU/RZqaRRHsEHFoe3NhS
	jG4FNgTLRSjuRJ6/J2Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPO88-00CJZ2-K2; Tue, 07 Feb 2023 13:35:28 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPO7w-00CJVj-HX; Tue, 07 Feb 2023 13:35:17 +0000
Received: from mxbox4.masterlogin.de (unknown [192.168.10.79])
	by mxout2.routing.net (Postfix) with ESMTP id 192C36160D;
	Tue,  7 Feb 2023 13:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1675776911;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+qbv0n0dKcwpBoP7NvIb165bwtTu0lYmwjiFWAV1Qec=;
	b=yNgHg9+vnJZKImB57vUO5nu22PU4EMoYJ/Tt69w/2+hT9i9K+J7Du5ra0C7/p2pWScXM6a
	HC/i252pqdVyr7hfGnI34RmllWkXANxUIiBkmItXPPHtefEcBw6T7EVmuMEWdkjtKvYNQR
	ehxl75wS+cpaem5FsPx7BNed4k64aHk=
Received: from frank-G5.. (fttx-pool-217.61.159.155.bambit.de [217.61.159.155])
	by mxbox4.masterlogin.de (Postfix) with ESMTPSA id B407180D97;
	Tue,  7 Feb 2023 13:35:09 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH v2] dt-bindings: mt76: add active-low property for led
Date: Tue,  7 Feb 2023 14:35:04 +0100
Message-Id: <20230207133504.21826-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: fcc6f107-9e6a-4587-a7ad-a6af974cf1bc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_053516_747051_ACA350A1 
X-CRM114-Status: GOOD (  10.47  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

LEDs can be in low-active mode, driver already supports it, but
documentation is missing. Add documentation for the dt property.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
v2:
- change commit message to mention that driver already support this
---
 .../devicetree/bindings/net/wireless/mediatek,mt76.yaml      | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index f0c78f994491..212508672979 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -112,6 +112,11 @@ properties:
     $ref: /schemas/leds/common.yaml#
     additionalProperties: false
     properties:
+      led-active-low:
+        description:
+          LED is enabled with ground signal.
+        type: boolean
+
       led-sources:
         maxItems: 1
 
-- 
2.34.1


