Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2039C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Apr 2022 14:36:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OYHHMoEdv+qDZUNsSHeWHW6ixRox4oYZez94SAZAyyg=; b=gVrafRXpuYmwmj
	PIqQ7rpjgo3P7twraWGQx7xlkko95HfxSHMlfjVtJnGxa7Mglgp5XaNYg24D7wJdrTg7e09hQ8ftD
	kjM8ki2a2IQgc31oyYQR7U5J05emWaIQF/7YyKsnQKXkwj4a47NxYrzNNuDOYp9m5Ge4XxsB2k3Ve
	9kibv8EdxYC6ck9n0KQCPJqdkMr2ldFVzLetPo8lnpWcO/y9LacnL3AJDeJ1ouzrZvycYTgmMDbH2
	nUlSZfqeS90+7vSml6g7BA3/DeB0zHqaEmsS2M4kKiGYx8UTZfoeQ+PSAdxwWbbiSBXLytG3NSto5
	KeV69t4zAfE+N9ThovRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nc6m8-006YVP-KO; Wed, 06 Apr 2022 14:36:48 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nc6kg-006XmV-7k; Wed, 06 Apr 2022 14:35:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/IAm1zyPctcxoxML0sDPVKwxvBMfVjy+g9VTkY82hNA=; b=oR5EtfpyxI9NbMR5HQ93DbqWh/
 HmOo3JuMp8fTwIxeooksI4Y4LaA0SFpCiR3L2YrOx0sZ1ix7AyAmO0nmMRkX34pE/OYalicl3XHW1
 IlAg+v8NRmeaC6oEXogY9Tgtp0+P/OGH0PeHbhkY3YhJKq9zSm3jIV5iLSbSP/R6d5vtZalu/4FiP
 RfoewGRgp9RTKDCtVuPzU28snOacIjWUzgSSQDkgKwWhnMMrjSskFiyhVHMP4KvbD5l11HroPzqlF
 w4Ap4Wt7G4ujPzwSdZAn2YT7ZuVh7Aei1PZ1mNNotYP/hJow5JT445nOONAlA4XzvqiHh3PNoGE6N
 eFJxPcRA==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:60666 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1nc6kY-0002uQ-MT; Wed, 06 Apr 2022 15:35:10 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1nc6kX-004ijj-Qk; Wed, 06 Apr 2022 15:35:09 +0100
In-Reply-To: <Yk2k9D40QojsRhoo@shell.armlinux.org.uk>
References: <Yk2k9D40QojsRhoo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH RFC net-next 03/12] net: mtk_eth_soc: add mask and update PCS
 speed definitions
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1nc6kX-004ijj-Qk@rmk-PC.armlinux.org.uk>
Date: Wed, 06 Apr 2022 15:35:09 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220406_073518_390975_C940979C 
X-CRM114-Status: GOOD (  10.21  )
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

The PCS speed setting is a two bit field, but it is defined as two
separate bits. Add a bitfield mask for the speed definitions, an
 use the FIELD_PREP() macro to define each PCS speed.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.h | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
index 8a10761adda0..f31ef594008a 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
@@ -17,6 +17,7 @@
 #include <linux/phylink.h>
 #include <linux/rhashtable.h>
 #include <linux/dim.h>
+#include <linux/bitfield.h>
 #include "mtk_ppe.h"
 
 #define MTK_QDMA_PAGE_SIZE	2048
@@ -485,9 +486,10 @@
 #define SGMSYS_SGMII_MODE		0x20
 #define SGMII_IF_MODE_BIT0		BIT(0)
 #define SGMII_SPEED_DUPLEX_AN		BIT(1)
-#define SGMII_SPEED_10			0x0
-#define SGMII_SPEED_100			BIT(2)
-#define SGMII_SPEED_1000		BIT(3)
+#define SGMII_SPEED_MASK		GENMASK(3, 2)
+#define SGMII_SPEED_10			FIELD_PREP(SGMII_SPEED_MASK, 0)
+#define SGMII_SPEED_100			FIELD_PREP(SGMII_SPEED_MASK, 1)
+#define SGMII_SPEED_1000		FIELD_PREP(SGMII_SPEED_MASK, 2)
 #define SGMII_DUPLEX_FULL		BIT(4)
 #define SGMII_IF_MODE_BIT5		BIT(5)
 #define SGMII_REMOTE_FAULT_DIS		BIT(8)
-- 
2.30.2


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
