Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C68FCD98DA
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Jun 2026 12:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0Hfd7o4l5KeyggBUdRXVUs9FUkJAGIoK0YPViSvNbm4=; b=31nKp0VP0hxoNmoL7WGW2q7AR+
	mnO0rqMtn6bDcwiFtO7EqiUXeTrpMycG/tx/4j5NYnA05z+K864mzn8pCzxLmnfd9YLJMuOnJ0vpR
	FvVZMJ3SYmkH/64hBIDhyr68C5GVMJsp0bR69UhBrfeCDlRO5Wd7v73QDa9hvG4wzGwI9Q8YRB3bI
	L9d+JlX4zt3+fUK7ATtg9ptAb/EcawqF2reL3n3U2kuPoas3oQ2T6L3o7RpO0NXDU3WY/nk+v2Kr5
	VtHkmslb9kpocsaLwHUMPYLMd6MkqAuq1gY5sJZKQ9h2YpzGz49VPB/bzpEJkfAVRC3/e5YTvwOVw
	SWweDTAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSSa-0000000FjB9-0Orv;
	Tue, 16 Jun 2026 12:00:04 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZSSV-0000000Fj8e-3HVe
	for linux-mediatek@lists.infradead.org;
	Tue, 16 Jun 2026 12:00:02 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2c6afcc99a5so229015ad.0
        for <linux-mediatek@lists.infradead.org>; Tue, 16 Jun 2026 04:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781611199; x=1782215999; darn=lists.infradead.org;
        h=mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0Hfd7o4l5KeyggBUdRXVUs9FUkJAGIoK0YPViSvNbm4=;
        b=UOd0CiNNATxLiHn4aWC/woQi1sQu3yJuK6XiSEHshHTN12vkRpcfywGvv4v+LB+JCq
         CkQ6h1I+uxtwzMMY48TpOCNOollSlCrs2TVigLamCvx8/zGh3wWWWjy5ZgJ4QQncbD8b
         ccxg4wYZ2Kb8emsRNi99AG/HGrsGqj3I/PbF9FUD6Rr0ou+QoqlE3h2zE1orA/TvrVWJ
         bFR+pAE0OOA+TQmukdzJna8DdJ7BB3SNjsCjV8UJbQBnBj7zrZFtfHl7mGcV2SoB+q/e
         IxDqmnLND0evXx6d3nW6BVtJJXGrMum7ruwKdMmhTX3PfGJ4l9M7r4bcWFrIdAWoeIF0
         cyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781611199; x=1782215999;
        h=mime-version:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Hfd7o4l5KeyggBUdRXVUs9FUkJAGIoK0YPViSvNbm4=;
        b=YuVW53d6qrzN3ejaAj8h8dfR9ko1TnoxEQnWkHmsiXAgts6dMqJzihjrSLES7ZrHXn
         qcsJd+KQHGYiBO5TD6U7lK4MRVkZEKRM+FNdaEOmVbQFMm3ocDbYwvLO4syUGsDVNkoR
         9P1D+vewI/TjaPLfX5bzAjWjApeUZ0JZilKLyxSzNNqKYw/HEKHHQgho5cXtoeSjSqMC
         d18UgiZTUJm+CuAfiWnXRVokAF/ZcsPAX3oCJUUCgzc9l3y+KQdgzp4GIQ+bHu9mR9pv
         nQ5BboPUgon7xV9Btyd35yFgh9Wq8D2rdKPXA0eZSwMCsiMm76wDLCyYltopfnjTwtul
         Mi9A==
X-Forwarded-Encrypted: i=1; AFNElJ83Qb7JAPVr1vpNjMPj1VM4sIoOOBVuwBLQS6a6FBNGmwIcYaLRCmYpX0aohQNgxEwOCa73r0cKKSMOK7RFhw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzympqj8zEo8LnRgxcyuzpznCup5Lju+1bhaDyxTI5bYxIbt27L
	4+BipFeTHlTaOWc3UvT4OHsy0ZhpnDdVn26fAm1fLpOBqznUxt0qmalI
X-Gm-Gg: Acq92OEmx/+hsOEonJCVtQAyLt5wCZtaWWG1TtGmMJISEo8gykpbhwrVxq6qx2Du9//
	koJ9oQ0Krel8nTLoxu29CFAt8HW/a1C0mjeVahGoGkqPWdxQlpSjPmXqkUUEX4E41Qs1AAlVxeQ
	WQZCH0nk25nLpoR5Pkn0TYuvauxUO/2UNwlgPjShnDQ0tdgfsTn84OJL0BFgx63+EfsGSoN8uyT
	jvC/l7pc1LbNpC5ZBheAUijYr3gTlFGzK46825CqisdSmBmtAlvt8utpXGruh8TE8PXCV/dudgy
	z8yI+4XsnXFx8fQyCdf9lvyAyOjr2VkEXGjsKtqlG4mfctmOhatUKRyyKcYEnXYl++dYFw/ab1z
	pi0/NBWtBzqnyk8UyucklrTYdeFoqpXRJ60ktxwJXRnHEPLKJMRTad8o/dEffij1nqJm3ohkD9O
	Y6ogMrk1GAiPqKOB5d
X-Received: by 2002:a17:903:1b6c:b0:2bf:13af:b077 with SMTP id d9443c01a7336-2c699b03448mr27431115ad.14.1781611198834;
        Tue, 16 Jun 2026 04:59:58 -0700 (PDT)
Received: from [127.0.1.1] ([47.253.114.73])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c433369c8asm133468595ad.73.2026.06.16.04.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:59:58 -0700 (PDT)
From: Wayen Yan <win847@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org, horms@kernel.org, pabeni@redhat.com, kuba@kernel.org, edumazet@google.com, andrew+netdev@lunn.ch, angelogioacchino.delregno@collabora.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH v2] [net] net: airoha: fix foe_check_time allocation size
Date: Tue, 16 Jun 2026 19:52:36 +0800
Message-ID: <178161119471.2163752.14373384830691569758@gmail.com>
Content-Type: text/plain; charset=utf-8
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260616_045959_897211_329C97C6 
X-CRM114-Status: UNSURE (   7.91  )
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

foe_check_time is declared as u16 pointer but was allocated with
only ppe_num_entries bytes instead of ppe_num_entries * sizeof(u16).

When airoha_ppe_foe_verify_entry() is called with hash >= ppe_num_entries/2,
it writes beyond the allocated buffer, causing heap buffer overflow and
potential kernel crash.

Fixes: 6d5b601d52a2 ("net: airoha: ppe: Dynamically allocate foe_check_time array in airoha_ppe struct")
Signed-off-by: Wayen Yan <win847@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_ppe.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_ppe.c b/drivers/net/ethernet/airoha/airoha_ppe.c
index 5c9dff6bcc..8fb8ecf909 100644
--- a/drivers/net/ethernet/airoha/airoha_ppe.c
+++ b/drivers/net/ethernet/airoha/airoha_ppe.c
@@ -1578,7 +1578,8 @@ int airoha_ppe_init(struct airoha_eth *eth)
 			return -ENOMEM;
 	}
 
-	ppe->foe_check_time = devm_kzalloc(eth->dev, ppe_num_entries,
+	ppe->foe_check_time = devm_kzalloc(eth->dev,
+					   ppe_num_entries * sizeof(*ppe->foe_check_time),
 					   GFP_KERNEL);
 	if (!ppe->foe_check_time)
 		return -ENOMEM;
-- 
2.51.0



