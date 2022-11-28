Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E341C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 21:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QVXbcaj0HG2V69BRM9WHD2nb8nYMSoGDBdtG+KKs/r8=; b=YdcVpeekhjqWRyOIliH5CSJ408
	VWE0jc+ot3TdL57swzeJcNRCV+rvxIjVZdj6ezq3ULtvvTM5X7LN9eh3PPxu53aZ4LiF4sUwpEpdq
	RS/XCgBlH+YFtNfTBow8/n4NhPINF2vQ2egdRPQYW9+vFX8s9HT2dw1BiE4+8kx8PL3PzZzay4Jhe
	VWfVNXFCorgl5IhG+EbxU7Z1RDZbv/Je/KV1iVWBU6jgi5tUZ6UchexsnLLcFuCKcVE9gUWLky526
	XtGrSqt6Hdnags8Nuov9xqgeqUOOMzeiXDpcIkANuQDFazWmhMS7FR8/cR3MQvCPuchB0GGHsFsJb
	DTNxW1hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlkn-004W3l-7y; Mon, 28 Nov 2022 21:33:29 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlkd-004W2H-1u; Mon, 28 Nov 2022 21:33:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1669671187; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=R/S87fl94BFiPI5qMA2RIlbkHvMFcCzvqUxQQvPSUQ0EyE5C18479+pA97bx3FR8bX/f2PbCWK6t6m7yszAVPVaiMCZbWkQandLqayVVm+w0ri15afC5tKALkafUEamieCDaeB3PsborJgPjKP8yGYnxOYUIJsLO/0Is8QszHkk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1669671187; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=QVXbcaj0HG2V69BRM9WHD2nb8nYMSoGDBdtG+KKs/r8=; 
	b=WiDE7CPPDeoy7lWxl26RSsiZ0sqWcePZWpUbxA/QSpv9AgHFxc0hSkvZGh3uDredoHLwxC6RV1b7qEnfY6/PDtuS6zzbGnmyLoh0xEs8fCVLq6cluVHT11sVKV/6iouYKGLlrL3bX6ovWBnQ1xqeOs54PPyzo8ox5dpn7d/3S1Q=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1669671187;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=QVXbcaj0HG2V69BRM9WHD2nb8nYMSoGDBdtG+KKs/r8=;
	b=W8DrlAuiZWEAivLGMb3xsjUYZfLC5DqzMnIodHeElRWu/ZzGOSOPFNDQnXH8B0aZ
	BP8zq50oJiG+HbBCO+bkkOU8xZAGSPdzaNY1OYYU+2oGkXXIZuxYco7GXrVPcEmmorN
	/ewPLsYcnHA0E36mVKAbuTv4+VB+YjYBKJ6lJMDo=
Received: from arinc9-Xeront.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1669671186041271.1969592308891; Mon, 28 Nov 2022 13:33:06 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mips@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Petr Louda <petr.louda@outlook.cz>
Subject: [PATCH] mips: ralink: mt7621: fix phy-mode of external phy on GB-PC2
Date: Tue, 29 Nov 2022 00:32:38 +0300
Message-Id: <20221128213238.3959-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_133319_169325_721C0D29 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The phy-mode property must be defined on the MAC instead of the PHY. Define
phy-mode under gmac1 which the external phy is connected to.

Tested-by: Petr Louda <petr.louda@outlook.cz>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---
 arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
index 7515555388ae..e31417569e09 100644
--- a/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
+++ b/arch/mips/boot/dts/ralink/mt7621-gnubee-gb-pc2.dts
@@ -113,13 +113,13 @@ &pcie {
 
 &gmac1 {
 	status = "okay";
+	phy-mode = "rgmii-rxid";
 	phy-handle = <&ethphy5>;
 };
 
 &mdio {
 	ethphy5: ethernet-phy@5 {
 		reg = <5>;
-		phy-mode = "rgmii-rxid";
 	};
 };
 
-- 
2.34.1


