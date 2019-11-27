Return-Path: <SRS0=L+xn=ZT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECFCBC432C0
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 03:01:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE5222075C
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Nov 2019 03:01:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ZQUbqE5z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE5222075C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=realtek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=N33NbkghcUyVdwXS84w+TMiVrv7BotAey83yWhp1YgE=; b=ZQUbqE5zK26nZN
	0hFVU3+ZxhcWXB0g+fszJQSlve7JBoobnKSvsGhB4ynyBGTyjtUMSm2OpD8I08locDA8CMQDH0Y02
	O5avkH2YathPEL9iWAqdSfuFi9603rzmpXqasgD4kFDnoEO2uMXdrytHmb76BqOISBwxRuH7JYDSb
	ff7rKBWNDCbIaM6j6IQplFCLtUcZASkmaugPNdjaIeV1FhdzkSWdAyk7hDLfwq1naclIMZh2d/SF7
	EEynN9/vedwExm0W5ty/EtR3wPaW4GzH5jCzmFjmzEiDpj9S8OpR1sADc/R6pRTqJ9NKc9Ir2Xgm4
	NoyoOdiiDLXwFQbYyqSg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iZnaL-0004rr-S2; Wed, 27 Nov 2019 03:01:45 +0000
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1iZna9-0004kW-6h; Wed, 27 Nov 2019 03:01:37 +0000
Authenticated-By: 
X-SpamFilter-By: BOX Solutions SpamTrap 5.62 with qID xAR31C2b020528,
 This message is accepted by code: ctloc85258
Received: from mail.realtek.com (RTITCASV01.realtek.com.tw[172.21.6.18])
 by rtits2.realtek.com.tw (8.15.2/2.57/5.78) with ESMTPS id xAR31C2b020528
 (version=TLSv1 cipher=DHE-RSA-AES256-SHA bits=256 verify=NOT);
 Wed, 27 Nov 2019 11:01:12 +0800
Received: from localhost.localdomain (172.21.83.238) by
 RTITCASV01.realtek.com.tw (172.21.6.18) with Microsoft SMTP Server id
 14.3.468.0; Wed, 27 Nov 2019 11:01:11 +0800
From: <max.chou@realtek.com>
To: <marcel@holtmann.org>
Subject: [PATCH] Bluetooth: btusb: Edit the logical value for Realtek
 Bluetooth reset
Date: Wed, 27 Nov 2019 11:01:07 +0800
Message-ID: <20191127030107.17604-1-max.chou@realtek.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [172.21.83.238]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191126_190133_499468_E76F0E07 
X-CRM114-Status: UNSURE (   7.98  )
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
Cc: max.chou@realtek.com, johan.hedberg@gmail.com, linux-kernel@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, alex_lu@realsil.com.cn,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Max Chou <max.chou@realtek.com>

It should be pull low and pull high on the physical line for the Realtek
Bluetooth reset. gpiod_set_value_cansleep() takes ACTIVE_LOW status for
the logical value settings, so the original commit should be corrected.

Signed-off-by: Max Chou <max.chou@realtek.com>
---
 drivers/bluetooth/btusb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 70e385987d41..82fb2e7b2892 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -552,9 +552,9 @@ static void btusb_rtl_cmd_timeout(struct hci_dev *hdev)
 	}
 
 	bt_dev_err(hdev, "Reset Realtek device via gpio");
-	gpiod_set_value_cansleep(reset_gpio, 0);
-	msleep(200);
 	gpiod_set_value_cansleep(reset_gpio, 1);
+	msleep(200);
+	gpiod_set_value_cansleep(reset_gpio, 0);
 }
 
 static inline void btusb_free_frags(struct btusb_data *data)
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
