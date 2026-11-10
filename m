Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D209F606F943
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 09:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sDGqlc2U;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=fW7UytSU
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=LV7wGzxaXG/Oe3tQF8GuKXXW5mTVHFKeI3Ufw+M4FAM=; b=sDGqlc2UCm8xhA4bNLlGfNLQcY
	6PchGHlkdoRRBHmOonVKrQsaR02oB+TVXLn1fQ+RMxmteixm/LSvtD6uoxWVjhdjiwWFfAgoGkK2d
	pbHaUaxsDRXH96S53z94bEvyBsu0KoBRwPPx2PAOam4+ElAoX7vGC55NY/Px7w1kCOrzLt/tIxstl
	W420wI3PFC7LU5cz74798trGgph23Cvyt4gju+8I3sxRYW4sHJid25B2xoH2+e3rjaLtjxxQrJdOG
	y37sC6/RLALea4nDMfY1rOL/6KRnxT18ocz1L7g/DyqW1EJVkURd3KqVkwZ2h2pEjGOvZ2Qdy0yz9
	L9qVn11Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOV-00000003Jyq-24oF;
	Tue, 10 Nov 2026 09:43:59 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOS-00000003Ju6-1L8T
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 09:43:57 +0000
X-UUID: 3cf38ce6dceb11f1afed4741b24580c9-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=LV7wGzxaXG/Oe3tQF8GuKXXW5mTVHFKeI3Ufw+M4FAM=;
	b=fW7UytSUHU+ZUh9ga796m0WcbwjuB+2KqfvtZTzz7F3wU5igDUCK5sePqJ+c4Xn4OcK9yDnqDYfmg4+OkSiQgANx1Z/bhIAQFFmnV8G5Mjo8SrxTlS9RvI/QjgLYTX9/R63saObqWjpzTri3qRS/7YQSv/NEWsmDCJ56k4W1834=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:e50f1ef3-ba0a-4aa3-a025-51449d8c2d3b,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:b0318ac,CLOUDID:71e61766-4b51-4c95-bb1b-80ac6aad9c96,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3cf38ce6dceb11f1afed4741b24580c9-20261110
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 751474058; Tue, 10 Nov 2026 02:43:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 17:43:50 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Tue, 10 Nov 2026 17:43:50 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: <linusw@kernel.org>, <lorenzo@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<brgl@kernel.org>, <mikhail.kshevetskiy@iopsys.eu>, <naseefkm@gmail.com>,
	<benjamin.larsson@genexis.eu>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <lei.dong@airoha.com>,
	<ansuelsmth@gmail.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
	Zhengping Zhang <zhengping.zhang@airoha.com>
Subject: [PATCH 07/12] pinctrl: airoha: an7583: fix SPI pin mux config
Date: Tue, 10 Nov 2026 17:43:34 +0800
Message-ID: <20261110094339.749110-8-zhengping.zhang@airoha.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110094339.749110-1-zhengping.zhang@airoha.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_014356_390541_EDDF661E 
X-CRM114-Status: GOOD (  12.83  )
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

From: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>

The SPI function does not advertise the base "spi" group or provide its
mux configuration, so a DTS state using function = "spi" and
groups = "spi" cannot be selected successfully.

On AN7583, pinctrl pins 45-48 correspond to GPIO43-46 and are shared
with the first SPI bus. Bits 19-22 of REG_GPIO_PON_MODE select GPIO
operation when set. If the bootloader leaves these bits enabled,
selecting SPI must clear them to release the GPIO overrides.

Add the "spi" group to the SPI function and clear its GPIO mode bits
when selecting it.

Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 1cd0f442ddc1d..986f10c9f1786 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -43,6 +43,7 @@
 #define MDC_0_GPIO_MODE_MASK			BIT(25)
 #define UART_RXD_GPIO_MODE_MASK			BIT(24)
 #define UART_TXD_GPIO_MODE_MASK			BIT(23)
+#define SPI_GPIO_MODE_MASK			GENMASK(22, 19)
 #define SPI_MISO_GPIO_MODE_MASK			BIT(22)
 #define SPI_MOSI_GPIO_MODE_MASK			BIT(21)
 #define SPI_CS_GPIO_MODE_MASK			BIT(20)
@@ -584,7 +585,7 @@ static const char *const uart_groups[] = {
 static const char *const i2c_groups[] = { "i2c0", "i2c1" };
 static const char *const jtag_groups[] = { "jtag_udi", "jtag_dfd" };
 static const char *const pcm_groups[] = { "pcm1", "pcm2" };
-static const char *const spi_groups[] = { "spi_quad", "spi_cs1" };
+static const char *const spi_groups[] = { "spi", "spi_quad", "spi_cs1" };
 static const char *const pcm_spi_groups[] = {
 	"pcm_spi", "pcm_spi_rst", "pcm_spi_cs1"
 };
@@ -861,6 +862,15 @@ static const struct airoha_pinctrl_func_group pcm_func_group[] = {
 
 static const struct airoha_pinctrl_func_group spi_func_group[] = {
 	{
+		.name = "spi",
+		.regmap[0] = {
+			AIROHA_FUNC_MUX,
+			REG_GPIO_PON_MODE,
+			SPI_GPIO_MODE_MASK,
+			0
+		},
+		.regmap_size = 1,
+	}, {
 		.name = "spi_quad",
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
-- 
2.43.0


