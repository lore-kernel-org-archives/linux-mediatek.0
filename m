Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29065E77180
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y62PD/q4WifdsD9DWO73O3hL33oH6LRMI1tKvJMAWf0=; b=BPok5kbzqG1pCAt1WUVdnDD8b9
	fHZpUYQF+a50OGsiJTnAnf2ngQWgmZwHwNdx3V4ZNf6PYvY6ZbGi3PmLfWEM84D1REIfABmSLSI2t
	t1ywGDNFPivMjChhHyfUexfbfaWGUf0XOp4npnfMwmd3VMVR0otS0utdDkQ3xQnmWlUg0Nz2sLtaG
	FHHA9on1WfEfC0J/Q3DZoAKw63OEdH+24ziSKpjcljDZbCvbG82ifyq2WqciOrsV8pNV/yuSkEZyF
	0IF7DSX2WzuC1TOet7cFmrhretPbbyWeA4BucBOPsGm2+ilOuP0DWAwGorcNbKs25458mfAmTxPzz
	Iu8Kmb5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOd-0000000DOoT-0Y2y;
	Wed, 11 Dec 2024 01:20:11 +0000
Received: from mail-oa1-f47.google.com ([209.85.160.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOb-0000000DOnI-1xWv
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:20:10 +0000
Received: by mail-oa1-f47.google.com with SMTP id 586e51a60fabf-29ff039dab2so875201fac.3
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:20:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733880008; x=1734484808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y62PD/q4WifdsD9DWO73O3hL33oH6LRMI1tKvJMAWf0=;
        b=pRE4Ap839ZIvfvLdw9deGG87Cst6ZvGuW6Y/Bisr96JfgEH8F4bpa27LjvLwinOsZG
         0urrF5b1uPuMLr3ilQapcdjZecbE1gbqpInpZ84ERX1mC8wWNpxN3j4ru5oqyfqjaMyG
         2eBy4pgtHMc6ZaZb6zuNdXDuDJUV+xtRmx3L5bIFxSHI9pTljMTeASqr89jb7hyRHCQo
         mzTsifOF56AgNTDNZ1XzS1vpZaG9eTt/+mYHVvmly/DdGxmk+OVw7L3ibotMWTijcPcP
         +M+C66PGowUp5Kvgrjt2E5jt04/0wbN+HlPv+Ajz7RdgQ1rvub2mx6IvY29dXeqGO6Bp
         FyYA==
X-Forwarded-Encrypted: i=1; AJvYcCWQ2LAuoPr4gw34clyszE2SeVIQpZbt8RARJ2cckITNYRLeAr/WbU4WEi2g2dccphFGclOBhMEWQcVnSgG4RA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwP3CHPm63E3/pF+XPettVLYw2wL7VOcZNK40DEDfRsaaj/74Bx
	cedasZhheqrZQQUvnmJMtu1O+8sMzJXEx7FyLGwIhKfFaEGGLSVK
X-Gm-Gg: ASbGncs5+WSNnJ9iDK8L+PqF6aZgMKRgdfhfGiGwhQaDe0bKbgVNieFGlS5ywQwfWN6
	7by0Qf62kt0qjgDthK5H1r/6dBWizHKhFI8wm+p3MmNclmNKz8KpBiWiksyA8kk4cGfrdjRMLuJ
	oeEI+kSa6nIFyqIBBIw9b+pIvUpGtLKs8MfJvXIVQWijzfK1GuSokrEFzg2KCidYLZkk0UOyRtP
	XD1Et+lbATyAjzja3NOkDuSZ0c1bM7MnCTdzzM5RqTlZIrCSwK3Sk92/treke/rwLwRuqA=
X-Google-Smtp-Source: AGHT+IHi2n0Oe10OpBcmMYum3qtEL9tyj3CRay7lN1GLs50XcirrOBt7LFdX+aDJKqzt8/dNOU+ccQ==
X-Received: by 2002:a05:6870:168f:b0:29e:2d50:11aa with SMTP id 586e51a60fabf-2a012c1ddaemr707724fac.18.1733880008569;
        Tue, 10 Dec 2024 17:20:08 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.20.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:20:08 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 09/17] wifi: mt76: Enhance mt7925_mac_link_sta_add to support MLO
Date: Tue, 10 Dec 2024 17:19:18 -0800
Message-Id: <20241211011926.5002-9-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_172009_504003_9900907B 
X-CRM114-Status: UNSURE (   9.07  )
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

From: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>

Enhance mt7925_mac_link_sta_add to support MLO.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 93e00a3840fe..9e9f33b6a1bb 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -878,9 +878,14 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	link_conf = mt792x_vif_to_bss_conf(vif, link_id);
 
 	/* should update bss info before STA add */
-	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls)
-		mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
-					link_conf, link_sta, false);
+	if (vif->type == NL80211_IFTYPE_STATION && !link_sta->sta->tdls) {
+		if (ieee80211_vif_is_mld(vif))
+			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
+						link_conf, link_sta, link_sta != mlink->pri_link);
+		else
+			mt7925_mcu_add_bss_info(&dev->phy, mconf->mt76.ctx,
+						link_conf, link_sta, false);
+	}
 
 	if (ieee80211_vif_is_mld(vif) &&
 	    link_sta == mlink->pri_link) {
-- 
2.25.1


