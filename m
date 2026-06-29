Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E5FCC43602
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2026 12:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K3SLRCeShC2U5Lb0rTb1U6hkwISYxR1k50UcKsPQ0QE=; b=pVEPFKUy6n8OZL5gTM/QEfPICC
	oxjLQ8tZUZBi+WU6YtWav9HwYrmQeM59n6VIcjGxG373KmXdtnoNBbDHZjyNWkr3p+Ia4XE3CgMoW
	C18A1QP9H5v6P+9lQHvADwT3w7tY465oLOmGQPN6AeYQGPEKtVz1sbu00GwK07k/EfO+Xx6sIhfN1
	F+ecXJ/NgwKpOtgEw0bqJ1bdnL9zCNSKN/6g0M+MCa6i4D9RK17SDykP4p/pn2Ref51o8cOP3KNaE
	WlAV2UDme553OAngoZqPhFTRx27pmC+shRVwcjgkB/yfW7M3z7uLD8rVYxmTRTqgjBzwrctroFX0I
	PMQyZlbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBBA-0000000EZLZ-0k2u;
	Mon, 29 Jun 2026 12:33:36 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weBB6-0000000EZEz-2EaR
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Jun 2026 12:33:34 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-c12629c937eso133301666b.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2026 05:33:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782736410; x=1783341210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K3SLRCeShC2U5Lb0rTb1U6hkwISYxR1k50UcKsPQ0QE=;
        b=fExl0xl3W2RZM21891oyB7PAbC9HAvDfkgVkCLOncezutBwfcUCR7MSo3bTgujyZ9K
         rg8A6Mall7+JQwcOHObH1EwdlvIQn6gGRxLrUwjLzsnhEzafiAZUuQlQkTwlTwC0ileD
         FgN++6yW/I4vY4GNryzVrid47ZaFzMJ7h28eKUG6di603534iQb1HqZmnczbismHKSM9
         aUlFU+LLCywsuiLwL/rWHM/goT9CkKrajx4x40s7/p+QXuzRcClw0DyBTKBXqp/96wps
         9hOSziZH9OIrpNes7+ptyelhu4j3YH/1BLo8ay1riXlAOCeE96UXwe1zId4/1dK9HMzT
         mHAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782736410; x=1783341210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K3SLRCeShC2U5Lb0rTb1U6hkwISYxR1k50UcKsPQ0QE=;
        b=ZKnGVCPSRefq9pG5hTeEyh+AGSTCeaNHXoZf6maamGJM5YAuBNkZJ0N1hnEeMlOJHP
         sbpDt94s7rhHFhppkNFu3wAp5qi5xBG/grUv23yPt7JIL/WQHYknNfVKY69GxhGznOF9
         lZQBDNTUqrd6G6wOzr+6F34K6lUOZFydq5Bxm7ag9g9G4xfUiXnjkVqIntAzwGYietO+
         7dwdGcW9pvsPbtH7aD3BOB4mn0TKrkKLtPIaNm6oGcMBi4dAuekKyoBBd2E9il2yglzU
         b0ZGjnXF8vO9kaqNVCqXXj5Ft1cFem5FD+Cl5a8tQ/9ALoBGNRlnia6Ip7wAKhK8Scjz
         5LXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrpvJuIC12/4bd8mS0vsL5PIMMTIpuShC7fAPtBl4/aU2xCkwv76XgS6nL8GF8RrSNmLRq5rjiijSfABnbY3Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyoc//5pYKqMVo1Wyrcb8UeM6nBejdtxWig+sXrEFNe4mniqmLu
	kdi8B8V9ID9vQgyY5T15rgYJM9MRrH1Qpf8Yp1Q6lGz11PkpDM1sieO6
X-Gm-Gg: AfdE7clYLdcN7Y7zFdYkyLnSdfplTMh7CQO/UzfnwyN7k/Pc0RXYsRN4hy55nzXRJEV
	Z+jSG+vJYEmmxjVlFFtGShvtthRcOptd9eidlC+pxSi/TZRfbhvX9HgZ3krBHKIVg6UAj8ix0j+
	iYJ4kJV1JizmTpNCEM3sKK255Wv/aj1Kn4uqhhRHmYMBKkITT0mxXjdRBWq39G8W1ilg0IK08xq
	/EQwarIaUMxKqKspwPvlWGfeVOCS1YOjjGx/TNy57BQV8LG0reukMOgrtn4b11JZRfhVnjcgu7v
	EfUTerFwoL5goJpx+IwFDtrimUAzLow7JXHX3EmW25T1X94IQBDJwEa2r3zC16ZBH9NUeRBn90D
	L75eSBLkRA7SjJMNxSsayDuDAQ/k2dYittJD+IxqnXLUdsuIF0jbC0szqqGs7U0XpO33DuSXFOT
	TcUQmyhak=
X-Received: by 2002:a17:906:6a1b:b0:c12:6b39:2211 with SMTP id a640c23a62f3a-c126b392346mr184315266b.43.1782736410170;
        Mon, 29 Jun 2026 05:33:30 -0700 (PDT)
Received: from fedora ([46.205.218.111])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c11fbe05c22sm773866566b.39.2026.06.29.05.33.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 05:33:28 -0700 (PDT)
From: Daniel Pawlik <pawlik.dan@gmail.com>
To: netfilter-devel@vger.kernel.org,
	netdev@vger.kernel.org
Cc: pablo@netfilter.org,
	fw@strlen.de,
	phil@nwl.cc,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	andrew+netdev@lunn.ch,
	razor@blackwall.org,
	idosch@nvidia.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	bridge@lists.linux.dev,
	coreteam@netfilter.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	rchen14b@gmail.com,
	lorenzo@kernel.org,
	Daniel Pawlik <pawlik.dan@gmail.com>
Subject: [PATCH 4/5] netfilter: nf_flow_table_path: handle DEV_PATH_MTK_WDMA in path info
Date: Mon, 29 Jun 2026 14:32:52 +0200
Message-ID: <20260629123253.1912621-5-pawlik.dan@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260629123253.1912621-1-pawlik.dan@gmail.com>
References: <20260629123253.1912621-1-pawlik.dan@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_053332_711560_474DA0CF 
X-CRM114-Status: GOOD (  10.96  )
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

From: Ryan Chen <rchen14b@gmail.com>

Without this change, nft_dev_path_info() hits the default -ENOENT path
for WiFi bridge offload via WDMA on MT7996. When a bridged flow goes
through the MT7996 WiFi device, the DEV_PATH_MTK_WDMA step does not set
h_source, causing the PPE entry to receive a zero source MAC and packets
to stall in both software fastpath and hardware path.

Based on a MediaTek SDK patch by Bo-Cun Chen <bc-bocun.chen@mediatek.com>.
Signed-off-by: Ryan Chen <rchen14b@gmail.com>
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
---
 net/netfilter/nf_flow_table_path.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/net/netfilter/nf_flow_table_path.c b/net/netfilter/nf_flow_table_path.c
index 6c470854127f..580aa1db3cb4 100644
--- a/net/netfilter/nf_flow_table_path.c
+++ b/net/netfilter/nf_flow_table_path.c
@@ -219,6 +219,10 @@ static int nft_dev_path_info(const struct net_device_path_stack *stack,
 			}
 			info->xmit_type = FLOW_OFFLOAD_XMIT_DIRECT;
 			break;
+		case DEV_PATH_MTK_WDMA:
+			if (is_zero_ether_addr(info->h_source))
+				memcpy(info->h_source, path->dev->dev_addr, ETH_ALEN);
+			break;
 		default:
 			return -1;
 		}
-- 
2.54.0


