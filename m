Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E072C624D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Sep 2026 16:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8SPDGoSTl4FqMo3J2GRF/g+R9eIi+flZl02DefvrWrw=; b=2/W6KUWaOOcb5pBFRpd25cEs0Z
	YAraUSogpfeGhUkbIO0RzvLR6O8PdF/V6WXlqugmTPwy7Vv2cDTFFgqAg1MzaJURd2qTSdhkJJEh7
	DehrcNH5WhmH/qS4KWm/lagMh6B6Db8GG0beJBRcAvDs/IwFeJhy1v9YXhvQ9jz88fq3HYUnwIqcX
	M1/viHBkuwvgGtAhLeDjbpMBonuNyxdqf3mycY+Pd1TMzUnhuqy/0IoErfIora0DxKfFZe7435WBY
	ET6t3I+iB1dSYZKp0VEJYTIuEt0dR9NnxAC8LEKCdnj9k9HrW8rfs99rkloFX/zt1CPUkqpvMwphE
	3VgRFrRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RQb-0000000CfWm-1e3p;
	Tue, 01 Sep 2026 16:33:41 +0000
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RQZ-0000000CfTd-1xwI
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Sep 2026 16:33:40 +0000
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-3a1e9f55e03so51831fa.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Sep 2026 09:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280417; x=1788885217; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8SPDGoSTl4FqMo3J2GRF/g+R9eIi+flZl02DefvrWrw=;
        b=pYbHuy0qKHrX4xhMx8CGkxXkbT7QSsI27UEBaaRtJHzu3weygf3rK+LJAxRhWN+wBB
         AZj+UCkqhHYjDNN65e9gJ/VRw60OZ8OCPxmoE8+M0p0tmNddFNAQJnuSQLYm4rERD3aZ
         kibpi7T6q1s4kMBgPEBZvt4wUq7KdZOrzmYat5iGBmIOWN1cLDieDTzANU4Onpw/Po+x
         pGC0jP9QfRwFKtCCX0mOJTt+m7+Y3q9M3zZYQ10htVjgl7S+gXNvy8j17QnKXcCjws3r
         n+ACiTNysNRCYOuRuBIhqcBt5yJ5Eh8G7y3h/v9WIxY9LXRrOM4vzgThSrTU2o+DYq4u
         FXzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280417; x=1788885217;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8SPDGoSTl4FqMo3J2GRF/g+R9eIi+flZl02DefvrWrw=;
        b=bx3dFqxZgKDOO5rZhDQm4p4b/ASWHV31bwld7juWDhCSIw6oCrHRdJXThW7m5p0SHj
         X1zCupI7kkk3zNU2gACSHYlhUPhkN8pkL3VRnN2CnmU7cRi9BXO0FmVAUAMrwkuBt2PF
         oIpQMw0rzg2CZLZuNTDbHLMFtecJmXfWnJhAZ1FF5lnYkd4u7UNKi2yz7EaE5kzkwjF5
         +huEDVbTL1zROjbTTdILHedCnQ/LOu2OKCZQk9LRB+3zlEUjZmIwaOitH3Xjis2nD79p
         5alpK6S0pMZh8zeo5bAlhu1i97Jv3nyDHJGp58TGaCl+sBOGK2tTuQykjgsNu9HI/Gd9
         wmfg==
X-Forwarded-Encrypted: i=1; AKwUvBwSado0tGSL3mHoyJI3qcwk6JsmPm5CywLuwI1MqnzMcG3eH7rAar12VpvNumxReTaajrq0KkZINutpzYgkFA==@lists.infradead.org
X-Gm-Message-State: AFuF++kHD3+RLunfmIOJ0mq8lE+0D15rwneRwg7CjoMNNVZopGOGbJ4Y
	DSpl003e8jeOGx3EJSu5uYVlY5SsaafFpZeD9Z3mGHCeKSq+hrXbDGA=
X-Gm-Gg: AYBFou3DxXduudvhKyPEtxp1lEB72bfQGY6FAw1EoEkqNv/WsDDDxLAI9YJaV+LmV9t
	TadtmqSGwsHIxdxRRd6rb17lhTLxSO59oYNZZ0j8Bb7SxPos7M5LB90QFQT2hv8DEgzW1+xc4wM
	5wJlwdjukC7Xtr0Ar7IG2Q4wNeD3LOXE1mkq/d2TnxoIA4s/2v+gWwLLNoCM4r6hCcF3WyIDm0E
	9S2Me/Xqy6yovfcwlJtO7HS+rbYpAZjDhqKQ2IkXvZbfMNWWdD+7pgF+gt8LMb4mI5lDo0DTfjl
	YI2L8xWZas5289OfJX38XhU26s9ptDo4Ly+CWTvMeSSJSu5cvZ5i2oWJcgtYBzyO8288433mcD6
	AouWBICk8qbI4QHde+ZfiR1pbILas4puZ4gi97rgNvdhuNxfGhvKxgXHrPkjfLB9j8s/op4qB/W
	An5idBjcK5zUL17PH2qLWq9G/KnuCKWK969UOuVQBqNZZRIRek7YHe
