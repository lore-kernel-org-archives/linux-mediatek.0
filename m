Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A05606B9D5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 09:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qKkJNYUE;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=bEiX+hW7
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=16bS82YVyP5/PKFj/qTEOZNq2kDjfVEF4QQ8JRJyM6A=; b=qKkJNYUEgksAhOOzAc2u5FdRko
	f5vupE1GjAGtfAbE53ZPEkKhLLLlv0b+Fn9UfoMwldqLUnJh69WtAdPfLbjqgX5SvZHqhgLcWuHio
	DTegaHspm3VLIgDgosdFirT8kO9CChxJRou9Jki/CM+ykW0B7oFilanzW8ZSYMIM1q21gGjcg1oef
	xlxbIDnaS/0PTUnSPO3OhksGTxGRh9T7xQoQJY3ff7qY3li4BTsugCemk9qyCIaDzaBfVHzimUoGG
	KOyCcCl/zN0/TqZxmOlislfS3tH3EWMdt68PcdN0P5ZDHuH8e18kY++dL+jWlci31mOB4joc9jcDy
	jcQSnvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOS-00000003JuD-1Dzu;
	Tue, 10 Nov 2026 09:43:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOQ-00000003Jro-0wWC
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 09:43:55 +0000
X-UUID: 3d09d906dceb11f1acbe4559397dec65-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=16bS82YVyP5/PKFj/qTEOZNq2kDjfVEF4QQ8JRJyM6A=;
	b=bEiX+hW7RCpWaQpTeX3aq2bwVEx4fpiHrAq22dV+E2zHBVtmRPvm9VCTpcSjU9JDx3odEGC7t4EQ33L3fQkkX0WZU+6aZtn5+gaUayiTnt4TY21eAiuQvxmPFaVukk9mU/UxQQW0WcN5UlWiUF2U9tBB5NpzApR32/lorwarUtc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:de602cd5-a457-4787-a08a-b5309c8af23d,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:b0318ac,CLOUDID:0c7d1357-a87d-42b7-8ffd-9e23ca174329,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 3d09d906dceb11f1acbe4559397dec65-20261110
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1103692329; Tue, 10 Nov 2026 02:43:52 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
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
	<ansuelsmth@gmail.com>, Robert Marko <robert.marko@sartura.hr>, Zhengping
 Zhang <zhengping.zhang@airoha.com>
Subject: [PATCH 08/12] pinctrl: airoha: an7583: fix eMMC pin mux config
Date: Tue, 10 Nov 2026 17:43:35 +0800
Message-ID: <20261110094339.749110-9-zhengping.zhang@airoha.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110094339.749110-1-zhengping.zhang@airoha.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_014354_277158_A011137D 
X-CRM114-Status: GOOD (  10.73  )
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

From: Robert Marko <robert.marko@sartura.hr>

The AN7583 eMMC group includes three pads shared with the first SPI
bus: pinctrl pins 45-47, corresponding to GPIO43-45. Their GPIO
operation is selected by bits 19-21 of REG_GPIO_PON_MODE.

The eMMC mux configuration only enables GPIO_EMMC_MODE_MASK, leaving
these pads in GPIO mode if their overrides were enabled by the
bootloader.

Clear the GPIO mode bits for these three pads when selecting eMMC.
Preserve bit 22, which controls the SPI MISO/GPIO46 pad outside the
eMMC group.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 drivers/pinctrl/airoha/pinctrl-an7583.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-an7583.c b/drivers/pinctrl/airoha/pinctrl-an7583.c
index 986f10c9f1786..74628a03ca909 100644
--- a/drivers/pinctrl/airoha/pinctrl-an7583.c
+++ b/drivers/pinctrl/airoha/pinctrl-an7583.c
@@ -44,6 +44,7 @@
 #define UART_RXD_GPIO_MODE_MASK			BIT(24)
 #define UART_TXD_GPIO_MODE_MASK			BIT(23)
 #define SPI_GPIO_MODE_MASK			GENMASK(22, 19)
+#define EMMC_GPIO_MODE_MASK			GENMASK(21, 19)
 #define SPI_MISO_GPIO_MODE_MASK			BIT(22)
 #define SPI_MOSI_GPIO_MODE_MASK			BIT(21)
 #define SPI_CS_GPIO_MODE_MASK			BIT(20)
@@ -991,7 +992,7 @@ static const struct airoha_pinctrl_func_group emmc_func_group[] = {
 		.regmap[0] = {
 			AIROHA_FUNC_MUX,
 			REG_GPIO_PON_MODE,
-			GPIO_EMMC_MODE_MASK,
+			GPIO_EMMC_MODE_MASK | EMMC_GPIO_MODE_MASK,
 			GPIO_EMMC_MODE_MASK
 		},
 		.regmap_size = 1,
-- 
2.43.0


