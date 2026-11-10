Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7254A60A3820
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 17:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=C3NL3k0D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7vdZotvX6OCfjq3cA5+TdLbCY+mxRKfqeiUrbolFA94=; b=C3NL3k0DyAyYnl
	Zi/zu6YSBlMFbriqop8pEEM0mEeS9iVxKMwV/vHg12ixHXSsqNRI2izVSf7Yn9qlu6H9HIF5ED5YJ
	I65bKN58XVOEuhxa/npnSmfMYMKq7S4afUj315kt6XfmLeIfMngJrMbJ0xm/zlQWQG/jzMshwllrK
	dX7Hg8BWSM3NABN6zaoblP9cxAGh9RTGyYQTGmSc1uPGR9b9IhwAr6Bk3cAoyeD7c+3oeidkk+CPP
	yaKhvqPyhiqGUNEZ++vK+caz+84GtU+6pNRDbpUoboS6YY5fWjxoZ3clY7HEhcq/vG6Pu/mGY786R
	Aw2dLj8D8PQXceCx2T7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpp9-00000004hYq-3wh7;
	Tue, 10 Nov 2026 17:39:59 +0000
Received: from nbd.name ([46.4.11.11])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQpp5-00000004hU2-46DD
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 17:39:57 +0000
Received: from [2a04:4540:1403:9bfc:b113:5373:d0ec:2ad1] (helo=bertha10..)
	by ds12 with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <john@phrozen.org>)
	id 1xQpp0-001CWh-1E;
	Tue, 10 Nov 2026 18:39:50 +0100
From: John Crispin <john@phrozen.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Ahmed Naseef <naseefkm@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>,
	Christian Marangi <ansuelsmth@gmail.com>,
	devicetree@vger.kernel.org,
	lei.dong@airoha.com,
	Linqi.zhang@airoha.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	mfd@lists.linux.dev,
	Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>,
	Rajeev.kumar@airoha.com,
	upstream@airoha.com,
	Weifeng.xu@airoha.com,
	zhengping.zhang@airoha.com
Subject: [PATCH 6/7] pinctrl: airoha: move the GPIO register offsets to the common header
Date: Tue, 10 Nov 2026 18:39:40 +0100
Message-Id: <20261110173941.301478-7-john@phrozen.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261110173941.301478-1-john@phrozen.org>
References: <20261110173941.301478-1-john@phrozen.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_093956_035904_DAA47937 
X-CRM114-Status: UNSURE (   8.39  )
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
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GPIO register offsets are private to pinctrl-airoha.c, which builds
the shared 64 pin register table from them. A SoC with more GPIO banks
needs its own table, built from the same offsets and its own for the
extra banks.

Move the offsets to airoha-common.h so the SoC drivers can use them.

No functional change.

Signed-off-by: John Crispin <john@phrozen.org>
---
 drivers/pinctrl/airoha/airoha-common.h  | 20 ++++++++++++++++++++
 drivers/pinctrl/airoha/pinctrl-airoha.c | 20 --------------------
 2 files changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/pinctrl/airoha/airoha-common.h b/drivers/pinctrl/airoha/airoha-common.h
index adfce89493f0..dc9b897ea77c 100644
--- a/drivers/pinctrl/airoha/airoha-common.h
+++ b/drivers/pinctrl/airoha/airoha-common.h
@@ -34,6 +34,26 @@
 #include "../pinconf.h"
 #include "../pinmux.h"
 
+/* GPIOs */
+#define REG_GPIO_CTRL				0x0000
+#define REG_GPIO_DATA				0x0004
+#define REG_GPIO_INT				0x0008
+#define REG_GPIO_INT_EDGE			0x000c
+#define REG_GPIO_INT_LEVEL			0x0010
+#define REG_GPIO_OE				0x0014
+#define REG_GPIO_CTRL1				0x0020
+#define REG_GPIO_CTRL2				0x0060
+#define REG_GPIO_CTRL3				0x0064
+#define REG_GPIO_DATA1				0x0070
+#define REG_GPIO_OE1				0x0078
+#define REG_GPIO_INT1				0x007c
+#define REG_GPIO_INT_EDGE1			0x0080
+#define REG_GPIO_INT_EDGE2			0x0084
+#define REG_GPIO_INT_EDGE3			0x0088
+#define REG_GPIO_INT_LEVEL1			0x008c
+#define REG_GPIO_INT_LEVEL2			0x0090
+#define REG_GPIO_INT_LEVEL3			0x0094
+
 #define AIROHA_NUM_PINS				64
 #define AIROHA_PIN_BANK_SIZE			(AIROHA_NUM_PINS / 2)
 #define AIROHA_REG_GPIOCTRL_NUM_PIN		(AIROHA_NUM_PINS / 4)
diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index a805f542bc7b..8f901f251c00 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -7,26 +7,6 @@
 
 #include "airoha-common.h"
 
-/* GPIOs */
-#define REG_GPIO_CTRL				0x0000
-#define REG_GPIO_DATA				0x0004
-#define REG_GPIO_INT				0x0008
-#define REG_GPIO_INT_EDGE			0x000c
-#define REG_GPIO_INT_LEVEL			0x0010
-#define REG_GPIO_OE				0x0014
-#define REG_GPIO_CTRL1				0x0020
-#define REG_GPIO_CTRL2				0x0060
-#define REG_GPIO_CTRL3				0x0064
-#define REG_GPIO_DATA1				0x0070
-#define REG_GPIO_OE1				0x0078
-#define REG_GPIO_INT1				0x007c
-#define REG_GPIO_INT_EDGE1			0x0080
-#define REG_GPIO_INT_EDGE2			0x0084
-#define REG_GPIO_INT_EDGE3			0x0088
-#define REG_GPIO_INT_LEVEL1			0x008c
-#define REG_GPIO_INT_LEVEL2			0x0090
-#define REG_GPIO_INT_LEVEL3			0x0094
-
 #define airoha_pinctrl_get_pullup_conf(pinctrl, pin, val)			\
 	airoha_pinctrl_get_conf((pinctrl), AIROHA_PINCTRL_CONFS_PULLUP,		\
 				(pin), (val))
-- 
2.34.1


