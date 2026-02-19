Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACD6FE9A02C
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Feb 2026 00:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4z7lJJUQMglrP+sakMJrEsjC5MSnfldpiVMijPhZKlI=; b=UhOhwWxarprT8S1oxbAvMVueD8
	p4/XG2J+Edy0YWILkLg6XSeWtItDQhT1aJjpnnWZO242iMEThgUNtEvPvZoELgao35ooOMMB++a1d
	o+WxyFPqg4hOItaGUoHryr0Y/WhbktwsOWbyymC0W8Q03VfuMksVc6EgwA5w/CreqE6dTd2b4WY4i
	0THBMBBrb3W9JYsVFyPpi5PvIZlIrIOrdXUzDw99oxP5wZ5pSXukoEYPMw1sv9MwbdIvjtUvEzhHp
	dDpyx1Et0ars8iilE97sQ80kaT4yxIgZOO/WhhwcLkKGdJwHitSgU7dz1xw9q0ARNwhH8L2a9+e6o
	0MXc4MlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5j-0000000AegT-38n3;
	Thu, 19 Feb 2026 00:40:27 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vss5f-0000000AeeA-18sP
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Feb 2026 00:40:26 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-4043b909ed4so291687fac.3
        for <linux-mediatek@lists.infradead.org>; Wed, 18 Feb 2026 16:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771461622; x=1772066422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4z7lJJUQMglrP+sakMJrEsjC5MSnfldpiVMijPhZKlI=;
        b=WL2UJ5Su5/fSobBqtBGqINrD8vpdH9KItnSjOyBjDL8dHYLEhaQvsaHotwLXYXaF2r
         vdP3qhyvYzBOIQlyVOgvPrNBkq1xss5KtEax2sY/VrlTXV7Xj7+0eGqiOUra/eEsXeXs
         AOvuODHLrVeJpi5feCX5DHV3Aa+oWcYcaHx9ShaSV1mezQ96GpqWtal5ZATawg/5E2In
         xF84rI3DaL8FZj9m9BnFNcpKY4KPjV55CzgE+ZZaJFMt6UGRvy2hoZ2ukOogDSvrZL1f
         WbOrBJ3YWMLjkBRq4MffdVZ7kby5qxJpG3tzp45vMy8c9E/n6eoDj5n4M2ps/iB6AjkP
         IrmQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc7XzOUfMkEXyKNeqWK42HjifRZ6oW+QvgKe6MT9mVJ9KTPs5FlCode6mhNzvbk7IrUAoYspwHm0ZllgTe5A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFFfBlf8/uP8ShgGAiJJeDbULEyHsWQX+uZqnwD1hhC1eLCvda
	ZxLDOjQ3vUGmWPrIdd7f5ApDg59vLxp2N5lMS+mqK376wUOR7Hb4ftQK
X-Gm-Gg: AZuq6aLPQRwlm8FMO7lymT27kR9tNBbRsBXQ70kezcKvDsv25PNDtZBJt3c7LAvaEez
	B+ctd3dm76g81NfGhXzEzVDQT9ZH40UfYk4SSa+b9pBOnGCnbWtot3oe8T37LfnhVIlWD032XOL
	oY0ku9XodSluvyrUMdDio22fnKBRBr3lIst2sTvqh5X/QRsz4Eve2546gJKpW35O+WrrJF1qdYW
	OISak4U9qYoNFfkL0L3j2iTCju1fWKDSr3oEUDyTHVJGeZ4PI6a44MKg567DA7m/iH6oKwwl/ZR
	bQCYuN0y6nljFZce0YWNeafg2raQlc3pDIDV2LhcPA1Zvapir3wPjIjFNTHKH77Qmovi6c/MA6P
	oHZWqTRJYRHrCBWa5ZFkH5xMF/0wvTC3MoRi9Ytiw7oP/w3mPZS8iYehB6Iyy7iVFOYtkay+IUW
	+WKdCRxLAYXQYNJbeuF8ctUkifR5GOLEbtZrsvuMgYFapMtl8=
X-Received: by 2002:a05:6870:1405:b0:40e:9550:3242 with SMTP id 586e51a60fabf-40eeea800famr11337612fac.16.1771461622267;
        Wed, 18 Feb 2026 16:40:22 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-40eaee45d12sm23477659fac.1.2026.02.18.16.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 16:40:21 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>,
	Xiong Huang <xiong.huang@mediatek.com>
Subject: [PATCH 06/11] wifi: mt76: mt792x: add PSE handling barrier for the large MCU cmd
Date: Wed, 18 Feb 2026 18:40:02 -0600
Message-ID: <20260219004007.19733-6-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260219004007.19733-1-sean.wang@kernel.org>
References: <20260219004007.19733-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_164023_317175_AC1AFE7B 
X-CRM114-Status: GOOD (  10.88  )
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

From: Sean Wang <sean.wang@mediatek.com>

Add a dummy register read in mt76_connac_mcu_rate_txpower_band() to act as
a PSE barrier. This would release PSE pages and prevents buffer underflow
issues when handling MCU commands with larger payloads without the response
in mt76_connac_mcu_set_rate_txpower().

This is a prerequisite patch before enabling MT7902 PCIe and SDIO support.

Co-developed-by: Xiong Huang <xiong.huang@mediatek.com>
Signed-off-by: Xiong Huang <xiong.huang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c | 4 ++++
 drivers/net/wireless/mediatek/mt76/mt792x_regs.h     | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
index d7fbf3454bb8..89bd52ea8bf7 100644
--- a/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt76_connac_mcu.c
@@ -4,6 +4,7 @@
 #include <linux/firmware.h>
 #include "mt76_connac2_mac.h"
 #include "mt76_connac_mcu.h"
+#include "mt792x_regs.h"
 
 int mt76_connac_mcu_start_firmware(struct mt76_dev *dev, u32 addr, u32 option)
 {
@@ -2246,6 +2247,9 @@ mt76_connac_mcu_rate_txpower_band(struct mt76_phy *phy,
 					    false);
 		if (err < 0)
 			goto out;
+
+		/* read a CR to avoid PSE buffer underflow */
+		mt76_connac_mcu_reg_rr(dev, MT_PSE_BASE);
 	}
 
 out:
diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
index acf627aed609..7ddde9286861 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_regs.h
@@ -25,6 +25,8 @@
 #define MT_PLE_AC_QEMPTY(_n)		MT_PLE(0x500 + 0x40 * (_n))
 #define MT_PLE_AMSDU_PACK_MSDU_CNT(n)	MT_PLE(0x10e0 + ((n) << 2))
 
+#define MT_PSE_BASE			0x820c8000
+
 /* TMAC: band 0(0x21000), band 1(0xa1000) */
 #define MT_WF_TMAC_BASE(_band)		((_band) ? 0x820f4000 : 0x820e4000)
 #define MT_WF_TMAC(_band, ofs)		(MT_WF_TMAC_BASE(_band) + (ofs))
-- 
2.43.0


