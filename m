Return-Path: <SRS0=0SFh=HJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 296D0C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 03:10:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C711264E90
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Feb 2021 03:10:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C711264E90
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FHbwlg+rPDjXIAFn/T7NIUEogL/dZ2wfaNvyywFTygA=; b=xmNmwJ96iaHbYZgwH72GTrp7A
	K/TycsJKolKb0nHcAQ1tAOXdSpniMRJ6tMc7mD/oOyjjctvGqL5WK0IlVj2ApRYLd367UYcEn7DId
	XRfv52L2KaKA7QGsb73EQtcBwbG16ucSwfY/4WDtecSjArB2GjxS8p7E5z+eeiq7DbKPsB68+tA+6
	8KBYCE4Tt/iBqj1JBePzODm30Ox8ryKRyywP+4n6CccmkoJhGUomTCu7gJW9hdGps50swhAJiK/1i
	rOZk+UWdF/x7KxpWyfdhrP87YpSYxj7ShYPnA1JXkm5LkWmBjz4VEZizJLZ8mkWWBQnM8Tp182Foi
	CeC6D6uOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8aT5-0008Ij-Oi; Sun, 07 Feb 2021 03:10:35 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8aSz-0008Gl-N2; Sun, 07 Feb 2021 03:10:31 +0000
X-UUID: 084f70a293764fcba23e6d3bf48a1626-20210206
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Sdq84meboDHzLtj488gMh2mSy38G//dKa9FNDJRj3nw=; 
 b=fStuHHzQM4bJy3f3BzcuYJZIXDl9jRawR6lj93B2M6YRXjBQcXYRL5oEKwqMXtgifg4GwpRlReAdbdYtcWB4AJr+0WSGHHmtdJ2BGiXU67Vp8nLkV/7dRkhXfC1v4sYvGTTrJiczJKLfRAfaj7dVE+zdzg5f6nMCDJFbunuqAow=;
X-UUID: 084f70a293764fcba23e6d3bf48a1626-20210206
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <leilk.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1110640572; Sat, 06 Feb 2021 19:10:23 -0800
Received: from MTKMBS31N2.mediatek.inc (172.27.4.87) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 6 Feb 2021 19:10:21 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 MTKMBS31N2.mediatek.inc (172.27.4.87) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 7 Feb 2021 11:10:13 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Sun, 7 Feb 2021 11:10:11 +0800
From: Leilk Liu <leilk.liu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Subject: [PATCH 2/3] spi: support CS timing for HW & SW mode
Date: Sun, 7 Feb 2021 11:09:52 +0800
Message-ID: <20210207030953.9297-3-leilk.liu@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210207030953.9297-1-leilk.liu@mediatek.com>
References: <20210207030953.9297-1-leilk.liu@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: A662DAAD9A6C68ADBD2A38020CC3C083FC960955591AF951F66C1BC382CB7F8D2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210206_221030_014030_3BB5DBD8 
X-CRM114-Status: GOOD (  10.91  )
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

this patch supports the controller's HW CS and SW CS via use cs_gpio.

Signed-off-by: leilk.liu <leilk.liu@mediatek.com>
---
 drivers/spi/spi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 21ea3e8a00e2..a247fcac0dc7 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -810,7 +810,8 @@ static void spi_set_cs(struct spi_device *spi, bool enable)
 	spi->controller->last_cs_enable = enable;
 	spi->controller->last_cs_mode_high = spi->mode & SPI_CS_HIGH;
 
-	if (!spi->controller->set_cs_timing) {
+	if (spi->cs_gpiod || gpio_is_valid(spi->cs_gpio) ||
+	    !spi->controller->set_cs_timing) {
 		if (enable1)
 			spi_delay_exec(&spi->controller->cs_setup, NULL);
 		else
@@ -841,7 +842,8 @@ static void spi_set_cs(struct spi_device *spi, bool enable)
 		spi->controller->set_cs(spi, !enable);
 	}
 
-	if (!spi->controller->set_cs_timing) {
+	if (spi->cs_gpiod || gpio_is_valid(spi->cs_gpio) ||
+	    !spi->controller->set_cs_timing) {
 		if (!enable1)
 			spi_delay_exec(&spi->controller->cs_inactive, NULL);
 	}
@@ -3464,7 +3466,8 @@ int spi_set_cs_timing(struct spi_device *spi, struct spi_delay *setup,
 	size_t len;
 	int status;
 
-	if (spi->controller->set_cs_timing) {
+	if (spi->controller->set_cs_timing &&
+	    !(spi->cs_gpiod || gpio_is_valid(spi->cs_gpio))) {
 		if (spi->controller->auto_runtime_pm) {
 			status = pm_runtime_get_sync(parent);
 			if (status < 0) {
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
