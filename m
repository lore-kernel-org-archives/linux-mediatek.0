Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5741FF886D
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2026 19:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fRBTVtb7VHeglAHXqHrDRxqCIft9Mc07dM462EhUPT8=; b=qaBJnd8TamMUlNe33hPE4wQMBr
	vsRpnhLXPgC3dy+pC/B/tfix92Ja2a1ofzSckTMInAivWFFbkFkl5ZwU4AG3c8E7oicBp1Wqu7Lsj
	qnxKgIhYDqA18Qndl5i84GcXI7BuZ7ZaY3UBqZySzZgrQc7U6ohShHzmr7YRAe0Hbj/ti7SU5hu4m
	u7WIG9LSrIl1NQmoaTen8yud0F4JjELBHDDYePRtWg5IKH/Uph8v8Tj/R00bSich9jFz1Xx5UlcFT
	TsfvxbahQr9rVll5fvMTikY0j8kRgNLtaTP5seto2fZ60Jf7OJXIbgDVyxwGnMhOUX3IlVPBWF8+S
	XfQ4rnwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHo1A-000000029N5-41YX;
	Tue, 28 Apr 2026 19:22:48 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHo18-000000029Mg-1juf
	for linux-mediatek@lists.infradead.org;
	Tue, 28 Apr 2026 19:22:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2b23fcf90b2so112834685ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 28 Apr 2026 12:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777404164; x=1778008964; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fRBTVtb7VHeglAHXqHrDRxqCIft9Mc07dM462EhUPT8=;
        b=V/0PUW3YYBM0EsW+fj+UGFB3mB88zqeTt/i1kqtcVRmkfFypKZRhVQYad6/eC5iAUO
         LeDMCSuaqANWQZTL2XQ6yhb2nbtUr+mIV/qv769JRMr3SFEjb0O7LZrMGwmauaOlm8RH
         gXQm2Tf+k4woKG87Fv+cHXHkFeU3yfvSnSmIRHaGCgYZUGtJS/Zpu61AfQKmfTXGfgsn
         0m2LtNorsNOqA3EcrLNRHCgf00D2OPom5v9yPM7GF7DIeF3oBo6JbP5bJqkYnxWCgOA7
         S+nipAl8lvmXyhczCAV/08aXaPmlQYOdU2EOgjna3l8tsAjY/DeacxTKN1W4IyOQLja/
         Y85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777404164; x=1778008964;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRBTVtb7VHeglAHXqHrDRxqCIft9Mc07dM462EhUPT8=;
        b=A9ToZXxEgv/DBA93ZeuQ6rg5cA4BR7BUsRHJlxM4czzM0TOXhBGw7xWUhhTiovVeoo
         pZec6yXCC1OiEvA5LUeBnb6RFqlzURLTuipuVR8ZK7W7JMc0aZrsJ7JhbkXGXbLbcgwA
         r5JLg2++WjeyU5z/qiHBUamK1Fa7swceqHAxDZqXDITOMyNPdFf4bZ7mjqviMKe5BQyN
         Q0JR7X7aMznf8gvIQKOOAlhyGQmCadjYtWaA5YC0teAYRJi62DGxBd5/M6rvJfghyslb
         ac/CzVD50/GpPk+4Wual+39ZBDHLmQryjZr141bVyKsLpoSGrA0XXKAswe3fyRt3x0QS
         HGOQ==
X-Forwarded-Encrypted: i=1; AFNElJ+fIfvT2Sk2tGkGqgddlKL5+/o0OBA70syLlWDvTb0CS2Oxd85ZVIqrMaBOMfiRGKdSn84XS1/+7/Mgg5Mq3g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjHhJkCqaZAk3kdf+RP5zxW4vI7ZN7+dmyacpP0DS8SmX+z9VW
	nG6IgsPQ1Zi+TFzPkeS/o5R77Qz+8FVu5njQ5s6hWAi/YLCZQEX3dupO
