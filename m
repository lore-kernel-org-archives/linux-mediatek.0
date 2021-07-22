Return-Path: <SRS0=Khw4=MO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03AC8C63793
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:44:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C312E6023B
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Jul 2021 07:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C312E6023B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=a2q2bczDgW0WCr7esiJ/dhAkIMd+ye3h3xPGLjg4oOw=; b=CBdXAww0ixJ5Kr
	hjHPQ+9Z9JrtIlN62CDPMffhzKThwsCG6oB+y9SwLAiOT2QYtn9JevRNqwV4epxXvH5ah7Bky5iZN
	P8UrGpEAVQoxIa4O5zlaptuZu2CH41H+xkPll6rjO6aCK3c9CKlhJxqRJZgbCIte8rp6OJgg7uCkk
	fOpbqx8/jRPE8TP7iAmPO8XGeawoFzvDz+DvDK6gSferDtCSMrsZnErw13C6m8/4yk3A1pO/Tuj0l
	aekuQazKAEAMgnG4MPCABYhHHcGmjBzoXhLWsju2BPb2f6EqZHRMy3hhQUtyEdg3TEaKt6z/jsdDI
	7HOSd32aX1j8+hk3V7Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6TMz-000ZBD-GC; Thu, 22 Jul 2021 07:43:49 +0000
Received: from mail-pj1-f49.google.com ([209.85.216.49])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6TMx-000Z8p-7J
 for linux-mediatek@lists.infradead.org; Thu, 22 Jul 2021 07:43:48 +0000
Received: by mail-pj1-f49.google.com with SMTP id
 gv20-20020a17090b11d4b0290173b9578f1cso2922054pjb.0
 for <linux-mediatek@lists.infradead.org>; Thu, 22 Jul 2021 00:43:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ex+u7pPojQ9p9mbp1qfF2tczFCJOho/PW6eHa/b1IFQ=;
 b=Br1WLTYY8MUV7IEuX7x/uOmmvJNNpLj4MsZkBS7VLTQ9jD24Jc4EEeNW9BH5lPoqaR
 8iqq5QuTQkSBQCcL+LcrZA1B6hSmTyh3xKHjFrWXFHMjr4hMNqNbb3tMheP959T/lOfX
 42q+8h8E1dfu6/G43slxo60ovnZRzPMHV3iNZoI3QVO5AZMWdRxIDH9KwDGy1NFLIG97
 /FYN+hN1sUw7eSz7xzmBDkY1ib06I1s8ICgscxAYQq4c42MVvbPVpdNBP1EO+AyceQLZ
 TCKMMyj67Y2WMYMyRS76e6i39Yf5+70qZlqFmX69C4pnDy6/IqN43J+MGwAl3saPoImG
 PWNg==
X-Gm-Message-State: AOAM530DoHlQMeP9+CYG8uCxK4YufF1sD4XYACyj4J2pxWH6umH7IiGS
 PaDdVXJBQdyaG6hvvzc9PzU=
X-Google-Smtp-Source: ABdhPJx6D3jb06v1EKqmb5MR4vsHz863fty8bcDx73SZ1ICN/tsq5sgVmV+ZwH5GrvMj/yqRrIcZEw==
X-Received: by 2002:a17:90a:530e:: with SMTP id
 x14mr39739413pjh.128.1626939824247; 
 Thu, 22 Jul 2021 00:43:44 -0700 (PDT)
Received: from localhost (61-220-137-37.HINET-IP.hinet.net. [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id x26sm30298886pfj.71.2021.07.22.00.43.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Jul 2021 00:43:43 -0700 (PDT)
From: You-Sheng Yang <vicamo.yang@canonical.com>
To: Marcel Holtmann <marcel@holtmann.org>,
 Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: linux-bluetooth@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, chris.lu@mediatek.com,
 will-cy.lee@mediatek.com, rex-bc.chen@mediatek.com,
 "mark-yw . chen" <mark-yw.chen@mediatek.com>,
 Andy Chi <andy.chi@canonical.com>
Subject: [PATCH 2/2] Bluetooth: btusb: Add Mediatek MT7921 support for IMC
 Network
Date: Thu, 22 Jul 2021 15:43:38 +0800
Message-Id: <20210722074338.760456-3-vicamo.yang@canonical.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722074338.760456-1-vicamo.yang@canonical.com>
References: <20210722074338.760456-1-vicamo.yang@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210722_004347_314936_0B5B6B0B 
X-CRM114-Status: GOOD (  11.05  )
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

From: Andy Chi <andy.chi@canonical.com>

Add Mediatek MT7921 support for IMC Network (VID=13d3).

* /sys/kernel/debug/usb/devices
T:  Bus=01 Lev=01 Prnt=01 Port=02 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=13d3 ProdID=3567 Rev= 1.00
S:  Manufacturer=MediaTek Inc.
S:  Product=Wireless_Device
S:  SerialNumber=000000000
C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
A:  FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=81(I) Atr=03(Int.) MxPS=  16 Ivl=125us
E:  Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E:  Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   0 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   0 Ivl=1ms
I:  If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=   9 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=   9 Ivl=1ms
I:  If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  17 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  17 Ivl=1ms
I:  If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  25 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  25 Ivl=1ms
I:  If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  33 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  33 Ivl=1ms
I:  If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  49 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  49 Ivl=1ms
I:  If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E:  Ad=83(I) Atr=01(Isoc) MxPS=  63 Ivl=1ms
E:  Ad=03(O) Atr=01(Isoc) MxPS=  63 Ivl=1ms
I:* If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us
I:  If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E:  Ad=8a(I) Atr=03(Int.) MxPS=  64 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS=  64 Ivl=125us

Signed-off-by: Andy Chi <andy.chi@canonical.com>
---
 drivers/bluetooth/btusb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index b71dbb2c9f5e..e2a6f0c99e3f 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -417,6 +417,9 @@ static const struct usb_device_id blacklist_table[] = {
 	{ USB_DEVICE(0x04ca, 0x3802), .driver_info = BTUSB_MEDIATEK |
 						     BTUSB_WIDEBAND_SPEECH |
 						     BTUSB_VALID_LE_STATES },
+	{ USB_DEVICE(0x13d3, 0x3567), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH |
+						     BTUSB_VALID_LE_STATES },
 
 	/* Additional Realtek 8723AE Bluetooth devices */
 	{ USB_DEVICE(0x0930, 0x021d), .driver_info = BTUSB_REALTEK },
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
