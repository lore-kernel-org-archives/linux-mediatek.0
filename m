Return-Path: <SRS0=43xy=5K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB90C54FD4
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 08:23:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 617EE2070A
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Mar 2020 08:23:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hdYMg/1d";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="p1ccBwk/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 617EE2070A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rRZbl4QFCdSrZU8pGYq+zwU5QbEUiMjayKzLcnARi5g=; b=hdYMg/1dXxCJPr
	z9ugmk3EyVm69ee0g6+//afYsn9yEKFUHxPofdhKklXC2nZoB3u7l3fGvNiKbZrV8EskGUQhFET99
	xX3kw3sLj7WzY68bQdvLiV0yQJLekwUwZCaZpqPuQQVskZejptMy2yTA73fFmXoTF4MrBunsgWJmp
	rrOpicHo9VszOQgRsyPtI367OVomhQzsOAGmfd7ZoT0EIYbtS4ScXXJO24OghDfMWtkkIZidx7Su/
	06DirAonLg+q0bbuT74AWj5C1QFPgph9i6oJPT8CPWmbNKR3/zXyWiXkNxPdqAfFH4MekSahOADIr
	FopuPXAYyeL/WeONkIVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jH1K3-00089T-LA; Wed, 25 Mar 2020 08:23:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jH1Jz-00086f-OY
 for linux-mediatek@lists.infradead.org; Wed, 25 Mar 2020 08:23:33 +0000
X-UUID: c3fefc9f1a7f4c898231a9faa5d0992a-20200325
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=0n+EUTSUdOSSkaTkHUmDbzhJFVoxjbBJTb+B0M4gX+k=; 
 b=p1ccBwk/gar46gDywu4I7HQ3ny8LuN9edXSd3hWIP5UV/G1XB7Zz6TuvpuW0Gq/RoM7fTkLuAmLLwxnLMXG/QTD7PN+OCSYNW7M99+Op+dwRrHD4AbCfRD8HaPqkLrNKQsBLFTJkQfGuzQlXnDWwPN7Sx5bes9w8N9e0/X6fugQ=;
X-UUID: c3fefc9f1a7f4c898231a9faa5d0992a-20200325
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hanks.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1760048904; Wed, 25 Mar 2020 00:23:29 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 25 Mar 2020 01:13:58 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 25 Mar 2020 16:13:27 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Wed, 25 Mar 2020 16:13:26 +0800
From: Hanks Chen <hanks.chen@mediatek.com>
To: Linus Walleij <linus.walleij@linaro.org>, Rob Herring
 <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Subject: [PATCH v4 5/6] pinctrl: mediatek: add mt6779 eint support
Date: Wed, 25 Mar 2020 16:12:43 +0800
Message-ID: <1585123964-10791-6-git-send-email-hanks.chen@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <1585123964-10791-1-git-send-email-hanks.chen@mediatek.com>
References: <1585123964-10791-1-git-send-email-hanks.chen@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: FF973F850011CBAAEE0C21F1680A0D8197FD3BA48076E1571591A28544583C1E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200325_012331_802767_34DF0B72 
X-CRM114-Status: UNSURE (   8.67  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Andy Teng <andy.teng@mediatek.com>, Hanks Chen <hanks.chen@mediatek.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Mars Cheng <mars.cheng@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

add driver setting to support mt6779 eint

Change-Id: I7aa1e64112cb2e43813328d9971fd644629edf0a
Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt6779.c |    8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt6779.c b/drivers/pinctrl/mediatek/pinctrl-mt6779.c
index 145bf22..3282260 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt6779.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt6779.c
@@ -731,11 +731,19 @@
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
1.7.9.5
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
