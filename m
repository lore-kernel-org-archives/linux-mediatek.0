Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6DF2F436A0
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Apr 2026 13:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KCc9El91v2tJeTyCQTpkqW7vYe/zKOnr7R5NXhlhOxk=; b=vKmo490y92mmfm2sAL3ra4klgh
	bb98JgnVoVwRTQpfVpdmu5XcuDs5cIhEB7cUlP8h7ZIvVpb1zVD/4HiJBbXD+tslBXiH0mAZPfgdN
	qyqMQOxpPNJH0OjmfkIuyhrTUxpfbZ3KdYYFfzgCyypZ9ikMwMsZj+owEmBst8B6uE+bFRZ9bCTLm
	ATTRv5yWxki4OcpHcoZ02+UpONSs9furisQHCKqL8gDV6Xksh0fDHZEz9D/34gvJWZ6dYWIbaQ23o
	nlC+r715y0JH8lzcNp/nHFiENB2hLacxMiNrycKIMiyfCtHH4bK1i9rTbstWA7ZWY0S7QlfV94/X6
	KKnUq7MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiyq-000000044KS-26AD;
	Fri, 17 Apr 2026 13:11:32 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDiyk-000000044Im-2tnl
	for linux-mediatek@lists.infradead.org;
	Fri, 17 Apr 2026 13:11:31 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-43cfd832155so486998f8f.1
        for <linux-mediatek@lists.infradead.org>; Fri, 17 Apr 2026 06:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20251104.gappssmtp.com; s=20251104; t=1776431484; x=1777036284; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KCc9El91v2tJeTyCQTpkqW7vYe/zKOnr7R5NXhlhOxk=;
        b=sURbExxUNZPyj1TAe8PuQ+FPPBHA4IZTc7h+dyiypnGCpu91VUmxOp31xRXKRCiuAT
         TY5j+LEN72QQGglsBJ3xKLZaL4kMK6hpPbQbRwNdKdSpCissRAcbjimJDk1BIgV3TLPD
         /UdbpuJ7Asfbrp7uZHFctC3iUn9MI6PEJkHJg38+5qv/zOU4JJQhEZZnqFhxOkLbDa29
         ObSNI+YV07ZwnAciXWDmY5sUl0zebI22cRcmLH37lQYa4WR1/ZXBx2M3h2iQylJENk1b
         ttaDVyYiyrZFq5b2v8ELG6MNQcr89RXmLi189sPZ7rZLcCul4ZFByW5HfCUivUAUSGdL
         9Wgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776431484; x=1777036284;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KCc9El91v2tJeTyCQTpkqW7vYe/zKOnr7R5NXhlhOxk=;
        b=WjArwLvy7RnZxG/Y6WBsD3mXrjygg6lM8H2Y2GuTusJJZpTQto1v2WTq9WVv3UVUZ5
         GcZtw5qtujNfoVbQ5SczMpLEMzvKCHhiQIicEglcj1zcVDADkzHuhUkuIM4XfSynBLVP
         08JveZMQUedyxaniUhK3oDJTK2XFi41Q76QcV7ooukDbI1kQqOiZwK4fz1RiOnkIHLcL
         PXfir7sO1rcN/M5QI9dl06pCgT0t8NwNsr+szX0rlvvgXWaideRl5NZ/gcCfllujCSRf
         Q1lCtfahc7eU+NLoKITofrz5VZin0JLkGTTMOtAOASW+8ipwVAxamF6IzVc00XmdZ00z
         Yz8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9muZUQ7XF/1YZ/+MfxKa44aE+IBKENbldcoaqlCA24M0DBDmoKU9TwqM+w3j3LNvdpTUfmg8xs8DBKg+UBxw==@lists.infradead.org
X-Gm-Message-State: AOJu0YypXfdpipPa+FH7hoytrPjWpvF3kFJKYgwJ2vAYeaeXZOmSwlV5
	+H404yXu1VNWSfBcnJgJa7biZQ2Wt+ElVYbYwuIbeyfY7b0BigCJvGlYPAwseDN6cHQ=
