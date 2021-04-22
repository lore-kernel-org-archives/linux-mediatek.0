Return-Path: <SRS0=s7tg=JT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CAC6AC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:12:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4C290613FB
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Apr 2021 04:12:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4C290613FB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HaanwBYwtu/5H4Xu/ZY9+cq/JA+nYxni0c0uF5qEYJY=; b=gfs9uI8Hfhb3+cUqZB9cb8j1H
	nuoQsAAmba7WyJ/ert1ebI3PKQkb8A6NunsgExd6HL4EVseR07i7Fg8IoUCF+btrnt/5waDSpYdJl
	D2xetXjzt1MzJakWr/fUlyw30GmRMmx9fnnbJT3kMatEmYdcpXxr7g2qJhFk5f215zd2pUxpLgQ37
	8DE1+85jtfArlU1ulxb2PXi3oy6RGecBvEeKJZh953SU+dmpkdhAifQ8Z/ppVz88u5hdmLIKcavEx
	JO93xuSvQ3VY+8uaihzRj6DJsIuC0qcL0uawwSw8hVPAp0WzNNvBjgJWcjb1iC66jNPNNF6Dz4ZW2
	Okclde4qQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZQh8-00Fm0J-AG; Thu, 22 Apr 2021 04:12:02 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQeu-00FlQY-Qy; Thu, 22 Apr 2021 04:09:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=BqG+zTglnF7bDNQlesivFzezPjfS1NU3z80UalF/S6Y=; b=MN4mHsgSbC318mpcEXeKOhbVyr
 kzjhGqpfCG43ZCjELzK1dRInbzNWLa7nTUVmFeGk7jU7QprEbnz4rBVzrjkFG1XQ5r5Ncac/L0oH8
 JWTqZOEjZIH5hj73bgRI5rn0HrLEhzlLKw9siZ0RQmJB30EtOI/wXtzXhtGVPHaxd6V/8LUKpvEoF
 72USnIl7FlP1YZBcifQfm0wOMAIhjrhSNv53DzRDqITHEVFsFXcW1Ef0jDx7yd38KRUAkxUrRl/U4
 vxc2o+NX4kby3H+PjDbYWdbt1WNU80FWBrXUvc2pj9DawaExsvdaqPXf2M4bzjv4yeGBexn5dkd3k
 Ph760uiA==;
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZQes-00DLdi-B2; Thu, 22 Apr 2021 04:09:43 +0000
Received: by mail-pj1-x102e.google.com with SMTP id nk8so7434490pjb.3;
 Wed, 21 Apr 2021 21:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BqG+zTglnF7bDNQlesivFzezPjfS1NU3z80UalF/S6Y=;
 b=XIw7qzdmjjv0XsqmEg2M6245uhywBxRrA+GaJEsytTxoss5nmoS7Jjxnb0uvvC2eNb
 9PerPXO3noS0Fyb0AXyAkRimWmhdvX0pEHjJIlGdWfdABzP1SgdpjmvgKn5xDwfgm1J/
 hcDYEJQ7iEY+/4KMfcDOz38ecA/RC2pXfpUs+C1NOWIehj8T3bQW1f58v2LiALKZ4kMb
 9/1SYZEXtSxJNjtrWMhpN4H+pFql5CtFjgJsgNSrlkCD5HWaqDXEKZ4/cWovRVcfYnqC
 T1iL8QN9M1xEmVfnOnUr/RXCOSfIpZdZyXfgOf0oEkz9Ffj4yimeIdAiWHZ+AC0pfP0/
 IB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BqG+zTglnF7bDNQlesivFzezPjfS1NU3z80UalF/S6Y=;
 b=fzdt2kczU07HfgMLa/ymOUkja4nB94dtrbmmp3TH6+GS7l4dDtJLkWkItLsPN/MQMP
 P/PNznJaMZyxIa3HbS+lZIW4V5740QUZVOxZ2QHBh9C/Sghu5rLXE1YPd+M4U3K/sgGN
 +KElDWnnE+SABeLhxhA6DKQU+KXCz7Fu4+HAkqgk3SSjuNeb4pOcr2W3nh3lgancP2ow
 QoZaL8aOiS2F+tqrHMLPYOkZQ20v2A5MICz2doIQQOMA8h1KgsFWpzS2pVybjDMfEure
 +qpQ7Kxpnn4vivFYNheMPXbeyXi4jfeOVRzQ9JUx+FzQgjgqQWoJbFTpHTbvzyrHsQhf
 pXqQ==
