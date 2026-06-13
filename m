Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2D2CD98C5
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2026 22:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jq383hib0Hf2iZ2gQxzHf9bBmy71fNWICtP0Xddblzg=; b=pNsARksz8qWgnQz5LTKW1ZJSH8
	oGddhvgHrw2GGXt+EQpMzTe0Kry3tsBd7AV6bG+mU5xnrGMbsWD+JOWKwiEzV+Gn2uQAwP2fFr167
	2EErP7rhEkUMxonK1MEq9vOK0aTLSyadsOVmfXVyQb3ZaGnjgKRVAAs2BE/wj0AXNi9bCl4m37Sxu
	rUkWyuMDH/ItLs48ekRN2Q9DX46gyG01UPqzqLUECDyHk87ijdxE6C+fB75f9EIwT1PKUTSvkv/Qo
	qLcHsQ834skMmi3bvjjR3vgp6HLxq2K/CQajWbVoSt2uyjLQRWxKPEO6va6bNBJIdgnTUBaJWJntt
	2uNWeS5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX8I-0000000CaLY-1mos;
	Sat, 13 Jun 2026 22:47:18 +0000
Received: from mail-dl1-f50.google.com ([74.125.82.50])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYX8A-0000000CaIN-18tm
	for linux-mediatek@lists.infradead.org;
	Sat, 13 Jun 2026 22:47:15 +0000
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-1384eb94d20so3084518c88.1
        for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2026 15:47:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781390829; x=1781995629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Jq383hib0Hf2iZ2gQxzHf9bBmy71fNWICtP0Xddblzg=;
        b=F4/ZIOd0CCdW8Df3a/q92VDGxazKjD+NQ8yiKFssA4OFiG215eoQmqhlQ7K95k6DtW
         qzHpUTJ9JjBsqECqZCjN00DTM+ezpWfppUCxiipRK3M4IrLK5zug2r56GAl/hAiilUvM
         llgAiCnwbX0Y6bOt0M//rzo35cpxkCe++xgIfLjCwWmlL2U99C5ZAtm9EF2fFjIAv9U0
         jn1lgGfdtwv830ArjCyN3S3Y5p+Pc0oJp40QYgr8E29QnVdTns35sw/MvcK2PxWNZ0+W
         75KMOP9Js9pOZBH9Hy0Ya2UQ3YqTmcLNer6tKnwAPcrF3g0Oq7RmFcHcXEXJ6rCDEMN+
         +EIg==
X-Forwarded-Encrypted: i=1; AFNElJ/RW5z8TSdRmD+mhdRupsz8YLMR8kQYntpkra2n0evWS5nA9/FrXQyhidZjlfH5kIELjEVoKc+B24es3UEk/Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YziWqx1JMdZIUtyEYCRuSAn8RHf37Ff+RTXS0CgR66fgeIrtHKw
	aLj2xaohBytCdP8iwgFvahQNjNZ+HNuIxfcSuoHnLKlAIxjOZBzwSDmX
X-Gm-Gg: Acq92OE+Bq9bKgekFuq4LXlwxdK3wd0uHjgrHL82HrJFMa7tFc9uVY5Ozzbo9n5s1HL
	TVWQ5LwB4g6GprbNZMYGLIAQ7MCJ/acmvBjlq7zdGkMHsg4m+huECOCH/39K+n7ziC/V/9FvTEl
	WbgYm2ZZRKuLSDyKNiMOdoOtjizu4/A4aAkO3sw2N7vS+VgSO7SMvHwG8BMomYDheRB8821dGVA
	ZEMjp9MoVXv4gvsUBIIvWS/5wSBqV+ohRhksbZypsPpNysgKd8r23x1Zr3ZJgmqrd2+6dx+h6YN
	x/Z9mRsmNSCKhmQV6kqZoqWm0YYde83AY4773j6TsP6o4PRF34fDhEA9eL2m/RJl8d3iwuO08tl
	KaLP+RjqXL2DxuHdOZBd6uMUT+1mA5zLP9+KWYGiZsZBrHwk0IgLZsxzK2e82RL6QxOeYxlMaKM
	FsAD1mtKZ/s0w6zyyyXjf3JXEP4IH+WDHa0A8ROlbuvCCfXchpCB0J8Qg28kucvHWNry5C0Flry
	TPuJkzkfYLKRYy+hOdW9kpwix1tKbxc/rST9Kp4
X-Received: by 2002:a05:7022:983:b0:136:58eb:a486 with SMTP id a92af1059eb24-1386f234e3fmr2419577c88.1.1781390829539;
        Sat, 13 Jun 2026 15:47:09 -0700 (PDT)
Received: from sean-HP-EliteBook-830-G6.. (114-34-228-194.hinet-ip.hinet.net. [114.34.228.194])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b97bf09sm6345380c88.14.2026.06.13.15.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:47:09 -0700 (PDT)
From: Sean Wang <sean.wang@kernel.org>
To: Felix Fietkau <nbd@nbd.name>,
	Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-wireless@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Sean Wang <sean.wang@mediatek.com>
Subject: [PATCH 1/5] wifi: mt76: usb: size RX page-pool pages from queue buffer
Date: Sat, 13 Jun 2026 17:46:51 -0500
Message-ID: <20260613224655.2405686-2-sean.wang@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260613224655.2405686-1-sean.wang@kernel.org>
References: <20260613224655.2405686-1-sean.wang@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260613_154710_333510_E137691A 
X-CRM114-Status: UNSURE (   8.25  )
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

From: Sean Wang <sean.wang@mediatek.com>

Use the RX queue buffer size to select the page-pool allocation order.
This lets USB devices use larger RX buffers without silently allocating
undersized order-0 pages.

Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mac80211.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/mediatek/mt76/mac80211.c b/drivers/net/wireless/mediatek/mt76/mac80211.c
index 13c4e8abe281..6ff1eada6d09 100644
--- a/drivers/net/wireless/mediatek/mt76/mac80211.c
+++ b/drivers/net/wireless/mediatek/mt76/mac80211.c
@@ -628,6 +628,9 @@ int mt76_create_page_pool(struct mt76_dev *dev, struct mt76_queue *q)
 	if (!is_qrx && !mt76_queue_is_wed_tx_free(q))
 		return 0;
 
+	if (q->buf_size > PAGE_SIZE)
+		pp_params.order = get_order(q->buf_size);
+
 	switch (idx) {
 	case MT_RXQ_MAIN:
 	case MT_RXQ_BAND1:
-- 
2.43.0


