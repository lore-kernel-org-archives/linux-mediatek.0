Return-Path: <SRS0=pZ6D=MU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B68C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 17:54:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA53760C3F
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jul 2021 17:54:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DA53760C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1K12mNLp368w3jzAUG6b3Eep0dA14J8G6NFLEf1ey04=; b=OsLzFtDJZlZeiM
	AZ/IRHi8oqE17Of1ppp1PWngJOUp9RA9iAWj3qnpO6PctJAfgWem1r/A2l8xm4rzIb2EfC0sv8Iib
	8E13nl/sRruBF1OS3XjvbZpmxL3dt+NvV/zGaepel9NL3GiRmmv8diJiRksJUp4pN64ByZ7fIY4vZ
	veXrgG1ZED/OZRvQrvLOxB118bl0R9Azinivmko/ixT/baZ+U2gUhfHDFzafX1FUcxOkIE89hyCZS
	ADTFzIAXB9V8lMakbhboaK0hhz0V2VFonpSxp2akSvmrugGJWKA61XdswfP01RigrXvXIOxLyIiYP
	FQeGnr/ufcFescFk8wNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8nkx-001uTR-Il; Wed, 28 Jul 2021 17:54:11 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8nkZ-001uOn-Qa; Wed, 28 Jul 2021 17:53:49 +0000
Received: by mail-pl1-x631.google.com with SMTP id k1so3586147plt.12;
 Wed, 28 Jul 2021 10:53:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+UFJID3RK8Mvf3O9hNEMzPnkq+/m+AsX5JYEUoSr13k=;
 b=JYdQ5tZKKdcp4RlelLIau9Za74wbrVH+YGbCQCINoGN5L/pd+JA8l0SuJIsus9oWnf
 yoPZiNNvlEXGNO0O1WyvXpMdp8hUUyZHUgy6Elx4DbRshi3HuO+CpEM+RyhoY/NFQV80
 8XGcmoALThMEp1YYbeTH5TspZdHPzGz/82MZyNQNmioaSL/xpvskZVpm/6SmQt0KGXci
 P3Jmi4BqCMjzqkrpxYqs8zJwRHCkn8TlAu+rDxQIcqgVdDYzOhW/lQUu+now/bXGPbCA
 DGiFJNX31RivzZlZA7/YY5dyqhc2WT2/TbiTYofmzDLbeOSFfQX6GM7AgSxSelVI32FG
 VwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+UFJID3RK8Mvf3O9hNEMzPnkq+/m+AsX5JYEUoSr13k=;
 b=uFafpvpLgfoGBqgMk9Dhph4Qh6TqF8llz9L1bRdEcChMFcway/s/VqYl8voBZnWbnr
 E0mierY4qEM7qBTIULHU1R8iZdgP3+iLrfCRDdHNT/wUvgTMKRmDS1HcBptddlVXOflM
 tA+75E44fcGibyeLRQsP+klbW6qLt2nDN9si3mHEA8gXLh0qO7/KkdI4aF825TB2Gl00
 BZRKSRqVN8nuqrDnAv0nGitY0jT1X+/wCP3yJk1X0F3mq9mh4P0JYIsxG2y0zC8Syp/y
 Ayip8Pp63dfNeN2KgZ1Bfg75/VX5IiMtpRWUCxUYf+NCfqRthuaccnC+ORCHxxiTKQk+
 4HZQ==
X-Gm-Message-State: AOAM531tmk2ewcDTSf8vXwspRzGHQgpzuvp/qGo5HpxbxBBE2nBwFl0o
 j7PiJl+AnpBDmi8XQvJgqdg=
X-Google-Smtp-Source: ABdhPJymE0InCyHTFO2miHWl9+IfFhQc6gc9jInoQiSnQj9jSF+3qp1HQRvIyrL8hUdiQLUh6jkO9A==
X-Received: by 2002:a17:903:2289:b029:12c:5642:c4df with SMTP id
 b9-20020a1709032289b029012c5642c4dfmr872792plh.23.1627494826812; 
 Wed, 28 Jul 2021 10:53:46 -0700 (PDT)
Received: from haswell-ubuntu20.lan ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id m19sm647113pfa.135.2021.07.28.10.53.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jul 2021 10:53:46 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [RFC net-next 1/2] net: dsa: tag_mtk: skip address learning on
 transmit to standalone ports
Date: Thu, 29 Jul 2021 01:53:25 +0800
Message-Id: <20210728175327.1150120-2-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210728175327.1150120-1-dqfext@gmail.com>
References: <20210728175327.1150120-1-dqfext@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210728_105347_915867_CEF34650 
X-CRM114-Status: GOOD (  16.40  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Consider the following bridge configuration, where bond0 is not
offloaded:

         +-- br0 --+
        / /   |     \
       / /    |      \
      /  |    |     bond0
     /   |    |     /   \
   swp0 swp1 swp2 swp3 swp4
     .        .       .
     .        .       .
     A        B       C

Address learning is enabled on offloaded ports (swp0~2) and the CPU
port, so when client A sends a packet to C, the following will happen:

1. The switch learns that client A can be reached at swp0.
2. The switch probably already knows that client C can be reached at the
   CPU port, so it forwards the packet to the CPU.
3. The bridge core knows client C can be reached at bond0, so it
   forwards the packet back to the switch.
4. The switch learns that client A can be reached at the CPU port.
5. The switch forwards the packet to either swp3 or swp4, according to
   the packet's tag.

That makes client A's MAC address flap between swp0 and the CPU port. If
client B sends a packet to A, it is possible that the packet is
forwarded to the CPU. With offload_fwd_mark = 1, the bridge core won't
forward it back to the switch, resulting in packet loss.

To avoid that, skip address learning on the CPU port when the destination
port is standalone, which can be done by setting the SA_DIS bit of the
MTK tag, if bridge_dev of the destination port is not set.

Signed-off-by: DENG Qingfang <dqfext@gmail.com>
---
 net/dsa/tag_mtk.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/net/dsa/tag_mtk.c b/net/dsa/tag_mtk.c
index cc3ba864ad5b..8c361812e21b 100644
--- a/net/dsa/tag_mtk.c
+++ b/net/dsa/tag_mtk.c
@@ -15,8 +15,7 @@
 #define MTK_HDR_XMIT_TAGGED_TPID_8100	1
 #define MTK_HDR_XMIT_TAGGED_TPID_88A8	2
 #define MTK_HDR_RECV_SOURCE_PORT_MASK	GENMASK(2, 0)
-#define MTK_HDR_XMIT_DP_BIT_MASK	GENMASK(5, 0)
-#define MTK_HDR_XMIT_SA_DIS		BIT(6)
+#define MTK_HDR_XMIT_SA_DIS_SHIFT	6
 
 static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 				    struct net_device *dev)
@@ -50,7 +49,8 @@ static struct sk_buff *mtk_tag_xmit(struct sk_buff *skb,
 	 * whether that's a combined special tag with 802.1Q header.
 	 */
 	mtk_tag[0] = xmit_tpid;
-	mtk_tag[1] = (1 << dp->index) & MTK_HDR_XMIT_DP_BIT_MASK;
+	mtk_tag[1] = BIT(dp->index) |
+		     (!dp->bridge_dev << MTK_HDR_XMIT_SA_DIS_SHIFT);
 
 	/* Tag control information is kept for 802.1Q */
 	if (xmit_tpid == MTK_HDR_XMIT_UNTAGGED) {
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
