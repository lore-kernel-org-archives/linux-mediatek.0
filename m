Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980AAC32773
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Aug 2022 12:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g/YPOMlZjMsEaO2WgP8P2ictRGCTTr097gbQCAoAdL0=; b=T9QApbf9RUVhTtGvwYlbMluCmd
	MUraDg2xFbhiflnDpVjc3COlFUwrxI0Cmuh7qU9iF4d6sfU8v5bcqGWkKo0JVWzxdH0cSl3BXc5+2
	9kcwCKT2fH9JQ3mnPkpxcS5VfP6y00haNd1XsLh/3YmL1anPAiR66ETYVZWL9H1hlRWJNaOyu03k7
	Oo5tzPGG+5Yrg/oTyAs4s28EF5rB3GKNhQ2EBEV58uVmXGFiSE72rZbUhjwGCLf1FO1G/hi56vIyE
	Uk43moMvxWWqNovSzVHEkF+F2a7u62EqsE2JqRGz4KTG2r08fQBJtBmFCbjrYRqQw4N1wxwzZhmSX
	HDzVbzZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1PX-008EB3-0t; Fri, 19 Aug 2022 12:47:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oP1PS-008E2t-Na; Fri, 19 Aug 2022 12:47:37 +0000
X-UUID: 462d5e8592dc4b45bc10993253b2af3c-20220819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=g/YPOMlZjMsEaO2WgP8P2ictRGCTTr097gbQCAoAdL0=;
	b=eqz286WlDwrBi5Va/N4fvbTOki8cK9cI0LmYNnDzFWCsjXmeTlOCqu/2Jhpv+NPutiJY0p2uWvvOT7i/eMstPdBc5XClUzx5QospF2u+Q5GA7GDkXqvSAqM/dEt3mcht86PcrlRQR0nOOLeDolrM8B495gkLY4dj1oohGoUmKJ8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10,REQID:ef114c04-411b-4c89-ad63-8f9baad9f3c1,OB:0,L
	OB:0,IP:0,URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Releas
	e_Ham,ACTION:release,TS:-25
X-CID-META: VersionHash:84eae18,CLOUDID:f06eba67-a9d9-4672-a3c8-12721739a220,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 462d5e8592dc4b45bc10993253b2af3c-20220819
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 80369850; Fri, 19 Aug 2022 05:47:24 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 19 Aug 2022 20:06:50 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Fri, 19 Aug 2022 20:06:50 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>, Guodong Liu
	<guodong.liu@mediatek.com>
Subject: [PATCH v3] dt-bindings: pinctrl: mt8186: Fix 'reg-names' for pinctrl nodes
Date: Fri, 19 Aug 2022 20:06:49 +0800
Message-ID: <20220819120649.21523-1-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220819_054735_751313_B6E237CA 
X-CRM114-Status: UNSURE (   9.17  )
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

The mt8186 contains 8 GPIO physical address bases that correspond to
the 'reg-names' of the pinctrl driver. The 'reg-names' entries in
bindings are ordered incorrectly, though. The system crashes due of an
erroneous address when the regulator initializes.

We fix the 'reg-names' for the pinctrl nodes and the pinctrl-mt8186
example in bindings.

Fixes: 338e953f1bd1 ("dt-bindings: pinctrl: mt8186: add pinctrl file and binding document")
Co-developed-by: Guodong Liu <guodong.liu@mediatek.com>
Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
Change in v2:
  * Remove changes of the formatting of addresses and add C-d-b tag for
    Guodong
Change in v1:
  * Capitalize First Letter of Sentences and rephrase the commit message
    [Allen-KH Cheng <allen-kh.cheng@mediatek.com>]
---
---
 .../bindings/pinctrl/pinctrl-mt8186.yaml           | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
index 1eeb885ce0c6..26573a793b57 100644
--- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
@@ -41,12 +41,12 @@ properties:
       Gpio base register names.
     items:
       - const: iocfg0
-      - const: iocfg_bm
-      - const: iocfg_bl
-      - const: iocfg_br
+      - const: iocfg_lt
       - const: iocfg_lm
+      - const: iocfg_lb
+      - const: iocfg_bl
       - const: iocfg_rb
-      - const: iocfg_tl
+      - const: iocfg_rt
       - const: eint
 
   interrupt-controller: true
@@ -235,9 +235,9 @@ examples:
             <0x10002A00 0x0200>,
             <0x10002c00 0x0200>,
             <0x1000b000 0x1000>;
-      reg-names = "iocfg0", "iocfg_bm", "iocfg_bl",
-                  "iocfg_br", "iocfg_lm", "iocfg_rb",
-                  "iocfg_tl", "eint";
+      reg-names = "iocfg0", "iocfg_lt", "iocfg_lm",
+                  "iocfg_lb", "iocfg_bl", "iocfg_rb",
+                  "iocfg_rt", "eint";
       gpio-controller;
       #gpio-cells = <2>;
       gpio-ranges = <&pio 0 0 185>;
-- 
2.18.0


