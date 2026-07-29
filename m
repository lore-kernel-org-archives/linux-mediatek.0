Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2353C54F51
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jul 2026 17:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gg6ArNtx1AiAv6yPr+prFaZ5QUtx/jRFL3cP/oq9oL4=; b=ezM26TKABuaIQMmLwsRL+HPsgH
	4+/KTBhS9ltdNGCv/sh0UAq/P2GFslM8hAZp6Uol6rxBVLfAOFgIo1I0Tp+7LFiIi841169xQac0P
	GFZ/wLshZZ+uq624gBSJEDhjYs6MnguX3w2eME0iAw2EWA2Wssq6jR/i8agzQ1ivh0GlhXgwxXbV4
	Qv4JL6FDPkqTGrYWbRBKBvoiSfuIkpMtjC5x5oZwyfVfGom9SZ37hlZuGiyYhHR6Qq6qCggVcLMHC
	sCy3WgVJn3D2vTgGimZP648O7l54+cu0hGkY2LiHha92R6xAvu1I5ju88jBikv2YwfNH+iOyHr6Ai
	aBA0AkQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8D4-00000008icO-3YSF;
	Wed, 29 Jul 2026 17:36:50 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp8D1-00000008iaM-2bJW
	for linux-mediatek@lists.infradead.org;
	Wed, 29 Jul 2026 17:36:49 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2ced3386430so12796895ad.1
        for <linux-mediatek@lists.infradead.org>; Wed, 29 Jul 2026 10:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785346607; x=1785951407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gg6ArNtx1AiAv6yPr+prFaZ5QUtx/jRFL3cP/oq9oL4=;
        b=hZ0dip/E4OYd6+jvFa/wDC6pn8FxuWI4GJDexEA32SXCGX06O0Dfpae2xmVBIPwWN0
         At3gLXSJzDG/9jd/VE+TUtYiiolDYJ31n9G3EXqcm00kEcCRRR1xM/gu69XQ3sDlRemn
         SKEY7FlT/yA0i9znbJRSogq1wKO0nB4809J8MvczYvBLMv9z5IoP01Ha062B/SRgLWut
         BeT6u36Tazo0OXvbFm2UOZRncTw98y2Xy1s/6+LO60sAQY2fZaC7mlaPt9kdSD246sqy
         gQcONo9hW+w8f8jXlLBOCPQAZCHd80wID02HpDFSyXSqiaP9c19L5obMscryKYqe/guB
         mBmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785346607; x=1785951407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Gg6ArNtx1AiAv6yPr+prFaZ5QUtx/jRFL3cP/oq9oL4=;
        b=OKw6wn370WkdrzLfe5jylJWWprAwpPVogPHSBmo8GFHRmamDwAPed8FDfTGT+uzlgv
         9g01129VoMgWswoYz63dBeGOsmznkzdg1qVqvG4nhWbkytKIIozm98WLpzkihVzTwvKT
         NphyHsed1uX3GTOvrdqDe6FiiPhOGkKr/TIJ676PeHojDkNMYTo9XIBZLzW7UC7KbvXp
         k/WtouUZk2vR5kJFXfNmCNRkPlzJMlZeWDbfUvrUZ3F6nQwSQBoxa1R7lfnQ14bcCpWi
         R7IJ6KEtC3iG0os1q0wnPIF+BpA7fGboWbbRuafjp7x35XnIT1OYhXg+J1v/hLhxnUGy
         BgPw==
X-Forwarded-Encrypted: i=1; AHgh+RpFwTBC3vLFa/iC1ZoGl2+M9qE0zldM7C3VPtLMGo89cM99N7HEpn6JyLRx/cGAqCE03Wmt8Br0659oTt0vvQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxo1DJpYElBlX4y2qUhMsmZKPwQ8v4u4f3vKyZKzckE74tcTqwf
	qsht6gvplLXLnJCvQtGX8pvYo4rDNPDJs5iHmMR5xYJ9SsrPOP8r2STm
