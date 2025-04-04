Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE11C3601A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Apr 2025 14:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=la0UMI/UisL21wG4UPlGkhTcnil6/pfUh4ZRF4MLSS8=; b=QpzmZiezt0MpQTueBqjtFxWEAR
	9080qqmY1pS6Y/Qt+xJcoqDIicWfTvxaCvEijg+nRtSvAohdjFdw81bAeMIsc1oJ8J+kMqr5NHHPJ
	4KkgaW8COE+K1az00SG2vrmfB9IBOsCtHoQV4dBltlvyfNap14y6Y8CF8c9bjn03SJrXs7ZDIMST8
	uez6jdoI1cput7wkMbh2Lcd209iy5xzW0EoD/s4ND7k1swtVzU+/EE8VjQydkegZwEaoyV3xzRyV4
	ubIbAPGxU8QlOlJmlzCef9QKI9yAOhnD/JA6FPonLEo6FRuOcCKFjfAyCPnwrSV0evlADRU9TZnrN
	GKEjnUDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hf1-0000000BvnV-1xgP;
	Fri, 04 Apr 2025 14:04:43 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hTu-0000000BtgC-2hsT;
	Fri, 04 Apr 2025 13:53:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743774793;
	bh=wHSW2yYOr4KJOJ8+TNv3Qp3Jf9vVjS0eM/3lV8YHR0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QazsvcgNslrT/Rv3rrW0/23ORVL5cuYxw4xkuVAs3u7eGNXUtrFdwWeM0aw2nBRFk
	 dF8gBaach/iaMQoHFjPkg1T+fIFZDjYvoL65/F+vDYfzx152kIyV/SMe0uK3u8bdcr
	 YO/LIcZwu0fKOyRzZ04oJ0Tvn67D3c6BHM6dEhyt3oCax2XSP+NsHrEYPGMItKBDJE
	 0d7u8x+m2AkT3p/N6DPk3qN87cLaSw2ZRfA3d+DD+ZUtmT0ciZxiQzzZb2MOA59/56
	 mgAfKsQwkYhAx1T76/jP1G+89T0tanEDDIC6j8PJbUzNlyAN3LpYZOqTeja007OfDi
	 OX8Gh0wbosK3w==
Received: from apertis-1.home (2a01cb0892F2D600C8f85cF092D4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6CFEE17E080B;
	Fri,  4 Apr 2025 15:53:12 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 04 Apr 2025 15:53:10 +0200
Subject: [PATCH 2/2] arm64: dts: mediatek: mt8395-genio-1200-evk: Add scp
 firmware-name
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-mt8395-scp-fw-v1-2-bb8f20cd399d@collabora.com>
References: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
In-Reply-To: <20250404-mt8395-scp-fw-v1-0-bb8f20cd399d@collabora.com>
To: kernel@collabora.com, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ben Lok <ben.lok@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_065314_855608_9BAE22E5 
X-CRM114-Status: UNSURE (   9.34  )
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

Set the scp firmware name to the default location.

Fixes: f2b543a191b6 ("arm64: dts: mediatek: add device-tree for Genio 1200 EVK board")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index f02c32def593a54531221ec57473a335af08a92f..2740c799ca12d7e05694f706df34335fa164aeb8 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -872,6 +872,7 @@ &pmic {
 
 &scp {
 	memory-region = <&scp_mem>;
+	firmware-name = "mediatek/mt8195/scp.img";
 	status = "okay";
 };
 

-- 
2.49.0