X-Gm-Gg: AeBDiesoGDDQ0FmCVrGAp21vNPwVWF3zcRZMXzSVWAYt2klSYENvNy2HH7S5saSlj3D
	yZ0swCxOWwSUAs/Wss189U7aUgdK/wKMM/xpgGz/9Ov/6a1xWXHMNoOsbQlwRTtw3NvmQyZWnA3
	MqTnbG1ZEaL4mumHbvvd1bvXWtsHu0NHP37VsePX4jvv49HesvonjmeGLmJf/naUOGuMtgVr+vI
	/VQVoW87xJYcCoyq/yEI8dh0QscdpHkzk8re10c6O8AWcmKacox6RHSwDhRlap6J2UCPIhIX+CR
	2BROiRbfFc5EpP/TalDm5WShsNdIacmjAZ5I60bvlKqJHGhATT5rEkgLCZ87mY7ChvijTDrk26H
	ek2HoSMUiJWAhD9ABqDV/FbYPPDH/eYZM78QhRh+k0i7SDqwDdT1qvohNdKn/NrPSUp63jQZOef
	6yZOo80hhG3PZu8zk5gk6/KHhk8cWdGj2sHVPCIXjr0HyYxcz5
X-Received: by 2002:a17:902:f90d:b0:2b2:4ded:954e with SMTP id d9443c01a7336-2b97c4624f4mr28534005ad.24.1777404164217;
        Tue, 28 Apr 2026 12:22:44 -0700 (PDT)
Received: from ideapad.. ([2401:4900:881c:789e:c457:196:87e5:7368])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7fc29b1fd5sm3885467a12.9.2026.04.28.12.22.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 12:22:43 -0700 (PDT)
From: Ankit Dange <ankitdange37@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	linux-wireless@vger.kernel.org
Cc: ryder.lee@mediatek.com,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	ankitdange37@gmail.com
Subject: [PATCH] wifi: mt76: mt7915: fix GENMASK for chain 3 RSSI in mt7915_mac_sta_poll()
Date: Wed, 29 Apr 2026 00:52:28 +0530
Message-ID: <20260428192228.144654-1-ankitdange37@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_122246_456400_68F7ADAD 
X-CRM114-Status: GOOD (  11.12  )
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

The RCPI values of response frames are stored as four consecutive
bytes in WTBL DW30. The bitmask for extracting chain 3 RCPI uses
GENMASK(31, 14) which is an 18-bit field overlapping with chains 1
and 2. Fix it to GENMASK(31, 24) to correctly extract the 8-bit
RCPI value for chain 3.

On devices with fewer than 4 antenna chains this bug is masked
because mt76_rx_signal() skips chains not present in antenna_mask.
On 4x4 configurations the corrupted chain 3 value feeds into the
combined ACK signal strength calculation.

Tested on Yuncore AX820 (MT7915, 2x2) by reading raw DW30 register
values and comparing FIELD_GET results for both masks. With
GENMASK(31, 14), chain 3 produces garbage values (e.g., -112 dBm
from a register value of 0xFFFF4248 where the correct result is
+17, indicating an unused chain). No regression on 2x2 operation.

Fixes: 94b335fa88e1 ("wifi: mt76: mt7915: add ack signal support")
Signed-off-by: Ankit Dange <ankitdange37@gmail.com>
---
 mt7915/mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mt7915/mac.c b/mt7915/mac.c
index b581d8f9..3d7d71ac 100644
--- a/mt7915/mac.c
+++ b/mt7915/mac.c
@@ -221,7 +221,7 @@ static void mt7915_mac_sta_poll(struct mt7915_dev *dev)
 		rssi[0] = to_rssi(GENMASK(7, 0), val);
 		rssi[1] = to_rssi(GENMASK(15, 8), val);
 		rssi[2] = to_rssi(GENMASK(23, 16), val);
-		rssi[3] = to_rssi(GENMASK(31, 14), val);
+		rssi[3] = to_rssi(GENMASK(31, 24), val);
 
 		msta->ack_signal =
 			mt76_rx_signal(msta->vif->phy->mt76->antenna_mask, rssi);
-- 
2.43.0


