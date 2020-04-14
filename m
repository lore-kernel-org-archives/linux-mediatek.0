Return-Path: <SRS0=jJra=56=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45BBAC2BB85
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 03:42:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AEF9206C0
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Apr 2020 03:42:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AOzwnQ5i";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="hkvI7C/d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AEF9206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=chxQ5tQ1RKQlF9GNonSekux3++ZZAzA6hZ1OvAsLK3E=; b=AOzwnQ5imp+fVy
	qcPQQJE23Wx/N4eJqoyrKOYm/l6L9mySz2Od8YT00VO7mXDVVMliPL95QNJ4gFGLUvWJXJ/g8M85B
	yWv7KWxaR5P20NSkzWjaLdE7KL9+jTjQgMvG5DpJQ4eFW6cz3ryB2I55j5VZE59GzEXKCbfqWJI5H
	OeeKBdnRvwDz4wb0eVwUzh8eVKNXRAjZZXMP8dt3yTHBOJYHlZ3eiMmEEpO9ptOwYkib7WOiAw+W5
	i2SFJcxmvTqaMlGaMAxZW+B7YvKxIQi3jnvKzOdpkqaJcKePuapP0myxSxHw3RIs6JewgmtGVS9hh
	aJ2bRZupqKABWiJAAkNw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jOCSi-0004P2-O9; Tue, 14 Apr 2020 03:42:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jOCRZ-0003Fs-Jh; Tue, 14 Apr 2020 03:41:03 +0000
X-UUID: 0d821055f4ef4820b4b9259eac5052fa-20200413
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=SkuybeaYmadFxyJ4GbnzpSoKVqrqaPzUzjiC/dZm8Jw=; 
 b=hkvI7C/dlEUsEq1OtfZDTkkdZYWqJRrvmDlVyaNOzUUgfMFRs3x87M9ol+nyAEx207mmqnfjd8XdDA5P5g1wneraCwvjb7gQnhQyyfXkNQ8AAz4qJphyricLL4AY2mrD6ZySm0KKvesrFlKCLpctnN3ZGCnENaAduj2cP4HmkMo=;
X-UUID: 0d821055f4ef4820b4b9259eac5052fa-20200413
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <yong.mao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1235827447; Mon, 13 Apr 2020 19:40:58 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 13 Apr 2020 20:40:57 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Apr 2020 11:40:55 +0800
Received: from localhost.localdomain (10.17.3.153) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Apr 2020 11:40:50 +0800
From: Yong Mao <yong.mao@mediatek.com>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 3/3] mmc: core: fix mmc_sdio_reinit_card fail issue
Date: Tue, 14 Apr 2020 11:40:11 +0800
Message-ID: <1586835611-13857-4-git-send-email-yong.mao@mediatek.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1586835611-13857-1-git-send-email-yong.mao@mediatek.com>
References: <1586835611-13857-1-git-send-email-yong.mao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200413_204101_646891_1BADA3BE 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

If SDIO device is initialized by UHS mode, it will run with 1.8v power.
In this mode, mmc_go_idle may not make SDIO device go idle successfully
in some special SDIO device. And then it can't be re-initialized
successfully.
According to the logic in sdio_reset_comm and mmc_sdio_sw_reset,
invoking mmc_set_clock(host, host->f_min) before mmc_send_io_op_cond
can make this SDIO device back to right state.

Signed-off-by: Yong Mao <yong.mao@mediatek.com>
---
 drivers/mmc/core/sdio.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
index f173cad..dc4dc63 100644
--- a/drivers/mmc/core/sdio.c
+++ b/drivers/mmc/core/sdio.c
@@ -850,6 +850,7 @@ static int mmc_sdio_reinit_card(struct mmc_host *host)
 
 	sdio_reset(host);
 	mmc_go_idle(host);
+	mmc_set_clock(host, host->f_min);
 	mmc_send_if_cond(host, host->card->ocr);
 
 	ret = mmc_send_io_op_cond(host, 0, NULL);
-- 
1.9.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
