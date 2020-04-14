Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D829C2BBFD
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 03:41:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E26E62075E
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 03:41:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bD6mlnMT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="qMawx4L1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E26E62075E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7o2K411LsH9HX3lBXJtbkDAdbEBUyINx8Tl7OJZaJs=; b=bD6mlnMTHlYOGi
	bvtRXdvuvgt3cVerVVbDuBGxoqZVPfya0LZlAin/u4jJkGxHHZnLZuVQ0R0o7RAH02mqthDQpCxSr
	si9u195XpaSWCTONjfqSYDVKq2/yjxdiRswTxT0HqOOKz8ORbuH4Ixse4CsY46VTxlgGXCcf9SEBz
	Ucq4yLgDa0oWiMKbyo/YQOGKL/ofqM9uLYzJtqZIPCLLFxkBYm+Vf9LxD7YTNx4hSqey2MGN87Irs
	HpGJpw1Mjf+rbbbwKleRuTpflWikqBLEp1nDqp3BMfQHsrKUYr48PcAc398hWoT3SHMbCtlCPQ+8j
	/vAbpoFiGArmsTRM3/kg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOCRy-0003gm-IJ; Tue, 14 Apr 2020 03:41:26 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOCRZ-0003Fe-01; Tue, 14 Apr 2020 03:41:02 +0000
X-UUID: fd01ed7e97d241e285bd99c3de5f8f15-20200413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=JsY5/5MxfWy5R02rcWXL2W12h0vpsAqE2P25DGsOcwQ=; 
 b=qMawx4L1R/SjXIumd+N18jT98mhib9GBHE/6xKN4SzsESCYRKHzRFy2RFV/S12IkcmRMtOP8nuA40Yr4WSdE1IqQrgFlKhNQXzUB0F78b2+qDR+6rcKIBXyD4YvKtI9zOZ1r+tTLDm5AIXe9awqXheBy1WtQ/Qr88X2Bb4VKYGQ=;
X-UUID: fd01ed7e97d241e285bd99c3de5f8f15-20200413
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yong.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1933411572; Mon, 13 Apr 2020 19:40:57 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Apr 2020 20:40:56 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Apr 2020 11:40:55 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Apr 2020 11:40:49 +0800
From: Yong Mao <yong.mao@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 2/3] mmc: core: rocr verification
Date: Tue, 14 Apr 2020 11:40:10 +0800
Message-ID: <1586835611-13857-3-git-send-email-yong.mao@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586835611-13857-1-git-send-email-yong.mao@mediatek.com>
References: <1586835611-13857-1-git-send-email-yong.mao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_204101_048964_2854300D 
X-CRM114-Status: GOOD (  11.97  )
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
Cc: srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, yong mao <yong.mao@mediatek.com>,
 linux-mediatek@lists.infradead.org, Chaotian Jing <chaotian.jing@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: yong mao <yong.mao@mediatek.com>

Some UHS SDIO devices can't enter to stable state after changing the
voltage from 1.8v to 3.3v even after a power cycle.
Verifying the rocr and the result of mmc_set_signal_voltage, if it
is not expected, power cycle SDIO device and re-initialize it again.
Thus will re-initialize the SDIO device successfully.

Signed-off-by: Yong Mao <yong.mao@mediatek.com>
---
 drivers/mmc/core/sdio.c  | 14 +++++++++++++-
 include/linux/mmc/sdio.h |  2 ++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
index ada0a80..f173cad 100644
--- a/drivers/mmc/core/sdio.c
+++ b/drivers/mmc/core/sdio.c
@@ -553,6 +553,12 @@ static void mmc_sdio_resend_if_cond(struct mmc_host *host,
 	mmc_remove_card(card);
 }
 
+static bool mmc_sdio_valid_rocr(u32 rocr)
+{
+	return (rocr & MMC_CARD_BUSY) && R4_OCR(rocr) &&
+		R4_FUNCTION_NUMBER(rocr);
+}
+
 /*
  * Handle the detection and initialisation of a card.
  *
@@ -605,6 +611,12 @@ static int mmc_sdio_init_card(struct mmc_host *host, u32 ocr,
 		goto err;
 	}
 
+	if (!mmc_sdio_valid_rocr(rocr)) {
+		mmc_sdio_resend_if_cond(host, card);
+		retries--;
+		goto try_again;
+	}
+
 	if ((rocr & R4_MEMORY_PRESENT) &&
 	    mmc_sd_get_cid(host, ocr & rocr, card->raw_cid, NULL) == 0) {
 		card->type = MMC_TYPE_SD_COMBO;
@@ -646,7 +658,7 @@ static int mmc_sdio_init_card(struct mmc_host *host, u32 ocr,
 	 */
 	if (rocr & ocr & R4_18V_PRESENT) {
 		err = mmc_set_uhs_voltage(host, ocr_card);
-		if (err == -EAGAIN) {
+		if (err == -EAGAIN || err == -EILSEQ) {
 			mmc_sdio_resend_if_cond(host, card);
 			retries--;
 			goto try_again;
diff --git a/include/linux/mmc/sdio.h b/include/linux/mmc/sdio.h
index e287699..03e23ec 100644
--- a/include/linux/mmc/sdio.h
+++ b/include/linux/mmc/sdio.h
@@ -36,6 +36,8 @@
 
 #define R4_18V_PRESENT (1<<24)
 #define R4_MEMORY_PRESENT (1 << 27)
+#define R4_OCR(x)		((x) & 0xFFFFFF)
+#define R4_FUNCTION_NUMBER(x)	(((x) & 0x70000000) >> 28)
 
 /*
   SDIO status in R5
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
