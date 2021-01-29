Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23B78C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:56:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6508364E28
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:56:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6508364E28
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cX5U2rxddufqbd751kNGT8T8oWCEcFY++gxzJNCWnSo=; b=F5mXo30708xlJ5yv7qRy4WtWi
	fZUhevldRJPhF/549vJwNYCZvU+gS2ZojyeqNPr9G0Mg/OIPAJCcyVvuiwLCiDaDM3iRNj1Plrd/j
	DkFK+ExeCy+ejXmmGFZuA8cEEh21JwyRjj3NYTFYY4OEv9DKH+q9LfwROnLG1JO9CWAypdxpDshdG
	rG0s5DVac5moe2051I1xfyVfO6wgVMxu/R9sS2uQ0+IUXu5gsLn0fxrs2FCVNgrpnuCTRanN/e2P/
	4nv8eXGS337idf5vblw385M5AP8mxpdJhW/R/dc1B6wJBy+9AmYv0sjwnjJTMY4UiDveiwvV7kDwu
	sxv0BkrGw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5QVQ-0004td-JQ; Fri, 29 Jan 2021 09:55:56 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5QUS-0004Sz-1f; Fri, 29 Jan 2021 09:54:57 +0000
X-UUID: c74ead1bba8440129169b3f84137ff0d-20210129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=HIGNyU+hnHKoaUxqyZlp769R29QzC6PH4kQs0YzBiMs=; 
 b=r14Cv38vor9mD6u8qWg//G5M0Z0BDqJI/TDvLKSdGfJUt3t8kJygZpfZAOejUsDex1kVhN5QZJKSXZjHm2md3Fg42X63A3CbumVqd9r//3Ml917A7NyxVvDI0a686Jev6Pe/f/RorUfIRNqYsPjXVMH11Kk0uUpf7R7zmaxqmJc=;
X-UUID: c74ead1bba8440129169b3f84137ff0d-20210129
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1361577281; Fri, 29 Jan 2021 01:50:32 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 01:50:30 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Jan 2021 17:50:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 29 Jan 2021 17:50:29 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Alessandro Zummo
 <a.zummo@towertech.it>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Fei Shao <fshao@chromium.org>
Subject: [PATCH RESEND v5 2/8] rtc: mt6397: refine RTC_TC_MTH
Date: Fri, 29 Jan 2021 17:49:35 +0800
Message-ID: <1611913781-23460-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1611913781-23460-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1611913781-23460-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_045456_303393_C168090A 
X-CRM114-Status: GOOD (  14.18  )
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
Cc: linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, Ran Bi <ran.bi@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Eddie Huang <eddie.huang@mediatek.com>,
 Yuchen Huang <yuchen.huang@mediatek.com>,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds RTC_TC_MTH_MASK to support new chips.

Signed-off-by: Yuchen Huang <yuchen.huang@mediatek.com>
Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
changes since v4: no changes
---
 drivers/rtc/rtc-mt6397.c       | 2 +-
 include/linux/mfd/mt6397/rtc.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 6655035e5164..80dc479a6ff0 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -75,7 +75,7 @@ static int __mtk_rtc_read_time(struct mt6397_rtc *rtc,
 	tm->tm_min = data[RTC_OFFSET_MIN];
 	tm->tm_hour = data[RTC_OFFSET_HOUR];
 	tm->tm_mday = data[RTC_OFFSET_DOM];
-	tm->tm_mon = data[RTC_OFFSET_MTH];
+	tm->tm_mon = data[RTC_OFFSET_MTH] & RTC_TC_MTH_MASK;
 	tm->tm_year = data[RTC_OFFSET_YEAR];
 
 	ret = regmap_read(rtc->regmap, rtc->addr_base + RTC_TC_SEC, sec);
diff --git a/include/linux/mfd/mt6397/rtc.h b/include/linux/mfd/mt6397/rtc.h
index c3748b53bf7d..068ae1c0f0e8 100644
--- a/include/linux/mfd/mt6397/rtc.h
+++ b/include/linux/mfd/mt6397/rtc.h
@@ -36,6 +36,7 @@
 #define RTC_AL_MASK_DOW                BIT(4)
 
 #define RTC_TC_SEC             0x000a
+#define RTC_TC_MTH_MASK        0x000f
 /* Min, Hour, Dom... register offset to RTC_TC_SEC */
 #define RTC_OFFSET_SEC         0
 #define RTC_OFFSET_MIN         1
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
