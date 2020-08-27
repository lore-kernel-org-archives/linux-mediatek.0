Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9913CC433E3
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 09:26:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6869C2075B
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 09:26:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="KAGKgPMP";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="bBSgLANl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6869C2075B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OtiHwKAcTEyqfDmkubT2Ts6QAYos4jSncpiN195b+rQ=; b=KAGKgPMPHP7DPXPfdmfbTuTLzn
	J3f78nl2wxJx6s01oO3N5xdBBBQcVXvbzj8eMJHRAGI2mRDefFu2aQYu2fd6OZTANz9m9WSRdBeYd
	0M5Myf4A7w+nmiiceexUaVjU8sRSzeGYsC66VhaTBOaulcaV/+lfpQb8c9gzpBE49gdmlU1qi6TQJ
	+KmP0MqT+Crka4lFJ05jcNEzQ3jDoYwtoBStD0+47tZhYKkCFry2MEjKZqbXCHDRZHwXXOJC8P1d0
	k1fr18/ExkQZV2fFloDEBnCMyyfPLx3H0ev2kjc/erMxMNVUbTHdbwfc9+g6xFrFbC8tJy9DAR49z
	3e5yMk2A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBEAK-0005Jb-IF; Thu, 27 Aug 2020 09:25:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBEAF-0005Hd-Sr; Thu, 27 Aug 2020 09:25:49 +0000
X-UUID: 517748ccda924743861d456329ed542f-20200827
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From;
 bh=V1FwTzdYmRJ/zoRfCUGYgxD7wn+pwTusye8m5DDKIDU=; 
 b=bBSgLANlpvU3hA3uxiJZmfs0j7+qqDpqEk3/MA74a6Zoiv1rXAYto4fJfbLXazE66F3jdV66he8NJp9AIAF3MaACzz5X4SMn8FmpUCUFE/YYLAq9nBnqBN32CIm0826w5oI74AR/mi4VFYO6ezpr2Dgot/TN6gL6xDux1L0AVws=;
X-UUID: 517748ccda924743861d456329ed542f-20200827
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 981604879; Thu, 27 Aug 2020 01:25:42 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Aug 2020 02:15:50 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 27 Aug 2020 17:15:48 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Thu, 27 Aug 2020 17:15:49 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>, "Vivien
 Didelot" <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, 
 "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Russell King
 <linux@armlinux.org.uk>
Subject: [PATCH] net: dsa: mt7530: fix advertising unsupported
Date: Thu, 27 Aug 2020 17:15:47 +0800
Message-ID: <20200827091547.21870-1-landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_052548_081436_E91ED158 
X-CRM114-Status: GOOD (  13.32  )
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

1000baseT_Half

Remove 1000baseT_Half to advertise correct hardware capability in
phylink_validate() callback function.

Fixes: 38f790a80560 ("net: dsa: mt7530: Add support for port 5")
Signed-off-by: Landen Chao <landen.chao@mediatek.com>
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
