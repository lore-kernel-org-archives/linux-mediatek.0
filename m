Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E5C6C2A062
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jan 2026 00:27:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j8HRHCajxeLrhtL1S291ZrvpdmCzir8N7qq8yDbrsMI=; b=zYZx5puLK4NyQaGU+IQLaXc+Ie
	dXCIOvYQdAQszpBn9/FvSULf48vvAPglPqzr/XNcZdbygaVnr94YBixbUrQSfxI8iC0s3UYyOqlrh
	Or2PLd7xbVtN5ijQkv9afKClVtwVLmDNt/t/n9rXW/0+Yjc8YIaG5PfLANORtA/KrhoDhcumBlCLN
	SZvh+2Sy0TWN0VVxA6dB/ZFf7jpMJQer5RsrzC03WUPWPxZvRgcMNfFLRvb1MkuWtjwf8XmV6bLyW
	w+yTgCYmQYZ5nKsQ7WYM1Sb/PshcjcWGykcN4IZws4wSQok2Hep3AzQFKc6kPa374g/dmGRLbnt21
	HSAJXVEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYRB-0000000Aa6I-2Edu;
	Mon, 05 Jan 2026 00:27:09 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcYR7-0000000Aa1l-31BC
	for linux-mediatek@lists.infradead.org;
	Mon, 05 Jan 2026 00:27:07 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-c46d68f2b4eso625512a12.2
        for <linux-mediatek@lists.infradead.org>; Sun, 04 Jan 2026 16:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767572825; x=1768177625; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j8HRHCajxeLrhtL1S291ZrvpdmCzir8N7qq8yDbrsMI=;
        b=fIXRBEIVL1epAKAHNFyEkXr1gqf7F7kLze32Pk2Ln1xhSIs/g3fV5ia2mib0m4lSPx
         NqA/DKLTH6MnR5rzULTpC+z4st2xQ/FbLSdaR7b3RvfFlcRcxKSnI1g7bKMC3Jp9jkug
         8ac5xH0ZhvnduV3oprmzA7zt15/ZRi5kF1YUch39w0jzTbqKcaAzmBxdaeuzuMEd9LUC
         i0RQy/AZgFmqAmtMSSOkThmy9iatG6WF8USEjV/4y7OOoeZ5OQTLrIYHZdW3tdobjB+2
         laFXhjwpEy1a95mU3L4J/QsNObfgeNTMAi0QdGNmunm1LD50pNxoCW/C5lpoKNQYNnTE
         Kd0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767572825; x=1768177625;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=j8HRHCajxeLrhtL1S291ZrvpdmCzir8N7qq8yDbrsMI=;
        b=DQzKaIzU7DEmUqyuue9ZsV4xnOj/5gBY90wRWhcAV4xyeIPiucNlj+/CE4Hobhi4/F
         gwje4q7RQTmT2x9wWQO597ozgyFja6EO6zDuo9pftYK+62NHUMVFt2Qgni59wImlwRKK
         T9ps1WdcxWAhDMzjXPxUKNU/+0X5Gw7WTfaS843UlSNu/WC2cNDfXojQ/+Xh9UE/mtno
         pI8RNrlDl0EPXW7FN3bclVKYt+B8EOvz8FLgbqUxlqxtIgd5L6P16a6rJDQWTs1jlzVt
         A+lyY6fPqpiImg7L++wiK9ec+HCfW5HXsjLszkK47fX5SBovURvImf4GQcYh8r+VywG/
         IwxA==
X-Forwarded-Encrypted: i=1; AJvYcCWeiUoFFWrY+6CjmSe6hQ7i6/RIs16NbXRA0mMdqSRyfigOcXmiwU20GQDipOxBkoOoKKmyPp9JgZKapS0Weg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzX+DYIyqFKJVfTRjhJOgP4/7TSPciFxYuu4kGsl6P95VGQ1HHQ
	H5PZk6qtKXsXipke+JO2W3UXwRXQQxF8szkTFq+9VvBeSpNfcNrIB0Ol
X-Gm-Gg: AY/fxX71U3VAGg+esAXr8W5aI/Xfrv4z0LoLAtNF9Y8nNkn6oHxsKXSUDO1pHcC2qfI
	Lp98TpEAa1b/Zzk14qkeJVS5srWNard1N2KDMjmiE66EgkqVG8aj2ug8IvbO6oypgrUEZNaViDl
	UUJ024T6p8LHC2K3lE7AL3mEpDUlICgkx4ndp271zJKmAOC2nsAC7QHV061zoq3x4KrBw5H2nKP
	EWmL/7WMO0PPkXPY+luHeDr4LOe3N2wToUlhCyErXk5/gK1UkNtzlhDPk6jDkWd3r5gnvT++6fv
	woz/S4nCvcnqAoS646v5Mi6is78GR/RzPlQOVeRaHjlVYoBVIt7ARBx80SLrUPRHNuhIOJ7S23G
	Kk56iaXtbJVoMK8asxRkCzfQLLFC1jToHqSkG2Q7pbmTIhLXF/VOCE2VGuus654EHz8sv8meB9O
	dWVW4FWnYSuFcmRJVT8/FZsyNDaixqw49Boijanoqv3hIBkiv7VKKZ8S6KlFy3ZSk=
