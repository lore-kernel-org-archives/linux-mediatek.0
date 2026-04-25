Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEB57FF885C
	for <linux-mediatek@archiver.kernel.org>; Sat, 25 Apr 2026 19:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aWRSKgFmDsEBT3ODy/e0S7epJ/vxH7tu9uKFy4AW+1Y=; b=B/CrRGZn+j1ip7vwHYmu5Um25G
	daLQDVhXRfX0Skfhk3QeTAmdwB39PPOB6D6oXj9WUJ0wRmh9olbeqj8938JomVf6urm+P+vTEK9lE
	SuZGjdYnONGBkxjuez5Tp+zu46woob8/Ha/xgY7/6p5XOOYvB72VvElN5fV+IZHeEWkfqDtMLF0mG
	GRMig2G2ufxvQ2dgSBn+bt7XXfQPbKRJjozs85obYLYa6LbZ+/sNmU6nXrwJ/q6cDGr+S74Nwrph8
	3X40zvLtblItKbWBkBnLHKlSJxIjP93yePeVa4mg82BSUIVG1Uzip7sz3a+cad9ScwRdLrCxgLVYl
	7jnNjIUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj1H-0000000Em90-4AkO;
	Sat, 25 Apr 2026 19:50:27 +0000
Received: from mail-ot1-f50.google.com ([209.85.210.50])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGj1F-0000000Em82-3Q5U
	for linux-mediatek@lists.infradead.org;
	Sat, 25 Apr 2026 19:50:26 +0000
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7de46b8e432so3128304a34.1
        for <linux-mediatek@lists.infradead.org>; Sat, 25 Apr 2026 12:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777146625; x=1777751425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aWRSKgFmDsEBT3ODy/e0S7epJ/vxH7tu9uKFy4AW+1Y=;
        b=comfw45B+4aR0qQtS9EktvVUWj1bhV95FuEQ5o/Er5GDAEObp6/x8zC+JnSa7eu3H9
         tvQoldDCIDeZhf9y3qC/HoBZBhCzLphT4W4VQn/+56rWWF3TZBCwfXWwE2q3hdMdym2n
         y1O73avKKT9fVedQGAjDYfHiSbuMJzSJMxTLd+s9pypUxXBw/6snlixlhxZT2Glo5s0N
         3QuU1zs6gaZbulnNoGV2CphuZLiXZIotT/h7jtPZZY5VVHEq9X0KeFsx6oJSF3GXFjzd
         O08gAE8Covb4lO/uwIqNDyiX9HgisgtGSMYYrs0y55SIH7iKbXKKVC5A7Oc8DlOaSUS6
         dggA==
X-Forwarded-Encrypted: i=1; AFNElJ91/1e3sOjBihlcjdMmKGaxWIpSGflng2wPGaO1l7XWUcvFHGR5tTzdVyzFluDzJTqxLP+nlKsY3J/gLpZYEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yye43CcFDMTtRTxlBKlk5SIUWUWhYGQDTfcK/8NkFvpAby0vWpc
	yvt+Jdyfy8MdJZyKetX/plVx3hdx0dMHBsY0mFV/GfSeZnoHY/7rpCW5
X-Gm-Gg: AeBDiesG6lKRXbpOB/+RvTd05665iOH8D10zdEBnk8n5IPsh3TIkqAafnL+QHdvYd8S
	X0JTp+JnHqyZF2MYLM96yRNt9sJfcdDDpU84slwLRFMS9hZrb+2xH/YpJkeOIaArGKreilOSnWY
	TAizAmzra7KsSukBXKbotnSl0kyL/sJ33qIMJB2EAYtle+q2BZQh9UACNwUnQcJOBehMHS94gjL
	yCVIapMu6aElT3W2U6n5RzWx/oeEtTi9wRuLqx0t+j3F5SjorbE/NBnZC9d/kU0e/W8ZAvOn+Ss
	o7V2NoIYQr7pMvoOTYflcDkR0B9iKkXa1K2spqeDu1f9TKkyHTV57OtgnKYomt66Sbt4oUaKKCJ
	X5z3UfcGOIj6NlgSKcEmcWSILg1ENzvdf+yTiMJFfuwU2M2R2Z/31Uve9iMmspx11Egq1APj1Wn
	m4ZQX+x1Z3yu35c0DmmMt13qWhnfQbZP+9+sa015aDy7vwCc0egXFvWtzGMCMci0CpTNmF/5wKw
	Q==
