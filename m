Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBFA3E77180
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:20:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdfYkugeufvaD6bBwr+fMjYhLzDCWCLOV5qz0sJPubA=; b=WP6MOqTMVC5BS8P/OGWnPkUAMH
	UBjx7uJ+K29+XnyhPse66LO3GETV+QOxJowix0SyZKAfc29LJiLZsHBgPYX1ZSceeOug25n+MMT7g
	bAdi8DB16ONEc3w9JFPAkOZVp3HL+dS7G3/qHNrQDloTp2gRMBPkq4p2dbOvfcWzlcMDf+FDEpR6Z
	LG6ZlEjdX4ymv7bj08pcGqtm4ZBxECOWQ4rfSTJwahchgubh6ro4SucTMuKWTFVObWOhBDkmgGe6I
	xGMgeNkLy2leS/HmNNfcNwvnkJEcfBUE4paaew72P91krgNGiYe+A/3fpmO3pEX7EckydxO8HnVon
	5E9df4mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOl-0000000DOtf-0VTd;
	Wed, 11 Dec 2024 01:20:19 +0000
Received: from mail-oi1-f169.google.com ([209.85.167.169])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOi-0000000DOrQ-32cD
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:20:18 +0000
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3eb40876bbfso858701b6e.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:20:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733880015; x=1734484815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BdfYkugeufvaD6bBwr+fMjYhLzDCWCLOV5qz0sJPubA=;
        b=J5DWPAkSnjNcSD+wVVqUjU57L08VFtnvFY3/PaggNgngKfCdT14f00ArKM9QW1nYIt
         htyxjosTdtJUzrQUuCXoHHjxajkTYN2vS1/RcuGwfkOcwPFWASy3VFQGUC0Wfw7+zT8R
         V1x5Cgt9YTr6ePfGVYPaYRmTURrjK6Gu+NmKFbxPT9ITBtBsc8WeIjzYAhERhCHyZypy
         5Pg8NnmB77IlhsWpwHVHyKw42aGRwnlgPgWAIxfiMnxB5cMtziOWK7SMAUsEmO6ey5uq
         +NPb6KgRd2roDUkqSV7IHA1AtmMaQkiE4U8SFQqtPa/Fa84U4mzGtsAV2EwGSb+SPyCt
         Sfyw==
X-Forwarded-Encrypted: i=1; AJvYcCU1RAx98PWn+FoHQ9HDQ/tnKdSKAbdsMluKk+4/geNeTzMnEwO3YMd6SIJy23sxQnHLjgY6Xeh95MHa6abLNA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuVUz+EWwfFSqxUtze8tX20VreSi/MI4csEorqGD3uDwhMkEh/
	XGLG/sODOEP0H9YmUSs71pARmBCPdwM/IsvFXcDpM+RWXaymKtPa
X-Gm-Gg: ASbGncuHiiEgJRKMjBtJtAEI3Y3B3LXOntQz+oEH8GL0WZYOU8/bhmfUl3zzfOgJgTY
	DP7mcwatXuEdzL3PCpxh5xf8yrjlpsjcSIDQgVUZUcylaF5Mrt5Y+M1kSmMJXaf3UN5UNHvM+u3
	n4H6WFVTJ2JiX+9GrlSlN8FfUADkZiWWQtKUoXCklbusm1prw/Jt9Shis4QSL1XnY9lgIeMyv42
	BxrGFXzG3lb7BYxi/WLkIg43Ci0dTkD/Yz503uVteI61DVhqbcG7qONXoOhuAWhvVGVVzI=
X-Google-Smtp-Source: AGHT+IFsi/N15YrTJAV4K2mZ/2RhdEDq73CVQz1/8jVmt+l1w+60W75u2y3clZ11ZP1IRXt4WmmcCA==
X-Received: by 2002:a05:6870:470e:b0:29e:49b3:c50e with SMTP id 586e51a60fabf-2a012c1ffe5mr693962fac.13.1733880015653;
        Tue, 10 Dec 2024 17:20:15 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:20:14 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 11/17] wifi: mt76: mt7925: Update mt792x_rx_get_wcid for per-link STA
Date: Tue, 10 Dec 2024 17:19:20 -0800
Message-Id: <20241211011926.5002-11-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_172017_200317_C05D996B 
X-CRM114-Status: GOOD (  10.45  )
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

Update mt792x_rx_get_wcid to support per-link STA.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt792x_mac.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c b/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
index 106273935b26..05978d9c7b91 100644
--- a/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
+++ b/drivers/net/wireless/mediatek/mt76/mt792x_mac.c
@@ -153,7 +153,7 @@ struct mt76_wcid *mt792x_rx_get_wcid(struct mt792x_dev *dev, u16 idx,
 		return NULL;
 
 	link = container_of(wcid, struct mt792x_link_sta, wcid);
-	sta = container_of(link, struct mt792x_sta, deflink);
+	sta = link->sta;
 	if (!sta->vif)
 		return NULL;
 
-- 
2.25.1


