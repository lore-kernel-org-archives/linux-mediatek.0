Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21902C44508
	for <linux-mediatek@archiver.kernel.org>; Wed, 15 Jul 2026 15:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EFw8XSdJCXuT7tU+Yd9AUWSw14+CKbWtPO+VaqQRC40=; b=sxmcbkQ1wi+KqYoSI0A9sSqrpv
	NA1cB+J81k3/OafIWqOvG36It/9ERWJj9dGzO6E1KRNDqMoLB2cVeSRszUkFcKc9FhA73pufi1aLq
	LS9ucjI7Jt1C15TMHjNJHFK5K2qaVuft1Tccy/jYm6akpZvaiGI9f9Fn6gVWZ0WWZCcBub72w9b/c
	TXC0C3OPOKzlAMnCyp/8muxI9JpfgYodmmPJU7MI1YDBKV59CrBFYz62nyAhe9oL6vOa/LYJ1O93G
	Mya1TcTWzpztXdn5vuWmtIHt476LVvRoj9KBn2sBiNlfuBwOLWElXBHpDHuRVLB84O4hPXUBu1eAf
	BaIDD3cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1QM-0000000FIM7-2Zr7;
	Wed, 15 Jul 2026 15:21:26 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk1QJ-0000000FIKd-0bRA
	for linux-mediatek@lists.infradead.org;
	Wed, 15 Jul 2026 15:21:25 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-848595b338cso6570922b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 15 Jul 2026 08:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784128882; x=1784733682; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EFw8XSdJCXuT7tU+Yd9AUWSw14+CKbWtPO+VaqQRC40=;
        b=kUhdm7rAKcU2b/kidxedyZadd83mM0xHUgJozFBuNdGzSU1hksnBwU9tNrRlKS5zwZ
         PtKDnE8oTunO4bNsSc4Jtd5bhk/4WJH8gJI435TMX968TIE1SRTUXSpeD+J5TsvhfSXJ
         l+zEPI2jD7YKvZnhffJlPflCZZWc50cMkXImBx+vCl2QZNgWCsIDZHp58JNhQoKKZevH
         GiiSNKVOSTqsllNwX0gq+7ak4kUGyeKV+ZPsU7F8X3/7oZIWqtsytCFToq4QvlFIHgEA
         tcfC4HWUWFxF+i+kPDJWa926pqXWJC7lyp1euv93+dLghR7IChcVTi3WCt8xV2cSQaW+
         z+ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784128882; x=1784733682;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EFw8XSdJCXuT7tU+Yd9AUWSw14+CKbWtPO+VaqQRC40=;
        b=OHlW17vX/7qxl5R3ycG1eFAZ3eoGBMOMj5P7CMIKNrPQkYZc4PNrPwcXFjHc5Q1S41
         8AQes2jhpvuPxxMVH88/F8p8fdpuq24goZMX8nCTVaighZ9EJjkrAh2qZMblv63LMjBz
         8bGxaO8LM3c5mJYxSgGqWQL3YE+FoeRPqAeCu3RoYuh9/ePrzMrFtzMSmhb1B5WcGL/I
         bREfCycWdD+SE8Y/0+JWPxiLagupnNmtdrqrfqyAHc7lCJJcaBqBBfurgva4PddLMHIp
         qm2pZQHJZ0ZHgsDYe74hUdoQUjvnS5LXCCz9Ef4wJwKA2Y1UoNZ5gwZsKZaNyC2rscBJ
         c/Ng==
X-Forwarded-Encrypted: i=1; AHgh+Rr9e6m4z/6eG1rIW8Q54XvavqfyqwFb4TcZixKgEPZEKcxApJiqZtHkVulNHCAo4PbVpUGztciifNNVQcMDdw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz17CpLrwNpw7lIGScSad7rY/b5TZhFmucQeJzEPfiAZ7o/lAL0
	jokCLjFi/fHCvBBCzaFUHdYxP9hWeNkgEyotcwX3RarbMqSCL096+7oxvWfPz9Uq
X-Gm-Gg: AfdE7cnjS7TOFC7Bbjb9XiP91u7ANX3SNhF4zMBZEGPsu53+v0F7eTV+FXt/9oQefmW
	ALWtQeMD+FLpJGG+Hg+nw+LnEQzNeF1qrNk9d2HWCs1mru4Ay11sZvQE46P4lAJrHmo0GFcFGZt
	rPmztecVfro3tXT0qL/5acvUrMyeaoLsDF3JXgtowcY1Z5JuPb4kit1ijj5SKPe0shuBZ21OdWP
	DmOY6he8Eif/9IH2gqfMFUL4WcadezmCtblRBgS/9XdOtD1HdZo6rYFO/DmRgd+Gwc5d+Su40DG
	Ohbd383oly1pMuk+YurS4kOqsGBgvteW5JpfbMJhnbEyhiu/WXp41cV92UG1kUSHh4+xovTywcr
	xvOifa0CGPIi5LBZ2YFnQ/809kjYNTlLU3pBIaMB0FnP0fiA54AdnWRVMKFWGn50crDi52RVjwJ
	mxYe4dlWWperByQ7CoQZnZDxhRb+kLNlOjW9vlqTAY9Gd0QMoI/Nz++sNuRBCNADoq