X-Received: by 2002:a05:6830:3141:b0:7de:44a5:51d1 with SMTP id 46e09a7af769-7de44a55dd5mr9306976a34.7.1777146624702;
        Sat, 25 Apr 2026 12:50:24 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.attlocal.net ([2600:1702:5083:7610:2e29:c3c3:de27:ce76])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dcd164d2c3sm13987624a34.24.2026.04.25.12.50.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 12:50:24 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Javier Tia <floss@jetm.me>,
	Marcin FM <marcin@lgic.pl>,
	Cristian-Florin Radoi <radoi.chris@gmail.com>,
	George Salukvadze <giosal90@gmail.com>,
	Evgeny Kapusta <3193631@gmail.com>,
	Samu Toljamo <samu.toljamo@gmail.com>,
	Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>,
	Chapuis Dario <chapuisdario4@gmail.com>,
	=?UTF-8?q?Thibaut=20Fran=C3=A7ois?= <tibo@humeurlibre.fr>,
	=?UTF-8?q?=E5=BC=A0=E6=97=AD=E6=B6=B5?= <Loong.0x00@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH v5 01/21] wifi: mt76: mt7925: fix stale pointer comparisons in change_vif_links
Date: Sat, 25 Apr 2026 14:49:51 -0500
Message-ID: <20260425195011.790265-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260425195011.790265-1-sean.wang@kernel.org>
References: <20260425195011.790265-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260425_125025_861341_83BAE79A 
X-CRM114-Status: GOOD (  10.05  )
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

From: Javier Tia <floss@jetm.me>

In the error path of mt7925_change_vif_links(), the free: label iterates
over link_ids to clean up, but compares against `mconf` and `mlink`
which hold stale values from the last loop iteration rather than the
current link_id being freed.

Use array-indexed access (mconfs[link_id] / mlinks[link_id]) to compare
against the correct per-link pointers.

Fixes: 69acd6d910b0 ("wifi: mt76: mt7925: add mt7925_change_vif_links")
Tested-by: Marcin FM <marcin@lgic.pl>
Tested-by: Cristian-Florin Radoi <radoi.chris@gmail.com>
Tested-by: George Salukvadze <giosal90@gmail.com>
Tested-by: Evgeny Kapusta <3193631@gmail.com>
Tested-by: Samu Toljamo <samu.toljamo@gmail.com>
Tested-by: Ariel Rosenfeld <ariel.rosenfeld.750@gmail.com>
Tested-by: Chapuis Dario <chapuisdario4@gmail.com>
Tested-by: Thibaut François <tibo@humeurlibre.fr>
Tested-by: 张旭涵 <Loong.0x00@gmail.com>
Reviewed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Javier Tia <floss@jetm.me>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 73d3722739d0..4d8ca04a128b 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -2179,9 +2179,9 @@ mt7925_change_vif_links(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		rcu_assign_pointer(mvif->link_conf[link_id], NULL);
 		rcu_assign_pointer(mvif->sta.link[link_id], NULL);
 
-		if (mconf != &mvif->bss_conf)
+		if (mconfs[link_id] != &mvif->bss_conf)
 			devm_kfree(dev->mt76.dev, mconfs[link_id]);
-		if (mlink != &mvif->sta.deflink)
+		if (mlinks[link_id] != &mvif->sta.deflink)
 			devm_kfree(dev->mt76.dev, mlinks[link_id]);
 	}
 
-- 
2.43.0


