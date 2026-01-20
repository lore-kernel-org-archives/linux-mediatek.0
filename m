Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1406D2629E
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jan 2026 20:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gyEJCUGxWh8NOcDt1pHqHJNYXEMGHKOoRcUV6C7L5qs=; b=kiE6UIEhGqqVOfALce8fmnSF4f
	GHAS09Tw6Ztsq9FhGdkPuJJsAMpruZ0JGtYADAKKKZ8RrsM7dmcfZdl7lSCvEwRqhIKMqWKQ/Z5V4
	PSxisPjyEOEm6D91O4/WJH12J0ojW8qTWd9fdZlL5+EwaSUSGRCaubo+zbZXQEEdE87qFOLDXLeg1
	1iX3iAzrM/9YvgVO09hcpCzp9iZwKXrc3lZ4/XBarMAblNeufv14O5aT8xsVi9uP+95dvaeWo4++C
	3dmtHqg+5HvNE++cYeczBM5dXPh5jteU/a9wrQ4S/x9bXMCKs3wSFaRHflm9UUPchDSm286TzUvSD
	LkUP/LoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI4S-00000004QKV-4Ap6;
	Tue, 20 Jan 2026 20:11:24 +0000
Received: from mail-dl1-x1230.google.com ([2607:f8b0:4864:20::1230])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viI4N-00000004QHB-0xVS
	for linux-mediatek@lists.infradead.org;
	Tue, 20 Jan 2026 20:11:20 +0000
Received: by mail-dl1-x1230.google.com with SMTP id a92af1059eb24-1220154725fso224614c88.0
        for <linux-mediatek@lists.infradead.org>; Tue, 20 Jan 2026 12:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768939878; x=1769544678; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gyEJCUGxWh8NOcDt1pHqHJNYXEMGHKOoRcUV6C7L5qs=;
        b=FtU4B9TaA0yY+aDrXn5tYqUA5jKnisOUpxZ4331OWBP5iL3qXR58LBrQ4mz5JxGQq+
         j6B2BhFLl3F3/vX7jKNLATB5NFeeo8Sa4MsCbAKze7vrMAvhdv9vKiZ5mJLdGpCSyghj
         I8oWikS16tl0/9CLLZP+eWOOZpNlcuE5fibPmd9Z+VfzZQhcwoE/czfKgBWvega4Q+/n
         1/zl4gRdpnQRyxvS0XJWRMOOaT/W1ZNUjUCFsmDQkoh4k792uRzuuneFdTaa7nt2JtZ2
         9PJ0x/C72dlHEaNcjlKMvYiAoE1fylgDUXIyAdj0e1nUmbK+zhsXcc/qkcxROY+Gh6lV
         pkpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939878; x=1769544678;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gyEJCUGxWh8NOcDt1pHqHJNYXEMGHKOoRcUV6C7L5qs=;
        b=cu0IB47icXJLgYA0dmpSQSXzzeBKkTJYnhohrEoWpzz7Hzhb9lXm9wZbc3u5W7MnmX
         lipwZLOur2HjcgO2mXYFPVmY4hLAEtzEnGwfNvrX201fryJrK2eb38EU23GYcAgCaaKe
         1Y7/DHbhcc2y5hooK45Or9WvXCqEHOIdNkqSY9NscN2sbZ4hV5QwU6jx8jBSy8OJMWfD
         DYqB0wDb7ao1/xacdF+BftAxUqwzmXff/M9ZmwUSGAE6njUnLSGNnXVmA16G1EBeWpBh
         fxgSxIx5VrGLkthzsZ9A9+U3Vca4GnDc7iyLxgPuwY3w5asFpCLZg1jJ0CVOtAYttS7O
         5VXA==
X-Forwarded-Encrypted: i=1; AJvYcCU7itsbJ71c1fQ7KozQ8mH1fwRy+g0P0BuMKI6SAghKP2A09O9BF7PxiNXXp6frN/fn7Nu9vUc5DFGdJhYU8A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWzVILT35qVnX3hjm8i4YmiSeCZJbyojinLhGsa/9693+bL2eO
	SGQYioFNKGUIOT7Onkd22TZPVVS9mEUul3aav96OwUKKLG+Zk56CVA+z
