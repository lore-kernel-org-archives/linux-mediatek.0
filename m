Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66534C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jul 2024 18:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIqKxSZyWTf/Z3V2HppYDKSRNXowgVnrZ6ay0XmhCCI=; b=j8reC7+DFRdz+d56zUYmCxun7W
	eECs9H/sjHbN0GrYH/SSVYFGNiSw3J1rB1/5b+BLluMyJK2XJ/vagVDfBYQfB6QTpGUH354yPE0No
	XdF+Y1DZ+JUToDi8IBNqdobhQYBvxThCHGdhgfs3wWR67kSyAzc2dI0Oki7pWSDx7bUmC7r05Mg23
	GzZYDRgHXUVFa+Wf87oHs76VOesjXcABeVkToLRMIh7olvl0GKYXrI2acSiQatN973gdzm1kkNXa+
	BEE6EjKjdrUKEUJVZ9MSDtJkXbQJR18R0zisyJvWyTk07BL4PQxNBBzxRnvy2CZ9XsiHOr1PLRaGr
	l2aGa3nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYVAV-0000000CMBB-0M8I;
	Mon, 29 Jul 2024 18:32:23 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sYV9O-0000000CLqU-3fIG;
	Mon, 29 Jul 2024 18:31:16 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-368557c9e93so1742396f8f.2;
        Mon, 29 Jul 2024 11:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722277873; x=1722882673; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIqKxSZyWTf/Z3V2HppYDKSRNXowgVnrZ6ay0XmhCCI=;
        b=W8yVSvE2qCHZyzU4QjxDWv+mhk/9YyCmUWZY7tpB6Wf3WCmTv8rY9d2r0p4JDYl75Y
         EoCSx+hLp5uXF4gv0ZNMwPyklFhXlgjRbjejiG7LzjCFj/e9KCE6w/MOUcFHQoIybgI/
         LHsttsFtcO6PBnggSxl1GwXQihZnT9hDzSgrp0G1hk5cIXEgDptANrdAfJsMRtA9YIkK
         lJwxAKOZkWoBep4+izfXGrlCG4fk1F/6WGa2JlsuB99p2f33VPg68sWN01FkCs52WzmO
         EFkAntjZzyp/kHyfbuvarc9i0QoM1b3Re8t1ier+Jb2+ndbJGcj9mwcqBO+X62Qc8kZF
         aq4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722277873; x=1722882673;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LIqKxSZyWTf/Z3V2HppYDKSRNXowgVnrZ6ay0XmhCCI=;
        b=ZBgXyAD8AuhFfwutBJTl77C/4h7IPdSBbIxQHalex36fr54KWtUPZkxwMGxxcRnazP
         6EG7YcAe/P/QAwSVLsE+iyrlKaOM8k7f5cZysSWezqbdRm6YJ+WTHFcrpenzm0/Mg3xC
         vAAaRP7K32mEVkomMTIJ3esjM8v56U76G8+Av3c4rhux3OR9KJ6pvwaSJGIs7pPRwPLv
         UfknMBQw6AaWfbjykAslY78cm+4gTY7+MC1oHJCYNS+VjXRAusf+vQwR8GRfmK7hbD98
         7h8IN6lYUTBlS9Ng8ePmRwgs1ULOPpK67Lq+jIzArpxbnevPt7sRd68BrZPa4Nt0R1Lk
         maBA==
X-Forwarded-Encrypted: i=1; AJvYcCXAnDg6GbgMBYtqH5VBrLCijF79gmI9xHcQGD30y94aqY/42knTKbsYaAohvLC/RZCLbt/HDv4NyGBRSfmlpUo4qbTU0imW+hhce13rwm1NHb5GehooRys0ojMP00SnGN8hrOW56qBqfScgmA7xjBW+i0oyb5eolbI=
X-Gm-Message-State: AOJu0YxemuoxvNy2as+qN4jGbjBmZncDv+3+HRYgxeWLsxotJGol4aAb
	6Sw2xjMuDyBSavSnqEA2iw4zkokjp+0I8IFoBlLEB2J94RBe+pRW
X-Google-Smtp-Source: AGHT+IHUcB8/KDGDXgq3kOKIaEI3RytM/LjgWsO98GOv2rYjFJYGwyqRRrzVWn4eD9YGmY7tMl40pw==
X-Received: by 2002:a05:6000:1542:b0:368:4e4f:cec5 with SMTP id ffacd0b85a97d-36b5cf25338mr7500104f8f.35.1722277873000;
        Mon, 29 Jul 2024 11:31:13 -0700 (PDT)
Received: from yifee.lan ([176.230.105.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36b367c0aa1sm12800165f8f.21.2024.07.29.11.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jul 2024 11:31:12 -0700 (PDT)
From: Elad Yifee <eladwf@gmail.com>
To: Felix Fietkau <nbd@nbd.name>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Elad Yifee <eladwf@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Joe Damato <jdamato@fastly.com>
Subject: [PATCH net-next v2 2/2] net: ethernet: mtk_eth_soc: use PP exclusively for XDP programs
Date: Mon, 29 Jul 2024 21:29:55 +0300
Message-ID: <20240729183038.1959-3-eladwf@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240729183038.1959-1-eladwf@gmail.com>
References: <20240729183038.1959-1-eladwf@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240729_113114_932221_9E35754F 
X-CRM114-Status: GOOD (  13.27  )
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

PP allocations and XDP code path traversal are unnecessary
when no XDP program is loaded.
Prevent that by simply not creating the pool.
This change boosts driver performance for this use case,
allowing the CPU to handle about 13% more packets/sec.

Signed-off-by: Elad Yifee <eladwf@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 4d0052dbe3f4..2d1a48287c73 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -2644,7 +2644,7 @@ static int mtk_rx_alloc(struct mtk_eth *eth, int ring_no, int rx_flag)
 	if (!ring->data)
 		return -ENOMEM;
 
-	if (mtk_page_pool_enabled(eth)) {
+	if (mtk_page_pool_enabled(eth) && rcu_access_pointer(eth->prog)) {
 		struct page_pool *pp;
 
 		pp = mtk_create_page_pool(eth, &ring->xdp_q, ring_no,
-- 
2.45.2


