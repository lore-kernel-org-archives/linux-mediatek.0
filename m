Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E6BC3ABC3
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 May 2025 14:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zletv3U5pRRedodS7LIwp9KMfAgSeQxiaCAd7v3PwI0=; b=ko17k40ewLN935
	+cYeFfG7WVtsYIZUM40jAGaZuj1nojP2ro5EqKO52MDs7KPELqviqCsko03KtjTDjVnraLKX9evw2
	3km6G/T79L31RTDHD0jTnefTJ7kWd9FHNykNevt8cnLPbDu8j5iYzymwKRinp0IFdLNMzZZSlRv35
	z/vCvyiHAviruKYHE25aCaNWnCYRGew+gpy6ppbpuB1GcyIugeK0tq4A5tLXYz9LX/dpXdhBVa1/R
	C2DnpBJfatia2472+acFVDu0CS8MdkFvjnmMk4geSHLH0fp0ljfrL3BlgFUWKsyDLgm4Dky50FUlV
	I6E5s0qdHGeVhwjcvxug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7n1-00000007NQz-2PAv;
	Sun, 11 May 2025 14:36:27 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE7XD-00000007LYF-3Tkm;
	Sun, 11 May 2025 14:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Zletv3U5pRRedodS7LIwp9KMfAgSeQxiaCAd7v3PwI0=; b=A3QRGkabFdzqzP5VkbwDaZ22sx
	B1tKM+hR4DQ7Nij8ZUyokotJ+X5zpwxTZnrP4R8n2Arh384HO2AJ7dCq7dq/kglI5OcWjzsktNupj
	Qx+QHA239eugxx4Et7EilXljDBuZZJ/EmiqJQBXsmBZa3bjjFBJ1VxsXsUJPqVaEhpBVm0N+YjsOC
	kIIN2UHilrT+HmbTWTpc4/x0MdkmEkROJZYs01xueJqBfXgiDY4o+gF2IXyb+hyMG9DHeeYX4jpTr
	BMmm+5v0QVgO+u0VMJRdTO8x+TJji/dEetRiuSSfmWbyMORnuOMYVtadv7ze3dX1HS1PM6KGGf6UA
	nHWPqgWw==;
Received: from mxout1.routing.net ([2a03:2900:1:a::a])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uE7X8-0000000Gchd-0jpp;
	Sun, 11 May 2025 14:20:06 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout1.routing.net (Postfix) with ESMTP id B2A6440094;
	Sun, 11 May 2025 14:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1746973199;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Zletv3U5pRRedodS7LIwp9KMfAgSeQxiaCAd7v3PwI0=;
	b=t6W+bX+z/KRWh9jA/wLcR8rgxTTS4oMSkzhc6kOa6+8CCchz6xVQORutqkVWCSVtNFi7cQ
	z/7aDNcaKk7HvAAjGho2aXcBXVk02wclJ/eoIdr67suJwISesnfTaRMKfy/OfyF3tFWABH
	h4K52HiAXDv3KU2v4e+UITQHa+tzdHc=
Received: from frank-u24.. (fttx-pool-194.15.84.99.bambit.de [194.15.84.99])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 98311100787;
	Sun, 11 May 2025 14:19:58 +0000 (UTC)
From: Frank Wunderlich <linux@fw-web.de>
To: Andrew Lunn <andrew@lunn.ch>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v1 07/14] arm64: dts: mediatek: mt7988: add phy calibration efuse subnodes
Date: Sun, 11 May 2025 16:19:23 +0200
Message-ID: <20250511141942.10284-8-linux@fw-web.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250511141942.10284-1-linux@fw-web.de>
References: <20250511141942.10284-1-linux@fw-web.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mail-ID: b7327c0d-db13-43b6-8ec5-709b71d19c3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_152002_504433_2AEAEC05 
X-CRM114-Status: UNSURE (   7.63  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Frank Wunderlich <frank-w@public-files.de>

MT7988 contains buildin mt753x switch which needs calibration data from
efuse.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
index 64466acb0e71..029699e4eb02 100644
--- a/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7988a.dtsi
@@ -696,6 +696,22 @@ efuse@11f50000 {
 			lvts_calibration: calib@918 {
 				reg = <0x918 0x28>;
 			};
+
+			phy_calibration_p0: calib@940 {
+				reg = <0x940 0x10>;
+			};
+
+			phy_calibration_p1: calib@954 {
+				reg = <0x954 0x10>;
+			};
+
+			phy_calibration_p2: calib@968 {
+				reg = <0x968 0x10>;
+			};
+
+			phy_calibration_p3: calib@97c {
+				reg = <0x97c 0x10>;
+			};
 		};
 
 		clock-controller@15000000 {
-- 
2.43.0


