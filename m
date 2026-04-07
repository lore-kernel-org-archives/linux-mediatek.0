Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3156DFF510A
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2026 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mdgebIX8WCshNHCphbYwlC8WuuoYhJuJww2bMe0846A=; b=sxZ1CSlRwcmwDHu8+6eICiLXn5
	Slh0bNaRaKiNxVKnCynKMfduVSvblKw6q9kfyBs9aaF1kX4FmprQMXqaF1APF30UNu4mS8jLAFLpd
	iBJfy2KjUWEnwT8ALd0w+ZH5oyWFbx17wmD83cruWAk9ATGl3ON56Dl/WmFXHmLy40NgMLNelLbTZ
	e3adxW2SflmYyMXG49iBbEbL6k0n9VrPUw4fPl7QeIQk9+K80RNxRcqfFyfIuqtldM07B+woNvHlV
	hm4mHQnguithO9taYYzrHJ3v3TaFQWEepz8EwYvTu5x0n0nwx8RBSlfNNdT2SirwukrQyYUHv7Yc0
	o9d9MFMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8cB-00000006jkw-0bbB;
	Tue, 07 Apr 2026 15:45:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8c9-00000006jkH-3Kez
	for linux-mediatek@bombadil.infradead.org;
	Tue, 07 Apr 2026 15:45:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=mdgebIX8WCshNHCphbYwlC8WuuoYhJuJww2bMe0846A=; b=SBTBmS/KDJiNBM7lz/Mgj+4o7z
	EQeH5qwxV2lXcXvzTt+SMuioZhm//2Wx2IWtARQZJgqR2Ob6xMHjpYXWIhJf6y/d8agC8epqdDt4/
	t6zTB1bcqvUWLHpfdLBm+N9SqjJo6dudVD3CvhjZzqu1p6cod04X39j4b9ug5zt74eEZlZoliu5nD
	N9XDITnyXNTwGBNHM+4K00AaMlcYONxEPHwegzTZUsJGpa842LfOlHxJvMYEAx3BO4RmUMkWYDcwM
	xEWb4xizraQ+kaXlEEMs4TEy2Bj21P9KNhFn9B/6tPnnqZdnF1z0IYoMB4lbqNyeNgF8YS8pFUI+5
	8QdDKBig==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA8c6-00000008cWQ-3Ix5
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Apr 2026 15:45:16 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2b258576d8cso33031495ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 07 Apr 2026 08:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775576712; x=1776181512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mdgebIX8WCshNHCphbYwlC8WuuoYhJuJww2bMe0846A=;
        b=rD15C5gJrDbCxsPg7AfZyp1cXMK9BECznqTyIzJqDYeBF4rXtZw8ILdoIx9EUVXpUK
         Yt7mJDvz69FIt/N/ojQpnS/yyyLcXi4AklseUYzD1QIeJMefkWWQatSMrH5WvbC/fZ8P
         Jxii+9zVr603Mj0umwydAKUmVIwY8UR2wmannv2foHDrjfm8NWpzlrqxxFfZnqj1YHTA
         oAa22ZE24hWmpxnfHeYC4boGh+e52ac4k03jpphEtPeG+E5hPkikc9jLUvrAGLgvChue
         q33xkXEERN0TvSoyv0MS5eKGT0nHYMYwgmxojrQ23W2OF4hTL5fguntO/gWsvnk5wvyl
         t5Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775576712; x=1776181512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdgebIX8WCshNHCphbYwlC8WuuoYhJuJww2bMe0846A=;
        b=LqY+S6Xdq6/ZwVav8rIbwv0Q3A5DUnryKE+soPHKbiXukh1HdfmSQK+pzMf7B58NVH
         GTgFZetxIxKJcX7k9kCTqUqp2nlXcOZ9SaGFPYdjJu2KZSxkm967G1klZiDnkHmj71U8
         CPDQEkXb7ML1cfs0iIFKXiVjyFm2UdO6tcoBQbA/4HRw3hzjCr0erd/Xm+dy0KDdeID/
         bys1zU/g70XtBbrZtIO1XHsXFRCdGs8kq1TWcG29XL6Fkdr88X4hMqIFSVVVa4HtXy2e
         wgBZfEJp1QtV5KTI1fGgx1BgZowbWd908ZQkiixW3tF4l6UDDzHNJK346B0HZ6tDKl0P
         g5bA==
