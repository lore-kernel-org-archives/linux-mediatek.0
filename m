Return-Path: <SRS0=0SFh=HJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F6DEC433E6
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 03:10:53 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 917A664E90
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 03:10:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 917A664E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YpDGEGamJaCVGI7iev0C4WGHS68PbhElKOMy53F7+SU=; b=PefBfnV4jlWX3YpimMukGrkWJ
	QngnpwQ2D9AUgiPo+2mfzcovpxoRxDkeel/wlM0ysVvveQUPOo3Xj6e2vQOmuRuEFsXCWjal9VzJc
	2ykrj57Ry69EupaijMty8CcvXJkhoPc2aStMRFsH6jcEvVFqSKjxNF4eQHHH3bwBXMljHEHjdf/Zu
	vSjYReRsWrnVaTXsFYSwVGcztZHcM2K11Xxq9GDrPsqzYHh1rupSqPWH0pm1QDQ8BMWj19bLr9Jz8
	PxQbuVPO19F/BiWUs4jCbmam3jFO2xW5P/jFPM/2oAQCoKndJv/Z4JdcaeE34yqGycfj6ls60ucAm
	fjspfi+UA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8aTB-0008Jj-1p; Sun, 07 Feb 2021 03:10:41 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8aT0-0008Gm-Ez; Sun, 07 Feb 2021 03:10:32 +0000
X-UUID: 90346648fdb5456096be53cf0597ed3e-20210206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=fTnLbW2pFpu2Tbr+fGhM5QaK8/ODgWWB1XxlN83IeFI=; 
 b=aN5oelD0y98qiD5SbVf8WTx7J1Kmx0bPdERj1FkKHqX/yiWRXoF3Nr+EWUQI9BzW4MdDUlo7Qy0EkKnd5sY8A5s9uv+3zFqUh1bhCwQTWk6JAbkG8fZ0H31rqQDPcCjzzBKKQbRM3eLrEN7U3w965DmmJ5I/f49IKc+VivFIu+c=;
X-UUID: 90346648fdb5456096be53cf0597ed3e-20210206
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 537856136; Sat, 06 Feb 2021 19:10:23 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 19:10:22 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Feb 2021 11:10:11 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 7 Feb 2021 11:10:10 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 1/3] spi: add power control when set_cs_timing
Date: Sun, 7 Feb 2021 11:09:51 +0800
Message-ID: <20210207030953.9297-2-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210207030953.9297-1-leilk.liu@mediatek.com>
References: <20210207030953.9297-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 2D5E1EFB4EBE03BA69EC4B61375D92D6EAFFE92DE3365406245FC32B6A9190C12000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_221030_654134_91C99660 
X-CRM114-Status: GOOD (  11.88  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 "leilk.liu" <leilk.liu@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-spi@vger.kernel.org, fparent@baylibre.com,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: "leilk.liu" <leilk.liu@mediatek.com>

As to set_cs_timing takes effect immediately, power spi
is needed when call spi_set_cs_timing.

Signed-off-by: leilk.liu <leilk.liu@mediatek.com>
---
 drivers/spi/spi.c | 25 ++++++++++++++++++++++---
 1 file changed, 22 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index a17efa8c3047..21ea3e8a00e2 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -3460,11 +3460,30 @@ EXPORT_SYMBOL_GPL(spi_setup);
 int spi_set_cs_timing(struct spi_device *spi, struct spi_delay *setup,
 		      struct spi_delay *hold, struct spi_delay *inactive)
 {
+	struct device *parent = spi->controller->dev.parent;
 	size_t len;
+	int status;
+
+	if (spi->controller->set_cs_timing) {
+		if (spi->controller->auto_runtime_pm) {
+			status = pm_runtime_get_sync(parent);
+			if (status < 0) {
+				pm_runtime_put_noidle(parent);
+				dev_err(&spi->controller->dev, "Failed to power device: %d\n",
+					status);
+				return status;
+			}
 
-	if (spi->controller->set_cs_timing)
-		return spi->controller->set_cs_timing(spi, setup, hold,
-						      inactive);
+			status = spi->controller->set_cs_timing(spi, setup,
+								hold, inactive);
+			pm_runtime_mark_last_busy(parent);
+			pm_runtime_put_autosuspend(parent);
+			return status;
+		} else {
+			return spi->controller->set_cs_timing(spi, setup, hold,
+							      inactive);
+		}
+	}
 
 	if ((setup && setup->unit == SPI_DELAY_UNIT_SCK) ||
 	    (hold && hold->unit == SPI_DELAY_UNIT_SCK) ||
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
