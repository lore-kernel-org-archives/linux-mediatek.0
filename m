Return-Path: <SRS0=oKwZ=FU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84435C4361B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 07:48:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 036A123356
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Dec 2020 07:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 036A123356
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FXGafFUoBWUcHZ1R5V1irE8qZzxeix/wLfH7j47D2os=; b=glm869At9nJzG043QrUsu70+M
	8cPmDqHOVZZau8aOIV0mwp5SwQKuGbEwOXUm/vPbYAhhbKX4qXAEhdL1oFcUEGTum36nDmgTIb90J
	F//ScW9iE+U1baruD8xo9PcOnzigKL4i8MBNg5KZZNkcr8eFSFs6lSr4HYS5zDZbEkViIZwKhcdnv
	PAZxnFDIvcWUVnH2vt5GeHL2YvGoBIW/tCHoozDCX1mVdVT0yTnORDa1FmRpvC1kgMAQ88gn3NtjY
	054+3xZsmtGz0LNGbraDJ+C6hCC734CAYVGvNYiAQ+3MetNfqOprSkqRsMk1UNDhl5/m/g8urpr9A
	6YFwfcXyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpRXO-0007RJ-Cm; Wed, 16 Dec 2020 07:47:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpRXK-0007P4-NT; Wed, 16 Dec 2020 07:47:52 +0000
X-UUID: 43a631691deb4efc86808c8c79543d82-20201215
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=ro+M72H/I6IDE3C8DKJyS+pDoZ0kBwvWeDFLDdHFPFk=; 
 b=jtHGuQIEZpDl6Mj8SeXS50OhtaJYjyfI6wKaU9RTmxs336HEKiKtWrX1rPhA+KfEUsAcRdhLS1gZ02YW35weiTvhEpK7VX5nh2VlC/Faxiy0EZ/PYJ0SwKotwsMwXy1eZlbz/t7HRWp3L8CDTeIkYcfKwBPXISjIEZlTqSfOl/Q=;
X-UUID: 43a631691deb4efc86808c8c79543d82-20201215
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <hsin-hsiung.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 963226221; Tue, 15 Dec 2020 23:47:44 -0800
Received: from MTKMBS06N1.mediatek.inc (172.21.101.129) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 15 Dec 2020 23:47:41 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 16 Dec 2020 15:47:41 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 16 Dec 2020 15:47:40 +0800
From: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Fei Shao <fshao@chromium.org>,
 Alessandro Zummo <a.zummo@towertech.it>, Alexandre Belloni
 <alexandre.belloni@bootlin.com>, Liam Girdwood <lgirdwood@gmail.com>, "Mark
 Brown" <broonie@kernel.org>
Subject: [PATCH v4 2/9] rtc: mt6397: refine RTC_TC_MTH
Date: Wed, 16 Dec 2020 15:47:00 +0800
Message-ID: <1608104827-7937-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1608104827-7937-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1608104827-7937-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201216_024751_087826_E1DD3763 
X-CRM114-Status: GOOD (  15.73  )
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
 linux-mediatek@lists.infradead.org,
 Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
 Eddie Huang <eddie.huang@mediatek.com>,
 Yuchen Huang <yuchen.huang@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch adds RTC_TC_MTH_MASK to support new chips.

Signed-off-by: Yuchen Huang <yuchen.huang@mediatek.com>
Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 drivers/rtc/rtc-mt6397.c       | 2 +-
 include/linux/mfd/mt6397/rtc.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 1894aded4c85..ea6da7476a5e 100644
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
