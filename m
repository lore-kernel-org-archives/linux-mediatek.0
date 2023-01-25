Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A6CC54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 13:30:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GnOGx+5KAZZWCkWWIQhZlETgJRuiLf+3XskpIdwIK8s=; b=O4YTfod/P+C+1p
	++k9x3mdZWoXcW8ffS9wLAMgFpDbm6tkvO2RSdWnx9cvw3HfkIYbTnop0I6yJUcTo+LJjCjcMnHab
	vhQK/W+N8LCa3aRTdnOzRWx3GLgt1vCP7icIVK1mgJLlFeoCNvPhmhgrKFxCuINXRAUw1HF+pyS4d
	oRwJuQonhTwf/f/aDJtZZJGLul2/VC3jTcBFZL5Ap4cs2opqarXrsmZBD33307paCUpTxZsHhXzfD
	thcFuHmBT+gwuoL3nIDHEl3xFN7bilCg6ECCVWapSZXp7exdS89Lz63QrXmLFhyYxsqMDSk08qvUy
	j53S6H8D8C21KjNDbjXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKfqj-007OUw-Ot; Wed, 25 Jan 2023 13:30:01 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKfqg-007OTz-Cn; Wed, 25 Jan 2023 13:29:59 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1674653386; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=epCHy7XZvmyvuoBJL25hKe/FnhUkiM3hH10KoaLLAn8XLzeTMeQpMXbAxZgyMzgOTuJ97qRQSEF8E9dsOVeLFVZFM4eoURfU0A0bB4hI4orUz5IDdjPTp8O8NTWpdFYM4r/xEk66XJsQ0D6GKdyzJl3b1ZtFq5AobBC4kBKFFR0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1674653386; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
	bh=GnOGx+5KAZZWCkWWIQhZlETgJRuiLf+3XskpIdwIK8s=; 
	b=NACs6x+wJq/tek8W9yDHcKqVEBXunrjCMD4OS/iDJz+XJ5Yo7aeUV6tpmieyZmc3lwVSzyDUkaOyqbyZMXdNTkifTxFKIo15l8KOd1Odo1+XGxsXV4Sv0P6+bd4hgwPbyxHPERRa30O8CN8QHVy71B+4o6D0CAtOnTZuoLWpgzU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1674653386;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:Reply-To;
	bh=GnOGx+5KAZZWCkWWIQhZlETgJRuiLf+3XskpIdwIK8s=;
	b=UJ8wpTFMez+hOwrB3b2QqV0i2Rzucw4RhB0LeJjedDuHxUpLLx9Ms1Izl7bQhxrY
	t+bqD1oTA7ui0jphsVGfbv553lTqF9RLAAyDdzbS7mLuPYXyYV9svrNBh+Jn0iETd0i
	HaIGlkaTBGfXht89S6xeEzqGci5G/PYKTBkrt+9w=
Received: from arinc9-PC.lan (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1674653384203939.6380957478401; Wed, 25 Jan 2023 05:29:44 -0800 (PST)
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: Felix Fietkau <nbd@nbd.name>,
	John Crispin <john@phrozen.org>,
	Sean Wang <sean.wang@mediatek.com>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH net] net: ethernet: mtk_eth_soc: disable hardware DSA untagging for second MAC
Date: Wed, 25 Jan 2023 16:28:51 +0300
Message-Id: <20230125132851.95298-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_052958_525084_59D99F59 
X-CRM114-Status: GOOD (  14.27  )
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
Cc: netdev@vger.kernel.org, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, linux-kernel@vger.kernel.org, Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

According to my tests on MT7621AT and MT7623NI SoCs, hardware DSA untagging
won't work on the second MAC. Therefore, disable this feature when the
second MAC of the MT7621 and MT7623 SoCs is being used.

Fixes: 2d7605a72906 ("net: ethernet: mtk_eth_soc: enable hardware DSA untagging")
Link: https://lore.kernel.org/netdev/6249fc14-b38a-c770-36b4-5af6d41c21d3@arinc9.com/
Tested-by: Arınç ÜNAL <arinc.unal@arinc9.com>
Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
---

The MTK_GMAC1_TRGMII capability is only on the MT7621 and MT7623 SoCs which
I see this problem on. I'm new to coding so I took an educated guess from
the use of MTK_NETSYS_V2 to disable this feature altogether for MT7986 SoC.

Arınç

---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 801deac58bf7..f1cb1efc94cf 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3243,7 +3243,8 @@ static int mtk_open(struct net_device *dev)
 	struct mtk_eth *eth = mac->hw;
 	int i, err;
 
-	if (mtk_uses_dsa(dev) && !eth->prog) {
+	if ((mtk_uses_dsa(dev) && !eth->prog) &&
+	    !(mac->id == 1 && MTK_HAS_CAPS(eth->soc->caps, MTK_GMAC1_TRGMII))) {
 		for (i = 0; i < ARRAY_SIZE(eth->dsa_meta); i++) {
 			struct metadata_dst *md_dst = eth->dsa_meta[i];
 
@@ -3260,7 +3261,8 @@ static int mtk_open(struct net_device *dev)
 		}
 	} else {
 		/* Hardware special tag parsing needs to be disabled if at least
-		 * one MAC does not use DSA.
+		 * one MAC does not use DSA, or the second MAC of the MT7621 and
+		 * MT7623 SoCs is being used.
 		 */
 		u32 val = mtk_r32(eth, MTK_CDMP_IG_CTRL);
 		val &= ~MTK_CDMP_STAG_EN;
-- 
2.37.2


