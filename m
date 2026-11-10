Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B429C606C65A
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Zw7aSwFt;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=NjfN8Q3o
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8n98LZOnT/eVXjJpv+jjYxJns6Yez0iBLvcPCYBn6qY=; b=Zw7aSwFtRyKPTae43mVPC17AHA
	ImpfYVj6DYsukqrNeClPGPWMoLqo11OgJl+s/q22wqtjy7HnYj0MEUdAKakEooF6rXBjnGeZWezh7
	EjSZv0KwKm15iFdQKO9DurGcIg4q9RXq2guEGR9DcpyBWYlcC+LBmJv+NO6r2cYKhUTQOUVbJSoLW
	Til0EKuE/47o3pLbhHqo3sAiB2sePdG3XLSVl7kZ8C86tPU/R/QxDk0gFeP5kSVa0hYr8ezOrmt8o
	wt/M8p1gunBG+8iIF2pyKumFju1ttkNREFjwlamzk1zwXQ1fC6ZhB9IUtArAgpzJ6g6U73ZofOdDQ
	ncqTxjYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOV-00000003JyD-1VnQ;
	Tue, 10 Nov 2026 09:43:59 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOR-00000003Jt4-0pxw
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 09:43:56 +0000
X-UUID: 3c85e36cdceb11f1acbe4559397dec65-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8n98LZOnT/eVXjJpv+jjYxJns6Yez0iBLvcPCYBn6qY=;
	b=NjfN8Q3o9G7KCVvXRzgbqCenkjrAXsI9Valbmn3Pn66ybpGCOjOvPG55BWbJlWgAZgIzfYA0uPzQ6sos1JPa+EL/+wfsWPjJqyTjvXpM06P2uBUa/oWJL/gvbgRUqEkxFRFBg54Hi5iwtkCBVDZMrddmLs1iUZHwlM5VVe6hjn4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:26854805-abeb-447e-a151-b66347209efc,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:0e7d1357-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3c85e36cdceb11f1acbe4559397dec65-20261110
Received: from mtkmbs14n2.mediatek.inc [(172.21.101.76)] by mailgw02.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 164074288; Tue, 10 Nov 2026 02:43:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 17:43:49 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Tue, 10 Nov 2026 17:43:49 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: <linusw@kernel.org>, <lorenzo@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<brgl@kernel.org>, <mikhail.kshevetskiy@iopsys.eu>, <naseefkm@gmail.com>,
	<benjamin.larsson@genexis.eu>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <lei.dong@airoha.com>,
	<ansuelsmth@gmail.com>, Zhengping Zhang <zhengping.zhang@airoha.com>
Subject: [PATCH 03/12] dt-bindings: pinctrl: airoha: describe all EN7581 GPIO mux groups
Date: Tue, 10 Nov 2026 17:43:30 +0800
Message-ID: <20261110094339.749110-4-zhengping.zhang@airoha.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110094339.749110-1-zhengping.zhang@airoha.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_014355_249995_8DBFD4BC 
X-CRM114-Status: UNSURE (   8.34  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Expand the GPIO mux groups from GPIO47-49 to GPIO0-49 to describe
explicit GPIO mode selection across the controller's GPIO range.
Allow multiple GPIO groups in a single mux state.

Correct the PHY LED pin groups to match the EN7581 pad assignments:
LED0 uses GPIO43-46, while LED1 uses GPIO33-35 and GPIO42.

The corresponding driver support is added in subsequent patches.

Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 .../pinctrl/airoha,en7581-pinctrl.yaml        | 28 +++++++++++++------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
index 0cf1826c691fc..fa7b3dc58a3ea 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,en7581-pinctrl.yaml
@@ -194,7 +194,17 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio47, gpio48, gpio49]
+                  items:
+                    enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                           gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                           gpio14, gpio15, gpio16, gpio17, gpio18, gpio19, gpio20,
+                           gpio21, gpio22, gpio23, gpio24, gpio25, gpio26, gpio27,
+                           gpio28, gpio29, gpio30, gpio31, gpio32, gpio33, gpio34,
+                           gpio35, gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
+                           gpio42, gpio43, gpio44, gpio45, gpio46, gpio47, gpio48,
+                           gpio49]
+                  minItems: 1
+                  maxItems: 50
           - if:
               properties:
                 function:
@@ -225,7 +235,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
+                  enum: [gpio43, gpio44, gpio45, gpio46]
           - if:
               properties:
                 function:
@@ -233,7 +243,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
+                  enum: [gpio43, gpio44, gpio45, gpio46]
           - if:
               properties:
                 function:
@@ -241,7 +251,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
+                  enum: [gpio43, gpio44, gpio45, gpio46]
           - if:
               properties:
                 function:
@@ -249,7 +259,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio33, gpio34, gpio35, gpio42]
+                  enum: [gpio43, gpio44, gpio45, gpio46]
           - if:
               properties:
                 function:
@@ -257,7 +267,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
+                  enum: [gpio33, gpio34, gpio35, gpio42]
           - if:
               properties:
                 function:
@@ -265,7 +275,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
+                  enum: [gpio33, gpio34, gpio35, gpio42]
           - if:
               properties:
                 function:
@@ -273,7 +283,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
+                  enum: [gpio33, gpio34, gpio35, gpio42]
           - if:
               properties:
                 function:
@@ -281,7 +291,7 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio43, gpio44, gpio45, gpio46]
+                  enum: [gpio33, gpio34, gpio35, gpio42]
 
         additionalProperties: false
 
-- 
2.43.0


