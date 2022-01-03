Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26E79C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jan 2022 04:33:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uIjO+/Upl3rFor6wpMI356OO+7w83NIDpKZxHTQ+FNk=; b=iNNKBYk1Xe7FzK
	lu3pxinALrJq50CCheyPVj7yP0q68sqtK3YMiQaUVstQHmYDa5sJruARGTKDWlwsuPwSeacjBpWO9
	Z231VoaKA6PCb0KiKCOS1VKVrHWXGajFp6Oms5ojW6LoJGb5UTARXAt0+tiyQSnRtx6idBfZTXa9+
	J7a0xN5QPOuifHevE9nte6ySmHmmlShXWpm66zz4caTolyIym4JWRSF6qlu+1O8b0vjrDpwACSWg8
	9J2FfDB5QFX7DYVZ2Ppp+6aRc4DIE+N5eS1cJnHahEKIpBYX/PN4/i+7UVg7eo5pQ0FA2wQMZniAL
	m986xbNzkHS/7rZG50tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4F1l-008Mmz-19; Mon, 03 Jan 2022 04:32:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4F1Y-008MmK-1Z; Mon, 03 Jan 2022 04:32:46 +0000
X-UUID: d7bc64c9db2441808309ab3c6ee9aed9-20220102
X-UUID: d7bc64c9db2441808309ab3c6ee9aed9-20220102
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <yc.hung@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1507288216; Sun, 02 Jan 2022 21:32:38 -0700
Received: from mtkexhb01.mediatek.inc (172.21.101.102) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 2 Jan 2022 20:32:37 -0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb01.mediatek.inc
 (172.21.101.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 3 Jan 2022 12:32:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 3 Jan 2022 12:32:29 +0800
From: YC Hung <yc.hung@mediatek.com>
To: <broonie@kernel.org>, <tiwai@suse.com>, <robh+dt@kernel.org>,
 <matthias.bgg@gmail.com>
CC: <yc.hung@mediatek.com>, <alsa-devel@alsa-project.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <daniel.baluta@nxp.com>, <trevor.wu@mediatek.com>,
 <allen-kh.cheng@mediatek.com>, <cezary.rojewski@intel.com>
Subject: [PATCH v3] dt-bindings: dsp: mediatek: add mt8195 dsp document
Date: Mon, 3 Jan 2022 12:32:03 +0800
Message-ID: <20220103043202.6524-1-yc.hung@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220102_203244_121685_BD4B1102 
X-CRM114-Status: UNSURE (   7.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "YC Hung" <yc.hung@mediatek.com>

This patch adds mt8195 dsp document. The dsp is used for Sound Open
Firmware driver node. It includes registers,  clocks, memory regions,
and mailbox for dsp.

Signed-off-by: yc.hung <yc.hung@mediatek.com>
---
Changes since v2:
  Remove useless watchdog interrupt.
  Add commit message more detail description.

Changes since v1:
  Rename yaml file name as mediatek,mt8195-dsp.yaml
  Refine descriptions for mailbox, memory-region and drop unused labels
  in examples.
---
---
 .../devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
index bde763191d86..779daa786739 100644
--- a/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
+++ b/Documentation/devicetree/bindings/dsp/mediatek,mt8195-dsp.yaml
@@ -27,14 +27,6 @@ properties:
       - const: cfg
       - const: sram
 
-  interrupts:
-    items:
-      - description: watchdog interrupt
-
-  interrupt-names:
-    items:
-      - const: wdt
-
   clocks:
     items:
       - description: mux for audio dsp clock
@@ -75,8 +67,6 @@ required:
   - compatible
   - reg
   - reg-names
-  - interrupts
-  - interrupt-names
   - clocks
   - clock-names
   - memory-region
@@ -95,8 +85,6 @@ examples:
        reg = <0x10803000  0x1000>,
              <0x10840000  0x40000>;
        reg-names = "cfg", "sram";
-       interrupts = <GIC_SPI 694 IRQ_TYPE_LEVEL_HIGH 0>;
-       interrupt-names = "wdt";
        clocks = <&topckgen 10>, //CLK_TOP_ADSP
                 <&clk26m>,
                 <&topckgen 107>, //CLK_TOP_AUDIO_LOCAL_BUS
-- 
2.18.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
