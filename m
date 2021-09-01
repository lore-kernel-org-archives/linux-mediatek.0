Return-Path: <SRS0=BCEy=NX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EDE6C432BE
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 03:33:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C25860E98
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Sep 2021 03:33:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4C25860E98
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l1DIoCnJ1PT2suqmrUDA0gXKcY0Oty58UZsN7Gy7ExI=; b=4xC/TPnEBh4Mg2
	+tLkBN9nXshp6lxIZStbuQF6V7jMjJ5P0FC0yChQI9kk5NoVi1LCSg5xBNyiz7HNZJcwroVXT9Wi6
	XT4quNAQce6qj2JY8dJLeBQAKEbISwojDZxeMwhMLgyYIXJ4Eqm6DZx7UY2HuHZzM/IjTsxy95P1V
	gpyzKAomq4aXcqghiYVeYORjANMcNNhPsdImdMLc5EKCtpT1HeSjtA4v4fIuYG8c3V3AJK+2oum3a
	zHCfVMku4Hv2zd2Ger/SWOBt/ZRgkHtb5Ce2c5HctACzrR0t0dgC1fp49GX/6TyE/vokYl8F5K1y6
	KLPk21g+nM8pb6hfeeIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mLGze-003fbW-Gb; Wed, 01 Sep 2021 03:32:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mLGza-003fZX-1Q
 for linux-mediatek@lists.infradead.org; Wed, 01 Sep 2021 03:32:53 +0000
X-UUID: 196f9a664c5246e49ab1cf96816a9f6e-20210831
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=RN4oMEhS0UA1wHIXlqHV4xSTBh+/e4g3gYX5ppiDNOo=; 
 b=MHPzC9O1wunB9rSGUvia2f9Wty8901amzkHgdYJPe01Qyh/TcggwmQZ/4vZ/Q/sEzQX8m9iYUIXx0ZU+BlxFFz0I6dexdwspBXEKd2K4+NQrznJAkhV6GsbB/b6hqpBt1IBQwyAv+VmXGhYYQuhGTRvVWgjFMsfCJrlLy3yQX7w=;
X-UUID: 196f9a664c5246e49ab1cf96816a9f6e-20210831
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <mark-yw.chen@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2080261761; Tue, 31 Aug 2021 20:32:47 -0700
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 31 Aug 2021 20:32:46 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 1 Sep 2021 11:32:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Wed, 1 Sep 2021 11:32:38 +0800
From: <mark-yw.chen@mediatek.com>
To: <marcel@holtmann.org>, <johan.hedberg@gmail.com>
CC: <chris.lu@mediatek.com>, <linux-bluetooth@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <michaelfsun@google.com>, <mcchou@chromium.org>, mark-yw.chen
 <mark-yw.chen@mediatek.com>
Subject: [PATCH v2 2/2] Bluetooth: btusb: Add protocol for MediaTek bluetooth
 devices(MT7922)
Date: Wed, 1 Sep 2021 11:32:26 +0800
Message-ID: <20210901033226.20693-2-mark-yw.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20210901033226.20693-1-mark-yw.chen@mediatek.com>
References: <20210901033226.20693-1-mark-yw.chen@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210831_203250_132213_6EB14650 
X-CRM114-Status: UNSURE (   9.48  )
X-CRM114-Notice: Please train this message.
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

From: "mark-yw.chen" <mark-yw.chen@mediatek.com>

The information in /sys/kernel/debug/usb/devices about the MT7922U
Bluetooth device is listed as the below.

T: Bus=01 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#= 18 Spd=480 MxCh= 0
D: Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs= 1
P: Vendor=0e8d ProdID=7922 Rev= 1.00
S: Manufacturer=MediaTek Inc.
S: Product=Wireless_Device
S: SerialNumber=000000000
C:* #Ifs= 3 Cfg#= 1 Atr=e0 MxPwr=100mA
A: FirstIf#= 0 IfCount= 3 Cls=e0(wlcon) Sub=01 Prot=01
I:* If#= 0 Alt= 0 #EPs= 3 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=81(I) Atr=03(Int.) MxPS= 16 Ivl=125us
E: Ad=82(I) Atr=02(Bulk) MxPS= 512 Ivl=0ms
E: Ad=02(O) Atr=02(Bulk) MxPS= 512 Ivl=0ms
I:* If#= 1 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 0 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 0 Ivl=1ms
I: If#= 1 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 9 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 9 Ivl=1ms
I: If#= 1 Alt= 2 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 17 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 17 Ivl=1ms
I: If#= 1 Alt= 3 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 25 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 25 Ivl=1ms
I: If#= 1 Alt= 4 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 33 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 33 Ivl=1ms
I: If#= 1 Alt= 5 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 49 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 49 Ivl=1ms
I: If#= 1 Alt= 6 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=btusb
E: Ad=83(I) Atr=01(Isoc) MxPS= 63 Ivl=1ms
E: Ad=03(O) Atr=01(Isoc) MxPS= 63 Ivl=1ms
I:* If#= 2 Alt= 0 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E: Ad=8a(I) Atr=03(Int.) MxPS= 64 Ivl=125us
E: Ad=0a(O) Atr=03(Int.) MxPS= 64 Ivl=125us
I: If#= 2 Alt= 1 #EPs= 2 Cls=e0(wlcon) Sub=01 Prot=01 Driver=(none)
E: Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
E: Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us

Signed-off-by: mark-yw.chen <mark-yw.chen@mediatek.com>
---
 drivers/bluetooth/btusb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 41e7c9f28d82..66c8f3cdc0c0 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2821,6 +2821,7 @@ static int btusb_mtk_setup(struct hci_dev *hdev)
 	case 0x7668:
 		fwname = FIRMWARE_MT7668;
 		break;
+	case 0x7922:
 	case 0x7961:
 		snprintf(fw_bin_name, sizeof(fw_bin_name),
 			"mediatek/BT_RAM_CODE_MT%04x_1_%x_hdr.bin",
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
