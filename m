Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52429C04FFE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Apr 2024 10:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ysDYALdPlitNAh4jAqVaMKhwoZEUpnFw/l18q9KZZ+s=; b=oEGfuIz0E7a5e8vQhG3y7rX7lU
	PNJrnxh+Imrb2ztsA/xPk9fuBhy9Zc9SZCayzLpOXRPRh4lkN82qZoKK1ICh5fcD+lBcC05Ml74vt
	6dwyRjdegFHoZXRspdYNw3KePy1AhrH3BpZw9jUArT/PdWVwIVtYksC3XWi/eBYj+2EAuEL2y31Lt
	2oarAUg3SKTLXO8ch4Z8lLgdgyhptpb6DjmMXymIwf7Fgu61x+1RzlNhGp07amulu8YbnkUZW74rL
	gONe6bQSxxtHGmq+WUarE51/56Mon+2QEuQeKLyV3iVufiLUddch0xEu6LAYOGGT/ehSAvmaRD6sI
	5tH9mqXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Irf-0000000C9bJ-422x;
	Fri, 26 Apr 2024 10:31:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0IrU-0000000C9WG-1Ja6;
	Fri, 26 Apr 2024 10:31:25 +0000
X-UUID: 1ef66dee03b811efa8f1cd58ee6c2400-20240426
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ysDYALdPlitNAh4jAqVaMKhwoZEUpnFw/l18q9KZZ+s=;
	b=fEhizmxhZ0h8/G45ea6Z7VF5DawzAmCUTcuqa78IDsWJoCPiCYjw3Udd7Qj6RCdPBCq/Hv/A8JhHw4iiHXkB7j8p30rAuga40NkYO90oaXl+8I2s9eyJS/7lJ9HaKoEf+M313l8EfglpbNejCmYd0022vRh9T8A2rGQC50vBAJA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.38,REQID:79cf6cb5-ddcf-4a34-821a-c1ee93b36667,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:82c5f88,CLOUDID:cb01a786-8d4f-477b-89d2-1e3bdbef96d1,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
	SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 1ef66dee03b811efa8f1cd58ee6c2400-20240426
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <zoie.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 999093229; Fri, 26 Apr 2024 03:31:20 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Fri, 26 Apr 2024 18:30:43 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Fri, 26 Apr 2024 18:30:43 +0800
From: zoie.lin <zoie.lin@mediatek.com>
To: Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
	<broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-i2c@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>, Zoie Lin
	<zoie.lin@mediatek.com>
Subject: [PATCH 2/3] dt-bindings: eeprom: at24: Add support for at24c64
Date: Fri, 26 Apr 2024 18:29:48 +0800
Message-ID: <20240426102949.23057-3-zoie.lin@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20240426102949.23057-1-zoie.lin@mediatek.com>
References: <20240426102949.23057-1-zoie.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_033124_417490_93EFF456 
X-CRM114-Status: UNSURE (   9.85  )
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

From: Zoie Lin <zoie.lin@mediatek.com>

Update EEPROM bindings to include Atmel AT24C64

Signed-off-by: Zoie Lin <zoie.lin@mediatek.com>
---
 Documentation/devicetree/bindings/eeprom/at24.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/eeprom/at24.yaml b/Documentation/devicetree/bindings/eeprom/at24.yaml
index 1812ef31d5f1..8befd09963be 100644
--- a/Documentation/devicetree/bindings/eeprom/at24.yaml
+++ b/Documentation/devicetree/bindings/eeprom/at24.yaml
@@ -131,6 +131,8 @@ properties:
       - items:
           - const: giantec,gt24c32a
           - const: atmel,24c32
+      - items:
+          - const: atmel,24c64
       - items:
           - enum:
               - renesas,r1ex24128
-- 
2.18.0


