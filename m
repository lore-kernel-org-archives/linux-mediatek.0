Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3BBD47CAD
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jan 2026 01:06:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajGEE+zV+m1fee4TbMLVvt12s4XfuElR8HLx1UKiaMk=; b=OkB1lSxSwLlsuKKmcQPQWyFyWQ
	q2sHiGLeMrcJrm/s3KRkIiN8gquWOZOeNdnLrDkK/ibLgAL9MFUJbM0Ppxk8/AXtoCf0Jz8gqDbDI
	kCSr4a7ceMQgD15nD5OtXxqWhVS4ovThN/o63g/QefSClLTqtAa6EtLlhIxAl0e8CfMD3PmDHWQsB
	AnoMKX2fxNC6/4FAh5Sz3FEZ7dUgGZahvPLB8zUMiNgGX/YKayV+74BuZmU+W2dTbvuHQXMvngBM5
	a803LiClnZiOuY+f1C9sPO0/gP+iJUm4iDGiboVB2CzY+7LDg3/+Fz+LPrbDnoU1JJnrbX6/TAhqL
	9wyoBHmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHq-0000000DOnq-2ZdR;
	Fri, 16 Jan 2026 01:06:02 +0000
Received: from mail-dy1-x132a.google.com ([2607:f8b0:4864:20::132a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgYHd-0000000DOdF-0uSX
	for linux-mediatek@lists.infradead.org;
	Fri, 16 Jan 2026 01:05:50 +0000
Received: by mail-dy1-x132a.google.com with SMTP id 5a478bee46e88-2b04a410f42so1852848eec.0
        for <linux-mediatek@lists.infradead.org>; Thu, 15 Jan 2026 17:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768525548; x=1769130348; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajGEE+zV+m1fee4TbMLVvt12s4XfuElR8HLx1UKiaMk=;
        b=mXir8ooDTXpa6ozmcPmHCufr1zwVZW58opNW1rPGz8KrjToexTxt/864Djh1GVvn3+
         j1pZUkBWbB0OtJfyVeFTvrNyzmF8QARm/igQ82nI11iYsXw41Ns9t2taAGEti8rDK/mA
         YL40RCMF/6afrCl2TMUfDME10Y+LnZRS8hy9/TVSNSel7R+LlqfSDCyZLL1UOzUnO9V3
         ZC0GQuZJABVCYVRH1Ena0KuANwS8TJFxGuy2OpPS2wDn73AbxOIdvkonC+PNqBXciTv/
         nkwy4fQ1RLDr8lVnRfxm3RX4VHBroSq69Sh3cQ12PZAlzolWnCuFEmuizUiGPV51+ovf
         BK6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768525548; x=1769130348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ajGEE+zV+m1fee4TbMLVvt12s4XfuElR8HLx1UKiaMk=;
        b=ZEEWmJbPgRG2H2DfEjl2bLdq5MA9V7CEwqtqfISyun4m544InYcK7WKL8fRS43J77E
         DuJ/m2Sca9rXB+5llEM48gXxH5Rqfn4wqXt62I07zqB2NzY65ywVMNY0AzPzawvjIs6o
         rbz5e3XBuzkowrYUGQDheLQLE/Qeplq1z8ALMFUFeBhS7Xx189s9E4OS0Sxh0P936Ny8
         iPKYf3uDrDEA3MLVHECICX1UmxOhlgWLGIJwLRMNUqj2n3SyZqMrixFmsLsKwa7U6NUw
         Wk71ZEEq6lWdBt1zfIkviwbqprk/hH2MCygz9e5nMEAYzWJhrTo+1qIhxD5tw39pjwBG
         r5vg==
X-Forwarded-Encrypted: i=1; AJvYcCXUVr0MHV/dPGCB3149Zp8NfNP3C3Pq5WtLIudAV1y26diDFUVS6sk0RCmqTCd2K5+8+gIAocXIY0xyIcdEUA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJAtJH+PsxZsmaFwaTdRtyCCZ3gn6ad5SYuIHREFOU2z65y1TE
	K1GesZUIcpAiVaBxHbw+yKwwsNxCwlrsolFE80gjcSuvX0pU+SNX28sRyOHlHFi5
X-Gm-Gg: AY/fxX4ViVMbVm+YNTquo5xRwJULJZOJBZK9Jxcp7QWPWRsuoQKnEVQ8/0jiLmR4xAS
	WgfpVLB4b1v3g87LJwNmu+Yke9Xbhjupeqi134aJm8DmS+3cWLaXx5zi/irS3EFw8m5CCh9sm4M
	F0VXEdo9K4nzTaDkgnK4URvjv6qfM3EA2bNoOiT6UFu9wJzzJoR+e35oxzguv4u4XUqpmXSAOcs
	MUiLM0p+yErl2zBzIbT0u85e8F10JWPe7CncJozEY/1uqrTEnYICgP2MkU0Er+uGLMYRmBJo9Ue
	QaLEj1HkCrByU/mQ8Na+7CdSWSG2++QaLvibYyWCDjhY97WoLt0TCssz/SX3lQ20oAVDWf9Miyh
	I5dbzRIF6x16opvZW28Uo2sXgiJsjyDcvjRQErz/UACCE//cA8/hEdHm11vw4V18t5own5bomAj
	IaBzhshS0A7lnhlqidcskmCk03ZjxD87WsVRYdAWV1SVWAdskg2knKwtt/PYCOlg==
X-Received: by 2002:a05:7301:1687:b0:2a7:83e:7b17 with SMTP id 5a478bee46e88-2b6b46e6ddfmr1326151eec.12.1768525548448;
        Thu, 15 Jan 2026 17:05:48 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:f1d2:502c:a6ff:5556])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b367cbc9sm1019884eec.32.2026.01.15.17.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 17:05:47 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	linux@frame.work,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	Zac Bowling <zbowling@gmail.com>,
	Zac Bowling <zac@zacbowling.com>
