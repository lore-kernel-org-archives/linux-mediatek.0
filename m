Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94298E77180
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Dec 2024 01:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yp97iVt69yOBSqlfe/exljPV9iDu960ZlpwaBTRyHuE=; b=p0bYnKD2UvfnkFvdqT0g8zl7cQ
	ZAV08ouD5ZMU1iT5Zgc8hp+AsqiOAkGkNkdq5gt4HIHn7+BbkpFd07qkPPuxhVahu2clSGmRUlklr
	llOTQAUPBaAf9LWl7ZvzWBr9LNJil91pT3/YbHRrKKchlWKUigEjDOfMekpWpBAKGSXMX35NtEyiS
	hgviG6Z/eQ3P3YqZWWaffrC+t76SGyP7GPVgIE4RFlAS4WCOxbnf672Ljf/bgc/5B73BoSGA6B6Cm
	WYp+uKw4u+NkzAuMwsPAbGiZuwHdzX8Fk2PJ6leIDdEj8fgQQtlIYzYVjb9Z0tduZj15NZIOB2BEp
	F3xB8Okg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBOQ-0000000DOiO-2qHl;
	Wed, 11 Dec 2024 01:19:58 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLBON-0000000DOhZ-34Y9
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Dec 2024 01:19:56 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-29fe83208a4so114193fac.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Dec 2024 17:19:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733879995; x=1734484795;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yp97iVt69yOBSqlfe/exljPV9iDu960ZlpwaBTRyHuE=;
        b=ePBINbfYzGuFr0EBDu6e1NH1jONs+QvytalQnQXLPK/URvFwANP/5JSyrkQVVoIl/D
         iykoLkrzjncHmQVZueVZ7JSE4l0QZKyvNrwyeks3a+qJKCycQD7si7QO0feTBAHdnSFb
         pWqdnmbih3yJlfariw83CQq0JIzFpVarn3vh1lHKfYpk1CmMf/iWZN9T540GH5GMIRgY
         1wxGo4oVJeWTrIFrlLGAdWp4KPq8A5naw7BL58PMhrEskk30qModny90oe5ro76bxxu/
         duFq9Fa5MXlJmw82AyAg72HHj11b7CJFmRMYeQxOIM6N5HgfN/UE0Cng81jXEl8Sd32P
         z2qQ==
X-Forwarded-Encrypted: i=1; AJvYcCURsVNYntUs2UhzSNWF5MQolq9gn0PZkgahCYMMLLRB7oKOTnWUpRXn04HBqL0WMHrMaJr9gg9xYMG0SS/4BA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4PXdIhs94Fap3DLX47QTScDXNbzcYAQbg6vwL6Pjs8kl0EUrk
	PRJRchh1msxQW+6U7MbcoqStvK4akejT72PdsyZICcUfpTJ7npRa3r+1zJuyFxs=
X-Gm-Gg: ASbGnctZ6rtcc9/o9ifCWslak4YudwuA1dFsik4juJAPh34Ju+PlFwjQU6OfMMiy9CQ
	EmpDUqLpWC116A+SB8RGfED/K02/0Bb7MlD7KwAKJZ95y0LFYoey2W8BAcze7UC8xR32pCkrBC8
	MfrpkzCn/+jGswHDrgMVq0G0g3QTJw5TQqHhRqW6ffxBbOxlUgIjmTTcJl5n7arYDbDJyhydINM
	sAPQ7As9X7xR7ORw/Iv3TrLpwqf5dtuPMIrJ1YrHgwZ8iXohspIgsw8MxqyVoPCLEBTtbY=
X-Google-Smtp-Source: AGHT+IGub+QpuAGxq89kxr8PhzQ0vEN2Is89Nr60V+LtDwDd1KSFdzv6E/56OxeohVB4H7GUerri1g==
X-Received: by 2002:a05:6871:5224:b0:29d:caa2:f0ef with SMTP id 586e51a60fabf-2a01537d059mr502351fac.6.1733879994868;
        Tue, 10 Dec 2024 17:19:54 -0800 (PST)
Received: from sean-ThinkPad-T450s.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-29f93552d34sm2705701fac.24.2024.12.10.17.19.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 17:19:53 -0800 (PST)
From: sean.wang@kernel.org
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: sean.wang@mediatek.com,
	deren.wu@mediatek.com,
	mingyen.hsieh@mediatek.com,
	linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	"allan.wang" <allan.wang@mediatek.com>
Subject: [PATCH 05/17] wifi: mt76: mt7925: Fix incorrect WCID phy_idx assignment
Date: Tue, 10 Dec 2024 17:19:14 -0800
Message-Id: <20241211011926.5002-5-sean.wang@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241211011926.5002-1-sean.wang@kernel.org>
References: <20241211011926.5002-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_171955_767388_47C3E988 
X-CRM114-Status: UNSURE (   9.57  )
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

From: "allan.wang" <allan.wang@mediatek.com>

Fix incorrect WCID phy_idx assignment.

Fixes: 86c051f2c418 ("wifi: mt76: mt7925: enabling MLO when the firmware supports it")
Signed-off-by: allan.wang <allan.wang@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 6823187f406b..97b48fda5595 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -384,7 +384,7 @@ static int mt7925_mac_link_bss_add(struct mt792x_dev *dev,
 
 	INIT_LIST_HEAD(&mlink->wcid.poll_list);
 	mlink->wcid.idx = idx;
-	mlink->wcid.phy_idx = mconf->mt76.band_idx;
+	mlink->wcid.phy_idx = 0;
 	mlink->wcid.hw_key_idx = -1;
 	mlink->wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mt76_wcid_init(&mlink->wcid);
@@ -851,7 +851,7 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	INIT_LIST_HEAD(&mlink->wcid.poll_list);
 	mlink->wcid.sta = 1;
 	mlink->wcid.idx = idx;
-	mlink->wcid.phy_idx = mconf->mt76.band_idx;
+	mlink->wcid.phy_idx = 0;
 	mlink->wcid.tx_info |= MT_WCID_TX_INFO_SET;
 	mlink->last_txs = jiffies;
 	mlink->wcid.link_id = link_sta->link_id;
-- 
2.25.1


