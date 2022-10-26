Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F26FBC38A2D
	for <linux-mediatek@archiver.kernel.org>; Wed, 26 Oct 2022 08:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DWV64hIs6KNcV3ZMh0mTUcgJBUFmsuupZkeJjORjcjQ=; b=t8kdud3IfEjNjN
	8ij37pYiPIj9uh4Twbe895tlpMjHIBfmTPgz44SKizn4iUhxYj10JUkYuA5BNkAEYnkpNnaNGKMm6
	pd9bf8WEk8qq/7YMdEppvqIOxMfLts7axuPzZ63WDrFkbAlqIAaQVSVKOdfftLqCaGpT81VVf5eCi
	lQkin4R4ZxhWBNaNluGTfwkyqzbDqlbREuIU9TsBQytREDFhASg1tSbnw5bzOj526GJL4Rt7ZZ6TN
	Q+0B6UdhyilRg14Okz+KRdgO5If886FACwyMaOu+3dN8ZItw4ev8OdzpAnQdf/dvHAxGuoFhmO+8R
	jzSpyBLsiDZQmmk/XlGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onc94-008dDe-VG; Wed, 26 Oct 2022 08:52:19 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onc8q-008d4p-PF; Wed, 26 Oct 2022 08:52:06 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id 9F0A3618E4;
	Wed, 26 Oct 2022 08:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1666774308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=DWV64hIs6KNcV3ZMh0mTUcgJBUFmsuupZkeJjORjcjQ=;
	b=kjNm7rHk1I1u0W3ORgYXv3iylQjLIDyc2V2w33+9K4CoUKlnp1+qgsvk/JD1Pgdc6Gs6V5
	Ea3oqgjS+lB6uOGwpLgYwicmmKneX7V0dOfz/RBqs2u2Gv7fAfpcoGy+LHhAqtGIhLx564
	uVSQKI7tccpqJ6TpnqLlK+DWZEyt5e0=
Received: from frank-G5.. (fttx-pool-80.245.72.174.bambit.de [80.245.72.174])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id D62DD1008E6;
	Wed, 26 Oct 2022 08:51:47 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mt7986: fix trng node name
Date: Wed, 26 Oct 2022 10:51:44 +0200
Message-Id: <20221026085144.107430-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 95f709b3-5d67-4463-868b-b118ca0adf85
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221026_015205_029102_F9AB0E21 
X-CRM114-Status: GOOD (  10.06  )
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

Binding requires node name to be rng not trng:

trng@1020f000: $nodename:0: 'trng@1020f000' does not match '^rng@[0-9a-f]+$'

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
index 72e0d9722e07..226648f48df2 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7986a.dtsi
@@ -168,7 +168,7 @@ sgmiisys1: syscon@10070000 {
 			#clock-cells = <1>;
 		};
 
-		trng: trng@1020f000 {
+		trng: rng@1020f000 {
 			compatible = "mediatek,mt7986-rng",
 				     "mediatek,mt7623-rng";
 			reg = <0 0x1020f000 0 0x100>;
-- 
2.34.1