X-Received: by 2002:a05:6a00:9467:b0:845:e3e4:9702 with SMTP id d2e1a72fcca58-84a55820631mr5597742b3a.47.1784128882203;
        Wed, 15 Jul 2026 08:21:22 -0700 (PDT)
Received: from DESKTOP-VNSSJ2S.lan (59-127-145-64.hinet-ip.hinet.net. [59.127.145.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a5c699440sm2268842b3a.34.2026.07.15.08.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 08:21:21 -0700 (PDT)
From: Zhi-Jun You <hujy652@gmail.com>
To: nbd@nbd.name,
	lorenzo@kernel.org,
	ryder.lee@mediatek.com
Cc: shayne.chen@mediatek.com,
	sean.wang@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Zhi-Jun You <hujy652@gmail.com>,
	Benjamin Larsson <benjamin.larsson@genexis.eu>
Subject: [PATCH mt76 v2 2/2] wifi: mt76: mt7915: fix net_fill_forward_path for non-DBDC mt7986
Date: Wed, 15 Jul 2026 23:21:13 +0800
Message-ID: <20260715152113.553-2-hujy652@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260715152113.553-1-hujy652@gmail.com>
References: <20260715152113.553-1-hujy652@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_082123_193284_875F1350 
X-CRM114-Status: GOOD (  11.60  )
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

Current implementation assumes that the hardware supports DBDC or single
band and binds to band0.

This causes net_fill_forward_path to select the wrong queue for non-DBDC
mt7986 because it binds to band1 and getting the following in dmesg:

ieee80211 phy2: WA: --> drop by reaseon:1, msdu id = 0xc002 but failed!
mtk_wed1: error status=00000002
ieee80211 phy2: WA: txblk
10324e00
len = 128
DW0 : 10 00 00 00
DW1 : 00 00 00 00
DW2 : 00 00 00 00
DW3 : 72 0f 94 68
DW4 : 00 00 00 00
DW5 : ff 03 00 00
DW6 : 00 00 3c 40
DW7 : 00 17 dd 14
DW8 : 79 6f 00 00
DW9 : 02 c0 00 00
DW10 : 58 c5 34 10
DW11 : 00 00 00 00
DW12 : 00 06 3e 00
DW13 : 00 00 00 80
DW14 : 10 8c 00 00
DW15 : 00 00 00 00
DW16 : 00 00 00 00
DW17 : 00 00 00 00
DW18 : 00 00 00 00
DW19 : 00 00 00 00
DW20 : 00 00 00 00
DW21 : 00 00 00 00
DW22 : 00 00 00 00
DW23 : 00 00 00 00
DW24 : 00 00 00 00
DW25 : 00 00 00 00
DW26 : 00 00 00 00
DW27 : 00 00 00 00
DW28 : 00 00 00 00
DW29 : 00 00 00 00
DW30 : 00 00 00 00
DW31 : 00 00 00 00

Fix it by using phy->mt76->band_idx for queue which works for both
non-DBDC and DBDC devices.

Fixes: f68d67623dec ("mt76: mt7915: add Wireless Ethernet Dispatch support")
Suggested-by: Benjamin Larsson <benjamin.larsson@genexis.eu>
Signed-off-by: Zhi-Jun You <hujy652@gmail.com>
---
Changes in v2
- Use band_idx for all cases.
- Link to v1: https://lore.kernel.org/linux-wireless/20260630150649.1629-2-hujy652@gmail.com
---
 drivers/net/wireless/mediatek/mt76/mt7915/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/main.c b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
index 51643a48ed15..044b592efe28 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/main.c
@@ -1743,7 +1743,7 @@ mt7915_net_fill_forward_path(struct ieee80211_hw *hw,
 	path->mtk_wdma.wdma_idx = wed->wdma_idx;
 	path->mtk_wdma.bss = mvif->mt76.idx;
 	path->mtk_wdma.wcid = is_mt7915(&dev->mt76) ? msta->wcid.idx : 0x3ff;
-	path->mtk_wdma.queue = phy != &dev->phy;
+	path->mtk_wdma.queue = phy->mt76->band_idx;
 
 	ctx->dev = NULL;
 
-- 
2.47.3