X-Received: by 2002:a05:651c:2224:b0:3a3:368:fb9f with SMTP id 38308e7fff4ca-3a30368fbfemr67836761fa.13.1788280417031;
        Tue, 01 Sep 2026 09:33:37 -0700 (PDT)
Received: from fedora ([92.36.3.203])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a34a8ed967sm678251fa.7.2026.09.01.09.33.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 09:33:36 -0700 (PDT)
From: Vitaliy Sochnev <sochnev.v.74@gmail.com>
To: Lorenzo Bianconi <lorenzo@kernel.org>,
	netdev@vger.kernel.org
Cc: upstream@airoha.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Vitaliy Sochnev <sochnev.v.74@gmail.com>
Subject: [PATCH net v3 2/2] net: airoha: grow the small RX rings
Date: Tue,  1 Sep 2026 19:32:54 +0100
Message-ID: <978fe95e4c5ddb05ceb7d8c4d00ea2d2203b79d0.1788286284.git.sochnev.v.74@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788286284.git.sochnev.v.74@gmail.com>
References: <20260831234701.206021-1-sochnev.v.74@gmail.com> <cover.1788286284.git.sochnev.v.74@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_093339_530401_B45315B8 
X-CRM114-Status: GOOD (  12.73  )
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

Raise the RX_DSCP_NUM() fallback from 16 to 32, the vendor SDK default,
and give ring 4 the 128 descriptors already used for rings 2/11/15.

Ring 4 is the shared "force to CPU" ring that airoha_fe_vip_setup()
routes BOOTP, PPPoE Discovery, PPP LCP/IPCP/CHAP/PAP/IPv6CP, ISAKMP,
DHCPv6, SIP and LLDP onto, so it sees the same bursty non-hashed traffic
as the rings already on 128 while sitting on the smallest allowance.
Both CDMs forward to it: REG_CDM_FWD_CFG(1) and (2) each set
CDM_VIP_QSEL_MASK to 4.

The NO_CPU_DSCP fix does not cover this. With it in place, at 16
descriptors the ring still dies during PPPoE negotiation on a Nokia
XG-040G-MF: over 6455 devmem samples in 60 s, REG_RX_DMA_IDX advanced
0x2c -> 0x52 while REG_RX_CPU_IDX stayed at 15, descriptor 15 had DONE
set on a 60-byte frame, descriptors 0-14 were empty, and q->tail was 0.
Hw had completed a descriptor the strictly sequential consumer in
airoha_qdma_rx_process() cannot reach, and negotiation never completes.
At 16 DHCP still works while PPPoE does not: a dial-up bursts Discovery,
LCP, IPCP and CHAP where DHCP sends one packet every ~150 s. With this
series, 508 forced reconnects over 20 h saw no recurrence.

RX_DONE_INT_MASK covers all 32 rings on both QDMA instances, so this
costs 544 more descriptors per instance, 1088 in total: 2.1 MiB of RX
buffers at PAGE_SIZE/2 each, plus 34 KiB of coherent descriptor memory.

Ring 4 and the VIP classification feeding it are shared driver-wide, with
no DT or hardware property distinguishing one variant's ring 4 from
another's, so this is not scoped to a particular SoC.

Fixes: 23020f049327 ("net: airoha: Introduce ethernet support for EN7581 SoC")
Acked-by: Lorenzo Bianconi <lorenzo@kernel.org>
Signed-off-by: Vitaliy Sochnev <sochnev.v.74@gmail.com>
---
 drivers/net/ethernet/airoha/airoha_eth.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ethernet/airoha/airoha_eth.h
index fa9a8edce22f..7fc37f159d2b 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.h
+++ b/drivers/net/ethernet/airoha/airoha_eth.h
@@ -41,9 +41,10 @@
 #define TX_DSCP_NUM			1024
 #define RX_DSCP_NUM(_n)			\
 	((_n) ==  2 ? 128 :		\
+	 (_n) ==  4 ? 128 :		\
 	 (_n) == 11 ? 128 :		\
 	 (_n) == 15 ? 128 :		\
-	 (_n) ==  0 ? 1024 : 16)
+	 (_n) ==  0 ? 1024 : 32)
 
 #define PSE_RSV_PAGES			128
 #define PSE_QUEUE_RSV_PAGES		64
-- 
2.55.0


