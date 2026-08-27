Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0B04C61DC4
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2026 13:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hWIouarLBH7JuHWJjN8tUII0KICbScsgCYFIy7YWfw0=; b=JfweCGK3GsC9Aox5/NjNmOQEOE
	9jmqbI178O0CcRjKUproyDoNzF9wqKCwg0xQ1aVnwYlzeB78oCPU4ip8gM5p3NE23At8iiJJQrRHm
	TP+QbdZC2OsWt6Xe0JnNEhltyEzQIpsC9T8r89FtpbbpXjKGt2fb2y2hGgsTL6ooUnxKYx/SSn/Qr
	xH5oOLm484t9LAz7ein8u2iyzEUFp5oXAjdY7kPUdenaraQACqjVsPpYJ7UlUSbLuTtJ1QbSf5jGs
	/6+/VTOKDtHQAllVl4c6D6dhXq/QXB/3u6d/jVvKLOq/WIR2oE2zRt/MupNjJ0lk7Ls9gpylmaBGN
	+D/yYVfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaT2-000000045Tp-1tXT;
	Thu, 27 Aug 2026 13:48:32 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzaT0-000000045Sn-3llo
	for linux-mediatek@lists.infradead.org;
	Thu, 27 Aug 2026 13:48:32 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-2d530328efbso7532315ad.0
        for <linux-mediatek@lists.infradead.org>; Thu, 27 Aug 2026 06:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787838509; x=1788443309; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hWIouarLBH7JuHWJjN8tUII0KICbScsgCYFIy7YWfw0=;
        b=hduQR0WzusjTQ+bqMuOGMRoO4m4Rp5ULmw58n/cIz0+C9RqbNHDxoAYI5ZUO3hXbpr
         iu12P7AIXbrHqDBTtIIdGCE84b+Zfls650KmtiLv7U5NXYm0+kvC5OgeMaE/xrmuuPjU
         O4zIg6pcltAeg5F8oPJDQn4jAiZHJn2Zz/Qz52Ze6WhW3rLpTJrQDJUa4ud9nJXZvH66
         JB0we8RyjbFyr2MlqRxxfHm0MvkyV2YeETs9DPSAE0+UPc0Tzw2Ps3DbA35bGv1yd3Ht
         uAhloVQdrl4NsenfuwqCWGwUDyRJEQAjMhbIVdRCuszHCW3lvyBSpa1Ld8EnwoD8vWAY
         heow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787838509; x=1788443309;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hWIouarLBH7JuHWJjN8tUII0KICbScsgCYFIy7YWfw0=;
        b=ZKJr0lBh3wkL157cex+5ZhEkmPjXyYNeRR8tjhRmzL9jHnmeozcRA+9RxDjM1Yvdi+
         Go0G5FQKC30/XA1kVYPrcdcn+T+/qJvOR58TVQvgTVOmrcGfqCcvCmIyt01TQCtsUROM
         YC6w9z6X7zoIqqRW4PmrhcwoTsR7uu2n33xRnzsf5TBrdRFisGMvsIo3aOANQoCx2X1r
         6ttiS1dCFUkELOy7ixfCoxFsa0fd/IORR1TTEhuZr+lj8Hg5Bp0ShA1LCck/sucPRZiu
         ttK9VlESgkNZJMgwRHad5xSK8o1mnyIIaz8UL7ZDmvDso+oYAIupLBz9IrT/yknNUrRL
         5ZHA==
X-Gm-Message-State: AFuF++kJUyCYlStCLdhgiVTcVRcppDecwSTsLIz0DCBYwQnmoMhMN82P
	4tb7dLUddb4ck8RsYQOz+W65GmpA6xN7rppRB40IVoFcHKKoNFbz6AtI
