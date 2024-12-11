Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D584E77182
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAlj/teGsDEq9AqLoVCNv/Q4QETD233FzVs6JHfwoUg=; b=O8MGVR/L+2/fLxeRm9D1ntMp3W
	D72AhoWJw0XNjHHoXICAWRVBQ843G/COD+8smex/nuz7Je5I5UKrJn4eddotnqN5DXS2XbELSIyNo
	vLcGPrd0hOkJnnfCuw7krjIz16SA4y+fXN0RGL1d1J9E/SSNoIr0KsubtGx2pNJqUQpDBPeBtI9YD
	ZOJ1I43ScOTaeIZmgWMlbBQBfZY2nbZXYZ8J22cNC+fUZGYA9C890Nh+bRvIbGtVYZ63jPZvPu6Q8
	FISkLY2fu4J/Xixsv5mP0N6wxEwlFZTzrXdvLtMtJ/2PNM5gA459MCcHOScLQVBHhVtUMmHoaJgsh
	IQfwcGlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOC-0000000DOco-3JbV;
	Wed, 11 Dec 2024 01:19:44 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOA-0000000DObe-2r9H
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:19:43 +0000
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5f2b936ad48so1223356eaf.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733879981; x=1734484781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zAlj/teGsDEq9AqLoVCNv/Q4QETD233FzVs6JHfwoUg=;
        b=QqnQMOPrZvX5lD4TAks3REw+HHEfZ1K+CUDecnq235M4WuJ7u2bG7v2zwI4TGb+R+h
         SMdQIYDT+8ROKL/XVCHHuAXq4S8a/PB1SuNZSmj0RI5yzBkTsvMJMUv5Eimdh0du7Los
         u1QZhR6IEz+m/kHMXb5DX69mT7w2p/N27LkSz5aAvbSwCEHX9zQ4nmzx9lNRawYg23Tr
         826YiYKeY6yWlRUn+6ViTd712xkzV9XY9QVShFrNU4RtQBQ2YEM8ZkSzs02YzouWGuhy
         u0uFeMCRtbeskSXD/aHItnM2sqnkLcas9kQgmUEXyRKjEuxsLw+ltAuVvurrTKWS2BRp
         roxw==
X-Forwarded-Encrypted: i=1; AJvYcCXp5cFmCX4r0epa+Qicnhnp0f9s3AtzsNh73OFoJVtZSyo6Qa3N9ZjIsawR2q+Hmv/5WE8v3kiY2PhifvEbrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVRpimf2EMsIkhhs/KH5jcIixhz7FVPbptmGkES9FCv38zY+VK
	WhSijo1RaGV4H9F6ijjtHL4vY8rik2msM1Ce24lenVTk+8rD4zWh
X-Gm-Gg: ASbGncs34pxOedxIBFN931JJEDo/lq9+9bmX0Mx6D1l4VBQGzNnPEJjSIOrOjKcHvhl
	4xxHHOZKW7+scWYf6fF9MG1t7XO9IIceto6DB3KcH/GIZRMDXEx6k3Z5CR0T+/n3vcj5NmsR642
	vfvjQrzi0X6HocmfXNqtONwRF463yq1jW2NJrMe91KqpMfYOlaaI2tJXxBbe5r6eClcB6cncny9
	MXu8I/9Vr7vllLQLi4uUyw2puimz4vZwnXfYpT+tGwpa9WWdvOopXvrXVbZTICVgxcBa9I=
X-Google-Smtp-Source: AGHT+IEKGtkKMDcOAvSZPb9fRrb8ifnKVB5UFdmFjXR1LR7QbnJ19pUR1iRC2SZdihLd7LrZZ/euWA==
X-Received: by 2002:a05:6870:3286:b0:289:2126:6826 with SMTP id 586e51a60fabf-2a012d9ce35mr796668fac.30.1733879981290;
        Tue, 10 Dec 2024 17:19:41 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:19:39 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 02/17] wifi: mt76: mt7925: Fix incorrect MLD address in bss_mld_tlv for MLO support
Date: Tue, 10 Dec 2024 17:19:11 -0800
Message-Id: <20241211011926.5002-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_171942_720196_ACA2932B 
X-CRM114-Status: GOOD (  10.78  )
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

For this TLV, the address should be set to the MLD address rather than
the link address.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: Ming Yen Hsieh <mingyen.hsieh@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 0c2a2337c313..7189d4f6dd4c 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2463,6 +2463,7 @@ static void
 mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
 		       struct ieee80211_bss_conf *link_conf)
 {
+	struct ieee80211_vif *vif = link_conf->vif;
 	struct mt792x_bss_conf *mconf = mt792x_link_conf_to_mconf(link_conf);
 	struct mt792x_vif *mvif = (struct mt792x_vif *)link_conf->vif->drv_priv;
 	struct bss_mld_tlv *mld;
@@ -2483,7 +2484,7 @@ mt7925_mcu_bss_mld_tlv(struct sk_buff *skb,
 	mld->eml_enable = !!(link_conf->vif->cfg.eml_cap &
 			     IEEE80211_EML_CAP_EMLSR_SUPP);
 
-	memcpy(mld->mac_addr, link_conf->addr, ETH_ALEN);
+	memcpy(mld->mac_addr, vif->addr, ETH_ALEN);
 }
 
 static void
-- 
2.25.1