Subject: [PATCH v4 17/21] wifi: mt76: mt7925: add NULL checks in link station and TX queue setup
Date: Thu, 15 Jan 2026 17:05:15 -0800
Message-ID: <20260116010519.37001-18-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260116010519.37001-1-zac@zacbowling.com>
References: <CAGp9LzpuyXRDa=TxqY+Xd5ZhDVvNayWbpMGDD1T0g7apkn7P0A@mail.gmail.com>
 <20260116010519.37001-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260115_170549_280965_909C1D12 
X-CRM114-Status: GOOD (  10.62  )
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

From: Zac Bowling <zbowling@gmail.com>

Add NULL pointer checks for mt792x_sta_to_link() and mt792x_vif_to_link()
results in critical paths to prevent kernel crashes during MLO operations.

Functions fixed:
- mt7925_mac_link_sta_add(): Check mlink and mconf before dereferencing
- mt7925_conf_tx(): Check mconf before accessing queue_params

These can be NULL during MLO link setup/teardown when mac80211 state
may not be fully synchronized with driver state.

Found through static analysis and pattern matching.

Fixes: c948b5da6bbe ("wifi: mt76: mt7925: add Mediatek Wi-Fi7 driver for mt7925 chips")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 7cf6faa1f6..81373e479a 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -871,12 +871,17 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 
 	msta = (struct mt792x_sta *)link_sta->sta->drv_priv;
 	mlink = mt792x_sta_to_link(msta, link_id);
+	if (!mlink)
+		return -EINVAL;
 
 	idx = mt76_wcid_alloc(dev->mt76.wcid_mask, MT792x_WTBL_STA - 1);
 	if (idx < 0)
 		return -ENOSPC;
 
 	mconf = mt792x_vif_to_link(mvif, link_id);
+	if (!mconf)
+		return -EINVAL;
+
 	mt76_wcid_init(&mlink->wcid, 0);
 	mlink->wcid.sta = 1;
 	mlink->wcid.idx = idx;
@@ -1735,6 +1740,9 @@ mt7925_conf_tx(struct ieee80211_hw *hw, struct ieee80211_vif *vif,
 		    [IEEE80211_AC_BK] = 1,
 	};
 
+	if (!mconf)
+		return -EINVAL;
+
 	/* firmware uses access class index */
 	mconf->queue_params[mq_to_aci[queue]] = *params;
 
-- 
2.52.0


