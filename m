Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18BD9D2F7DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Oct 2024 02:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rZHvVfowzI3daZqCxdNalDtcmaBy5OTc9UKJrJPe1mo=; b=jH68de1a3hGtGyD6UmGf94yYHJ
	vpcKssBC/vpl8EjC5jnK3P+eaHt/qnIc5x+XSH7IGPmYiO1tmadFO3QOFIDiT7ESXFaxe66Ttdxap
	XGdr92Q11itLDDzPEEFc3oysuZ6f5F99CbKodNOangMAEG5oZLxNWoVoCPn+Rre29wWDPUklxwtlB
	Ph57SaU1DeWdv/cVq6gmrJhk8V7JjZn/tEmx8ZrNrJ046kSf33WEDSvZXZtcd+tXaL37NG+tFYTV5
	tmTFUQgu5OdAsw7PSJQXbsYTifwS5XJt8PfmC772I3pen/NtvPzt0cBEjEmr1XS+nQqyeKx4YPIN2
	GOpXYCWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1GEs-0000000DYUF-0mBu;
	Thu, 17 Oct 2024 02:27:46 +0000
Received: from smtpbguseast2.qq.com ([54.204.34.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1GDN-0000000DYLu-0Ld9;
	Thu, 17 Oct 2024 02:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1729131914;
	bh=rZHvVfowzI3daZqCxdNalDtcmaBy5OTc9UKJrJPe1mo=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=hyWWmKpMObmnWtr9UJ+WHOk1f9+bfsVUtoUPTLpUYtDnzt/9qAF8EBjIk6UDbO3K8
	 OlEEYiYGhFcmUkU0MFARq0RZ+DL2BM6vKd0NSslG/Mp1Dmh93X7DbPn5M94Fbs98wP
	 G79iFp/O13uB26ke/BjDEQt1q9fL9ARiJxM8Yxp0=
X-QQ-mid: bizesmtpsz13t1729131878t8vehn
X-QQ-Originating-IP: R8LP9wFVVRb29t4eRnx8s4PSHdaUWr6JRjPv5XZ/nhM=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 17 Oct 2024 10:24:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 16719627143748163980
From: WangYuli <wangyuli@uniontech.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	johan.hedberg@gmail.com,
	matthias.bgg@gmail.com,
	hello@felixjara.me,
	wangyuli@uniontech.com
Cc: linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com,
	aaron.ma@canonical.com
Subject: [RESEND. PATCH v2] Bluetooth: btusb: Add MT7925 support for ID 0x13d3:0x3608
Date: Thu, 17 Oct 2024 10:24:33 +0800
Message-ID: <3DBBE09166DE4374+20241017022433.50800-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OEbZSWfyiQCUR+5mE0k0JnUQla4wPZJwj8Otq4Ia/tRPBe9iDTnh/4si
	3wUG56yqlJ9E0gny5kJtdLKSGIhDRTb3SdUpkw8mAncEnAnwhL7pepINh+q01kQZFeVeDx0
	KdXFKL0RouWT9OXDyoPaicjmc+tJLzgNuV2zlrfQsByTy2JPA0vN/rDn9jvA9AuGorlbDV6
	dOEpJ9Ft0sUfU1/KFpWKzlRDGKpcToWGJTkdn2ZW9uEBNrVAe7qUDkL3OLTHT52mjDJa5bi
	O2Q/5CSAqeae9hCL+SK66VD/TnpWdwzPIzcfQPbKN3BlSEzchvIf1EzneGyl2YaGsKYY6NN
	aUVtDGhHv3S2qoInWXYAkrqhdhK8Au6DN/+j+eq7Ty1/Q4E5iZyBAaagmv7ZxMrVb8zmg0T
	CZgHGBpmG+OWXaX8tNMesDroRjgZtGu6jPlItYidxF7h10rNRg6Jr0EMlA8WI7qm1mN15Q+
	xH4StL5nSyDmsVc1vA8kZuZqEhnRVwHR4l2MOaAEz13fEqqcSlFwmrLGFHraeG1uIbD/i36
	YpN5dLVAEfZMaC/BdVX8u39Ovx/p4R/s14hubxzxSU4UPXXcCmQFCYqN3LU9iwLB0ectzo/
	hhHc7m3QGo067vCKG5WKFSb3EjDoZPh67qd/7Mi6TDXblPWndO9keT6etTXuZsh7swl+zSE
	w6J1rqGxTVdGzKoOC6CYTMmL0PApQhiiOUwtgX8sRUsPdfU3yAegGjwxxgH6CY1qutlQprr
	vkiGs5zIEEcm6OUmeFdIY+i0s+t2JujJ5cBgC+1s5LcHDe/HkXMpfbAalMHR4IBmECJ/MsR
	RoTrPBqRX9yfxQTQPA5B+TtJYxG5XiBrmuqrrqPIH8pvUgapLIqW6JZ1NRUA/4BBTuHFwwC
	HayjJZbWUpQkX8yuM+x3yvx7nn0/gzgJCsRbNtqlaIRVf+cXdkMPAFhLwPp6gYM/eSOWVHA
	rm/8bz+xqypF656uA+KtaXO5hXPYn2Rv4R7XeuMUzzf7GRJjCvkXWInWh
X-QQ-XMRINFO: Mp0Kj//9VHAxr69bL5MkOOs=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_192614_054098_52F73699 
X-CRM114-Status: UNSURE (   8.89  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Félix Jara <hello@felixjara.me>

Add compatibility Bluetooth device MT7925 for Asus UM5606 with
ID 13d3:3608.

The device info from /sys/kernel/debug/usb/devices as below.

T:  Bus=03 Lev=01 Prnt=01 Port=00 Cnt=01 Dev#=  2 Spd=480  MxCh= 0
D:  Ver= 2.10 Cls=ef(misc ) Sub=02 Prot=01 MxPS=64 #Cfgs=  1
P:  Vendor=13d3 ProdID=3608 Rev= 1.00
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
E:  Ad=8a(I) Atr=03(Int.) MxPS= 512 Ivl=125us
E:  Ad=0a(O) Atr=03(Int.) MxPS= 512 Ivl=125us

Tested in Asus Zenbook S 16 UM5606XA

Co-developed-by: Félix Jara <hello@felixjara.me>
Signed-off-by: Félix Jara <hello@felixjara.me>
Tested-by: Félix Jara <hello@felixjara.me>
Link: https://github.com/openSUSE/kernel/pull/10
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/bluetooth/btusb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index cd22b34542d5..4adae0be8222 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -512,6 +512,11 @@ static const struct usb_device_id blacklist_table[] = {
 						     BTUSB_WIDEBAND_SPEECH |
 						     BTUSB_VALID_LE_STATES },
 
+	/* MediaTek MT7925 Bluetooth devices */
+	{ USB_DEVICE(0x13d3, 0x3608), .driver_info = BTUSB_MEDIATEK |
+						     BTUSB_WIDEBAND_SPEECH |
+						     BTUSB_VALID_LE_STATES },
+
 	/* Additional Realtek 8723AE Bluetooth devices */
 	{ USB_DEVICE(0x0930, 0x021d), .driver_info = BTUSB_REALTEK },
 	{ USB_DEVICE(0x13d3, 0x3394), .driver_info = BTUSB_REALTEK },
-- 
2.45.2


