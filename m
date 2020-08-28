Return-Path: <SRS0=47V3=CG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1362C433E6
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 10:53:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DE2A2086A
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Aug 2020 10:53:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lE6W68x/";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="g+kbXf5b"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DE2A2086A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5KgHVOKZbw2RdX+9GZG7PxfmY4JH2v1Q16/klfS3jyQ=; b=lE6W68x/RbuVRMtaKCK374AWUW
	OVLHa47NihBTnAzr9ROlDkdxBi8OYAkoss5yA2/k4hqWBVYitKu6IIIjbuNFueASlYEwpt7Wkf+Gm
	GawZtvOAIiN9oSAhloFfhhtswCWG6TIs2bL98wBMKyLfjIrAvC5b5KOn2ZplghYxGGDufg8uCaQAU
	G/viPDH8lNtriiMnz+NEP2qDvzdyWwcnue/iZ7TIR1s83p+XOTaW3yI9hdPnonZANT4wp1o2Ivqjc
	tG7NLxG5wafg+ysJ4hqCtRTD4xE0kFgSwIyeR0zCh9WuquJS1doP99Wca/hC5Qm4S0JEyHXf4/ii6
	6L0ijDtA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBc0G-0000sn-GD; Fri, 28 Aug 2020 10:53:04 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBc0A-0000rc-Lg; Fri, 28 Aug 2020 10:53:00 +0000
X-UUID: 7ccf045e6dbb4eb0932f9ecccd7b575d-20200828
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=FZ0PPk8gVzEhQ1IFGUZY31/TpdulCQ+QsyJk9Jc/ChY=; 
 b=g+kbXf5bXrsWP4IbyCHYs8dW3ksVkMmHTlIDMlPRieojj+pA/p7JPWFluCbsjQb5YHay5UB6vHDknorV8/IpeXC2/ZGbjdMV6sATfehNzHexnwm3yqkbcswPOYEWw6leD7tc8aGR54xkeX3l+l4Tr1Lx5bbtiP2siDHgGvlBnFU=;
X-UUID: 7ccf045e6dbb4eb0932f9ecccd7b575d-20200828
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2128183475; Fri, 28 Aug 2020 02:52:49 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Aug 2020 03:52:47 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 28 Aug 2020 18:52:44 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 28 Aug 2020 18:52:45 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, "Vivien
 Didelot" <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Russell King
 <linux@armlinux.org.uk>
Subject: [PATCH net v2] net: dsa: mt7530: fix advertising unsupported
 1000baseT_Half
Date: Fri, 28 Aug 2020 18:52:44 +0800
Message-ID: <20200828105244.9839-1-landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_065258_900711_B2506381 
X-CRM114-Status: GOOD (  13.88  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Landen Chao <landen.chao@mediatek.com>, dqfext@gmail.com,
 frank-w@public-files.de, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 opensource@vdorst.com, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Remove 1000baseT_Half to advertise correct hardware capability in
phylink_validate() callback function.

Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
Signed-off-by: Landen Chao <landen.chao@mediatek.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
---
v1->v2
  - fix the commit subject spilled into the commit message
---
 drivers/net/dsa/mt7530.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/dsa/mt7530.c b/drivers/net/dsa/mt7530.c
index 8dcb8a49ab67..238417db26f9 100644
--- a/drivers/net/dsa/mt7530.c
+++ b/drivers/net/dsa/mt7530.c
@@ -1501,7 +1501,7 @@ static void mt7530_phylink_validate(struct dsa_switch *ds, int port,
 		phylink_set(mask, 100baseT_Full);
 
 		if (state->interface != PHY_INTERFACE_MODE_MII) {
-			phylink_set(mask, 1000baseT_Half);
+			/* This switch only supports 1G full-duplex. */
 			phylink_set(mask, 1000baseT_Full);
 			if (port == 5)
 				phylink_set(mask, 1000baseX_Full);
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