X-Gm-Gg: AeBDietnlYddSXP//zyW/ppRBvYnkzg920QBQDi6EZIGYGrC9gpau9PFd21bHWQJU6J
	nnLZnmVouX3tHhMpw5sFCbZ1SnitZ8P5L17bKmjlMqWshNpI7rwHUOTKOqE8QoUl5DLnC+4Ni/e
	Fby8YibbhR32izVG3TXLfcrRtTSoi+DeQFc1IzGZ/Uz8i9wK6Zuh1OeTGEhoiHLQ621jvLe4Utb
	Emh4VLu5O2MuBPIXQY+ndyN+jSPM6adrIFCpQu4wJ7ZMl815yxEsVoe8pCT5kwRLjdmmNI+2q73
	c5xDs0ZpzK/fh64zyiVDF3ZQ4vmDwM/2eC4RTi+emaF+0X3Miz/czHEj97/FbyzUkVxx2Ff6JqC
	jgwR2Uv12MmtdYqnQ5T9MLFfNN/QQ7xMfmQ7/GQY9YNq03fwPTvZ5GugMXwN7IXWqw5+ffmvuaN
	9vY5iUxyPk0bEUzgkJbLLYoHANld0XweiWchGgeaC97esPlek6Lso3i16q1JJpAo+fUXLTQSnym
	SHydwcVgahip9cDlZ2TUr22
X-Received: by 2002:a05:6000:2005:b0:43d:77a8:3ba7 with SMTP id ffacd0b85a97d-43fe3e12484mr4104740f8f.44.1776431484359;
        Fri, 17 Apr 2026 06:11:24 -0700 (PDT)
Received: from localhost (p200300f65f20eb08db61cfc60d8aa232.dip0.t-ipconnect.de. [2003:f6:5f20:eb08:db61:cfc6:d8a:a232])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-43fe4e3a7b4sm4356620f8f.22.2026.04.17.06.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 06:11:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Ulf Hansson <ulfh@kernel.org>
Cc: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>,
	linux-mmc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	linux-kernel@vger.kernel.org,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	linux-bluetooth@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org,
	Ping-Ke Shih <pkshih@realtek.com>,
	linux-wireless@vger.kernel.org,
	Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Brian Norris <briannorris@chromium.org>,
	Francesco Dolcini <francesco@dolcini.it>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/6] sdio: About pointers in sdio_device_id::driver_data
Date: Fri, 17 Apr 2026 15:10:46 +0200
Message-ID: <cover.1776429984.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3816; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=gRLZDYjP8rAyYDu/dxhxXrW55dQHWBhhz4Mp7s9yll4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBp4jFWdaRCcbA6UCRSVtfbncEwOSti40CoPsvF+ vdIuFxTidWJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaeIxVgAKCRCPgPtYfRL+ Ts32B/9u8msCou5BwhNaY0DlL45F+7qpQKpSsQuRk2gI42hvAESq9kyeVN/MZWif44tjir6LK2z uIl/GDbOQMK01aikDbfuVOtkDDghRBSTEB7Jka+OjfPnDumnNigRsaaBGNvsAFjIJkLhEy6qJDP Tn8woM7fN22cukUBpxin+S+kcXgM00Q8TjTUzEfguVA/yR/5l3z2E6JOyddLE7skD3BcWZth7gw bSohFR1HxMGAwUA7mKVNzLdYdPXW7y8rKtYwlVFZUsZmtrNFbfl9Br+UBebFAMyx3Rll6Um30xM RwO7mqAqqwH8Ox2CRHpiyR61s3V9bmt+/v2tLxnaw2vhp3PI
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_061127_018397_D697E0B8 
X-CRM114-Status: GOOD (  17.67  )
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

<linux/mod_devicetable.h> contains several device_id structs for various
device types.

