Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CDCBC54EBE
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Jan 2023 10:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WVRQn0/z4/Txw4tds1T9p+ZOw4h5tZ0f/iFMTnbJITI=; b=PiMUTM4rjaANozRgfcVrzu0jli
	cr9mfQtN3MQF2X1lyDut71AMdeoYuNCYigv1jPU8jkDJ8DbTw1vF+60g+lBByMP3FwpTCUg8TiQs6
	RMLKQceKnF4V0g534G427RO3gk3vX6dLc6u/167epF5C3pQfv30dr3K/FaTOeIFSGamq6F94d7ItV
	KV6OBFqSsYuSNQbAZY7YD/Kc6PpK1XSp43HNlMh78B/R5ll/UnIxusP2oX70PAkYwobBt+J9ArWOG
	ZilQOw4oNfYt5pIY1vdzvDeMjCkYe9J+x39zm8IUHPU778VlKD8YPhNScwSt32g8JpfmikttwUeaz
	GfQZgEzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHN7W-009mtG-55; Mon, 16 Jan 2023 10:53:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHN7U-009ms5-LQ; Mon, 16 Jan 2023 10:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WVRQn0/z4/Txw4tds1T9p+ZOw4h5tZ0f/iFMTnbJITI=; b=QsrKGgwcLjHNdt4t76Fbu/5LaD
	MWTNm2rwvkvwwC6C8OXfwL00Ww22CMljMf2O1Wt1VuoWJ3xqUgkH4Obf4FF+ja0iDIOlYrbqNtzP0
	jUfx50wS4sUBeBHAn8ui51Vq/3kliUsuC3Y1RDD2yxJd1Qim2Z72Mf77vw0f7WHuWq/2eMQaH4lO1
	2rpxL5MVcbOMhZFD7T+LPcMMHmm7qs+jxOKhxOJQkVMn8OUS/4JUANq/GqJVmzDJbOgvWAS8RMGA+
	/syN3GzLLRueNcqN4/la2O3jisO0lLExJj209AoCdYt+8GmRXo3WGZ8CptkBt33IseFbsF6miB9nX
	ni4t4qUg==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pHN7D-005Z6g-2o;
	Mon, 16 Jan 2023 10:53:28 +0000
X-UUID: f79a93d8958b11eda08d4d6090ec5a5c-20230116
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WVRQn0/z4/Txw4tds1T9p+ZOw4h5tZ0f/iFMTnbJITI=;
	b=Pj6hEWsfv9oRV4U2rOZYD6l4jaT5dTzEwB26ZnKI+aGzKPbg3ROGkhgk5NgRyCr2TgNlDsOfADYL/he+suWi+RjuZY2QHJ007jjMKjRL9NE9S0PC8Sa5zPF1I86VUFe3VuvyQzIj3KenYyiqCmqVP4/RU+4p/wlmYKPgKSeJW0w=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:3b08681d-582a-45bd-8fa5-77492fe5aef4,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:3ca2d6b,CLOUDID:a2a2c854-dd49-462e-a4be-2143a3ddc739,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0,NGT
X-UUID: f79a93d8958b11eda08d4d6090ec5a5c-20230116
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <allen-kh.cheng@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1654972427; Mon, 16 Jan 2023 03:53:10 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 16 Jan 2023 18:53:07 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Mon, 16 Jan 2023 18:53:07 +0800
From: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
	<linux-watchdog@vger.kernel.org>
CC: <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	<devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-mediatek@lists.infradead.org>,
	Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: watchdog: mtk-wdt: Add reset-by-toprgu support
Date: Mon, 16 Jan 2023 18:53:04 +0800
Message-ID: <20230116105305.31818-2-allen-kh.cheng@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20230116105305.31818-1-allen-kh.cheng@mediatek.com>
References: <20230116105305.31818-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_105325_290215_4CB267BD 
X-CRM114-Status: GOOD (  10.14  )
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

In some applications, the mtk-wdt requires the toprgu (TOP Reset
Generation Unit) to reset timer after system resets. Add optional
mediatek,reset-by-toprgu property to enable it.

Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
---
 .../devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
index b3605608410c..b4de6b134ce1 100644
--- a/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
+++ b/Documentation/devicetree/bindings/watchdog/mediatek,mtk-wdt.yaml
@@ -52,6 +52,12 @@ properties:
     description: Disable sending output reset signal
     type: boolean
 
+  mediatek,reset-by-toprgu:
+    description: The top reset generate unit (toprgu) generates reset signals
+      and distributes them to each system. If present, means the watchdog
+      timer will reset by toprgu once system resets.
+    type: boolean
+
   '#reset-cells':
     const: 1
 
-- 
2.18.0


