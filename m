Return-Path: <SRS0=Q4g2=MM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E9C8C07E95
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 03:52:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F50860C41
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Jul 2021 03:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F50860C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9P7nvFFJguKrqOcYxjc6tr9zxdPFiiRWuNhKcqVPQA=; b=vUvVrAhGJWIKm+
	AhVfHatdYklm4d8X7umdjO+aNV0+DprlOltdd4Fyi+5CaUjzXSDGPezKMDckXpfP0XB892UDJ0tuy
	GJV7zbXLdUFbEx4QNGeWOxmvllt862IUaGd48TmKBjNflHlS8C0iz+R9NiR2PcrNy86fIxE748yLi
	6VhvpRuLiqrCbeCjL2Lrcxxi1ldltonJ0FmOzM2mJHzp/7cejuK2aZUKbojFEBIWmST/wMB3C1I10
	9KX+3pAd9OgPwK5sK8MgboBoFNeaLlKQ1beYqR7xpRZ2VVv5BV/9hHtORX18fKEd0qR5DSU6C8bhG
	k1auXzPskHgW7BcZGi7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m5gnw-00Bp6S-N9; Tue, 20 Jul 2021 03:52:24 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m5gnu-00Bp4r-KF; Tue, 20 Jul 2021 03:52:23 +0000
X-UUID: b1b6c49c96554e31adc940877e9cad51-20210719
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=7q3C2n8o+ah8sQ4nGV4WUfMOSZmLDa8kDM/dzqZCwSA=; 
 b=payZ3u9noQhAl7G8viYsyW9uHFDM3vvpDZL4gwGyqOgVHNVAXNkIKH5xa3GhpTwEMrUU0a0WeJlvE67rlsDCMq0KRm88wFSC550f6WEOt9g/+APDHSETbmkd5Se8HJgctRpiumVAZWpes8/yhQNWHysw8UfyBA6eGB8yFj75rK0=;
X-UUID: b1b6c49c96554e31adc940877e9cad51-20210719
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 900618329; Mon, 19 Jul 2021 20:52:16 -0700
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 19 Jul 2021 20:50:11 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 20 Jul 2021 11:50:09 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Tue, 20 Jul 2021 11:50:09 +0800
From: Landen Chao <landen.chao@mediatek.com>
To: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, "David S . Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, <dqfext@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <netdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <frank-w@public-files.de>, <steven.liu@mediatek.com>, Landen Chao
 <landen.chao@mediatek.com>
Subject: [PATCH net-next v3] net: Update MAINTAINERS for MediaTek switch driver
Date: Tue, 20 Jul 2021 11:50:07 +0800
Message-ID: <49e1aa8aac58dcbf1b5e036d09b3fa3bbb1d94d0.1626751861.git.landen.chao@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1626751861.git.landen.chao@mediatek.com>
References: <cover.1626751861.git.landen.chao@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210719_205222_719794_66CFBAD3 
X-CRM114-Status: GOOD (  10.20  )
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

Update maintainers for MediaTek switch driver with Deng Qingfang who has
contributed many high-quality patches (interrupt, VLAN, GPIO, and etc.)
and will help maintenance.

Signed-off-by: Landen Chao <landen.chao@mediatek.com>
Signed-off-by: DENG Qingfang <dqfext@gmail.com>
Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
Acked-by: Vladimir Oltean <olteanv@gmail.com>
---
v2 -> v3: Change Message-Id from v1.
v1 -> v2: Remove Change-Id.
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index bd7aff0c120f..3315627ebb6b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11588,6 +11588,7 @@ F:	drivers/char/hw_random/mtk-rng.c
 MEDIATEK SWITCH DRIVER
 M:	Sean Wang <sean.wang@mediatek.com>
 M:	Landen Chao <Landen.Chao@mediatek.com>
+M:	DENG Qingfang <dqfext@gmail.com>
 L:	netdev@vger.kernel.org
 S:	Maintained
 F:	drivers/net/dsa/mt7530.*
-- 
2.29.2
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