X-Forwarded-Encrypted: i=1; AJvYcCXF0UbLtLIWF9o1/CR5jiMXiSMfbSSvGh020r37qzacBj6cnikh+rLZVDcId2nGao7AUMLhO94pn4TW0JhEBg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYlml3dws+WdIoqvvmPaXSYnF7BeHNOplY1zsKdds82Ff/l6mQ
	sybIZJkvlXWXz9vrmV6e4Nw9slfmMGVsdjQv5PxdUPIwlcEkCwtUFM0b
X-Gm-Gg: AeBDieujQmElZVi7ZmXMCLt/wIlj+r2Y7lDLs6Kjs5OWLTFNZL5iVeoHB2bJC1s6FfN
	CbSVEZutVPH92xLufLbwtfUZTTosdJawdp5FIKugENB04VybTnSDWS1omZkRvGM+qmN26kkHbGD
	8ppY8g6fwsHcRodzjxk6B9qqC1bQmCE2rvf+mSUJRxBQI7vxtrManFVZQCGrQK1EyH4qiUTi7h8
	KsytXwbdfYpoBTR6FDnJXvd+qm77vhBvC9prJetAv9uzJTerggQrpWm7M0RaaaHkYuqXKYN4WVC
	uM8BKkeAJEwhPwWQSSzJbz3GhCakywMX98/bzDpCIBlRgSxnQfZJ5XW46kkW7jvQityDhf8FeCA
	59dtUOVPisAh5lfSCLGgqFkgYVxHkH+neZfqRiwRImXCR6IIsXUdGMMhHIaQxvdJb6MXlfh33Yi
	ObC0voWHmjkH+VYh817rCjVP8=
X-Received: by 2002:a17:903:1aa8:b0:2b2:42b1:ad9a with SMTP id d9443c01a7336-2b28182be11mr183382875ad.19.1775576712346;
        Tue, 07 Apr 2026 08:45:12 -0700 (PDT)
Received: from BM5220 ([49.215.226.71])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2b27472d55fsm230992905ad.11.2026.04.07.08.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 08:45:11 -0700 (PDT)
From: Zenm Chen <zenmchen@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com,
	shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: zenmchen@gmail.com,
	stable@vger.kernel.org
Subject: [PATCH mt76] wifi: mt76: mt76x2u: Add support for ELECOM WDC-867SU3S
Date: Tue,  7 Apr 2026 23:44:30 +0800
Message-ID: <20260407154430.9184-1-zenmchen@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_164514_934412_B516EE53 
X-CRM114-Status: GOOD (  10.80  )
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

Add the ID 056e:400a to the table to support an additional MT7612U
adapter: ELECOM WDC-867SU3S.

Compile tested only.

Cc: stable@vger.kernel.org # 5.10.x
Signed-off-by: Zenm Chen <zenmchen@gmail.com>
---
This ID was found from [1] and adding it to the device table should be 
enough to make it work. Hardware probes at [2] can prove its existence.

[1] https://bushowhige.blogspot.com/2019/08/ubuntu-1804-mediatek-usb-wi-fi.html
[2] https://linux-hardware.org/?id=usb:056e-400a
---
 drivers/net/wireless/mediatek/mt76/mt76x2/usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
index 01cb3b283..459c4044f 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76x2/usb.c
@@ -16,6 +16,7 @@ static const struct usb_device_id mt76x2u_device_table[] = {
 	{ USB_DEVICE(0x0e8d, 0x7612) },	/* Aukey USBAC1200 - Alfa AWUS036ACM */
 	{ USB_DEVICE(0x057c, 0x8503) },	/* Avm FRITZ!WLAN AC860 */
 	{ USB_DEVICE(0x7392, 0xb711) },	/* Edimax EW 7722 UAC */
+	{ USB_DEVICE(0x056e, 0x400a) },	/* ELECOM WDC-867SU3S */
 	{ USB_DEVICE(0x0e8d, 0x7632) },	/* HC-M7662BU1 */
 	{ USB_DEVICE(0x0471, 0x2126) }, /* LiteOn WN4516R module, nonstandard USB connector */
 	{ USB_DEVICE(0x0471, 0x7600) }, /* LiteOn WN4519R module, nonstandard USB connector */
-- 
2.53.0


