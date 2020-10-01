Return-Path: <SRS0=Oval=DI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09C0FC4727E
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 16:03:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B239B20872
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Oct 2020 16:03:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="z1sczom+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B239B20872
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=s7Cn9SOw8xJNV+UqhXr/y1LA+ZERKaE2qEDxbiIxmqE=; b=z1sczom+0j7hYWEXb6dzM82K1
	UziwQrTjPCXpQOIimE6jwCL3rtjYwg4rff5EHuwjfz24XpUgtI9nkmGlartnqU5M9oJ84XIEsfraC
	bIBRnbfAfb21XO8RSrHAKDXPPATpampxQ8D7NCFYLlyryfMwZaqATP4Slgpp45Gn6O1T5V9Fk3mTC
	eYXndmm9ZT6WvwpJ+aM49qJcXSPQVeYX5iM7Oig+dHVblUx7bnijdOkHqlAcYxk+NyExkC6ckqHWA
	GJt3Wy3BANj63czJ+ijI7B3PMBffFE5cSqi4ZP+HPRU+j9XzEt8GWLMFSdykAiiLo4us3qtYDpgca
	uHTJiNTkw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kO13T-0000si-4w; Thu, 01 Oct 2020 16:03:39 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kO123-0008R9-T4; Thu, 01 Oct 2020 16:02:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 859FE29D756
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/12] soc: mediatek: pm-domains: Allow bus protection to
 ignore clear ack
Date: Thu,  1 Oct 2020 18:01:51 +0200
Message-Id: <20201001160154.3587848-10-enric.balletbo@collabora.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201001160154.3587848-1-enric.balletbo@collabora.com>
References: <20201001160154.3587848-1-enric.balletbo@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201001_120212_096260_1D01A8D7 
X-CRM114-Status: GOOD (  11.80  )
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
Cc: drinkcat@chromium.org, weiyi.lu@mediatek.com, fparent@baylibre.com,
 Matthias Brugger <mbrugger@suse.com>, linux-mediatek@lists.infradead.org,
 hsinyi@chromium.org, matthias.bgg@gmail.com,
 Collabora Kernel ML <kernel@collabora.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

In some cases the hardware does not create an acknowledgment of the
bus protection clearing. Add a flag to the bus protection indicating
that a clear event will be ignored.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---

Changes in v2: None

 drivers/soc/mediatek/mtk-pm-domains.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pm-domains.c b/drivers/soc/mediatek/mtk-pm-domains.c
index 2075072f16da..0222be12d0df 100644
--- a/drivers/soc/mediatek/mtk-pm-domains.c
+++ b/drivers/soc/mediatek/mtk-pm-domains.c
@@ -60,19 +60,23 @@
 
 #define SPM_MAX_BUS_PROT_DATA		3
 
-#define _BUS_PROT(_mask, _set, _clr, _sta, _update) {	\
-		.bus_prot_mask = (_mask),		\
-		.bus_prot_set = _set,			\
-		.bus_prot_clr = _clr,			\
-		.bus_prot_sta = _sta,			\
-		.bus_prot_reg_update = _update,		\
+#define _BUS_PROT(_mask, _set, _clr, _sta, _update, _ignore) {	\
+		.bus_prot_mask = (_mask),			\
+		.bus_prot_set = _set,				\
+		.bus_prot_clr = _clr,				\
+		.bus_prot_sta = _sta,				\
+		.bus_prot_reg_update = _update,			\
+		.ignore_clr_ack = _ignore,			\
 	}
 
-#define BUS_PROT_WR(_mask, _set, _clr, _sta)		\
-		_BUS_PROT(_mask, _set, _clr, _sta, false)
+#define BUS_PROT_WR(_mask, _set, _clr, _sta)			\
+		_BUS_PROT(_mask, _set, _clr, _sta, false, false)
+
+#define BUS_PROT_WR_IGN(_mask, _set, _clr, _sta)		\
+		_BUS_PROT(_mask, _set, _clr, _sta, false, true)
 
 #define BUS_PROT_UPDATE(_mask, _set, _clr, _sta)		\
-		_BUS_PROT(_mask, _set, _clr, _sta, true)
+		_BUS_PROT(_mask, _set, _clr, _sta, true, false)
 
 struct scpsys_bus_prot_data {
 	u32 bus_prot_mask;
@@ -80,6 +84,7 @@ struct scpsys_bus_prot_data {
 	u32 bus_prot_clr;
 	u32 bus_prot_sta;
 	bool bus_prot_reg_update;
+	bool ignore_clr_ack;
 };
 
 #define MAX_SUBSYS_CLKS 10
@@ -267,6 +272,9 @@ static int _scpsys_bus_protect_disable(const struct scpsys_bus_prot_data *bpd,
 		else
 			regmap_write(regmap, bpd[i].bus_prot_clr, mask);
 
+		if (bpd[i].ignore_clr_ack)
+			continue;
+
 		ret = regmap_read_poll_timeout(regmap, bpd[i].bus_prot_sta,
 					       val, !(val & mask),
 					       MTK_POLL_DELAY_US, MTK_POLL_TIMEOUT);
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
