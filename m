Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3726071E41
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=2Cb5CEs6;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=queeEvOY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WpZjllCHcDQphGMq4daj/RT9B9Xyv5S6DoQe0TrOBD8=; b=2Cb5CEs6FJE/Pm+J5j+QBX+MTW
	q55CIUDoPaxGopgtc/ViXyZa/b6zq1Fb3HCG/oo3bfLnlH8dE7W5coM3HRNcWETTiDUWZAGa8LcCs
	3otxi/hxTAh4CALO9Zmb/TNemNFO4aoWBvOrBE9K6KC1HK9DOXwl64rz7HEz4mZbBl/YSf3iJ86SU
	2wex844Kz+nyl1Gepw/90IxY63mu7x/jvl1g5hVm5u87mrivZENWx3qMjKQyl2MmEPFnGShFqD9y9
	wqp7Z9A0hA+/zkyIV/VrpLATZUcaanA9W9ltIQ/ig7NUO5q5tE29vERw5QdyMuO+N3vfQqdHaY3tS
	zQPrCiOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOV-00000003JzH-2cCd;
	Tue, 10 Nov 2026 09:43:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOS-00000003Jt5-2mFk
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 09:43:57 +0000
X-UUID: 3cce1010dceb11f1afed4741b24580c9-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=WpZjllCHcDQphGMq4daj/RT9B9Xyv5S6DoQe0TrOBD8=;
	b=queeEvOY5W/b7mdkIRNM/excArk7kjOyhxCA0THVHFlvhcsfB2t2r23pC9xGE8SzbutddYb0azFM953dJiQgLDrsw5phYO9lgRL7361/+YA+UEx8UP3WtKrpuzFw8AKdIEWhLZC64eCsuxAUUN3PA+uMDHFq/v+vpjWAU4Ajdzg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:9458f98b-c618-4638-a5eb-13d16c8ea904,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:534392eb-7d0c-4db4-a7e5-d44f18b7500b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3cce1010dceb11f1afed4741b24580c9-20261110
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 294227599; Tue, 10 Nov 2026 02:43:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
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
Subject: [PATCH 06/12] dt-bindings: pinctrl: airoha: describe all AN7583 GPIO mux groups
Date: Tue, 10 Nov 2026 17:43:33 +0800
Message-ID: <20261110094339.749110-7-zhengping.zhang@airoha.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110094339.749110-1-zhengping.zhang@airoha.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_014356_713043_F7A1CBC1 
X-CRM114-Status: UNSURE (   8.32  )
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

Expand the GPIO mux groups from GPIO39-52 to GPIO0-52 to describe
explicit GPIO mode selection across the controller's GPIO range.
Allow multiple GPIO groups in a single mux state.

Add spi to the supported SPI groups alongside spi_quad and spi_cs1,
and increase maxItems to allow all three groups in a single mux
state.

The corresponding driver support is added in subsequent patches.

Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 .../pinctrl/airoha,an7583-pinctrl.yaml         | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
index aad2e9880ec6c..1a24c01eb4102 100644
--- a/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/airoha,an7583-pinctrl.yaml
@@ -157,8 +157,8 @@ patternProperties:
               properties:
                 groups:
                   items:
-                    enum: [spi_quad, spi_cs1]
-                  maxItems: 2
+                    enum: [spi, spi_quad, spi_cs1]
+                  maxItems: 3
           - if:
               properties:
                 function:
@@ -192,9 +192,17 @@ patternProperties:
             then:
               properties:
                 groups:
-                  enum: [gpio39, gpio40, gpio41, gpio42, gpio43, gpio44,
-                         gpio45, gpio46, gpio47, gpio48, gpio49, gpio50,
-                         gpio51, gpio52]
+                  items:
+                    enum: [gpio0, gpio1, gpio2, gpio3, gpio4, gpio5, gpio6,
+                           gpio7, gpio8, gpio9, gpio10, gpio11, gpio12, gpio13,
+                           gpio14, gpio15, gpio16, gpio17, gpio18, gpio19, gpio20,
+                           gpio21, gpio22, gpio23, gpio24, gpio25, gpio26, gpio27,
+                           gpio28, gpio29, gpio30, gpio31, gpio32, gpio33, gpio34,
+                           gpio35, gpio36, gpio37, gpio38, gpio39, gpio40, gpio41,
+                           gpio42, gpio43, gpio44, gpio45, gpio46, gpio47, gpio48,
+                           gpio49, gpio50, gpio51, gpio52]
+                  minItems: 1
+                  maxItems: 53
           - if:
               properties:
                 function:
-- 
2.43.0


