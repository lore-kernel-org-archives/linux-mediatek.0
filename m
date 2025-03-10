Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB322C282DE
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Mar 2025 11:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RcnXFhBJsspPY81aHKEpyHgRpt8kbK5A2y07Uh+g33g=; b=0zZDStiChTu8Y6vg9I97MTJhqR
	HJhanl5u+jMhoQY+k/6tYVBBUtrbvISp91RhuMozedQdRK7RA4CAXelaiVYUFHqet+x2uzOd3yoa+
	VdFm9g+fTvHo6CEu7O+mkDBS8RAyzfaipvWhGwKwuzT1JrDTwBxcVUBG9IKXwibsdL9xaCI9sT/Ly
	iqr+kr+DAY/gKjgwuVWiRJ7C7hp7c4lO4DHH/UxYGDBZTcP+1osz5u2wsimForK0BsymYPXbTqVKQ
	Nsd3q9L9KBP43tDuAJuq0aSfH9HDrtjrKFhV4+wQGUC7YHyyz0jMCfEVtYdeJ5iTKjJFaO0g8rq43
	cnM+J16Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trb4t-00000002OJu-0A6B;
	Mon, 10 Mar 2025 11:13:47 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tragT-00000002IzU-0zsr
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Mar 2025 10:48:34 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so22865185e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Mar 2025 03:48:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741603711; x=1742208511; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RcnXFhBJsspPY81aHKEpyHgRpt8kbK5A2y07Uh+g33g=;
        b=IensH9ow62SsG71YlmazmZUBJ0s6P2573urRNA+4EfPnSWvdYB/7/wxSbjdnGwn2gU
         TaueRys7cKv/Tl5mwdtaEheTawOuNHcyJ1cBHM/s+e5jT+2r7dHJXVB2WpNOegF+oesd
         jbvjZyr8XNwWN1eyVHkpZHo+lGr1YhV4lcdY/wTLmim21OZBoKn7TcaapB1JASNuA4Vh
         u9d2OeVg6nC4+vgFDrH1Mk1juDEPtUH/5/vfqKxix+evb+4E8ahbQOWNGuIz2sywVTz4
         wmxN+205cyBd/PPUMtoPHLB/As355+j8giAQuzvCZD4BpO2Gf6PtLRASv8lfksRr4l25
         5eHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741603711; x=1742208511;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RcnXFhBJsspPY81aHKEpyHgRpt8kbK5A2y07Uh+g33g=;
        b=i1rwdgz3D5sJfPYnCMThY8z8fSOpAWupfMktUTc7jPFH1742p/r0J2i8CdIiMgOPuX
         rXHz2GH5lf4+4dR+Ah7u58SBN+QgNmzvZa1wPc5QUHKKLIOWgMErwTqkyWDe5BIob8CB
         f3EEdI+avqShOHnSdCX3mfdqQAbpGgq68oSuXkhkzq72xZ856NQpC5m/T+CQYE46yqNR
         6SMhBK1+/Jjh0kRDEoQmrYAlN5NoqvZpqrtoFPbU7OenAFowZyxFnXnDPkKZVkfyLXtu
         J6HWvYnXOwp/QWlyHn3ZUoG8M/Ji8nJkfZ1AzxxxeoYnF1mAXQc5+QhhuUWjXlZSIcAG
         A3GQ==
X-Forwarded-Encrypted: i=1; AJvYcCUznVNRaazJbxnfZvwHaTiKp8fXF8CGUGqg+JcPRrgO9cdrJGViZRmaoB1OFnsFLRBhWyqVjZumcgl5aq2AKA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+VoPUUzIvBLjImhddj++dHQpnq6+VnLg4Nz5kHFI2RBi2yFX9
	moCK+T0AgHjh+zXstSORXm08uTTH3UU6dy713Mnf1SpYLFqD9qnzqYCP6/bVakA=
X-Gm-Gg: ASbGnct7Z06g9iqBhnLxFQ5bF+bTA/qPv1r3sxrtKIdy7zGjW//TeftK5q9uCWrjZYu
	5M6Gp7iMGGHYwzQqdTj1m/40d8AuIvEvt2z7LtgS/MvlAnFRuoG2vzr4k7DUuDsSdxnbqdvjoT0
	4t5mpa5HK7JFqaOk9bc8aE+TnTuiAGL6bwMl8sgPoGf2fXCAOPMKcn66gQrreeICp4fn9h128mx
	s4C0vkjtHG9VgMBoW595Lq7AUMMUNMdwAIDQW7WwA88yxPpuBQUkImXhtMZWpfTrV/MrR5H0ab0
	T+xX55VJtf2jYK/NEqNolQYAzzgkxalmrPC7MgJ1bv+hftLHSQ==
X-Google-Smtp-Source: AGHT+IEvyQMgaUHnCuYCt+OpJiqkHIstn9Ui2odq4PjFQ9lNSszLbzPKWSr7S0YVwsCBZMsm/36JQg==
X-Received: by 2002:a05:600c:470d:b0:43c:fab3:4fad with SMTP id 5b1f17b1804b1-43cfab351c6mr15054385e9.16.1741603710881;
        Mon, 10 Mar 2025 03:48:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43cf27f8ef3sm45737585e9.11.2025.03.10.03.48.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 03:48:30 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:48:27 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Felix Fietkau <nbd@nbd.name>
Cc: Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
Subject: [PATCH net] net: ethernet: mediatek: Fix bit field in
 mtk_set_queue_speed()
Message-ID: <eaab1b7b-b33b-458b-a89a-81391bd2e6e8@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_034833_290775_B5AD8E67 
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

This was supposed to set "FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1)"
but there was typo and the | operation was missing and which turned
it into a no-op.

Fixes: f63959c7eec3 ("net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
From static analysis, not tested.

 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 922330b3f4d7..9efef0e860da 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -757,7 +757,7 @@ static void mtk_set_queue_speed(struct mtk_eth *eth, unsigned int idx,
 		case SPEED_100:
 			val |= MTK_QTX_SCH_MAX_RATE_EN |
 			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_MAN, 1) |
-			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5);
+			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_EXP, 5) |
 			       FIELD_PREP(MTK_QTX_SCH_MAX_RATE_WEIGHT, 1);
 			break;
 		case SPEED_1000:
-- 
2.47.2


