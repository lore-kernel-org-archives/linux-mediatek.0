Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B54D374A6
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Dec 2025 22:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Bsaeh+R85W3yqBXY0/3dvY5ZY1X6APknzRRJmY7imCA=; b=ug9qaXUu3cn+LD
	limoMsq0ZkKHMRiBUt+9FPkIuaoj6MkFzTkfKks/Nb1IEdltX+rDINlVpyBSHORhcP9yA6HoiLF+H
	tJRC7SVq5KnEYDiSllMShSvjfeFWegjjpu5D8txfyclJOtLCBb9v9rvE3W3uw/m9RMbZpAnWp/IF6
	kfL4oJDD8UOgu2lBAGKbRXLR3KYHUVtR/AAMta888Q2q1NcOjYRHQVBc13t2PZu8neAfDUGvIyma+
	syeiUTTqVkoW4hkqUsn3c3froKN8LkHy9AUqrzh5VEdRBmYJGs6AawsFuVjkND7xP+EYmYJ3/t+Op
	D8i3V6x/uxPgp3fW7nYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqh-0000000A5Rl-0uXv;
	Fri, 05 Dec 2025 22:00:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqf-0000000A5OZ-28SI;
	Fri, 05 Dec 2025 22:00:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Bsaeh+R85W3yqBXY0/3dvY5ZY1X6APknzRRJmY7imCA=; b=gVPFAFitucrsfMwuC88SaBaC5K
	lEZbb6hTwYbfgKyCYizCM8AF/uHrtgWhbzLgfyJw9SQTH0UsoFMZ4oY9Gq1Urh/KYtJ6OFB9cCYYZ
	pCWUIDJz5QZR9eiGhrFN2y2YR2k8D0jsfZrkW4r5ljQEHR0S58tRbOx5WWOPC32+pFHsKjlRNhmLJ
	q0gE6Ic90s0N6enpl/Yd6LOr7dXm4ERUQVCLxrNhY+FMvvcwyghZ/S9QWwXgo/Suj8GqN8Wg3GvG9
	AxVlO2bi9IqD87iVj5aO1GEd2wZR5xxtqYbD6flzxpQlrkKt2IUzBuvSMkmnuIDkkSDzktjIuOl1+
	Ve/EUaVg==;
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdqa-00000006IYH-45f5;
	Fri, 05 Dec 2025 22:00:19 +0000
Received: from mxbulk.masterlogin.de (unknown [192.168.10.85])
	by mxout1.routing.net (Postfix) with ESMTP id 1BE7A3FD50;
	Fri,  5 Dec 2025 22:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=routing; t=1764972005;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Bsaeh+R85W3yqBXY0/3dvY5ZY1X6APknzRRJmY7imCA=;
	b=yJRRRkihclJuRSI/DLO1f3PO8oASBGmyaBC+rF5SUnfv3zT3xsbKyKAU+KRrSq5t7crTf+
	2Nx695LypGQojaYqtGjLjg/HcFW4QTJuJ1q8qn01KK8KLph2NxfimDi/actEOVldkm5z1Q
	N108qUsFeV8T4xwo6l+ef9z+zSDJVZA=
Received: from frank-u24.. (fttx-pool-157.180.225.155.bambit.de [157.180.225.155])
	by mxbulk.masterlogin.de (Postfix) with ESMTPSA id E5F1F1226F1;
	Fri,  5 Dec 2025 22:00:04 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH] arm64: dts: mediatek: Apply mt8395-radxa DT overlay at build time
Date: Fri,  5 Dec 2025 22:59:38 +0100
Message-ID: <20251205215940.19287-1-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_220017_274692_29E4473F 
X-CRM114-Status: UNSURE (   8.36  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "Rob Herring (Arm)" <robh@kernel.org>

It's a requirement that DT overlays be applied at build time in order to
validate them as overlays are not validated on their own.

Add missing target for mt8395-radxa hd panel overlay.

Fixes: 4c8ff61199a7 ("arm64: dts: mediatek: mt8395-radxa-nio-12l: Add Radxa 8 HD panel")
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
This will show a warning [1] in upcoming 6.19.

Note that if it is desired that the combined .dtb is not installed, then
the combined .dtb should be added to 'dtb-' variable instead.
---
extracted missing part from [2] with updated commit title/description
after my bananapi series [3] to solve all warnings. Added Fixes-tag to
make sure it lands in 6.19.

[1] https://lore.kernel.org/all/20251114222759.4181152-1-robh@kernel.org/
[2] https://patchwork.kernel.org/project/linux-mediatek/patch/20251117211306.725678-1-robh@kernel.org/
[3] https://patchwork.kernel.org/project/linux-mediatek/cover/20251119175124.48947-1-linux@fw-web.de/
---
 arch/arm64/boot/dts/mediatek/Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
index cac8f4c6d76f..3f76d9ce9879 100644
--- a/arch/arm64/boot/dts/mediatek/Makefile
+++ b/arch/arm64/boot/dts/mediatek/Makefile
@@ -166,6 +166,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-grinn-genio-700-sbc.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-kontron-3-5-sbc-i1200.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l-8-hd-panel.dtbo
+mt8395-radxa-nio-12l-8-hd-panel-dtbs := mt8395-radxa-nio-12l.dtb mt8395-radxa-nio-12l-8-hd-panel.dtbo
+dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-radxa-nio-12l-8-hd-panel.dtb
 dtb-$(CONFIG_ARCH_MEDIATEK) += mt8516-pumpkin.dtb
 
 # Device tree overlays support
-- 
2.43.0


