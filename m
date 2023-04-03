Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20251C761A6
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Apr 2023 10:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BZ9tPE6ls/muuZObj8Q8K01GmUnkjtbnL+JF6Rq/x1c=; b=BsTi/cQqUsNLK6
	lrxkSPqu1qn8+RWxRk42w/7Rewx2YEKmIOqUIdqzq7ZEb44qTwtSpnMtUN2hQIRnWjR+47PRMdyF2
	t5kzuaLMUTofRHRwdX0wb4zm/Zl+MD4ssL5qIDq5yiyG7sTkZANS8nuO6ro84P0IXmENVq8upJX5z
	vbwjbH8Qd0TPtvip8ylSTLFpqBs/2x89EL1PjPjvbxdgu4f5Nw/YJMotlJ6Y8xDyoXMayP30Q847k
	hUsOVkrA1MyBP4wHJM24GEOJ5LskSZb4smt2MV6b9JnOuVG8YhK+/jlZM6JS0kyGZm17Qe53eNq/7
	9+rDdXr0xauZmPoxi2WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjHtR-00F1sq-1N;
	Mon, 03 Apr 2023 10:58:33 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjHtN-00F1rh-20;
	Mon, 03 Apr 2023 10:58:31 +0000
Received: from mxbox3.masterlogin.de (unknown [192.168.10.78])
	by mxout2.routing.net (Postfix) with ESMTP id 8AB655FB9D;
	Mon,  3 Apr 2023 10:58:26 +0000 (UTC)
Received: from frank-G5.. (fttx-pool-217.61.152.94.bambit.de [217.61.152.94])
	by mxbox3.masterlogin.de (Postfix) with ESMTPSA id C0B2E3608ED;
	Mon,  3 Apr 2023 10:58:25 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [RFC] arm64: dts: use size of reserved partition for bl2
Date: Mon,  3 Apr 2023 12:58:18 +0200
Message-Id: <20230403105818.29624-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: ff39b839-2afa-4e8f-82c9-0ea90158acdd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230403_035829_801617_5B9FBADA 
X-CRM114-Status: UNSURE (   9.87  )
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

To store uncompressed bl2 more space is required than partition is
actually defined.

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
I used the definition i got from mtk used in their SDK uboot.

Openwrt uses also the first reserved partition to give bl2 more
space:

https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/mediatek/dts/mt7986a-bananapi-bpi-r3-nor.dts;h=f597b869abc80d1a73f44ebb85ad4da17376bb52;hb=HEAD#l22

so imho it should be same in mainline to not require complex bl2
compression.
---
 .../boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso     | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
index 84aa229e80f3..e48881be4ed6 100644
--- a/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
+++ b/arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-nor.dtso
@@ -27,15 +27,10 @@ partitions {
 
 					partition@0 {
 						label = "bl2";
-						reg = <0x0 0x20000>;
+						reg = <0x0 0x40000>;
 						read-only;
 					};
 
-					partition@20000 {
-						label = "reserved";
-						reg = <0x20000 0x20000>;
-					};
-
 					partition@40000 {
 						label = "u-boot-env";
 						reg = <0x40000 0x40000>;
-- 
2.34.1


