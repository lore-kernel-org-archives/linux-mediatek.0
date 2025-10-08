Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42064CCA470
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Oct 2025 14:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:Subject:
	Message-ID:Date:MIME-Version:From:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iJLXoDWYgAmog44Pm7ibdOmWHzVIeuqL1A8vf/ARX2o=; b=z+Ial1MjCOgW3Y8UrK80+9fMsJ
	gqpoKrJv4MwRFI+gQ0P7WwqXR9E3FynGbwhw9aAZ+57CnsGRR+korSIoR+SieYj0CPx91DUnmguvk
	aAVxoCDU43ZBArRQnZRNUR5ZQhsKNqPYs7dUkDVqvXwjoBpHhWsmQO3CItabj1YIzzzY2O3mpSRPs
	QbLJ6U3Katxs1BZaFE4br71mnffS5KqbWOhpOvq4FMzCNFCRLR7KTZN8srx11uSfQPBW+cStJ/ydM
	PctpQDb3n/km0WkAP8ci2l8Ob1FuGvfRZqrsiA1kqddXvuJkdy1oz/EscdBuBhezq6ypR+7tTTAEA
	O9ygi0Dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6VJf-000000043nj-1XCV;
	Wed, 08 Oct 2025 14:38:55 +0000
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6VJd-000000043nL-15di
	for linux-mediatek@lists.infradead.org;
	Wed, 08 Oct 2025 14:38:54 +0000
Received: by mail-qk1-x730.google.com with SMTP id af79cd13be357-87808473c3bso975864885a.1
        for <linux-mediatek@lists.infradead.org>; Wed, 08 Oct 2025 07:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759934332; x=1760539132; darn=lists.infradead.org;
        h=to:subject:message-id:date:mime-version:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iJLXoDWYgAmog44Pm7ibdOmWHzVIeuqL1A8vf/ARX2o=;
        b=LPubMOSuUeDdk5na2xSY6XvUA3yPZNKJICrDM64Y1SHew6eRReUEOknLKKTpbGUwAF
         VSi5HomDNATBix6VDFPUNOHwjdB40X1lwu/NNfJ6JaKnRm2RamYjkq2Fjfal/UPlXjgX
         SH5IophPbNjnSTeGvaUjWX1LYjXFtG1ZK4G1wpbke3c3pvevCqw/RpNmP3M62TzGM4AA
         WGRckH7xwP6QjsbSrfMw6MQCWmnT1fPFVJgPtil5aj3/AIfiiH3s6fYtuzopEVbdPED0
         vNeIz0k7oy97PWUvpAaCK8lqN3PnsoJx37sTtCCvxFnY43VeYPoVQouuXQ3qcJkReHTI
         CCTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759934332; x=1760539132;
        h=to:subject:message-id:date:mime-version:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iJLXoDWYgAmog44Pm7ibdOmWHzVIeuqL1A8vf/ARX2o=;
        b=hfFF0Vyk+cXPpEHmhfIJbq9QZ14Gy304MArkK5dXOjmMJBHrh20kSIhSIUWmsAdZVQ
         kuzrysfvVWoAb2DLxCK0CyjyTHLDOHlq+j/gOZeGPK+hdCfVgs8NlLhE5vE3HYTYaL8T
         6uEB7R/XpbQFrdcNGQpyZu/MqMYhMPq5Sm/39XBJHHgAd7abPqYUSKP1Bz1aWuHcmKCN
         wXFcrgEAhe7GeZzr8Fhp3cX++hyd86jk6tCozAvwo3t3w0IBrHHouDXE+1dlBXGeutmb
         qap4cBTLfR20z0PAeOw3Wh1Kr6wU7o/fxGPt1nsgFJJe7/T2cHNO5024nGJJyw3XMgy9
         gVuA==
X-Forwarded-Encrypted: i=1; AJvYcCX0dEe/3mtsKyrwTMRqdFzBIiwy5FULIdhxDdUZzrjmHkC4v9lx0TtJpDh3J5EL/YRoixhIQG4SlgYHppddLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyxKEpZmr9/hEdDQl2S+rLwkKPTTBJBl1xiEEEjl4vHUd1InCVt
	pp7qOTAsbJIiTpujpjkWHsOQSelBAxnmIa119wiNi+Yt8tUaCZQZ0Rj6KiFOK95xI+4pKFL4BL4
	GWhkNqxcQ3WJtAhAPre5vJUgXchdYgEsfL27G
X-Gm-Gg: ASbGncv7MpbjvsVRdMfvQ55QNkBsRgIFMHgDXt9L0Ig0BrZxfkgQiihgFSDL/s1AURy
	Pq30jAlNMIoofd1+1W399pIRxQIIZG4KXZ81ofiFNm6drqRd9LVJLp/VD/2ARapS9NVmL/Z5wY1
	r++HOt556+OoqLNwEXlUzqAIQLwFBmQJGt1h3xVeec0W8ckoruT4Lc9pNWTC/Iv7HgHYe/lx3Rx
	obHaDMkJlE+ijoBfsNd0aZrD/BJMnHVT1Ozz3w=
X-Google-Smtp-Source: AGHT+IF+it1OcBxPz0VsB/IdgmRpXcmiUKEzYN63Nr6odezkJwkdhC21LZw9Rqe4nPvESEy+tDLg5BBsdUxS47vIkLM=
X-Received: by 2002:a05:620a:2548:b0:875:79b2:13bc with SMTP id
 af79cd13be357-883523d6f26mr540921885a.21.1759934331479; Wed, 08 Oct 2025
 07:38:51 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Oct 2025 07:38:50 -0700
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Oct 2025 07:38:50 -0700
From: Amit Dhingra <mechanicalamit@gmail.com>
MIME-Version: 1.0
Date: Wed, 8 Oct 2025 07:38:50 -0700
X-Gm-Features: AS18NWAAD0Ld_hK9Lnl2mXC1VttH3a6opSMyMypTfNMv1gG0_fwBqVnAVW12AtI
Message-ID: <CAO=gReGixJuoovC4C5Gyx2G-1MTGPjFq2TwC3jxy1jQ1w1RmDg@mail.gmail.com>
Subject: [PATCH] [PATCH next] : Fix a NULL vs IS_ERR() check in mt7915_init_debugfs()
To: Ryder Lee <ryder.lee@mediatek.com>, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Shayne Chen <shayne.chen@mediatek.com>, 
	Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	StanleyYP Wang <StanleyYP.Wang@mediatek.com>, 
	Nikita Zhandarovich <n.zhandarovich@fintech.ru>, Razvan Grigore <razvan.grigore@vampirebyte.ro>, 
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_073853_320535_43494D52 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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

The mt76_register_debugfs_fops() function doesn't return NULL pointers,
it returns error pointers. Update the error checking to match.

Fixes: e57b7901469fc ("mt76: add mac80211 driver for MT7915 PCIe-based
chipsets")
Signed-off-by: Amit Dhingra <mechanicalamit@gmail.com>

---
Compile tested only
---
 drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
index b287b7d9394e..cb9ad05db9d4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/debugfs.c
@@ -1232,7 +1232,7 @@ int mt7915_init_debugfs(struct mt7915_phy *phy)
 	struct dentry *dir;

 	dir = mt76_register_debugfs_fops(phy->mt76, NULL);
-	if (!dir)
+	if (IS_ERR(dir))
 		return -ENOMEM;
 	debugfs_create_file("muru_debug", 0600, dir, dev, &fops_muru_debug);
 	debugfs_create_file("muru_stats", 0400, dir, phy,
-- 
2.51.0

