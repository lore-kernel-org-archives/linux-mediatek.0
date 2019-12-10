Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61CF1C3F68F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 08:15:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21026206D5
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 08:15:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="XOZe/E8f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pTp2PPKi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21026206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XvlaIfDNJXymUUcR9a8t6qMgp7I/jmh4WHbbFkJzYq4=; b=XOZe/E8fkWG+u6
	Ybhxug37C90JjvwOsVjlim0UGIOkmpUmDhYvqKrC/N3QuTHJ4tkkZeNShD1H3Pgb7ILgtbMqpNvni
	AcXnGHfzdo8i6Pb7J2CEuMCipBO0c1Bbsn/mqScGpQMLnRU4blnxIIInV8jDIjjQ2IgaVwj0RlsSJ
	XzQMxgtxhMnb5IbfiF/DVBcBR6awCmAr0B6z/VZ9SCNAo2i3/+X725dYTNGNSDgtH8+tMPLT0F62B
	LXubp+Udvg19QuLo6/bzEvbtXezcruRWOFD2xW6My4TA0RW2Tuw4ZnRByTCJW4HFjYXmgrIuR+U0W
	JkdKP2+L7eTTA3nI0bdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ieafX-0008WS-7O; Tue, 10 Dec 2019 08:14:55 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ieafT-0008Tr-SJ
 for linux-mediatek@lists.infradead.org; Tue, 10 Dec 2019 08:14:53 +0000
X-UUID: 24a182a04d8f4499891c6328e4eaa0d1-20191210
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=THbuVAlbiUyMgTyO0rwrKX/mskzsxNwDv9gxXp2O2c8=; 
 b=pTp2PPKiPwR8QPOOf5yohf9lFERpEDlo/g/t2ChREfzFb9c+wylx++/div4hAB337+Ja2KIzbSu4URgdj5XHXUly8yuxrD8OBvV+ox0jlNLiRIN2dkCgL4fyzPr7ZPSk9lObJW05Yx2LY6Jy6eJZZXSShLlqLd0lDKwy6FT+hSI=;
X-UUID: 24a182a04d8f4499891c6328e4eaa0d1-20191210
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 586373266; Tue, 10 Dec 2019 00:14:48 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 00:15:50 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Tue, 10 Dec 2019 16:14:38 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via
 Frontend Transport; Tue, 10 Dec 2019 16:14:26 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: <andrew@lunn.ch>, <f.fainelli@gmail.com>,
 <vivien.didelot@savoirfairelinux.com>, <matthias.bgg@gmail.com>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>
Subject: [PATCH net-next 1/6] net: dsa: mt7530: Refine message in Kconfig
Date: Tue, 10 Dec 2019 16:14:37 +0800
Message-ID: <6ecf6cbf38223f35854bc361c2eefa1d85c724d2.1575914275.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1575914275.git.landen.chao@mediatek.com>
References: <cover.1575914275.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_001451_925575_9870F788 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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
Cc: devicetree@vger.kernel.org, Landen Chao <landen.chao@mediatek.com>,
 frank-w@public-files.de, netdev@vger.kernel.org, sean.wang@mediatek.com,
 linux-kernel@vger.kernel.org, opensource@vdorst.com,
 linux-mediatek@lists.infradead.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Refine message in Kconfig with fixing typo and an explicit MT7621 support.

Signed-off-by: Landen Chao <landen.chao@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/dsa/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/dsa/Kconfig b/drivers/net/dsa/Kconfig
index c7667645f04a..467f80157acf 100644
--- a/drivers/net/dsa/Kconfig
+++ b/drivers/net/dsa/Kconfig
@@ -33,12 +33,12 @@ config NET_DSA_LANTIQ_GSWIP
 	  the xrx200 / VR9 SoC.
 
 config NET_DSA_MT7530
-	tristate "Mediatek MT7530 Ethernet switch support"
+	tristate "MediaTek MT7530 and MT7621 Ethernet switch support"
 	depends on NET_DSA
 	select NET_DSA_TAG_MTK
 	---help---
-	  This enables support for the Mediatek MT7530 Ethernet switch
-	  chip.
+	  This enables support for the MediaTek MT7530 and MT7621 Ethernet
+	  switch chip.
 
 config NET_DSA_MV88E6060
 	tristate "Marvell 88E6060 ethernet switch chip support"
-- 
2.17.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