X-Google-Smtp-Source: AGHT+IEY0zZXsw28HdBCqO5suui0ZQArzOaey4A7hNOTjMt9GTJKdAkyGN3WU76yNJIYmYwh3R5SvA==
X-Received: by 2002:a05:7022:f00b:b0:11a:126f:ee78 with SMTP id a92af1059eb24-121722fd228mr49567544c88.34.1767572824695;
        Sun, 04 Jan 2026 16:27:04 -0800 (PST)
Received: from zubuntu.bengal-mercat.ts.net ([2001:5a8:60d:bc9:9ebf:dff:fe00:f8f2])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de268sm133378109c88.8.2026.01.04.16.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 16:27:04 -0800 (PST)
From: Zac Bowling <zbowling@gmail.com>
To: zbowling@gmail.com
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com
Subject: [PATCH 13/17] wifi: mt76: mt7925: fix kernel warning in MLO ROC setup
Date: Sun,  4 Jan 2026 16:26:34 -0800
Message-ID: <20260105002638.668723-14-zbowling@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260105002638.668723-1-zbowling@gmail.com>
References: <20260102200524.290779-1-zbowling@gmail.com>
 <20260105002638.668723-1-zbowling@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_162705_762727_D29BF42B 
X-CRM114-Status: GOOD (  16.35  )
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

mt7925_mcu_set_mlo_roc() uses WARN_ON_ONCE() to check if link_conf or
channel is NULL. However, during MLO AP setup, it's normal for the
channel to not be configured yet when this function is called. The
WARN_ON_ONCE triggers a kernel warning/oops that makes the system
appear to have crashed, even though it's just a timing issue.

Example kernel oops during AP setup:
  WARNING: CPU: 0 PID: 12345 at drivers/net/wireless/mediatek/mt76/mt7925/mcu.c:1345
  Call Trace:
   mt7925_mcu_set_mlo_roc+0x...
   mt7925_remain_on_channel+0x...

Replace WARN_ON_ONCE with regular NULL checks and return -ENOLINK to
indicate the link is not fully configured yet. This allows the upper
layers to retry when the link is ready, without spamming the kernel
log with warnings.

Also add a check for mconf in the first loop to match the pattern
used in the second loop, preventing potential NULL dereference.

This fixes kernel oops reported during MLO AP setup on OpenWrt with
MT7925E hardware and similar issues on standard Linux distributions.

Fixes: c5d11e4a9fa8 ("wifi: mt76: mt7925: add mt7925_change_vif_links")
Link: https://github.com/openwrt/mt76/issues/1014
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 .../net/wireless/mediatek/mt76/mt7925/mcu.c   | 20 +++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
index 958ff9da9f01..8080fea30d23 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/mcu.c
@@ -1337,15 +1337,23 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_bss_conf *mconf, u16 sel_links,
 	for (i = 0; i < ARRAY_SIZE(links); i++) {
 		links[i].id = i ? __ffs(~BIT(mconf->link_id) & sel_links) :
 				 mconf->link_id;
+
 		link_conf = mt792x_vif_to_bss_conf(vif, links[i].id);
-		if (WARN_ON_ONCE(!link_conf))
-			return -EPERM;
+		if (!link_conf)
+			return -ENOLINK;
 
 		links[i].chan = link_conf->chanreq.oper.chan;
-		if (WARN_ON_ONCE(!links[i].chan))
-			return -EPERM;
+		if (!links[i].chan)
+			/* Channel not configured yet - this can happen during
+			 * MLO AP setup when links are being added sequentially.
+			 * Return -ENOLINK to indicate link not ready.
+			 */
+			return -ENOLINK;
 
 		links[i].mconf = mt792x_vif_to_link(mvif, links[i].id);
+		if (!links[i].mconf)
+			return -ENOLINK;
+
 		links[i].tag = links[i].id == mconf->link_id ?
 			       UNI_ROC_ACQUIRE : UNI_ROC_SUB_LINK;
 
@@ -1359,8 +1367,8 @@ int mt7925_mcu_set_mlo_roc(struct mt792x_bss_conf *mconf, u16 sel_links,
 		type = MT7925_ROC_REQ_JOIN;
 
 	for (i = 0; i < ARRAY_SIZE(links) && i < hweight16(vif->active_links); i++) {
-		if (WARN_ON_ONCE(!links[i].mconf || !links[i].chan))
-			continue;
+		if (!links[i].mconf || !links[i].chan)
+			return -ENOLINK;
 
 		chan = links[i].chan;
 		center_ch = ieee80211_frequency_to_channel(chan->center_freq);
-- 
2.51.0


