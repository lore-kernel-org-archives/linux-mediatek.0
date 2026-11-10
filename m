Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 664DA606BF04
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2026 09:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sh84BgXD;
	dkim=pass (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.a=rsa-sha256 header.s=dk header.b=peLSh0Ge
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ABGgDRVwGV2v5HDXz46KiBH+OUpckTODrt/huCpfQR4=; b=sh84BgXDQfs1OHNxTstK0NF0Hk
	TpMNkQt+s5iDep0y09ZdZXqSD/+I8zn83CnQmAAWHXc7GKyX2nxbM3Zvxu1jm39L+lB7rx1tZOpp5
	Ckum9/4VEFlJ65/w+gGJtWPoM16sX13UBeJz5qmRzJPqN30P9NxUY753F4BSa9Y8dsQK7LZ9cWvEm
	zIU1jWecHiqSeZ8wAf0+lKNi5w6Qnz2vqOgbE+kcAuq1Bnj8inUeo9qrRpuV2cIq92PhZe5so7FYC
	iDwT8lM7rvTuY5eAiqg3/4lT54tZ5M13LWlXdeSfjJ9CV0umEV5NClquv51GIczQ09DE+poB5euAO
	2aD2NmVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOQ-00000003Jrk-0Rac;
	Tue, 10 Nov 2026 09:43:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQiOO-00000003JpJ-0sBK
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Nov 2026 09:43:53 +0000
X-UUID: 39e6600adceb11f1acbe4559397dec65-20261110
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ABGgDRVwGV2v5HDXz46KiBH+OUpckTODrt/huCpfQR4=;
	b=peLSh0Ge8xvg+hVTXxlbsPFL4TBpmu68lDTQjsaNIvHoj42Ybaqn6eC0f09KfQl871SS2CKEatFf8vr2Uwua7AMGzm1vVJ8HuzCXvrBb1TFHkKYgu15Kiz2qdTjd+BJSivmKPDoVaCYeF4OHQ7ILzATw3h5AerfjPCZnLgEFjKY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.21,REQID:ac20e9eb-ddac-4f40-a6d5-e26839e87934,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:b0318ac,CLOUDID:324392eb-7d0c-4db4-a7e5-d44f18b7500b,B
	ulkID:nil,BulkQuantity:0,SF:81|82|102|836|865|888|898,TC:-5,Content:0|15|5
	0|99,EDM:-3,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 39e6600adceb11f1acbe4559397dec65-20261110
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by mailgw02.mediatek.com
	(envelope-from <zhengping.zhang@airoha.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 80678464; Tue, 10 Nov 2026 02:43:47 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Tue, 10 Nov 2026 17:43:44 +0800
Received: from mediatek.com (172.18.153.129) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.2562.29 via Frontend
 Transport; Tue, 10 Nov 2026 17:43:44 +0800
From: Zhengping Zhang <zhengping.zhang@airoha.com>
To: <linusw@kernel.org>, <lorenzo@kernel.org>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<brgl@kernel.org>, <mikhail.kshevetskiy@iopsys.eu>, <naseefkm@gmail.com>,
	<benjamin.larsson@genexis.eu>, <linux-gpio@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>, <lei.dong@airoha.com>,
	<ansuelsmth@gmail.com>, Daniel Schwierzeck <daniel.schwierzeck@gmail.com>,
	Zhengping Zhang <zhengping.zhang@airoha.com>
Subject: [PATCH 01/12] pinctrl: airoha: fix setting of GPIO direction
Date: Tue, 10 Nov 2026 17:43:28 +0800
Message-ID: <20261110094339.749110-2-zhengping.zhang@airoha.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110094339.749110-1-zhengping.zhang@airoha.com>
References: <20261110094339.749110-1-zhengping.zhang@airoha.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_014352_275974_C4BDE93A 
X-CRM114-Status: GOOD (  12.74  )
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

The GPIO_CTRL registers have two bits per GPIO where the values 0x2 and
0x3 are reserved. It can happen that both bits in GPIO_CTRL of a GPIO
are set when the pinctrl driver is probed (e.g. modified by bootloader),
but the current code just clears the LSB. Thus when switching a certain
GPIO to output, the updated GPIO_CTRL register can contain the reserved
value 0x2 for that GPIO. This can result in not driving the GPIO pin at
all.

Always clear both bits per GPIO and just set the LSB when the GPIO is
configured for output.

Signed-off-by: Daniel Schwierzeck <daniel.schwierzeck@gmail.com>
Signed-off-by: Zhengping Zhang <zhengping.zhang@airoha.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index 52a768c859b71..8dd0881bba4ad 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -164,7 +164,7 @@ static int airoha_gpio_set_direction(struct gpio_chip *chip, unsigned int gpio,
 {
 	struct airoha_pinctrl *pinctrl = gpiochip_get_data(chip);
 	u32 mask, index;
-	int err;
+	int err, offset;
 
 	/* set output enable */
 	mask = BIT(gpio % AIROHA_PIN_BANK_SIZE);
@@ -176,12 +176,13 @@ static int airoha_gpio_set_direction(struct gpio_chip *chip, unsigned int gpio,
 		return err;
 
 	/* set direction */
-	mask = BIT(2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN));
+	offset = 2 * (gpio % AIROHA_REG_GPIOCTRL_NUM_PIN);
+	mask = GENMASK(offset + 1, offset); /* always clear the two bits per GPIO */
 	index = gpio / AIROHA_REG_GPIOCTRL_NUM_PIN;
 
 	return regmap_update_bits(pinctrl->regmap,
 				  pinctrl->gpio_regs->dir[index], mask,
-				  !input ? mask : 0);
+				  !input ? BIT(offset) : 0);
 }
 
 static int airoha_gpio_direction_input(struct gpio_chip *chip,
-- 
2.43.0


