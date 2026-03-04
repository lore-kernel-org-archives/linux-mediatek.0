Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E291DEFCE53
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Mar 2026 23:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Ifn8MRmL2Rzzn2OVQLCOQAsiMkzCVLXoTf/UR06PTs=; b=Ao/NYDOaC7ezvGR6YpPHbS9VXX
	n7EcT9yuTJDmz8iqLWG/vKmVSIvKCRMTQcywKddyfMbAZwnk+RtCp9PRwM6QOOq5bC6NQWz8htPJ2
	ehaiW79hPhp0/panSYuJw9XGSl9ZF0B25T6vY6cTxr/5lpbr+tQAsP166l13v4E0nwVlKYMwUlQTA
	SMA9WmPB63957krsHksAu9f0KT4N99+Bz4kQ5mtgzU1LHppOBaWzg+UiWY6KqdraFRZjubVInNw2b
	XI09q3nBVjHx8dOACXKThlS0qrn6EMPW7wLZE4u11Ai7h2cmm4GdanI2VKtD/5Z+7H/zczKKxJRxT
	tHpNqOcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvzR-00000000eCc-3xRE;
	Wed, 04 Mar 2026 23:50:53 +0000
Received: from mail-ot1-f49.google.com ([209.85.210.49])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxvzM-00000000eAn-0XW1
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Mar 2026 23:50:52 +0000
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7d4c85307b2so5208764a34.0
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Mar 2026 15:50:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772668247; x=1773273047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Ifn8MRmL2Rzzn2OVQLCOQAsiMkzCVLXoTf/UR06PTs=;
        b=nw/FktagNOc+mpH3GJAM8yLTW/lutJzHASaq2hoes+JzhJPkSZ3rv44UpHIPbmlTVf
         LBtgrm67DfzenWHGoZaao2au3EntmpIIqL2l/Qpp8D0xcBOj/of+EsEftZbWs8F/6+xp
         zq8WnEXoOpP4UHCHYu8bRjpk/nKn6Ao+YQiqXduXUP/s0D3A2VDPe4h1iFMnUpQXj5L1
         fBDDExR1PJqVtoXe77F1+p84iCv8SwmCoAvbKFYcfuhdOt7gvgXKnIFwrI0HJPC16ZSW
         5vaXIk8M2bQdsVLdIGTyBs5dDm60QbxvVIru8K1rw7a6wzBOYNOug0MFxt2HGh+qg2Lr
         HhFw==
X-Forwarded-Encrypted: i=1; AJvYcCUF8psxPbkNP0n4HctF144EYeBIOPkbRacFThosZzzfwP5x2g2G1jDHKoqbgmyN/+l8NXSifWeOYgCvho+21Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9nauV4d6f17Sgh5P8uIhPerL92UIVH842bO4tRfSowaZPmzBY
	uEJ6PCIODXcIA//epDpt+vpPXF5bGWIRgP3J50BSEEwMXEz53KLXB1gb
X-Gm-Gg: ATEYQzwjDGKgVjCrU22+U9+vpP2KkIx1Aj/28JVnhuC/OLB21p3XYkqLWU7/FWkFSHA
	LZkR1kS31rjUTlH7E13n6pmRPphZaZJIpJSRs4e79kV72ob8ki11s2tsmz49otKRJvdZgdyPOx2
	w9dcRqBCjRuCVLird/uJAcjY/CVL5DFJuThgMp+jJd8CsKhZ8XDAn73mJ42Uvjnlu/SCfX1izz0
	YPP7cpx0zlJ2jGoLeNoue+zhsL0OyRd0V+FZnZ3OQuJMFwbS/AxohXv+mwuFKWWKLLyo6AJM8bL
	zrqRHACdgzqZ5iQg1N6uRYfIx9Wzcwfx4e6/rB7d0pEHf/PsoP7dMGcqnmpU7UKPwcms1oGfBgF
	8uzDpFFK4tn8BdGJh2SbuLhb0a57Y8JqPGi+Pqmyah5us7if6te5fPGTrzbfeZuXKL+wj2bTlob
	eoAzECN4mn1TK53x8pwf7JJZJX5ON9WkzWg7ziRvl7l5Ymbpw=
X-Received: by 2002:a05:6820:488b:b0:67a:2305:5e4e with SMTP id 006d021491bc7-67b176f8840mr1723687eaf.17.1772668246921;
        Wed, 04 Mar 2026 15:50:46 -0800 (PST)
Received: from sean-HP-EliteBook-830-G6.lan ([207.191.35.252])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-679f2bfee3csm14410687eaf.7.2026.03.04.15.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 15:50:46 -0800 (PST)
From: Sean Wang <sean.wang@kernel.org>
To: nbd@nbd.name,
	lorenzo.bianconi@redhat.com
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	yu-ching.liu@mediatek.com,
	yuchi.wang@mediatek.com,
	jenhao.yang@mediatek.com,
	posh.sun@mediatek.com,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 2/7] wifi: mt76: mt7925: guard against NULL chandef in BSS RLM TLV
Date: Wed,  4 Mar 2026 17:50:15 -0600
Message-ID: <20260304235020.40451-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304235020.40451-1-sean.wang@kernel.org>
References: <20260304235020.40451-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_155048_175482_41E0452A 
X-CRM114-Status: GOOD (  11.25  )
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

mt7925_mcu_bss_rlm_tlv() dereferences chandef->chan without verifying
that chandef and chandef->chan are present.

While current callers normally provide a valid chandef, future call
paths or partially configured interfaces may result in missing channel
information and lead to a NULL pointer dereference.

Add a defensive check and bail out early when channel information is
not available. This does not change behaviour for normal operation.

Co-developed-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Stella Liu <yu-ching.liu@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/mcu.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 1379bf6a26b5..e050c2795cb4 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -2291,11 +2291,18 @@ void mt7925_mcu_bss_rlm_tlv(struct sk_buff *skb, struct mt76_phy *phy,
 {
 	struct cfg80211_chan_def *chandef = ctx ? &ctx->def :
 						  &link_conf->chanreq.oper;
-	int freq1 = chandef->center_freq1, freq2 = chandef->center_freq2;
-	enum nl80211_band band = chandef->chan->band;
 	struct bss_rlm_tlv *req;
+	enum nl80211_band band;
+	int freq1, freq2;
 	struct tlv *tlv;
 
+	if (WARN_ON_ONCE(!chandef || !chandef->chan))
+		return;
+
+	freq1 = chandef->center_freq1;
+	freq2 = chandef->center_freq2;
+	band = chandef->chan->band;
+
 	tlv = mt76_connac_mcu_add_tlv(skb, UNI_BSS_INFO_RLM, sizeof(*req));
 	req = (struct bss_rlm_tlv *)tlv;
 	req->control_channel = chandef->chan->hw_value;
-- 
2.43.0


