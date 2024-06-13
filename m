Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D69BDC27C53
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Jun 2024 03:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8jO8Gc5RDctWw/ZhCBLlPB6OeGfOoPDaHWniwL5VRGE=; b=eG5EuJYDgSdaePSVksKr4qz4Kd
	worxt7ypD7R70MVaCpxqE95ij9DEkoJWLRcLwhkzrUGLIO4oJ+nz/u3Wgj0oM+wFF/BUwU6J9wik7
	vPXtldN3pBq6XnfcMfdsDB0psGYLGC357jS6s2SIqmHeKiyNL2jpUqqqk5NG35gquSiwxwy98fgI+
	srP02CKAbQHjvYzkiB9j0EvZBeRUqaaCb6scgSEHFTylSnwAx3o8F8Kaps9lOCEK17iTNb+kvEH0M
	7aTZBtats77BpIRHCn/BAl3YewoJX5tTmJnSmvJ/Yuz8UTcL+8UOLcVak1et31ta9Sd5yw3xQ/VJG
	ANsInn/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHalJ-0000000EwUK-2OnB;
	Thu, 13 Jun 2024 03:04:29 +0000
Received: from mail-oa1-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHalC-0000000EwPs-3Wha
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Jun 2024 03:04:24 +0000
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-254976d3327so77814fac.1
        for <linux-mediatek@lists.infradead.org>; Wed, 12 Jun 2024 20:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718247862; x=1718852662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8jO8Gc5RDctWw/ZhCBLlPB6OeGfOoPDaHWniwL5VRGE=;
        b=vibuy2qLX//Z0YCoijldtKEsLUkH+RbNp4nuFmVsEr4dSjW7EdAq3t2ywP/sDgwC6q
         Th3ri6w34yhXv3zQMMQPl4nJi6CE4s0doghYTFGZ+mhCnhg4hnsOYodF7G3KJv6/84/X
         d9QRS3wuGCPX1J1yN3N6QqOz1ud+ug1kJxv2AcVgCEIKLOi80fyufMK0wUVuJW74WQIc
         C+Q8sMsNryP2R0aghGoSrPkZuEMJBn8K3UQut+DfIp4JYAnoPkeJy+H+lwy3lButWKFJ
         /9Nb56hKnQ6+RA41KpQnwtzWXLrsnvUhQ8XxudPks5O7sBU91D7oQCjM2sxWCMv+hXJl
         7CVw==
X-Forwarded-Encrypted: i=1; AJvYcCVIEqDG0TOdeiiq2xIK1yvFSKRZbWQCbXwJbYcE7zK2xUS16Fh1Tw545YrPLN1jmZGTFlwzis76yCuxjQijzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzQHX2FeCeXVKixUaV0ADu5w7pS5ZZqrk9RlbeCtn6gPmtos7Ix
	MI0dl8Lkox21w+ZGQ+028AQIxkBhgjZtP9OEfV6Ac7kzPi96UFty
X-Google-Smtp-Source: AGHT+IFGHgXP29zx8KF95nPLg6SntZXj7M9MxPR4qFdAyLnNZf/Wwbn8J1+lymEzEjIjt3HPXJT4lA==
X-Received: by 2002:a4a:8552:0:b0:5ba:ca86:a025 with SMTP id 006d021491bc7-5bb3b7a9135mr3998243eaf.0.1718247862043;
        Wed, 12 Jun 2024 20:04:22 -0700 (PDT)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5bd629263c5sm67685eaf.46.2024.06.12.20.04.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Jun 2024 20:04:20 -0700 (PDT)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 47/47] wifi: mt76: mt7925: simpify mt7925_mcu_sta_cmd logic by removing fw_offload
Date: Wed, 12 Jun 2024 20:02:41 -0700
Message-Id: <20240613030241.5771-48-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240613030241.5771-1-sean.wang@kernel.org>
References: <20240613030241.5771-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_200422_914937_B3E4F9F4 
X-CRM114-Status: GOOD (  10.94  )
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

The mt7925 only supports offload firmware making the fw_offload check
redundant. This update simplifies the logic in "mt7925_mcu_sta_cmd"
by removing the unnecessary check for fw_offoad.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 7156ba092302..c0b27d28a6d1 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1643,7 +1643,7 @@ mt7925_mcu_sta_cmd(struct mt76_phy *phy,
 	if (IS_ERR(skb))
 		return PTR_ERR(skb);
 
-	if (info->link_sta || !info->offload_fw)
+	if (info->link_sta)
 		mt76_connac_mcu_sta_basic_tlv(dev, skb, info->vif,
 					      info->link_sta,
 					      info->enable, info->newly);
-- 
2.34.1