Most of them have one of:

 - kernel_ulong_t driver_data (sometimes called "driver_info")
 - unsigned long driver_data
 - const void *data (sometimes called "driver_data" or "context", sometimes not const)

Taking sdio_device_id as an arbitrary[1] example (which has
kernel_ulong_t driver_data), there are drivers that store integer values
in it (e.g.  drivers/media/mmc/siano/smssdio.c) and others use pointers
(e.g.  drivers/net/wireless/realtek/rtw88/rtw8723ds.c). The latter
involves explicit casting, both for initialisation and for usage.

In the past I tried to address this using i2c as discussion case[2].
Back then the motivation was just to get rid of the ugly casts. Today
I'm working on CHERI which is an architecture extension (currently for
arm and riscv) that uses 128 bit pointers to store additional
information, implementing e.g. read-only pointers and preventing out of
bounds access on the hardware level.

The complication here is that a kernel_ulong_t (which is still 64 bit with
CHERI) cannot store a pointer.

The obvious way to fix that is to replace the kernel_ulong_t by an anonymous
union that contains the original unsigned long and a pointer. This doesn't 
change the size (or layout) of the device id struct for archs where 
sizeof(long) >= sizeof(void *) [3] and gets rid of the casting. On CHERI archs 
this is an ABI change, but as a new architecture changing ABI isn't an
issue there.

I was surprised that changing struct sdio_device_id didn't require
preparation in the various drivers as they all already use named
initializers.

So the first patch expands struct sdio_device_id and the 5 following
patches implement cleanups that can be done then.

Patches 2 to 6 all depend on the first patch (only). This is not urgent
and thus merge window material. I guess merging of this series has to
happen in 3 steps:

 1) patch #1 via mmc
 2) patches #2 and #3 via bluetooth
 3) patches #4 - #6 via wireless

(where 2) and 3) are independent).

The series was build tested on arm64.

[1] well, one that isn't used as much as spi_device_id or i2c_device_id to have  get a manageable POC.
[2] https://lore.kernel.org/lkml/20240426213832.915485-2-u.kleine-koenig@pengutronix.de
[3] As of now this is true on all architectures running Linux even with s/>=/==/


Uwe Kleine-König (The Capable Hub) (6):
  sdio: Add syntactic sugar to store a pointer in sdio_driver_id
  Bluetooth: btmrvl_sdio: Make use of driver data pointer in
    sdio_device_id
  Bluetooth: btmtksdio: Make use of driver data pointer in
    sdio_device_id
  wifi: rtw88: Benefit from sdio_device_id::driver_data_ptr
  wifi: mt76: mt7921-sdio: Make use of driver data pointer in
    sdio_device_id
  wifi: mwifiex: Make use of driver data pointer in sdio_device_id

 drivers/bluetooth/btmrvl_sdio.c               | 22 ++++++++---------
 drivers/bluetooth/btmtksdio.c                 |  8 +++----
 drivers/net/wireless/marvell/mwifiex/sdio.c   | 24 +++++++++----------
 .../net/wireless/mediatek/mt76/mt7921/sdio.c  |  4 ++--
 drivers/net/wireless/mediatek/mt76/mt792x.h   |  2 +-
 .../net/wireless/mediatek/mt76/mt792x_core.c  |  2 +-
 .../net/wireless/realtek/rtw88/rtw8723cs.c    |  2 +-
 .../net/wireless/realtek/rtw88/rtw8723ds.c    |  4 ++--
 .../net/wireless/realtek/rtw88/rtw8821cs.c    |  2 +-
 .../net/wireless/realtek/rtw88/rtw8822bs.c    |  2 +-
 .../net/wireless/realtek/rtw88/rtw8822cs.c    |  2 +-
 drivers/net/wireless/realtek/rtw88/sdio.c     |  2 +-
 include/linux/mod_devicetable.h               |  5 +++-
 13 files changed, 42 insertions(+), 39 deletions(-)


base-commit: 028ef9c96e96197026887c0f092424679298aae8
-- 
2.47.3