X-Gm-Gg: AR+sD136fSMoXyaoCRvJWvLkXsdyzQEYxWrHtPvy/N+8u2ni3gj6sWw7P5n8spSSn7b
	9FcNotLDyqgGJIsa/uw/imGD20ljRW+NdL0ooibgxe9hWebimHtdbeoAsFOzQtC5iB8Re3Pm8EL
	w9gwKDHGorYZ9YVRZytK27dnOKuMGcMWIUtCrtu8hEGKYwltG7fEEnfz5KTgDe6lNzAxD8jTwy8
	tIjPJUitu+KCvgzqbpc9j2LVTdjhZ7hUhQzhHBNVDAtsZ+54f2iQZAzKZoxFMzjQ1fqDMVPviWL
	/oQh9wdJMFHr7Ue58LHTVvD5EB0wEqwJTPgucXaMqa5qGmWk+LxPafdHk1t2c3zbxM2vj27uiDS
	jBaR3LNKXqh1fO08FwcojxZFIahLPYeVIizJDUiawjXZ8up6i8EKYo/m+ySRI9NZNZedsSP4+x9
	PEznrvzmdzac/u1cFSiKjw7MebQmPjsN9fT2IwbyxlhrkvWCFQZoFoKvx2VsG3vhR6/xjm93jN/
	XgL0aQ9PNVCvA01glyynsEHKRDDYWYiMM54NvpDZhhp9GaaxNmfdMH/uB0ebDtMlhHtjySeUFEV
	eHwXtiFc2VLuow6mny0pvJwZWpZZKw4wbCtvWA8jLrpdcVXTx+LysrAsSK48AcKJZ9W93FPx7PD
	BM9GvBXVWDwx012E3
X-Received: by 2002:a17:902:e550:b0:2ca:1479:d9dc with SMTP id d9443c01a7336-2d707b64aecmr290601105ad.12.1787838508938;
        Thu, 27 Aug 2026 06:48:28 -0700 (PDT)
Received: from silver.tail241a39.ts.net ([2402:800:63a6:a199:ad96:d99:29d:5e21])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283da25c09sm33302987eec.31.2026.08.27.06.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 06:48:28 -0700 (PDT)
From: Huy Nguyen Dinh Quang <huynguyendinhquang@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: linux-mediatek@lists.infradead.org,
	nbd@nbd.name,
	lorenzo@kernel.org,
	Huy Nguyen Dinh Quang <huynguyendinhquang@gmail.com>
Subject: [PATCH RFC] wifi: mt76: mt792x: treat ACPI MTGS 0xff as no geo limit
Date: Thu, 27 Aug 2026 20:48:20 +0700
Message-ID: <20260827134820.2607530-1-huynguyendinhquang@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_064830_944837_992EE21E 
X-CRM114-Status: GOOD (  10.17  )
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

Some OEM ACPI MTGS tables fill unused geo power/offset slots with
0xff. Windows treats that as "no cap". Linux assigned the u8 value
to s8 and min()'d it, clamping every rate to about -1 dBm
(txpower_sku tmac = 3).

Skip geo capping when pwr is 0xff, and do not apply offset when it
is 0xff.

Tested on ASUS Vivobook S 14 M5406WA (MT7922, mt7921e):
- 5 GHz: tmac 3 -> 25, TX ~40 Mbps -> 200-350 Mbps (80 MHz)
- 2.4 GHz: tmac 30 after the change (channel 6, 20 MHz)

Fixes: f965333e491e ("mt76: mt7921: introduce ACPI SAR support")
Signed-off-by: Huy Nguyen Dinh Quang <huynguyendinhquang@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
index 946dd79..fa539cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_acpi_sar.c
@@ -280,7 +280,15 @@ mt792x_asar_get_geo_pwr(struct mt792x_phy *phy,
 		return dyn_power;
 
 	geo_power = (band_pwr + idx)->pwr;
-	dyn_power += (band_pwr + idx)->offset;
+	/*
+	 * ASUS (and some other OEM) ACPI MTGS tables fill unused geo
+	 * slots with 0xFF. Windows treats that as "no cap". Linux took
+	 * it as s8 -1 dBm and min()'d every rate down to ~3 dBm tmac.
+	 */
+	if ((u8)geo_power == 0xff)
+		return dyn_power;
+	if ((band_pwr + idx)->offset != 0xff)
+		dyn_power += (band_pwr + idx)->offset;
 
 	return min(geo_power, dyn_power);
 }
-- 
2.55.0


