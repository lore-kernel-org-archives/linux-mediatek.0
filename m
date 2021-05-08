Return-Path: <SRS0=aHEw=KD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 966A8C433B4
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 May 2021 06:06:10 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0407F61468
	for <linux-mediatek@archiver.kernel.org>; Sat,  8 May 2021 06:06:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0407F61468
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/se3S95jVEu8h8TXSLvlJJLy3H6jJB27ztFLgzVglSM=; b=DhOypQAlf5fgRtsAc9RWeZI1lJ
	jx1JYa1Xy16FjQkGslwgqI0AIQsfUAZMUJ60NPtQGbFmG/YGdF5786MbYS+ob8oGBn/4gw+akmrM9
	mm6K5ijHMAsm71+5V5hdZ/R1e52UgAV2Ql0OC62T5GG+xuuCb5inc8pjxVQjwra1Gs/N0vOgzSxO1
	eg27mYkn1dcHfP/c30lzaGlktwAkRIqNMO3EXfumaV+klk53CzkhIjMewnsImShOw+StCcVBdymdU
	SeB1hxTXQRNqVSPA9LMNzvLOgsjhHkkNYFHw2f1NKiohMLNTLVmPN/hj0+XZDGAG/zkuWD+N8Rtrx
	ieFoUeMg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lfG6A-008u1e-TZ; Sat, 08 May 2021 06:05:59 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfG2z-008tiR-Ka; Sat, 08 May 2021 06:02:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=LzsXpElDjIO7XmkOcikhnLJHW8Nb/ewAaXAWTFquzbQ=; b=D8Wk4+wV/I1x4a3+qzMWjm7OLL
 ur3IlZFcQ7FJ4owRAkyRA0fLj0g0K5W9DmdXJG85cHTSZ6nqsc++TGAQNn1xgIUqa8DSpxZQfP+ZP
 EZB89/ba5XJmkcjRQzTBRIhgUVE0b7RdM/b6YI19Zl0ad7xPdYRS3drUKH8JkxD+ZRl2y6YdY8qUP
 CiBYhMqz39dA/zF4VkB7lHbB9E9pv9AmeIgIVqDLHmoBlpBUQRflOQGuVk6A0WwINig1t728fPz+N
 fN+WhczRISWYxyZxxvWA4rRX9FROmfh+8LxSOv2jRfl3vwRKSr9BRB5xa4OOs+QCBF8Xw+N48Fr58
 xo+DaH8A==;
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lfG2u-007OFn-UA; Sat, 08 May 2021 06:02:39 +0000
X-UUID: d9ee270410af4933a42fff1489b73e5b-20210507
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=LzsXpElDjIO7XmkOcikhnLJHW8Nb/ewAaXAWTFquzbQ=; 
 b=g0RlMbaq7NRd7TDBSqXL5EaLrLPJLVjiJQzLvS6eI3Rv8UXb9CrI7OyeVcrpkq3rO7Rwg9uhs0i4+INdlbZwW7MKOsl9yN1bICSdGxq3xUUE4rBXQgk5QPlQt1mskVpmXNdaBDT1QSXhxXHkKDhfbiLzlF+BfqqgsX4z1CfS/UU=;
X-UUID: d9ee270410af4933a42fff1489b73e5b-20210507
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 289598363; Fri, 07 May 2021 23:02:33 -0700
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 7 May 2021 23:02:32 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 8 May 2021 14:02:20 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sat, 8 May 2021 14:02:19 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: Mark Rutland <mark.rutland@arm.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-spi@vger.kernel.org>, <linux-mediatek@lists.infradead.org>, Leilk Liu
 <leilk.liu@mediatek.com>
Subject: [PATCH] spi: take the SPI IO-mutex in the spi_set_cs_timing method
Date: Sat, 8 May 2021 14:02:14 +0800
Message-ID: <20210508060214.1485-1-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-TM-SNTS-SMTP: BC75931E69A775349CBFFC250E38064680A523688CABCE0898A061ACCED4A45F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210507_230238_407573_ACD96DF8 
X-CRM114-Status: GOOD (  11.61  )
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

this patch takes the io_mutex to prevent an unprotected HW
register modification in the set_cs_timing callback.

Fixes: 4cea6b8cc34e ("spi: add power control when set_cs_timing")
Signed-off-by: Leilk Liu <leilk.liu@mediatek.com>
---
 drivers/spi/spi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 2350d131871b..6bda471b9621 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3459,9 +3459,12 @@ int spi_set_cs_timing(struct spi_device *spi, struct spi_delay *setup,
 
 	if (spi->controller->set_cs_timing &&
 	    !(spi->cs_gpiod || gpio_is_valid(spi->cs_gpio))) {
+		mutex_lock(&spi->controller->io_mutex);
+
 		if (spi->controller->auto_runtime_pm) {
 			status = pm_runtime_get_sync(parent);
 			if (status < 0) {
+				mutex_unlock(&spi->controller->io_mutex);
 				pm_runtime_put_noidle(parent);
 				dev_err(&spi->controller->dev, "Failed to power device: %d\n",
 					status);
@@ -3472,11 +3475,13 @@ int spi_set_cs_timing(struct spi_device *spi, struct spi_delay *setup,
 								hold, inactive);
 			pm_runtime_mark_last_busy(parent);
 			pm_runtime_put_autosuspend(parent);
-			return status;
 		} else {
-			return spi->controller->set_cs_timing(spi, setup, hold,
+			status = spi->controller->set_cs_timing(spi, setup, hold,
 							      inactive);
 		}
+
+		mutex_unlock(&spi->controller->io_mutex);
+		return status;
 	}
 
 	if ((setup && setup->unit == SPI_DELAY_UNIT_SCK) ||
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
