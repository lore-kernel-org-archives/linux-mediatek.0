Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43480C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 10:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DOFKnmHP53qH0B8P7KVcbC/Zjvdj8HmKvORpyyP7mNQ=; b=APKk7QAmWIka1A
	fCa+VNaRmNjVi8gLCIoDjGZPKZ5JY5q183hEjU9JIepW2rDGHiryQ7W3fmKooJNdCGfQmH/x7WRJD
	vKQNpqdmEU4RIfCqqD961QNM+xUlmxVHHZz8Q3QhWp7Nj15Ok7ovQoh8k98Dl0DN9HQeRK0HhL1HU
	041rjBpp5vX/5fouJ3RhQOY4kyZ2Mq6X92Pnscwj1qdtpWFPQcdLD0wAS1cLwQBV6uWj+RHp8pZBA
	zEXmm5npiMRCYsDph5xmA9jv9VLK4THQWL5USM+8KtNguPwiFHeRWj2W2rtMf9ises+Vd7lLwG/U+
	ifNMHEZqQfLZl06Jq1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNch-00AQZI-KV; Mon, 17 Oct 2022 10:45:31 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okNZM-00ANH0-6j; Mon, 17 Oct 2022 10:42:06 +0000
Received: from mxbox1.masterlogin.de (unknown [192.168.10.88])
	by mxout2.routing.net (Postfix) with ESMTP id DD5D660469;
	Mon, 17 Oct 2022 10:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666003316;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DOFKnmHP53qH0B8P7KVcbC/Zjvdj8HmKvORpyyP7mNQ=;
	b=r4ohJPS75MjuxZRPSmTZpwVwLJzNQRGqog3D16Awhl9n7FGa8US5RYvy/r6u87zUCQ4acr
	MIaP/ZdGWHElrsfo8BO7qLBDSJxO1Am4BLYn0AFsA4omhNv33lN9P9Px3eu/WrInVCMvTf
	haQLQPQNsic5JXH3TBlvBvDqtIm/Mg0=
Received: from frank-G5.. (fttx-pool-217.61.154.127.bambit.de [217.61.154.127])
	by mxbox1.masterlogin.de (Postfix) with ESMTPSA id 37F394053E;
	Mon, 17 Oct 2022 10:41:56 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC v1 04/12] dt-bindings: arm64: dts: mediatek: add compatible for bananapi r3
Date: Mon, 17 Oct 2022 12:41:33 +0200
Message-Id: <20221017104141.7338-5-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221017104141.7338-1-linux@fw-web.de>
References: <20221017104141.7338-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: cafb17bd-435b-40ad-a6cf-f9aaf80b891d
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_034204_439508_E03FE0D1 
X-CRM114-Status: UNSURE (   7.80  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

Add compatible for mt7986 based BananaPi R3 SBC.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index d76ce4c3819d..7642f9350d2c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -83,6 +83,7 @@ properties:
           - const: mediatek,mt7629
       - items:
           - enum:
+              - bananapi,bpi-r3
               - mediatek,mt7986a-rfb
           - const: mediatek,mt7986a
       - items:
-- 
2.34.1


