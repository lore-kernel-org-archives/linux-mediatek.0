Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C2A6C282D3
	for <linux-mediatek@archiver.kernel.org>; Wed,  5 Mar 2025 00:09:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9eJeXiBH2lgfUF9NdCY1XMR3UJufv/lPn99+6l/Nkk=; b=XBh7t20EGpu1M7vezIir10ICPv
	wJPuR/JNhi1HQtTSZ8t9eMGuCAAsyDFTjlaqups1BW1ZUJv6k836lrX6AOlCNWDxKwZ2Qu3FC+3CJ
	/3ai0GfxzsOiDSlxyg4TJ2UmC6Ormoh4D7GriARsXDy2yF/hMyoswWMjoujj5NCQ8lOZrSdh9g0rT
	50PgTOrG2z1P/jbilb7m/hiSpfzh+xbqdNIRLCSl6FpRbiEULyKQuinhezyFWf1DNy4p6+JKe8F4b
	vZ0O9L+vK+BMGgd8c8xxWeDil9i4ByQSZDfpi7+RVqKKS5BA3Hxtvh2md/hM3268DWLM7UhRUrk9A
	HxAKFZBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcJv-00000006b3Q-1O9x;
	Wed, 05 Mar 2025 00:09:07 +0000
Received: from mail-oi1-f173.google.com ([209.85.167.173])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpcJt-00000006b26-0yeo
	for linux-mediatek@lists.infradead.org;
	Wed, 05 Mar 2025 00:09:06 +0000
Received: by mail-oi1-f173.google.com with SMTP id 5614622812f47-3f3ffe06107so3777170b6e.2
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Mar 2025 16:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741133344; x=1741738144;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=U9eJeXiBH2lgfUF9NdCY1XMR3UJufv/lPn99+6l/Nkk=;
        b=c4LFPXTIKiFa+qNcKuUwc1va9j4yH+7uA+m4BWMnG4uT2/UMLM9OMKZsjbb4rnvoO7
         qPNTYeVTtZYxwVicPrpKEEd10WYYTWWWfwHYSz+X2/9XBrf8aigQzK25OREwBhL69ufN
         wH91JXH6sZ65BHQXxs93/VaroLxA8h6UGdjgAwDU87nixgLwPZm7ObjVbuLYvqwapzvu
         F5SFW9mKtIdICjZGAEKt0XOm5JM+Xk08xjkeYEIDZUJn0z6UP/dibi4vQRkX7Hz9hB5q
         lorWO+Iv2/NPPL9dcQDba2A63ydYez7zkHT68iV9Pl7yjDdzQA1ASKyv479fv2PxicMB
         0g/g==
X-Forwarded-Encrypted: i=1; AJvYcCXbdvfr963pG4JM2OTHymn+n8cpW85PKFtTkPc8wALqckY12M1g9LGGJQ4J1ANktID/WZJjOIGBNVG28xiKHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEzj/eOLiks2j3NVP+lTmaygFOIUoeCm+ta6WL6RDfXhdZ10xZ
	pFmqn4JsD2DGtjXNkTsapdGvDMa9eiW96cpUTaKCxf4NaQSq4qhSYM5lrjpC
X-Gm-Gg: ASbGnct0xF57OL7voRacN6IhTYyltGgETdHxbCBIyUz+vf5u0c07APNnLklNrWSWKlJ
	EzwAv5hoWxnESzwJCEYD9VpmJ+Et78S7Q3rxSoZLgcOLA+C8zrXrUXL3DE4T87+yJ1t85jgn9rR
	I8vuDZjB0cN6FUttXD13tjapJiL1NgXF2rZt+rU8f/U3WNYo73JcnouY8s5ayDM7Euj+7QehHMb
	TOaHY+AQ68gKRnK1IucgoGHYAG0UIkDhABZe0xhi8oXjmkwCFV9v9f9ooZcFInCi44600pNiXYp
	NRduHPunOtQ2nrwhSkyNImlI/vNMPhR4VzKLsnWzkCDFf2dsf9YLuyI2jzYAqA==
X-Google-Smtp-Source: AGHT+IEwvVhbQJMEaGdrFKMtOxiiJCKto8VYM3jUlbmpjF3jkBrGvZ4szLZ7/dmzI2XnhwPbqNTrlg==
X-Received: by 2002:a05:6808:1a1b:b0:3f4:af3:74a5 with SMTP id 5614622812f47-3f6831755e7mr500177b6e.21.1741133344379;
        Tue, 04 Mar 2025 16:09:04 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3f67ee8f479sm299985b6e.40.2025.03.04.16.09.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 16:09:03 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	stable@vger.kernel.org,
	Caleb Jorden <cjorden@gmail.com>
Subject: [PATCH v5 3/6] wifi: mt76: mt7925: fix the wrong simultaneous cap for MLO
Date: Tue,  4 Mar 2025 16:08:48 -0800
Message-Id: <20250305000851.493671-3-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250305000851.493671-1-sean.wang@kernel.org>
References: <20250305000851.493671-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_160905_274381_2493ADF4 
X-CRM114-Status: GOOD (  11.06  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

The mt7925 chip is only support a single radio, so the maximum
number of simultaneous should be 0.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Cc: stable@vger.kernel.org
Co-developed-by: Sean Wang <sean.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
Tested-by: Caleb Jorden <cjorden@gmail.com>
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
---
v2:
  1) generate the patch based on the latest mt76 tree
  2) update the commit message
v3:
  1) fixed the merge conflict
v4:
  1)  add tested-by tag
v5:
  1) update co-developed-by tag
  2) rebase to wireless.git
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 4f35c2f16d0d..604f771af68e 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -256,7 +256,7 @@ int mt7925_init_mlo_caps(struct mt792x_phy *phy)
 
 	ext_capab[0].eml_capabilities = phy->eml_cap;
 	ext_capab[0].mld_capa_and_ops =
-		u16_encode_bits(1, IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
+		u16_encode_bits(0, IEEE80211_MLD_CAP_OP_MAX_SIMUL_LINKS);
 
 	wiphy->flags |= WIPHY_FLAG_SUPPORTS_MLO;
 	wiphy->iftype_ext_capab = ext_capab;
-- 
2.25.1


