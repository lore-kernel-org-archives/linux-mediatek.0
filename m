Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 638DCC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 17:38:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EE2B564E04
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 17:38:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EE2B564E04
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QvUXV9TxcRzKsZnjUBLGJnMMd3Cvp81vAH9lAmon98E=; b=UlLB+Yz4gl5oZXb85zt7LTGqE
	aXxBwHjyNn8gjJ4kk5Sm/IuyLJ/74D12ymJdNoulBB4ekl8Vc/vxKqF8oFg6bzPcBycZ+SBbFoUwe
	lb1x8WHK9dNXwiEB4ay+B12zzw/7/yja9qw8drqBVXRfuMV+aZI4WdvN2alFNHoUwDuVPOEwxXBkU
	9Sq2eSIOd00Mr3oepRiGktXjYelY4uiXFR2P57eSxPF48TsDVOfIqAmL/79LJKXl4y5k+iD0UUFda
	TukGOtuGaOO86zhyJXpvxN4dYW6Jru036BbL6PiC8ih8qlYLJ6G1R9m7q/KPAgmEj9Icicw1z+CCH
	qJxjqFJhQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLrA1-00GXTi-Qf; Mon, 15 Mar 2021 17:37:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLr9B-00GXHI-TF; Mon, 15 Mar 2021 17:37:01 +0000
X-UUID: f0431b4a89674f1383a67ed8cfdc313e-20210315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Y30nkUCimlP+nLQZWi2qp/2YMZ0llYN3OxLniy86Jfg=; 
 b=Z5yZSyJIfzf0ZJ9SaCeNRk7vKjDlDSjtqKDupUsYylnW5SwmH7d9gCocT2ml5WxjvY7DzUF3yywKw5Pz0tO7GJmMWOn0PWfzH+zjVwYbeo3X+H3LGEK65sg62UP3WRch90BQCVV+Y2smFI2uWB7IjBy165VS2z8YF8vGoZBAhiU=;
X-UUID: f0431b4a89674f1383a67ed8cfdc313e-20210315
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 164635140; Mon, 15 Mar 2021 09:36:48 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 15 Mar 2021 10:36:47 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 16 Mar 2021 01:36:45 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 16 Mar 2021 01:36:45 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Liam Girdwood
 <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Eddie Huang
 <eddie.huang@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, "Alessandro
 Zummo" <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Nicolas Boichat <drinkcat@chromium.org>
CC: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>, Yingjoe Chen
 <yingjoe.chen@mediatek.com>, Fei Shao <fshao@chromium.org>, Ran Bi
 <ran.bi@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <linux-rtc@vger.kernel.org>,
 <srv_heupstream@mediatek.com>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, Yuchen Huang
 <yuchen.huang@mediatek.com>
Subject: [PATCH v6 2/8] rtc: mt6397: refine RTC_TC_MTH
Date: Tue, 16 Mar 2021 01:35:51 +0800
Message-ID: <1615829757-3223-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1615829757-3223-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_173654_762672_E914139A 
X-CRM114-Status: GOOD (  14.83  )
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

This patch adds RTC_TC_MTH_MASK to support new chips.

Signed-off-by: Yuchen Huang <yuchen.huang@mediatek.com>
Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
Acked-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
changes since v5:
- no change.
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
