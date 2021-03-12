Return-Path: <SRS0=zPgu=IK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B65C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 15:38:17 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0F9965005
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Mar 2021 15:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0F9965005
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6mK8za0ACwDEzl5VBQUDnKavqWYGz2xALZcvVVugw8Y=; b=isXy6sw6H53IOMXYa2rFSQTPf
	vklvzY7fu9j0M3ey31r5p6l4BzNYFTQhLPInoQFO6T2W3u59shA1b1DT3BL4wpbdk+IZqqfzw4cv4
	KeVbSN/UPeRAoZSMiCCacAUsyc25mqQXt5Feij61C3v8hw3kMpf3eUVzkgeQBwBFcpoAHFu3aFjCF
	5fT3TGQ5L+sFLmICSHzeMaHNNz4EGf2RsJW3cLG1DUoUm7SCz2ucihpFtduLGNB0hkrHUEZjpmorE
	C+qZ0e3nlNbT/xzG8GufGuK/9bYAj1lWFSo/NNV2g9KU2KTZl1Z2Yvwrwd8ti2wl+hasTTrAPZ/fG
	yXHItXxXQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKjrZ-00BoyE-9m; Fri, 12 Mar 2021 15:38:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKjod-00BoQ8-Ir; Fri, 12 Mar 2021 15:35:09 +0000
X-UUID: 9b5b2c9e3d2943b993428badafe8502f-20210312
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=TVyvF1kxbelKFASaYedJnEmlvRTA0a3y0RhZBaZ9b8U=; 
 b=BP7JdET45CR9WZOWcWKIpFi6FEO2DwmIAW/7qP181VYI1rFexnMQ4J1lQg8rwaf249GoqDR4Vc6oLiBKkSVHUYNiN6X5/xVdRQfFA94lm6YrMInMa82E0SyQLGdlogIctQYmJFJwLansKyTVEsQQVSb9lSv2/b9l4oiX+7e9O3A=;
X-UUID: 9b5b2c9e3d2943b993428badafe8502f-20210312
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 48369629; Fri, 12 Mar 2021 07:34:55 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 07:34:53 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 12 Mar 2021 23:34:52 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 12 Mar 2021 23:34:52 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <drinkcat@chromium.org>
CC: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v6 1/5] soc: mediatek: pwrap: use BIT() macro
Date: Fri, 12 Mar 2021 23:34:42 +0800
Message-ID: <1615563286-22126-2-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1615563286-22126-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1615563286-22126-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210312_153505_736435_33645EB6 
X-CRM114-Status: GOOD (  11.76  )
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

Use a better BIT() marco for the bit definition.
No functional changes, cleanup only.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Reviewed-by: Nicolas Boichat <drinkcat@chromium.org>
---
changes since v5:
- no change.
---
 drivers/soc/mediatek/mtk-pmic-wrap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 5d34e8b9c988..c897205ad11f 100644
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
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
