Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2825FC61DD3
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2026 05:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=s9VeM2Hj9d1CYutblv9K9gniHtTbYGqC7kevoULcpcA=; b=YV7U71WxqbDXCXoaWFp6az+bYU
	hu9VM0AFNlybv7ykmHpj54892bdIiSKFEfYX4Y4jtx7Ve9A2IJuAuYlRMXe0ow0Rom233MQo9j4SD
	euLSY4CTIM3Q2DZIEApfbUHXLRM3uq7IDcTEMrzInnUgIXuJAylv00v/jGVds+dFbSryrss2NP50O
	hbB372XLXGVFtgLOisH4mv0WiNu3r3CZikuq5XvGXSuK50DTuEb1cweRkEtuV1DiJV++Kk9eeoNPT
	gT85hntZqLKJr8j+1pidkeu6/arRD01omE2UwMMlbOUtdibk5WRXNGWy+5gTpY3hSnLqOoxQ7A+TS
	G72TEzpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2MVJ-000000014RE-0IXB;
	Fri, 04 Sep 2026 05:30:21 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2MVF-000000014QJ-3vTS
	for linux-mediatek@lists.infradead.org;
	Fri, 04 Sep 2026 05:30:19 +0000
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id BFCD244BAA
	for <linux-mediatek@lists.infradead.org>; Fri,  4 Sep 2026 05:30:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1788499812;
	bh=s9VeM2Hj9d1CYutblv9K9gniHtTbYGqC7kevoULcpcA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=kPoyCHgruozjzrQzIrWZpv6LdfuNlNZSU0XUzk4pBYZgBcPqw8UC+CBAe4PLY9qMD
	 EkTMyLWpXDsYCZhTzISiV6e8GzXoows5Zm87tKGAAxAH1WaYPmTRjr/KMe7aU6XRmj
	 6qhdj1lB2CQ8yTy26DoAL7i+M0o2Y8r3Tt5qJLZ/qsWW88MGs6UwznWNkZqHGUP5ma
	 Asezl2BmluU2GoOIP4EDliBZfB0b3Gn/hz2ulqHEB5+YQJr73u4HTHUIwQrEJBxuFm
	 ONF58gjhY+mX8TSjDZDOkcf2CZCYdB0w6x3dSe765AarVG3WcD9TZKu2/QLO34r/ZK
	 bJBDUKxxKxm8hFq8JErjemUKSFj6bV9T9+BaFKwvgLQ+K91agXVAnSsIE2xC7e6jHJ
	 FEIHT1AwaP9CyO8j0psaaUeSrgkshdzBx2Dh+FEejpB+jHrjL025/0ukVFujva9H2b
	 ByH76eXIVZNJovbt3HXTKEdwrDCyfGelItY9MQELhu84N2MpvEa4ZhOeZk6QZyWa2C
	 b6FV+oB2LRMI+/2gI2dJ5GAhBk126zOErPy/xBR5faSGJIVFoF6MffUubsMtP8yMJ0
	 Clovb7GzJPdurot6TYn4ap60DprVjFKeGXytNmNuMm6HoVHKy/JWpMA4P5TSkWYzGW
	 a9J6jo+sYSlcSfNQwNz2so+g=
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-84e048a801dso723216b3a.3
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Sep 2026 22:30:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788499811; x=1789104611;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s9VeM2Hj9d1CYutblv9K9gniHtTbYGqC7kevoULcpcA=;
        b=XXA9ew3FM7n4qzYizh+YApVxVaGKW1Wk7170oBdOW7KoQy5offJ2RcTE4Rq++0ajeL
         Su61dpaHUJYFJANWqJXc6CwBtf2L24WnK0hC0em0GwGxO/rRt48B68m1HhEcCSRcmhcw
         IKOVLe+ak3BlxNQIykoInIXyHHQfFAluoRiG7biJDuIKgvCD/qZszR0M/33MbK/gpYWm
         25nfnneD2wTqBdXNSXxDSka0TrhhGS8x3ZfW3i3KAWX57WTRZwXsv1obvo6s7rRss8GI
         3JDv2+Z7CF7Il3RXRH0lmdY0cBzm0JgAX1YgyXfQaK2MR8YvNz57a5zIU4afMIu+Cabn
         zrvw==
X-Forwarded-Encrypted: i=1; AKwUvBzi3QCy0i9e47omXTQRN+Vfo+HYMR589unN0JYAwifW+2SG/9YkgUMtS2Et/suWdNQ6U2wCSZBWg2OJPt6Ieg==@lists.infradead.org
X-Gm-Message-State: AFuF++mhsumK4fVokmpu8nEgJerKpO7XSGKcvgnyps7E0Z5H+lA6WAz6
	2XGvcw29JiIYcgNs6VKuwHVrKns20/dDQw3xiyQCbvZz6K16OgFhfBPIdMCwUVuETHgLXkcu+8c
	OrwNMvnBVlAzT61eTanx3LCqargBNHvMH2BHRBvQ7k71e0DZcTZFb/7eN1GPTPk18KYU5gTu+y0
	VVe4Vzpxl42Icbmw==
