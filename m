Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C61C77B7C
	for <linux-mediatek@archiver.kernel.org>; Sun, 28 May 2023 11:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wKL2OHRpM57lwNDHj3JRgnkVg9YanEJjJkWatc4415E=; b=4cbYulRQYVr+tR
	33U8nIU35+2A0pmGB4Rsd+xzxAw2E1tDDUHDzkFRjV3OM6HwENKNQxR/8rtw5yEP7yHhqRNcXnkq8
	EL3ND+coT8MWIwtisGIvJiymnOJwmyHSFBe7yop08wFb3UgXcAbMC78qOtca7siLKHFKpuTsqm8rD
	V9p+4G0f9qkZOeGk1+5w4waRKwC6UdnBSY0lh2+SZKKu1G0uSqafjBYXfXAinWzW+MiJsmi7n2Vop
	3HX+0T1gfMFBMjA7TQPm3B36JXiXfak3mR4G3rrbDQVMBZ1tszWne/K0iQJimOeHzpDFakTocQXi4
	ZRzkrzpkImZFpoirAl0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Eex-007Xo1-2x;
	Sun, 28 May 2023 11:34:03 +0000
Received: from mxout4.routing.net ([2a03:2900:1:a::9])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Ees-007XlL-1g;
	Sun, 28 May 2023 11:34:00 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout4.routing.net (Postfix) with ESMTP id AAAFC10047A;
	Sun, 28 May 2023 11:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1685273628;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wKL2OHRpM57lwNDHj3JRgnkVg9YanEJjJkWatc4415E=;
	b=gGdaQZM0Gk6IFscFNfBqFaJ5YPjd9dy6lokKYou2PrEarVjzFH6XiIStRtC/ghSXzif641
	kytNmZaV1lrLsORRg4C8z5MJqK+F9m2iwn0hsyo2eP5yCXED+kZiIl9X7o+YY5c4LXpk1w
	keUjo0HC9S0qQGWy2/Rdoq7jUQSvHGU=
Received: from frank-G5.. (fttx-pool-217.61.156.30.bambit.de [217.61.156.30])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id C78F91003E5;
	Sun, 28 May 2023 11:33:47 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: linux-mediatek@lists.infradead.org
Subject: [PATCH] arm64: dts: mt7986: use size of reserved partition for bl2
Date: Sun, 28 May 2023 13:33:42 +0200
Message-Id: <20230528113343.7649-1-linux@fw-web.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: 698df16c-71eb-4971-9a45-3611eae1be82
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230528_043358_738387_7F01C792 
X-CRM114-Status: GOOD (  10.40  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, stable@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

To store uncompressed bl2 more space is required than partition is
actually defined.

There is currently no known usage of this reserved partition.
Openwrt uses same partition layout.

We added same change to u-boot with commit d7bb1099 [1].

[1] https://source.denx.de/u-boot/u-boot/-/commit/d7bb109900c1ca754a0198b9afb50e3161ffc21e

Cc: stable@vger.kernel.org
Fixes: 8e01fb15b815 ("arm64: dts: mt7986: add Bananapi R3")
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
If the bl2 does not fit into the bl2-partition (cut off), board does
not boot, thats why i want to increase it now. My current bl2 is 197K
for nor and i ran into this problem.

Openwrt uses also the first reserved partition to give bl2 more
space:

https://git.openwrt.org/?p=openwrt/openwrt.git;a=blob;f=target/linux/mediatek/dts/mt7986a-bananapi-bpi-r3-nor.dts;h=f597b869abc80d1a73f44ebb85ad4da17376bb52;hb=HEAD#l22

so imho it should be same in mainline to not require complex bl2
compression.

have now sent the board-specific dts to uboot too:
https://source.denx.de/u-boot/u-boot/-/commit/d7bb109900c1ca754a0198b9afb50e3161ffc21e
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


