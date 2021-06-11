Return-Path: <SRS0=puoQ=LF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C604AC48BD1
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 11:15:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93433613C8
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Jun 2021 11:15:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 93433613C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8IJgtQnIBeD8WvTzDoEPpuzjIVb59ccgwGkFSKhVhao=; b=JJECdGjW/Gog1y
	8V9XOlhrkZBMcoUq8OiCPIHfTY7IBmDsNxSza4aGe2hwSS/c9Apc+qfAw5xKv+zDcGzbBqWSmMMIv
	6pNr9DT6BS/5CPQKOLGkbYuJ8YEEqprJQtwRsGE2ch9JpaoR4hlYb/TOF0a52SVXgoBRbtG71JQJY
	zFNtcL4nJkilWJKA1FmobjWPsMGCJbhpa3S9o3qv1RVbAL/wlOioRAIiaoA/jI5LOBoJJHRYRIkXw
	RxozrYb4lQcYXFzzum8Wq4GxE5MwRzZY38v6kvwGt/2s8u9nSxJ9x2Mi9bftK6yXpCicEtrO+OQjP
	ce2OQ2b6d2yvKzwb/6jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lrf7q-004xXR-G9; Fri, 11 Jun 2021 11:14:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lrf6B-004wlN-8p; Fri, 11 Jun 2021 11:13:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 193696109E;
 Fri, 11 Jun 2021 11:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623409994;
 bh=/k+3lM8FCcwSaHqv2P5+2MbpRxWaZc7shGXGvJaDrsA=;
 h=From:To:Cc:Subject:Date:From;
 b=HFhsn+A7kFQbIfcP3v6qfhd3ZDPQnEi7Fazrn4TL9YmzmvSxpt9e3PumbXrCumIQG
 QtAFfkxG7OScdQjUYrrrFH7GeYANTcPv16FKeK0DjCvF2nHEC36xWZnTuYitiuloH1
 8P523IVy2oPas+6E7PlrYvVbC49YWvMdCGvnRpNBzd1LBeRcjMkoJ1dQWhkCp1pMdX
 Vmindf69LDAFEMllkklpaB4dptWCq+Gs0M5l/295UGCCdBSJGyReGbiqKBYvw/SB/+
 DcQBdZPEfwapuxw/APCBNaapadjVEO2Cf8hSYb/UoLWnngecztBQL0xn0GLEhD6n3A
 MhM720W7m3q9Q==
From: matthias.bgg@kernel.org
To: james.lo@mediatek.com
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] soc: mediatek: pwarp: delete confusing comments
Date: Fri, 11 Jun 2021 13:13:07 +0200
Message-Id: <20210611111307.29038-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210611_041315_380083_4C734303 
X-CRM114-Status: GOOD (  10.43  )
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

From: Matthias Brugger <matthias.bgg@gmail.com>

Comments sugguest that MT8195 arb_en_all and int_en_all values need to
be confirmed. But actually these values are correct.

Suggested-by: James Lo <james.lo@mediatek.com>
Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

---

 drivers/soc/mediatek/mtk-pmic-wrap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
index 952bc554f443..118eb4acdeb6 100644
--- a/drivers/soc/mediatek/mtk-pmic-wrap.c
+++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
@@ -2047,8 +2047,8 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
 static struct pmic_wrapper_type pwrap_mt8195 = {
 	.regs = mt8195_regs,
 	.type = PWRAP_MT8195,
-	.arb_en_all = 0x777f, /* NEED CONFIRM */
-	.int_en_all = 0x180000, /* NEED CONFIRM */
+	.arb_en_all = 0x777f,
+	.int_en_all = 0x180000,
 	.int1_en_all = 0,
 	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
 	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
