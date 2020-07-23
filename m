Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B91CAC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 11:20:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8724C20B1F
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 11:20:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="jxJ/Glmc";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="DuxFQ7Xy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8724C20B1F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3yOKzHKZFK+6Dcs3o5ir10QaMYGcSYSQPODaM4aw4Dk=; b=jxJ/Glmc4hXwd6858hX61ssKh
	NGf1vUppPiHnQnkHkQvHR/xFlGdFrc6QNTjH9fxr2I13e4wKEuwr6dhm6LpNRFOseh0xXW9bxS3qO
	iNrjFvvH7fkKCaFqEw1bKpDXswd28yuBKpBSjOPt6YoK2kI4AMHLJD10XwbcU6bWMODsz/tYsnG8S
	XkL4lB4kNhBCFtWAqFBbwjFjoaQohQrsqTHb/GncL3RDQ0E7RRDcKnNR5D6/OlegcAkECHmF6CabA
	ZsgWsfbGjy3Ip5GL6fflYdoaaE9PnPveih/PXYO8Ty5f0Avj7upe9aNkyLhuRHFt4a05GGC0Ox0H2
	9/H1MOfBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyZHH-00083z-9w; Thu, 23 Jul 2020 11:20:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyZGw-0007wB-KJ; Thu, 23 Jul 2020 11:20:24 +0000
X-UUID: f6e3cdc70f07444892a2e5b30ba7f065-20200723
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ISbiQYwws4OhOVOvWHyiC46oPXaE0qjkMAx3jpdU6P8=; 
 b=DuxFQ7Xy+Wy7UwkBs7X5RyPb4i5LRaK55vZ3PJW5l3slkx4pCgf6oIuxgOFTT+GL9MdFYegtZ3IsLmo1vLLUvy8JyiO5LcaRFem+K47hDusz49B9CfDC92da7JDsani8fLPHhD0XoKPgGbVTGRwMYM26QqSK1mfTIpjFzylpE7c=;
X-UUID: f6e3cdc70f07444892a2e5b30ba7f065-20200723
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1104854645; Thu, 23 Jul 2020 03:20:13 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 04:20:13 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 23 Jul 2020 19:19:59 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 23 Jul 2020 19:19:59 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, "Michael
 Turquette" <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, "Sean
 Wang" <sean.wang@kernel.org>
Subject: [PATCH v9 5/7] pinctrl: mediatek: add mt6779 eint support
Date: Thu, 23 Jul 2020 19:19:55 +0800
Message-ID: <1595503197-15246-6-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
References: <1595503197-15246-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: EFC0D02131D0973A2B17EF22824657711A36717F71941980F565D18CC7E469722000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_072023_206179_0670BE5F 
X-CRM114-Status: GOOD (  10.62  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Andy Teng <andy.teng@mediatek.com>,
 Mars Cheng <mars.cheng@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 mtk01761 <wendell.lin@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add driver setting to support mt6779 eint

Acked-by: Sean Wang <sean.wang@kernel.org>
Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt6779.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6779.c b/drivers/pinctrl/mediatek/pinctrl-mt6779.c
index ede185b58d41..bb0851c73304 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6779.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6779.c
@@ -732,11 +732,19 @@ static const char * const mt6779_pinctrl_register_base_names[] = {
 	"iocfg_rt", "iocfg_lt", "iocfg_tl",
 };
 
+static const struct mtk_eint_hw mt6779_eint_hw = {
+	.port_mask = 7,
+	.ports     = 6,
+	.ap_num    = 195,
+	.db_cnt    = 13,
+};
+
 static const struct mtk_pin_soc mt6779_data = {
 	.reg_cal = mt6779_reg_cals,
 	.pins = mtk_pins_mt6779,
 	.npins = ARRAY_SIZE(mtk_pins_mt6779),
 	.ngrps = ARRAY_SIZE(mtk_pins_mt6779),
+	.eint_hw = &mt6779_eint_hw,
 	.gpio_m = 0,
 	.ies_present = true,
 	.base_names = mt6779_pinctrl_register_base_names,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
