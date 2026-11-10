Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE82606C657
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=q+AHUviM;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=Pmpul+xO
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=8CFw8pG2i0/lPMAAzFWDQ4v+K0ug8N4/BQf9jB1xhyg=; b=q+AHUviM7LHb0LPuAvRR3xLk5a
	msFLPAc/g+XleCNLilVUAXl6okZXZhDFc+F09Akp+TWyG1b7bouXcak+eBtw5m2F46rS+nOLIUyWe
	ofhS4S3xXZb0nkcYErGJevrkjVri44ADaIOe1DANEXx/CJ/HMdS7oxDIlD7vgYI2ghq543uzRxyXU
	IkH9oJG48bTBKhuXBJg+Xd5nbrVV/Gg2Buwa6tKQ11nACGEe1Xw4PDHdZL/wr7Ks8GUewslKE5+mh
	sDvuUSMcGZMhsV3hoBbo54Lf0KP0yMXe3g5PaKFvO7QXVElDMjuBLxm90biqEc5Ld4ao5F+tpc0pY
	y8pY4Lcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOV-00000003JyO-1imj;
	Tue, 10 Nov 2026 09:43:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOR-00000003Jt5-1Fxj
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 09:43:56 +0000
X-UUID: 3c9e2eeadceb11f1afed4741b24580c9-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=8CFw8pG2i0/lPMAAzFWDQ4v+K0ug8N4/BQf9jB1xhyg=;
	b=Pmpul+xOEOjFXBdVy/DfDMALn88oz/etzWwx2zZY3ELyX1F5qSOSCjoBDyzye7AiTqLkn/3DosCTIIaK69zv/O8Ow7Tg1dUCnBKxsxdkSeTGQtOSIMAP5uUcFiPsEjL7XpCVALaKJ/GZql71qGt0vN5v7+tYl6WIu78TKAcv+YA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:16f17df7-0710-41f2-b749-37ffb2614e15,IP:0,U
	RL:0,TC:0,Content:50,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:50
X-CID-META: VersionHash:b0318ac,CLOUDID:1a7d1357-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:4|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3c9e2eeadceb11f1afed4741b24580c9-20261110
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1316589041; Tue, 10 Nov 2026 02:43:51 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
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
Subject: [PATCH 04/12] pinctrl: airoha: an7581: fix PHY LED GPIO group assignments
Date: Tue, 10 Nov 2026 17:43:31 +0800
Message-ID: <20261110094339.749110-5-zhengping.zhang@airoha.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110094339.749110-1-zhengping.zhang@airoha.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_014355_403248_EED047EA 
X-CRM114-Status: GOOD (  10.06  )
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
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,UPPERCASE_50_75,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PHY LED function tables associate LED0 mux bits with the GPIO pads
used by LED1, and vice versa. Selecting an LED function therefore
programs the mux bit for a different pad from the requested group.

The LED mux bits in SCU register 0x214 correspond to these GPIO pads:

                  LAN0    LAN1    LAN2    LAN3
  LED0 mux bit       3       5       7       9
  LED0 GPIO         43      44      45      46
  LED1 mux bit       4       6       8      10
  LED1 GPIO         33      34      35      42

Correct both the advertised groups and the function-group entries to
match these assignments. This ensures that the pin claimed by pinctrl
matches the pad controlled by the selected LED mux bit.

Keep the existing mux masks and PHY source selections in the LED0/1
mapping registers unchanged.

Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 drivers/pinctrl/airoha/pinctrl-an7581.c | 80 ++++++++++++-------------
 1 file changed, 40 insertions(+), 40 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7581.c b/drivers/pinctrl/airoha/pinctrl-an7581.c
index bfb777594811b..3cbdfc31e97e5 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7581.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7581.c
@@ -594,28 +594,28 @@ static const char *const pwm_groups[] = {
 	"gpio46", "gpio47", "gpio48", "gpio49"
 };
 static const char *const phy1_led0_groups[] = {
-	"gpio33", "gpio34", "gpio35", "gpio42"
+	"gpio43", "gpio44", "gpio45", "gpio46"
 };
 static const char *const phy2_led0_groups[] = {
-	"gpio33", "gpio34", "gpio35", "gpio42"
+	"gpio43", "gpio44", "gpio45", "gpio46"
 };
 static const char *const phy3_led0_groups[] = {
-	"gpio33", "gpio34", "gpio35", "gpio42"
+	"gpio43", "gpio44", "gpio45", "gpio46"
 };
 static const char *const phy4_led0_groups[] = {
-	"gpio33", "gpio34", "gpio35", "gpio42"
+	"gpio43", "gpio44", "gpio45", "gpio46"
 };
 static const char *const phy1_led1_groups[] = {
-	"gpio43", "gpio44", "gpio45", "gpio46"
+	"gpio33", "gpio34", "gpio35", "gpio42"
 };
 static const char *const phy2_led1_groups[] = {
-	"gpio43", "gpio44", "gpio45", "gpio46"
+	"gpio33", "gpio34", "gpio35", "gpio42"
 };
 static const char *const phy3_led1_groups[] = {
-	"gpio43", "gpio44", "gpio45", "gpio46"
+	"gpio33", "gpio34", "gpio35", "gpio42"
 };
 static const char *const phy4_led1_groups[] = {
-	"gpio43", "gpio44", "gpio45", "gpio46"
+	"gpio33", "gpio34", "gpio35", "gpio42"
 };
 
 static const struct airoha_pinctrl_func_group pon_func_group[] = {
@@ -1067,90 +1067,90 @@ static const struct airoha_pinctrl_func_group pwm_func_group[] = {
 };
 
 static const struct airoha_pinctrl_func_group phy1_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
 static const struct airoha_pinctrl_func_group phy2_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
 static const struct airoha_pinctrl_func_group phy3_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
 static const struct airoha_pinctrl_func_group phy4_led0_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED0("gpio33", GPIO_LAN0_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio43", GPIO_LAN0_LED0_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio34", GPIO_LAN1_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio44", GPIO_LAN1_LED0_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio35", GPIO_LAN2_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio45", GPIO_LAN2_LED0_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED0("gpio42", GPIO_LAN3_LED0_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED0("gpio46", GPIO_LAN3_LED0_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
 static const struct airoha_pinctrl_func_group phy1_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(0)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(0)),
 };
 
 static const struct airoha_pinctrl_func_group phy2_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(1)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(1)),
 };
 
 static const struct airoha_pinctrl_func_group phy3_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(2)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(2)),
 };
 
 static const struct airoha_pinctrl_func_group phy4_led1_func_group[] = {
-	AIROHA_PINCTRL_PHY_LED1("gpio43", GPIO_LAN0_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio33", GPIO_LAN0_LED1_MODE_MASK,
 				LAN0_LED_MAPPING_MASK, LAN0_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio44", GPIO_LAN1_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio34", GPIO_LAN1_LED1_MODE_MASK,
 				LAN1_LED_MAPPING_MASK, LAN1_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio45", GPIO_LAN2_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio35", GPIO_LAN2_LED1_MODE_MASK,
 				LAN2_LED_MAPPING_MASK, LAN2_PHY_LED_MAP(3)),
-	AIROHA_PINCTRL_PHY_LED1("gpio46", GPIO_LAN3_LED1_MODE_MASK,
+	AIROHA_PINCTRL_PHY_LED1("gpio42", GPIO_LAN3_LED1_MODE_MASK,
 				LAN3_LED_MAPPING_MASK, LAN3_PHY_LED_MAP(3)),
 };
 
-- 
2.43.0


