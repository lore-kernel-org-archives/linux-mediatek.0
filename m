Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30D5BC79FBB
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Sep 2026 21:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5yA1J/Oc/mv6lA/Q/2/0pN8xrLK69dfWL8b6vtP2vm0=; b=vSy6r3wUM3ihjA+fOb+d4sjd/A
	d3l5/JFXLYDAFGxEeYyZUuqJmbkmQuvTddAwnUr4n0caBXk5igCHkPGRScQw6/CQ+ekWwM2GHI5X3
	OkAZpeHr5NQuneecNG1kcBksB1vQSpOR3AROttelGWI6nJG3NBfkv1ngX3r4CaBFPZK9uPkCLiFkH
	artaTRaPGiEWTcjBPHnR+g+loDWAFezw0ycqBcfxJhnj3TFxQ5aXrQ4UK5lgWHAU0AG6giFLvGstG
	dPVRZ+dDelcDlR0njzfmhcpJYn1MmxKeq3uJN0sJUQd934M90uqInN1RZlCS+EkYReAYaT/Sdx3Ui
	tYLtkCeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mjR-0000000FS4u-2Qdr;
	Thu, 10 Sep 2026 21:54:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4mjQ-0000000FS3x-0OH9
	for linux-mediatek@bombadil.infradead.org;
	Thu, 10 Sep 2026 21:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=5yA1J/Oc/mv6lA/Q/2/0pN8xrLK69dfWL8b6vtP2vm0=; b=SzVdxpyogS3cLxs8Mox/1vc+vY
	QHDfEWQ89Edg416QLN+GN1MpfaeFwcAZ22KpgZX1co1anqkLpS9KRKrHRxonKDZWzsovJd0K3CKli
	JqXf4uPT/C3LyWwuepteZjda/udDiIVkutsd6QHJmHrsnynZMgTIPpEtQXdrHuPKKesjfioPvT+AX
	qhtiFQETKimClD/zEW44AXA1c0OEIwVNVDpKgo06aT6wEtsjVPOaZRTvPT8dSQlRF2woJp0AaoxfZ
	+vXQsmi+ftBLaMbne1xD8oI8+ArpgQZlH/9yOWSJXoYjzgaShR1BEKmG2ar7qWje57ZiwfAy+jBl3
	pZduTL7w==;
