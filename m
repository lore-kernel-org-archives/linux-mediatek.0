Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3445C32771
	for <linux-mediatek@archiver.kernel.org>; Sun, 18 Sep 2022 13:44:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LyKKSIaUWUL8B9tj8IvHXWbgygrP25IoTaLgYk3F3Cw=; b=hyZhPRkB7OzV+llL7vxE3AlsJL
	24CIh+HaETyDetbo84vDTm0vE3mKTR7358qQQ4+7Xb4OXwo5qIgkoIxxB7OrnkiqAh/+ino9tEbft
	d2+5MbpZBR8ndNnNe5GlGnBm5/6PtUG4CObbrjawBeFk3JKn3gy7dyLblRGcj2p+D99hrDO29oCa6
	/5JAtMjEb9ohP9/aT2Ev7kePGltdcxi6JDF5p/frDgIl58HfKAJqTFTBjzBeWswD7C/SApWf1/HJ4
	vQHLoT8OSPZc3dKvrVMsp3AXlhTBrCyXFXMgOSS6jrBxNGa/LIGX9lg4jFovMuVIn6xirXulvP4d4
	57WPZtEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZuay-00Gasx-3M; Sun, 18 Sep 2022 13:44:28 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZuYy-00GZ3x-Vt; Sun, 18 Sep 2022 13:42:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663508526; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=nzX7dfm18rd14GFycVu1wcpX5W6xRmu40k9VGkQCC2nMzmJ7cs4piT1G2Y8pXAmoR1TZc5Doopu+WnARP+LLpU71TS0A64pUfw1uysFYk/nmFEU7QX89G5S/1kc7og6WByssincdUW3tAiR+vwOHfAx3agELxEgKHIWppeYS62k=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663508526; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=LyKKSIaUWUL8B9tj8IvHXWbgygrP25IoTaLgYk3F3Cw=; 
	b=WoxWI5JB/2SbxJUwpFIroVQL9pvDSgbHgxYXPlNYsmj1suN+pFN81ZmfP1V4nHJGc7XDFGwB5HZDrsI8fyiJ9lBuEkghAEo40ZcqxhXYF595orQA4RBUsLXwp2XsdQ/h8znAblhWr6ecdyR3aggBRz0o/h3eJ+Q8GvmGrGbVbsM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663508526;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=LyKKSIaUWUL8B9tj8IvHXWbgygrP25IoTaLgYk3F3Cw=;
	b=VhuaRfpv2ywD6K1jREvAmHgGxh6IFqNF+bBK0w1Ak5LMh1EC5kMjWvDY9s3DGKU4
	B9PZ0zdK6n21jWl4+gH6RN8LWZtFrs77RsxdPaipXXFG74il81Qq/ekU5xtrwX/K+t5
	F10yKNht4BVOW+OcmrIYL8cheFAmT7NK+WUMulU8=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663508524861456.3233529066084; Sun, 18 Sep 2022 06:42:04 -0700 (PDT)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	erkin.bozoglu@xeront.com
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	=?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
Subject: [PATCH v3 net-next 06/10] mips: dts: ralink: mt7621: remove interrupt-parent from switch node
Date: Sun, 18 Sep 2022 16:41:14 +0300
Message-Id: <20220918134118.554813-7-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220918134118.554813-1-arinc.unal@arinc9.com>
References: <20220918134118.554813-1-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_064225_132531_8A2C9031 
X-CRM114-Status: UNSURE (   9.08  )
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

The interrupt-parent property is inherited from the ethernet node as it's a
parent node of the switch node. Therefore, remove the unnecessary
interrupt-parent property from the switch node.

Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Reviewed-by: Sergio Paracuellos <sergio.paracuellos@gmail.com>
---
 arch/mips/boot/dts/ralink/mt7621.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/mips/boot/dts/ralink/mt7621.dtsi b/arch/mips/boot/dts/ralink/mt7621.dtsi
index 294ee453ec36..c0529e939a31 100644
--- a/arch/mips/boot/dts/ralink/mt7621.dtsi
+++ b/arch/mips/boot/dts/ralink/mt7621.dtsi
@@ -348,7 +348,6 @@ switch0: switch@0 {
 				reset-names = "mcm";
 				interrupt-controller;
 				#interrupt-cells = <1>;
-				interrupt-parent = <&gic>;
 				interrupts = <GIC_SHARED 23 IRQ_TYPE_LEVEL_HIGH>;
 
 				ports {
-- 
2.34.1


