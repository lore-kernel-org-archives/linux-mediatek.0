Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C199EC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 22:03:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 807BE20771
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 22:03:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="SPW6AoIC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="fbqxBg2v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 807BE20771
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6UCtomGFuEBqE6fRHE83JC9kSrWJ0CREw9fvzAW7ZZg=; b=SPW6AoICTNjv7JkB3IVtPOrauy
	dzbTdserdPkSXH5JatrHhVj+z6jMKvMnClgnfrE9Hu1JmlXkuEp+bo5PRExFUc+FMksLbnsdd72yi
	unpih93SRxdoUtYHjofE9pNx9drpOOfMhZWZPWY6dXWMKBrh6xiT+nd4iWrIOuD47RukOxzu5+56a
	kPusY2eXb3mZCSdPl5AeKAXNBT7u2qiF93Pv0X+Go9sgnY3cq0GctlfI2e52pnjEkEkKOUKTrcwzh
	P3DNEE8MoVF+wvbDADiKeNQLbw/X5JQwj5eLo+zW8B4HwQUyAvfylLpPMTSTMIT8T0HhIcthqZ9yc
	wQCTgi3g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6LJD-0004Au-4A; Thu, 13 Aug 2020 22:02:51 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6LJB-0004AD-2m
 for linux-mediatek@lists.infradead.org; Thu, 13 Aug 2020 22:02:50 +0000
X-UUID: 7c74a940b8db4c85bccfbbc7e2148723-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=rD0m4doqCUrNGdW0dCK8TkYRyBtDiT5wCBqL1d3SJ2o=; 
 b=fbqxBg2vdVmgE6fdEP8F75F3gcCfFqPaZKhM49Ezmx0+J7cPTTx15dOL37leD00HY6q37KAyhPGzrF2XBERTkLv6D7DnDbAbiAzavKaJRE84bl46eVlnbQ2NaiAa9DbDafBgTDkDCzeYv2w/agbUF4vp/GEifkQz6xxST3KHBJQ=;
X-UUID: 7c74a940b8db4c85bccfbbc7e2148723-20200813
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1950178720; Thu, 13 Aug 2020 13:50:04 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 14:50:02 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 05:49:49 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 14 Aug 2020 05:49:49 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH] mt76: mt7663s: fix resume failure
Date: Fri, 14 Aug 2020 05:49:47 +0800
Message-ID: <f15034742d64dde093562ed360164e1f37e10fd4.1597354840.git.sean.wang@mediatek.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_180249_319908_090937C4 
X-CRM114-Status: GOOD (  12.57  )
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
Cc: linux-mediatek@lists.infradead.org, YN Chen <YN.Chen@mediatek.com>,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

MT7663s have to rely on MMC_PM_KEEP_POWER in pm_flags for to avoid SDIO
power is being shut off.

To fix sdio access failure like "mt7663s mmc1:0001:1: sdio write failed:
-22" for the first sdio command to access the bus in the resume handler.

Fixes: a66cbdd6573d ("mt76: mt7615: introduce mt7663s support")
Co-developed-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7615/sdio.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
index b018a9675c1a..56f65345d048 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/sdio.c
@@ -424,6 +424,8 @@ static int mt7663s_suspend(struct device *dev)
 			return err;
 	}
 
+	sdio_set_host_pm_flags(func, MMC_PM_KEEP_POWER);
+
 	mt76s_stop_txrx(&mdev->mt76);
 
 	return mt7615_mcu_set_fw_ctrl(mdev);
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
