Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 918E9C4345F
	for <linux-mediatek@archiver.kernel.org>; Sun,  5 May 2024 16:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4WZG70r8O5lFcJ/c3m5E3BoGyd+N0jBB6rsNs5I7w5I=; b=gfRNcllxCL+VCP
	ZKfNjvx98gJVEJubwbRkLPV3MS0KFAI9BrEFIGQTADlqCG3QB352eVVKCRnXSXyxWLQ+jOiRff4t1
	aKmTigmNMJJI81sdHUyuX2vCBvk0c40WHKWbgB66m+YXv2TcM3xWrbw9PcdYO1nqRcbylj2fKsvP/
	l38fA0suPtjlTebxO3PtLokeFYew47jNoNcdfL5GPAwZUtTvjO6i5GpcToFloAehSKSN7qer+/UyS
	DyM49Y2qwoP6n4iZYXgEQsDVCKXc+l5W4e3Amii44tAFQp5heNRZ5ZZqDK+208NA24QzQM9mIlG1v
	yzheE86v91P8Y7y4NpBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3f08-00000004psZ-3xvU;
	Sun, 05 May 2024 16:46:12 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3f00-00000004poq-3zyD;
	Sun, 05 May 2024 16:46:08 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 97F705FC36;
	Sun,  5 May 2024 16:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1714927561;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4WZG70r8O5lFcJ/c3m5E3BoGyd+N0jBB6rsNs5I7w5I=;
	b=YPrHqBk1k0CDPlMkhHZ81R7pN7OflmVokk9KkwmPSHiqAA8A0skbw3pEfPIG9xbyJTb3W+
	RchVYou0Suokrza/FnffpnyIiKGlSdAW/4P06esjT0N/UmX24gZKBWySElJ8RVNvsNE7OO
	YliBkdw1IHbMRFfMSKHovAjRMdmIIWg=
Received: from frank-G5.. (fttx-pool-217.61.153.24.bambit.de [217.61.153.24])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id A5F9B3604D6;
	Sun,  5 May 2024 16:46:00 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [RFC v1 3/5] dt-bindings: net: mediatek,net: add reset-cells
Date: Sun,  5 May 2024 18:45:47 +0200
Message-Id: <20240505164549.65644-4-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240505164549.65644-1-linux@fw-web.de>
References: <20240505164549.65644-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 5b13f365-7f17-4ad6-9c2a-9ca17ef7465e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240505_094605_179061_8B73255C 
X-CRM114-Status: UNSURE (   7.97  )
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
Cc: devicetree@vger.kernel.org, Tianling Shen <cnsztl@immortalwrt.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Eric Woudstra <ericwouds@gmail.com>, linux-clk@vger.kernel.org, linux-leds@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add missing binding for property used in mt7986a.dtsi.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/net/mediatek,net.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index e74502a0afe8..5214927c0fe8 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -101,6 +101,9 @@ properties:
   "#address-cells":
     const: 1
 
+  "#reset-cells":
+    const: 1
+
   "#size-cells":
     const: 0
 
-- 
2.34.1


