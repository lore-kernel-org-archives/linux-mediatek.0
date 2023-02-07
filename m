Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E000C636CC
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Feb 2023 10:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uj3s91N95T2F3BwhUboKahqX3DOnIiHlbQ37Lz6ta+g=; b=btKObBzaHrD6Lg
	aYCtwnab9f8QEc0LzgL4x/tEDGVmGyKA19nmvVNhyXX7l7mBr/cTJsk8CBnqdXcilt35uV4JTNdUU
	FqF3fX/TE2UMisFKjt4otG3olHxdX1kl6QIQaC4Mw2Ymh05WdiEaGGs9aOprKDFm3E3G0ruRZoOY7
	lXlX1PE4kbnmeP9dYCZXcnn2f5wdjjzsZwYg0XiIYm0X2BvE9wevB0SECxdQcOd1MchUelYOdEXD2
	R9fxG9WT08mTf+QK0bqzMQ5yTLB/kz0GIm1puTNAZiDJZS2DocJUpO8KEhLzCPnnK5b+DRobS5qw5
	eC5QWKc8KsgqMZHRaO/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLAM-00BhF3-Rs; Tue, 07 Feb 2023 10:25:34 +0000
Received: from mxout3.routing.net ([2a03:2900:1:a::8])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pPLAB-00BhB7-H3; Tue, 07 Feb 2023 10:25:25 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout3.routing.net (Postfix) with ESMTP id 546166003B;
	Tue,  7 Feb 2023 10:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1675765518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=uj3s91N95T2F3BwhUboKahqX3DOnIiHlbQ37Lz6ta+g=;
	b=JOp9XjaFJmuJYY2z436g99uQ5iccj+m5ZbLs0A6C0TTT9Y72j1wYnqHqrmi1dG2o+u74Yi
	JqipeNbljDl8LdBejFBhwpLWcJ4ABa99YWUkEn34ncqn6/T5E3L4o9yonq9DmsW6OAJYsx
	fLNRy2vea1KYTeErgeP4iGjBCVXeeAs=
Received: from frank-G5.. (fttx-pool-217.61.159.155.bambit.de [217.61.159.155])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id B6FA31226E8;
	Tue,  7 Feb 2023 10:25:17 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] dt-bindings: mt76: add active-low property to led
Date: Tue,  7 Feb 2023 11:25:01 +0100
Message-Id: <20230207102501.11418-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230207_022523_806189_043DD0AE 
X-CRM114-Status: UNSURE (   8.81  )
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
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>, netdev@vger.kernel.org, Kalle Valo <kvalo@kernel.org>, Sean Wang <sean.wang@mediatek.com>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

LEDs can be in low-active mode, so add dt property for it.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
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