X-Gm-Gg: AR+sD11a/la1wXXhSlktUIK07pevNIzqC5IDaaT6kSClHtxx/q0ZzrcL2+CVzhoGWKD
	O7NWflptlh1zlv19BLFfBumzhKhNSyGBTPwlG6KrxFZnmVXr2fAa8N/2xDLcq5UMeznyrHrz+YG
	XpxmbP0sVsFBjTG+I3EWGwMRO198cZefrbCMh6A8nSwAM6l+Pa9wZxNPqdyhLIhCIyJx7fWy1gr
	Y5DGTf1Dz8qPhA9htJhwi0uC24R/jvAVEtinPLHzP31Acibt532MZfcVWi+ppNrWWmd0UHmYCiQ
	En1t5ejuvcmncUAZbCoK7zmIKNvEIN6en2Dq3nCwgFD2/V7cU/dUz8lkje4JzhqpEQbRY6lesH6
	ij2Gz2UmYnoiFNuj2OPJ6XZR6azDg2XaurZk2F5o6ZzVaumqQP5Dp4udxgZqq7ud3j+6EB2TA3V
	q6ImjDuI8uc9Qq65up8q1tPBDbIZv4VopZTi/QeuLhKpGGRXswi/6fTUy92+6/eknQ8OpH21D2g
	VXU8roTCMw6E63Dk7JyjU82gF0=
X-Received: by 2002:a17:903:11ce:b0:2ca:b8fd:1a8f with SMTP id d9443c01a7336-2d016050393mr86243135ad.39.1785346606916;
        Wed, 29 Jul 2026 10:36:46 -0700 (PDT)
Received: from KRHW1CJW23.bytedance.net ([120.234.91.241])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf39cdsm14806045ad.55.2026.07.29.10.36.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 29 Jul 2026 10:36:46 -0700 (PDT)
From: Zhao Li <enderaoelyther@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rex Lu <rex.lu@mediatek.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Chad Monroe <chad@monroe.io>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>,
	MeiChia Chiu <meichia.chiu@mediatek.com>,
	Bo Jiao <Bo.Jiao@mediatek.com>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org
Subject: [PATCH 1/2] wifi: mt76: mt7915: unlink TWT flow on MCU add failure
Date: Thu, 30 Jul 2026 01:36:31 +0800
Message-ID: <20260729173632.14387-2-enderaoelyther@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260729173632.14387-1-enderaoelyther@gmail.com>
References: <20260729173632.14387-1-enderaoelyther@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_103647_709883_11D08A34 
X-CRM114-Status: GOOD (  12.45  )
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

mt7915_mac_add_twt_setup() links a new flow into dev->twt_list before
asking the MCU to add the agreement, but exits without unlinking the flow
if the request fails. The flow-ID and table masks are only committed
after MCU success, so the still-linked flow is invisible to the
mask-gated teardown paths.

If the station retries the setup, the same slot is cleared and its
embedded list node reinitialized while it is still linked, corrupting
dev->twt_list and potentially preventing a scheduling walk from
terminating. If the station disassociates instead, teardown skips the
flow and station storage can be freed while the node remains linked. A
later scheduling or debugfs twt_stats walk can then dereference the
freed flow, resulting in a use-after-free.

Unlink the flow with list_del_init() on the MCU ADD failure path. This
restores the list to its pre-request state and leaves the node safe for a
retry. Mask and agreement accounting remain untouched because none of
it was committed before the failure.

Fixes: 3782b69d03e7 ("mt76: mt7915: introduce mt7915_mac_add_twt_setup routine")
Assisted-by: Codex:gpt-5.6-sol
Assisted-by: Kimi:K3
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Li <enderaoelyther@gmail.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
index 334c19ab2b22..1ad54a5bb374 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mac.c
@@ -2345,8 +2345,10 @@ void mt7915_mac_add_twt_setup(struct ieee80211_hw *hw,
 	}
 	flow->tsf = le64_to_cpu(twt_agrt->twt);
 
-	if (mt7915_mcu_twt_agrt_update(dev, msta->vif, flow, MCU_TWT_AGRT_ADD))
+	if (mt7915_mcu_twt_agrt_update(dev, msta->vif, flow, MCU_TWT_AGRT_ADD)) {
+		list_del_init(&flow->list);
 		goto unlock;
+	}
 
 	setup_cmd = TWT_SETUP_CMD_ACCEPT;
 	dev->twt.table_mask |= BIT(table_id);
-- 
2.50.1 (Apple Git-155)


