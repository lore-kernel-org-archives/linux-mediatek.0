Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38857C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 13:35:19 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CAF066192F
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 13:35:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CAF066192F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gHbuz+I6maH7PN+f0xz7w4c2sDfox6WIs7bZDGlybTg=; b=D7V6XjU0deeno+yvWz10Sd51mX
	SgoqHqB8dOPFwiJn6IDSwH1WhtMTP1M8nVEW3qSNxxVvnGEo6xaeoEboLfR+YBT1M9P/FwRnVICjR
	rL53FB4rRgIXXq5oCwuR46YskkVgD73ATU35Jnkxle/guOm9ye0mY/Ea8WqOI1m+GKY1i1A/k3MvE
	ZeUD1ZPcnidzAyC/LfsZkRd8AQS7WmpDUj8zzxT2wHEOP65aiihgqTOyYFH+z65alb8ViizYVxL6G
	Sut+RiYZI474kNfSsrhSflYk9S4K5wPDT/R6Ds0qk55C3QOtEpULSIRhpE0vs/cpwwR7tD+CVLOCC
	1Q2CgmSg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRazx-006g0v-EK; Wed, 31 Mar 2021 13:35:05 +0000
Received: from mout.gmx.net ([212.227.15.19])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRazu-006fzy-Ef
 for linux-mediatek@lists.infradead.org; Wed, 31 Mar 2021 13:35:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1617197689;
 bh=ibhtJylvLZbLVTdi5GGJTxnMI6oVXL6m7a7MF8mWkPg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=HduMZJ2SHdWqRJv3jdKbJddOUTup1rLzkBZrjzbNUZA1rzOHVqaRtaOvNax8+d/Iu
 Y6X2Ww9veTHcH1AyCxUMrJeuIzm7mLQjxXwLE8drWLUmO89hOzvecWfbN4WEwdI0oy
 PUhlhqr7KDwabBkqS8Jx+NpL/fSc3rKM73vZhJN0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([217.61.148.91]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N0X8o-1lmYBh1L6K-00wVIp; Wed, 31 Mar 2021 15:34:49 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: netdev@vger.kernel.org
Cc: Frank Wunderlich <frank-w@public-files.de>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>, davem@davemloft.net,
 linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH][net-next] net: mediatek: add flow offload for mt7623
Date: Wed, 31 Mar 2021 15:34:37 +0200
Message-Id: <20210331133437.75269-1-frank-w@public-files.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:HPmPr6jTaU43AppMP5/aiJa5Sh3rTHe9vTWbrw6fgj27gpFLtPo
 RB8jAfpYdIuUWWhlQ7Avihs9EqqiGgffrsqZl+rIT2rowIjU2DmieK7uVJMFOBx7uZVoYOg
 GXSmnz7dBLQq+pPOr5RBtCWd3MIO9l6f4Ioa2CBjgtq4on9IHdnu4OQcmjbFAlekZtSFRSb
 XzRgT+fOvWgjoZatX9rCw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:aUESrT1sTvA=:bbw19/M6xSRsQGZVRWjg/Q
 tjsOOYyf4//ERAFPKI5ktz4h/K8agFPFJBeC0THwCL6xjh5FAnzaUpVB1D8dDD1azZ/x+eBQt
 yqCVFiuhDz/UcLFpVSu4HiBulctG57QHL18MzhYuDktEAfWsLWUYbxUaAbSUkkmEA5Lc7vyOq
 MduVhlSQSrzFYf5t8QXc8BjqKvIamjNtpIVfqsdwzqviZmfR0t2weGJzFHSjByKlDzJ7G7Lnb
 0SestJlEs/OhqWFHK0ZaCbRNdMLB3X+u6h6QHs4XCsJQc+SYinf27sitxBKdM/JMDC81j2voM
 Bo6vLQlRRfx2vNOZfr0wL/SgBf45jzDo3g9x6XqPTbz+E2uz8C5ghujlV1jU8jglZM4aiWUeE
 p5AxxCFS/ZhCN+Z0ZUk9EATBfy7GF9wQxF1MXAFfaq1T3CSaWTI3HLPZqjeMQi5dbgi/B5Sww
 RK6/1Hk9NXuQQqXrjbvD3Vhh8SjKkLE4eUKwk6NTBqntO1eOIudv88XgY8jGudSVclJyGhI0/
 6vQlZtt7GxiL62hLTqQVcufwQWSMu1LhTaBVENmzjwE0Zb0uXTR4VCyAepLeB/OBcKpsZYGV5
 JOYaHBpd2lq4akdtqmlzZdhchYM/v3a8SIzePNHPc73CW2hWZTDhGZzoZUE83Wo1lb/cS+/F5
 JrwHKnSRtW9vmDeTERCzuFEYGQfaKJeKZTFDMGJGXYvKqFU9+VuTJ3lNs8dYMitzHd+Jfc8E+
 3+0KuoLI6bKoXA0EaOYleszB0CXy9ufYut01JgSiv8ZcoQfyn4TMNLTHHM+gtGOSazEl8gjSm
 F+dtnHm1EcMb16DoQaXQkd7pUzjgqGiOLaxA3XV+QqQ9ve5G29dKxj9cR3xx1SHdXSa4uQylh
 WJwuioNimKKPk60RcAZx1CSOb8GQqUHnxYAAJ5FHNhoLuZdkQdYLt/6QuIkWoncryDXBluy4p
 oia9575QcUBH6LeGXyvUv1f8AP/yLLc2ybAlRDGQz8I7Pm8z3yR5z5qgxOz0tNxujza8Nhaqz
 CGH3xLIdSMeoq95FLcOSC1SWj771ROEy8hPZFwjsqaYpOlA1eR8I1/Cxi966lV/5c3ERBK6fs
 k/8L71t5zlkjKDKss+lknl9cgo8Ro78ThtVpUQKwLoXPNi2kqbztYnrjLeItLhy7Lnhj7oPfc
 NqYU+XdGbiNCbkk2kE4Xf14su/nkC6yqPZImlF+yEzV5/2yHYKhVQqFsJypHB23w+MQF348OH
 2fPDrxWiTCXSTWhJG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_143502_618865_532C3B26 
X-CRM114-Status: UNSURE (   6.26  )
X-CRM114-Notice: Please train this message.
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

mt7623 uses offload version 2 too

tested on Bananapi-R2

Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
---
 drivers/net/ethernet/mediatek/mtk_eth_soc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 0396f0db855f..810def064f11 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -3202,6 +3202,7 @@ static const struct mtk_soc_data mt7623_data = {
 	.hw_features = MTK_HW_FEATURES,
 	.required_clks = MT7623_CLKS_BITMAP,
 	.required_pctl = true,
+	.offload_version = 2,
 };

 static const struct mtk_soc_data mt7629_data = {
--
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