X-Gm-Gg: AY/fxX47gXtQGX8mppAO5TdtgGF59vMIItlBzvUPooACZCmxEKpyJsPbOFWARFGATcF
	nkiZ8TZB7bAH2F30oGrotTg/iTPqfS3aPT8YDA1CGGkuqmPvg2u2DjEuzYIkY1kCRKQ1f/sWoQM
	eKEghgftZbJiNjxjMb/vIa7Hvk11Sv6OQt4DtbNJkZ2GawvJGNoPpsN/p9AMUeW8Tldqc59Qsym
	JHiR9HUd6JkB6Juy3NU3ejwPsyUSA3g0s10sW9V5kgnfQdqXF/RipLcIO+C9inljG6FdQupQHgC
	+G7tUbFJ1x7ozfiJSaApMhTK4qo41lHM1EwKhZIesahBXwazmHu+O84tAQofy3ykh/wjqUlUrmz
	ompPe+aOIhqG+fJgOLtnBxIOVGHoaWHm1+O7uPlq3XumfgEG3k5u5UiwKZKFWd2lQSwq29Z23Nh
	MQmV0TOKx5a9fVZkKnRRGl9IG7w2KB+sK/asjhPjkZ8EVqbV7KNvtYE64Iiqiylw==
X-Received: by 2002:a05:7022:140c:b0:123:3c24:b15 with SMTP id a92af1059eb24-1233d0ed5bfmr9477991c88.19.1768939878038;
        Tue, 20 Jan 2026 12:11:18 -0800 (PST)
Received: from zcache.home.zacbowling.com ([2001:5a8:60d:bc9:4a3c:9f7c:8037:90c1])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ad7201fsm21982990c88.7.2026.01.20.12.11.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 12:11:16 -0800 (PST)
From: Zac <zac@zacbowling.com>
To: sean.wang@kernel.org
Cc: deren.wu@mediatek.com,
	kvalo@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	linux@frame.work,
	lorenzo@kernel.org,
	nbd@nbd.name,
	ryder.lee@mediatek.com,
	sean.wang@mediatek.com,
	zac@zacbowling.com,
	zbowling@gmail.com
Subject: [PATCH 13/13] wifi: mt76: mt7925: fix double wcid initialization race condition
Date: Tue, 20 Jan 2026 12:10:43 -0800
Message-ID: <20260120201043.38225-14-zac@zacbowling.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120201043.38225-1-zac@zacbowling.com>
References: <CAGp9LzrcvW18xKFL-oF3wxRmb73G6PN59Y2NSA2E5idva1wtKg@mail.gmail.com>
 <20260120201043.38225-1-zac@zacbowling.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_121119_295255_35B2125D 
X-CRM114-Status: UNSURE (   9.88  )
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

Remove duplicate mt76_wcid_init() call in mt7925_mac_link_sta_add that
occurs after the wcid is already published via rcu_assign_pointer().

The wcid is correctly initialized at line 1023 after allocation.
However, a second mt76_wcid_init() call at line 1036 reinitializes
the wcid after it has been published to RCU readers, which can cause:

 - List head corruption (tx_list, poll_list) if concurrent code is
   already using the wcid
 - Memory leaks from reinitializing the pktid IDR
 - Race conditions where readers see partially initialized state

This appears to be a refactoring error where the duplicate call was
left behind.

Fixes: TBD ("wifi: mt76: mt7925: add MLO support")
Signed-off-by: Zac Bowling <zac@zacbowling.com>
---
 drivers/net/wireless/mediatek/mt76/mt7925/main.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7925/main.c b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
index 4b7c13485497..acce21ad3a29 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7925/main.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7925/main.c
@@ -1033,7 +1033,6 @@ static int mt7925_mac_link_sta_add(struct mt76_dev *mdev,
 	wcid = &mlink->wcid;
 	ewma_signal_init(&wcid->rssi);
 	rcu_assign_pointer(dev->mt76.wcid[wcid->idx], wcid);
-	mt76_wcid_init(wcid, 0);
 	ewma_avg_signal_init(&mlink->avg_ack_signal);
 	memset(mlink->airtime_ac, 0,
 	       sizeof(msta->deflink.airtime_ac));
-- 
2.52.0