Received: from mail-qv2-x10.google.com ([2607:f8b0:4864:33::10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4mjN-00000002zHr-0c7P
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Sep 2026 21:54:54 +0000
Received: by mail-qv2-x10.google.com with SMTP id 6a1803df08f44-90cdfc6db09so2108326d6.2
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 14:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789077290; x=1789682090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5yA1J/Oc/mv6lA/Q/2/0pN8xrLK69dfWL8b6vtP2vm0=;
        b=nY9SCpwelAsGDZzJiGP+WGXYaYsnmUFoQUfJ6/eVorwR6hoS8hD2BYPl9vF28ACeWV
         5VrQoryxCKh55Xb1uRZ/YFSwxrmAPLyt1ENpUNAFyhcdG20nstSeBhSD+QmEeY+sLU5N
         qMsrP9LOaJSs2KkdJQBrP7cTidsZvEpREWfCCO4Z3xECAIAVYzgKt8eYgvbOBZHfmTYR
         X/SuW0PXvu1aMQZTVLM43c5FjEHpKCCwdjdsSOc1UScHwqlRjl4dTCrZDjtQswihg341
         zBttLBnEr6uO6O+mgJP3OJixooZsoLY1XTjIbnhgy6vJHrl6sv6vT0Yi7cl6GDof7/2o
         j0BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789077290; x=1789682090;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5yA1J/Oc/mv6lA/Q/2/0pN8xrLK69dfWL8b6vtP2vm0=;
        b=UXK8taXuoNYstqkUocLZWdbxpvfMSkexQjLDjAqFmCWPQhLQCIdMZMfFyJZAZqgyuy
         9VRCLlMiu1z7OOtAgLXOWxDVPAdiC7bH9Id+yzbJD491bL0oaMy29+7EmNnD/Pf3tN6X
         VmSDeosWX15qu2M8P9dh7dzWLVZuf6zTQq6Px97n3gmo/0CxFvHOdzxsUUUw2BqFgrSm
         PTmmCsFyKZY3/cF6afi95xHPLcvR+HRIf83IeXC8qsQhp2x/KF8Es3IWHJ5t7pi/Wt0l
         cyVVsCtVLVQHRfMLtvtXw1R+H9Ecm8q4qv7vOvKUOslaHHaRW4K2sRNUBqYUNGUk3ZrY
         8zjw==
X-Forwarded-Encrypted: i=1; AKwUvByaV5iX1UP3K+UWv/6WUtUUeCxy5x/S6r2UJyk9xdDcRqEUwsPgR7Lm7cl3WAMzG06Ze+tXTByBxpMjD1TZ4g==@lists.infradead.org
X-Gm-Message-State: AFuF++mzbY+gxVGB3MuTVJRHLqtX78IvVMD7WNFgpY6dXRxFlCVCdvyG
	U4j/pfpRoYk2yrOmtj1X0REZLxo9G509VV3NWLvYmmDdjlHXjS0NwUA=
X-Gm-Gg: AYBFou01aondB//p4PpeTZULIvaYe/alnmhxz5tyOrwHfys0ldt7mVttVTo/J/3LRGF
	XFtgD135yTF8XYCnNmtOZoPb3WQs1QGVHkNGkHocCZ/dw59MFsVDBcpX6M6n3kbV+SNqGEm5jA8
	94ha7pTv778VYZCHaI0kagkqWfaDCYtl0ErzPCIOGYBQKXp7hxl70dA8F5iR67lOdlhUCzPzBFw
	4JiHOkNShnqb5wEm618dWSNTyyhO4fNHgXK9CyuGrORdxOcIimbJg8wrVihFLQfQaYYe/8yalEP
	7HWpdkF0M6y9ruNuu5V2bO2FGJTd9dGt9y7/vf/2laik7SPKjSq10kr8n9q9ZqdhiIFyPz/DHus
	odyy5BVYE39MZeoRZaqAaJoXKqGg942PWyMCZ/Dn9U7mbzqTABA67I26ZpXYsy0ddF8XxuaYTNI
	wlkX2wZrelsDuhavYidskEzexIhmjCvSGuis8IKwyUsMfnLY6FIkYrSc6NnwnheflvW9jpzwayx
	nyuyOeR6QV7VI3iMq2g46Y3JAAm8S/CjYiTGqUBSs6u+LWs4RM/xtkRN2CMErlguNRFm0YyfX/V
	aaUhOb98eVCD9oQv12qlTlplieqX
X-Received: by 2002:a05:6214:3d9b:b0:90e:93b2:3205 with SMTP id 6a1803df08f44-912120d689emr17573146d6.22.1789077290445;
        Thu, 10 Sep 2026 14:54:50 -0700 (PDT)
Received: from localhost.localdomain ([104.39.73.78])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9120f496598sm5826736d6.35.2026.09.10.14.54.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 14:54:49 -0700 (PDT)
From: Myeonghun Pak <mhun512@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Ijae Kim <ae878000@gmail.com>
Subject: [PATCH] wifi: mt76: mt7615: restore DBDC state after ext PHY failure
Date: Thu, 10 Sep 2026 17:54:41 -0400
Message-ID: <20260910215441.76683-1-mhun512@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_225453_429964_005BC751 
X-CRM114-Status: GOOD (  11.91  )
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

mt7615_register_ext_phy() limits the primary PHY to DBDC capabilities
before allocating and registering the secondary PHY. If allocation,
EEPROM override, or PHY registration fails, it returns without restoring
the primary PHY capabilities. The EEPROM override failure also leaks the
newly allocated ieee80211_hw.

Route all failures through common labels that free the secondary hardware
when it was allocated and restore the primary PHY capabilities.

This issue was identified during our ongoing static-analysis research while
reviewing kernel code.

Fixes: 0f2173f093b3 ("mt76: mt7615: add support for registering a second wiphy via debugfs")
Cc: stable@vger.kernel.org
Co-developed-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Ijae Kim <ae878000@gmail.com>
Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
---
 .../net/wireless/mediatek/mt76/mt7615/init.c    | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7615/init.c b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
index 42e11ba1206ee..02e51b2d42ed8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7615/init.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7615/init.c
@@ -542,8 +542,10 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 
 	mt7615_cap_dbdc_enable(dev);
 	mphy = mt76_alloc_phy(&dev->mt76, sizeof(*phy), &mt7615_ops, MT_BAND1);
-	if (!mphy)
-		return -ENOMEM;
+	if (!mphy) {
+		ret = -ENOMEM;
+		goto error;
+	}
 
 	phy = mphy->priv;
 	phy->dev = dev;
@@ -573,7 +575,7 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 
 	ret = mt76_eeprom_override(mphy);
 	if (ret)
-		return ret;
+		goto error_free_hw;
 
 	/* second phy can only handle 5 GHz */
 	mphy->cap.has_5ghz = true;
@@ -591,7 +593,14 @@ int mt7615_register_ext_phy(struct mt7615_dev *dev)
 	ret = mt76_register_phy(mphy, true, mt76_rates,
 				ARRAY_SIZE(mt76_rates));
 	if (ret)
-		ieee80211_free_hw(mphy->hw);
+		goto error_free_hw;
+
+	return 0;
+
+error_free_hw:
+	ieee80211_free_hw(mphy->hw);
+error:
+	mt7615_cap_dbdc_disable(dev);
 
 	return ret;
 }
-- 
2.47.1