X-Gm-Gg: AYBFou1KPCkmim0F6y4mTB4YgPMHFwd+Sx/+jEB5w64ih8TOGvm/29MJAUWs3XFT+y4
	nBzRp83Jon1vTf/tdZv1XLe9r4fijkQ2CxlUwnOOgDuyCIZXmotBlt9au7rdW7ecNJjwRcJu4I1
	0qYYvjAE0MgrTDw7Eq3wS+TKBoIyHWrHjDGAIXS5COJ2+ghPLmdxsCIzsMigxdxyeyzxuIocXQ0
	st+6PP1Xnb5+qNq/w//Ob5otN+mS76Jpgqbz6IblQlXRsXB3fEN3K24evGXdIhCggcc7HAKyqgz
	7bIcTPUoiX9swi+U0Q66LBsFM1PNZWihyau6VhIUqjFeP1MQHYbbhIRq8FQ/vBgz4srTm2sdIRo
	04YlWJqUr1WQkTeSl0sAKpgWj20z91jxfoNlAmKDv
X-Received: by 2002:a05:6a00:8d8d:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-861662d4c0fmr5800148b3a.4.1788499811036;
        Thu, 03 Sep 2026 22:30:11 -0700 (PDT)
X-Received: by 2002:a05:6a00:8d8d:b0:855:eb7b:5804 with SMTP id d2e1a72fcca58-861662d4c0fmr5800075b3a.4.1788499810579;
        Thu, 03 Sep 2026 22:30:10 -0700 (PDT)
Received: from canonical.com (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152d29654sm711385b3a.33.2026.09.03.22.30.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 22:30:10 -0700 (PDT)
From: Ivan Hu <ivan.hu@canonical.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	peter.tsao@mediatek.com
Cc: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] Bluetooth: btmtk: Declare MT7920 (MT7961 1a) Bluetooth firmware
Date: Fri,  4 Sep 2026 13:30:07 +0800
Message-ID: <20260904053007.667472-1-ivan.hu@canonical.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_223018_366469_CC966D9B 
X-CRM114-Status: GOOD (  10.49  )
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

btmtk_fw_get_filename() constructs the firmware name at runtime, so for
the MT7920 variant (dev_id 0x7961 with fw_flavor set) it requests
"mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin" without ever declaring it via
MODULE_FIRMWARE(). Tools that select firmware from module metadata (e.g.
"modinfo -F firmware") therefore omit this blob, so request_firmware()
fails and Bluetooth does not initialise on MT7920, even though the file
is present in linux-firmware.

Declare it with MODULE_FIRMWARE(), as the mt76 driver already does for
the corresponding MT7920 wifi firmware.

Fixes: 1cb63d80fff6 ("Bluetooth: btusb: Add support Mediatek MT7920")
Signed-off-by: Ivan Hu <ivan.hu@canonical.com>
---
 drivers/bluetooth/btmtk.c | 1 +
 drivers/bluetooth/btmtk.h | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/bluetooth/btmtk.c b/drivers/bluetooth/btmtk.c
index ea0c320f9827..911aba5c134e 100644
--- a/drivers/bluetooth/btmtk.c
+++ b/drivers/bluetooth/btmtk.c
@@ -1581,5 +1581,6 @@ MODULE_FIRMWARE(FIRMWARE_MT7663);
 MODULE_FIRMWARE(FIRMWARE_MT7668);
 MODULE_FIRMWARE(FIRMWARE_MT7922);
 MODULE_FIRMWARE(FIRMWARE_MT7961);
+MODULE_FIRMWARE(FIRMWARE_MT7920);
 MODULE_FIRMWARE(FIRMWARE_MT7925);
 MODULE_FIRMWARE(FIRMWARE_MT7927);
diff --git a/drivers/bluetooth/btmtk.h b/drivers/bluetooth/btmtk.h
index c83c24897c95..bc26148ec544 100644
--- a/drivers/bluetooth/btmtk.h
+++ b/drivers/bluetooth/btmtk.h
@@ -7,6 +7,7 @@
 #define FIRMWARE_MT7922		"mediatek/BT_RAM_CODE_MT7922_1_1_hdr.bin"
 #define FIRMWARE_MT7902		"mediatek/BT_RAM_CODE_MT7902_1_1_hdr.bin"
 #define FIRMWARE_MT7961		"mediatek/BT_RAM_CODE_MT7961_1_2_hdr.bin"
+#define FIRMWARE_MT7920		"mediatek/BT_RAM_CODE_MT7961_1a_2_hdr.bin"
 #define FIRMWARE_MT7925		"mediatek/mt7925/BT_RAM_CODE_MT7925_1_1_hdr.bin"
 #define FIRMWARE_MT7927		"mediatek/mt7927/BT_RAM_CODE_MT6639_2_1_hdr.bin"
 
-- 
2.53.0


