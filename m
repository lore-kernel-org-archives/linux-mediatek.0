Return-Path: <SRS0=eP1B=K4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3F0C47083
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 11:21:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80DA861159
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Jun 2021 11:21:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80DA861159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvedpGpFBJkKDGbJM8vJCmzbodaomapnA5K3XBXZQvA=; b=BVWtSICiSeb6w8
	fNmpYPjSDORUc8hv1kuewMAWecNF3wAKFaAWjLSpyncnJDSq+yJEbkZr7ep1ygfTif+oghw/+LHGR
	UYz6mU6cLNdUjTg//AB0edrYXmF0OARTZpLk/GDn3DVGMWwAjy95+xakeOIyjY9+fhRfz8sfKhk5c
	GuIcv6OLjLy9k1ZtMszhaW8n3Q2B/gBEDj7jjY7jHDUXA3kP/DAh1V7M/927svfGLXm/b7BvOpTnx
	yaudFkq2N5t7kPP2pQ8oByJ10XAKuXf9ofZdcN4jOGgyrdtLqORU+19yNL1EjYNpc4wPvpmwlVKXK
	t1h2TW3NvOKQqgRWCS+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loOwN-003hdS-DU; Wed, 02 Jun 2021 11:21:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loOvl-003hQB-Fv; Wed, 02 Jun 2021 11:21:07 +0000
X-UUID: 03a28f328d544e37b2d148810a03e294-20210602
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Y3DrD2P8rHQjEIDN+kKiO2zJXJBBASAxxojCTUT7rI0=; 
 b=E/dQdorsMQQf8T8QK8ZWrCoDipGyNcnVctoTg4671XRkhkRAFwFwGGk6YCLZ9pcsEFib3XGRzlxmnVJ7iAOcEHoYDBnqZuNXgmrSgTOq7TOTjhDZX1teoDNOOjZlG8bVtC2p7bEpQTh5NuH9FvIkw1dKVZmD9rAJbme7Y4yxEzI=;
X-UUID: 03a28f328d544e37b2d148810a03e294-20210602
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <james.lo@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 780537524; Wed, 02 Jun 2021 04:20:56 -0700
Received: from MTKMBS02N1.mediatek.inc (172.21.101.77) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 04:20:55 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Jun 2021 19:20:53 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 2 Jun 2021 19:20:53 +0800
From: James Lo <james.lo@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
CC: Sascha Hauer <s.hauer@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, Henry Chen <henryc.chen@mediatek.com>
Subject: [PATCH 2/2] soc: mediatek: pwrap: add pwrap driver for MT8195 SoC
Date: Wed, 2 Jun 2021 19:20:50 +0800
Message-ID: <20210602112050.12338-3-james.lo@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210602112050.12338-1-james.lo@mediatek.com>
References: <20210602112050.12338-1-james.lo@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210602_042101_744975_F05620AE 
X-CRM114-Status: GOOD (  14.08  )
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

From: Henry Chen <henryc.chen@mediatek.com>

MT8195 are highly integrated SoC and use PMIC_MT6359 for
power management. This patch adds pwrap master driver to
access PMIC_MT6359.

Signed-off-by: Henry Chen <henryc.chen@mediatek.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 35 ++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index e4de75f35c33..952bc554f443 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -961,6 +961,23 @@ static int mt8183_regs[] = {
 	[PWRAP_WACS2_VLDCLR] =			0xC28,
 };
 
+static int mt8195_regs[] = {
+	[PWRAP_INIT_DONE2] =		0x0,
+	[PWRAP_STAUPD_CTRL] =		0x4C,
+	[PWRAP_TIMER_EN] =		0x3E4,
+	[PWRAP_INT_EN] =		0x420,
+	[PWRAP_INT_FLG] =		0x428,
+	[PWRAP_INT_CLR] =		0x42C,
+	[PWRAP_INT1_EN] =		0x450,
+	[PWRAP_INT1_FLG] =		0x458,
+	[PWRAP_INT1_CLR] =		0x45C,
+	[PWRAP_WACS2_CMD] =		0x880,
+	[PWRAP_SWINF_2_WDATA_31_0] =	0x884,
+	[PWRAP_SWINF_2_RDATA_31_0] =	0x894,
+	[PWRAP_WACS2_VLDCLR] =		0x8A4,
+	[PWRAP_WACS2_RDATA] =		0x8A8,
+};
+
 static int mt8516_regs[] = {
 	[PWRAP_MUX_SEL] =		0x0,
 	[PWRAP_WRAP_EN] =		0x4,
@@ -1066,6 +1083,7 @@ enum pwrap_type {
 	PWRAP_MT8135,
 	PWRAP_MT8173,
 	PWRAP_MT8183,
+	PWRAP_MT8195,
 	PWRAP_MT8516,
 };
 
@@ -1525,6 +1543,7 @@ static int pwrap_init_cipher(struct pmic_wrapper *wrp)
 		break;
 	case PWRAP_MT6873:
 	case PWRAP_MT8183:
+	case PWRAP_MT8195:
 		break;
 	}
 
@@ -2025,6 +2044,19 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
 	.init_soc_specific = pwrap_mt8183_init_soc_specific,
 };
 
+static struct pmic_wrapper_type pwrap_mt8195 = {
+	.regs = mt8195_regs,
+	.type = PWRAP_MT8195,
+	.arb_en_all = 0x777f, /* NEED CONFIRM */
+	.int_en_all = 0x180000, /* NEED CONFIRM */
+	.int1_en_all = 0,
+	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
+	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
+	.caps = PWRAP_CAP_INT1_EN | PWRAP_CAP_ARB,
+	.init_reg_clock = pwrap_common_init_reg_clock,
+	.init_soc_specific = NULL,
+};
+
 static struct pmic_wrapper_type pwrap_mt8516 = {
 	.regs = mt8516_regs,
 	.type = PWRAP_MT8516,
@@ -2065,6 +2097,9 @@ static const struct of_device_id of_pwrap_match_tbl[] = {
 	}, {
 		.compatible = "mediatek,mt8183-pwrap",
 		.data = &pwrap_mt8183,
+	}, {
+		.compatible = "mediatek,mt8195-pwrap",
+		.data = &pwrap_mt8195,
 	}, {
 		.compatible = "mediatek,mt8516-pwrap",
 		.data = &pwrap_mt8516,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
