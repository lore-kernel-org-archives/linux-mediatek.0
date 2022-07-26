Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25141C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Jul 2022 03:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Z8qIDVDgBIakM2ddogDBvUAuMmI2ji5nmfwb/01xnk=; b=MO9nwjkcOptpndHZOSFaBJ+P6A
	wx3m9KK367NfywmgGnYu/c+cet4FoTf6jFb2d3PGPsq7L/fwvnlwFnWuD+DTI0QpXiOAF8z+YEos1
	csBEcJJO/cCXQ/VmGfHN5S5E5ja0eXoUhbq4SFGqZiIhCCC2UV/8YBbxX0iZlHf1wKj4TYI/ZjP1I
	q2we/N46fg2PGO/QVLaKgz5uuW6b+g2PpkpEBqK1TByqIc5rl0IWN7xC+Mmkgdmmqk+nO3OTkSm7H
	+yK+uecG4wvsOZfWBAbW7Ak1mgsu/aHo0IW/UF2GcI8PAx+R0vrW4HcxHtq/POZeaeDbKrH04J1p3
	VOeiu50Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGAur-0071Yc-1b; Tue, 26 Jul 2022 03:07:25 +0000
Received: from mail-m121145.qiye.163.com ([115.236.121.145])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oGAuL-0071K3-IV; Tue, 26 Jul 2022 03:06:56 +0000
Received: from amadeus-VLT-WX0.lan (unknown [113.118.189.34])
	by mail-m121145.qiye.163.com (Hmail) with ESMTPA id 3F99E800058;
	Tue, 26 Jul 2022 11:06:51 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 3/3] arm: dts: mt7623: update scpsys device nodes
Date: Tue, 26 Jul 2022 11:06:21 +0800
Message-Id: <20220726030621.7555-3-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726030621.7555-1-amadeus@jmu.edu.cn>
References: <20220726030621.7555-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDGhlPVkJNT0lDSBhDGEpKHVUTARMWGhIXJBQOD1
	lXWRgSC1lBWUpKSFVKSkNVSkNCVUhPWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Oio6Ehw*UT0rKE44GUgLNx4q
	LBgKCUxVSlVKTU5DQ0tPQ0pKQktPVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	SFVKSkNVSkNCVUhPWVdZCAFZQUlLSU43Bg++
X-HM-Tid: 0a823878b704b03akuuu3f99e800058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220725_200653_764618_3E660AFE 
X-CRM114-Status: UNSURE (   9.10  )
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

Since the power domain data of mt7623a changed,
device tree should also be changed accordingly.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm/boot/dts/mt7623a.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/mt7623a.dtsi b/arch/arm/boot/dts/mt7623a.dtsi
index d304b62d24b5..fb2670875a66 100644
--- a/arch/arm/boot/dts/mt7623a.dtsi
+++ b/arch/arm/boot/dts/mt7623a.dtsi
@@ -31,8 +31,9 @@ &pcie {
 
 &scpsys {
 	compatible = "mediatek,mt7623a-scpsys";
-	clocks = <&topckgen CLK_TOP_ETHIF_SEL>;
-	clock-names = "ethif";
+	clocks = <&topckgen CLK_TOP_MM_SEL>,
+		 <&topckgen CLK_TOP_ETHIF_SEL>;
+	clock-names = "mm", "ethif";
 };
 
 &usb0 {
-- 
2.25.1


