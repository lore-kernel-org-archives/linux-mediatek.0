Return-Path: <SRS0=GXkz=C6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F914C43463
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 11:14:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3B31207BC
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Sep 2020 11:14:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OQl09K/S";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="KyOFN1+n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3B31207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=NiYXp/6apOGb/KBcja5eMRZiiB84hY/RgafQf38Pirk=; b=OQl09K/SetH6mL0yOHK2dyHg7
	p/QkkWyVugoLsbxpOY9hi6013Co55a1dW0YDa/mmshqGapacN8CfPby6CM3CWjAG3Ba29C8ZHGZvR
	CovRoxasB9WsvJcALcvN5iOZa4MrRIi7A8bRgOrLlNKVIYgWp9qEV3VDAJhW6a8ddY5YhXHr2kolZ
	M2x9KNM2WUIQ69fWBOQ5AQSY53Y2FklGf/Yww9c+WP3wfbCFuF89lo9OdYdO+75kjMhoACF8ybzzT
	0ppvyNRaLylInZtYi7D/6+/fL0GdOEZxDl+y9OR0393flGMt3ZgnuVxtPLO5D2rwc66nq078uL+xK
	7zzhHxomg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKJm2-0001Bu-0T; Mon, 21 Sep 2020 11:14:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKJly-0001AO-Sr; Mon, 21 Sep 2020 11:14:20 +0000
X-UUID: 2f960ab1cad34e4db17502fdc22f30ef-20200921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fpzOG0X71zzG1KUuoZmURiigMLk58k6qDYDOQDvWkFE=; 
 b=KyOFN1+nuSaEARSiGzu0RLcrLZtbcQlog4tLnm79PdYauCVy8V0Hq/LLVeW2zB0jk5Q22dRL6k/rmKkoEe2TJI0sw7Esx7/LvMKh65KbSUNgFgfSuwJLtqo1FW5zsKTbw1b38AGmlS/ZAEzuBL4d49gGxrT6YPvHZoCYAuKcvWs=;
X-UUID: 2f960ab1cad34e4db17502fdc22f30ef-20200921
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 573842146; Mon, 21 Sep 2020 03:14:15 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Sep 2020 04:04:12 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 21 Sep 2020 19:04:10 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 21 Sep 2020 19:04:12 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Argus Lin <argus.lin@mediatek.com>,
 <drinkcat@chromium.org>
Subject: [PATCH v3 1/4] soc: mediatek: pwrap: use BIT() macro
Date: Mon, 21 Sep 2020 19:03:52 +0800
Message-ID: <1600686235-27979-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1600686235-27979-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1600686235-27979-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200921_071419_107897_639D8417 
X-CRM114-Status: GOOD (  13.29  )
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
Cc: devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Use a better BIT() marco for the bit definition.
No functional changes, cleanup only.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 5d34e8b..c897205 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -27,8 +27,8 @@
 #define PWRAP_GET_WACS_RDATA(x)		(((x) >> 0) & 0x0000ffff)
 #define PWRAP_GET_WACS_FSM(x)		(((x) >> 16) & 0x00000007)
 #define PWRAP_GET_WACS_REQ(x)		(((x) >> 19) & 0x00000001)
-#define PWRAP_STATE_SYNC_IDLE0		(1 << 20)
-#define PWRAP_STATE_INIT_DONE0		(1 << 21)
+#define PWRAP_STATE_SYNC_IDLE0		BIT(20)
+#define PWRAP_STATE_INIT_DONE0		BIT(21)
 
 /* macro for WACS FSM */
 #define PWRAP_WACS_FSM_IDLE		0x00
-- 
2.6.4
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