X-Gm-Message-State: AOAM531nGKTP1f6Qn5yp4TMNKHiqJ4K6WesJms3BBL9zG/NV6vYAJheB
 W2zE47KWF+0ZcBvRhUQjN40=
X-Google-Smtp-Source: ABdhPJyXEesIOVFoSTI8GDvHdygln2zE5LDKv0dytmwT9xBB8YiKt6cpGaU8lBrUMOCkCPl6DIUf/Q==
X-Received: by 2002:a17:902:a585:b029:e7:3d46:660d with SMTP id
 az5-20020a170902a585b02900e73d46660dmr1326944plb.12.1619064581626; 
 Wed, 21 Apr 2021 21:09:41 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id i17sm635354pfd.84.2021.04.21.21.09.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 21:09:41 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH net-next 05/14] net: ethernet: mtk_eth_soc: reduce MDIO bus
 access latency
Date: Wed, 21 Apr 2021 21:09:05 -0700
Message-Id: <20210422040914.47788-6-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
References: <20210422040914.47788-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_210942_409625_DE334C50 
X-CRM114-Status: GOOD (  15.46  )
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

From: Felix Fietkau <nbd@nbd.name>

usleep_range often ends up sleeping much longer than the 10-20us provided
as a range here. This causes significant latency in mdio bus acceses,
which easily adds multiple seconds to the boot time on MT7621 when polling
DSA slave ports.

Use udelay via readx_poll_timeout_atomic, since the MDIO access does not
take much time

Signed-off-by: Felix Fietkau <nbd@nbd.name>
[Ilya: use readx_poll_timeout_atomic instead of cond_resched]
Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 18 ++++++++----------
 drivers/net/ethernet/mediatek/mtk_eth_soc.h |  2 +-
 2 files changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 5cf64de3ddf8..a3958e99a29f 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -79,18 +79,16 @@ static u32 mtk_m32(struct mtk_eth *eth, u32 mask, u32 set, unsigned reg)
 
 static int mtk_mdio_busy_wait(struct mtk_eth *eth)
 {
-	unsigned long t_start = jiffies;
+	int ret;
+	u32 val;
 
-	while (1) {
-		if (!(mtk_r32(eth, MTK_PHY_IAC) & PHY_IAC_ACCESS))
-			return 0;
-		if (time_after(jiffies, t_start + PHY_IAC_TIMEOUT))
-			break;
-		usleep_range(10, 20);
-	}
+	ret = readx_poll_timeout_atomic(__raw_readl, eth->base + MTK_PHY_IAC,
+					val, !(val & PHY_IAC_ACCESS),
+					5, PHY_IAC_TIMEOUT_US);
+	if (ret)
+		dev_err(eth->dev, "mdio: MDIO timeout\n");
 
-	dev_err(eth->dev, "mdio: MDIO timeout\n");
-	return -1;
+	return ret;
 }
 
 static u32 _mtk_mdio_write(struct mtk_eth *eth, u32 phy_addr,
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 875e67b41561..989342a7ae4a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -327,7 +327,7 @@
 #define PHY_IAC_START		BIT(16)
 #define PHY_IAC_ADDR_SHIFT	20
 #define PHY_IAC_REG_SHIFT	25
-#define PHY_IAC_TIMEOUT		HZ
+#define PHY_IAC_TIMEOUT_US	1000000
 
 #define MTK_MAC_MISC		0x1000c
 #define MTK_MUX_TO_ESW		BIT(0)
-- 
2.31.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
