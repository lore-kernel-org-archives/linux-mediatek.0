Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E64DEDEBF1
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Mar 2026 20:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g2z52IdWgskYeOiZeBZcRxQieKJEbjxt8gRN0ppFkwA=; b=BbHFSot8mCrNM1
	xa/KgmG/ASm0xdHOdRcDFeRuaXxcZ+pV2b4BbmTqmOboT369QZnB3LefYkDBiWf/wzzmUZn+7CSbG
	NEqZlc9nRKfBzw2akc3l/vY+kkpROdgPMAxMhfA0eNelppFJ94sCqOfaT29OD00nHdpP9ZtpdqACf
	M/0mN33jtndmR24oUHDHHIxnPeVgp2RfO+QueafLIGXDgjzjwMEA7Un9HXdcyI91j05E00kJbqj56
	X6VyZbGNesKcz5/Ze/zeZBGIMAiWp/2actkzy5yH77PRhycVnbYK6fvGX5ct9vi7goc/UTEyxsHpR
	f6dA4Oysyy4gNoNUy7BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWEC-0000000FuCu-3Ama;
	Tue, 03 Mar 2026 20:20:24 +0000
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxWE9-0000000FuBu-348w;
	Tue, 03 Mar 2026 20:20:23 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 8087F40252;
	Tue,  3 Mar 2026 20:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1772569215;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=g2z52IdWgskYeOiZeBZcRxQieKJEbjxt8gRN0ppFkwA=;
	b=Rvv/wlB1CnEwf/0AyjW5t6+vkFmi+9s7wkdl0DK/lAvOmmMIdJ1y/b7APPZHp8TaEOkD/M
	oOUNXAt1mVvA1Rp9JmgRuBm3bycdnlds/+5HlnHbhpm3BH18h7VuLbWfk6WqSqsQc/WZFS
	R6qVRWnNbJjZiQtIWQZTkZ3AUBPboLc=
Received: from frank-u24.. (fttx-pool-217.61.147.65.bambit.de [217.61.147.65])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id 4F9A91226DC;
	Tue,  3 Mar 2026 20:20:15 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH] arm64: dts: mediatek: mt7988a-bpi-r4pro: rename mgmt port to lan5
Date: Tue,  3 Mar 2026 21:20:06 +0100
Message-ID: <20260303202006.37515-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_122021_958165_774ABD49 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: devicetree@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Andrew LaMarche <andrewjlamarche@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

It turns out that the label mgmt confuses users and now official case is
released where the port is labeled with number 5. So just rename it to
lan5 to follow naming convension (lan1-4 from mxl switch and lan6 for lan-
combo).

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
index a48132f09411..1175ee156cb3 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
@@ -207,7 +207,7 @@ &gsw_phy0_led0 {
 };
 
 &gsw_port0 {
-	label = "mgmt";
+	label = "lan5";
 };
 
 /* R4Pro has only port 0 connected, so disable the others */
-- 
2.43.0


