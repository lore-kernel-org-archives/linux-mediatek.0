Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3124C433E9
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 08:24:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 659B564EE7
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 08:24:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 659B564EE7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=DH6UJcD+7prfyd1xRAKlEDmrXNOjBy5TN4uf+zIpmbY=; b=2549mGC1/PXrrbvXpzIzL619c
	ee7FeL28/080R/zm0d6+B9/XcXphwrPLyXaJkOwYFAhYSFtRwbvV6339iaJ0047Ymt+2mtQuAW/kk
	a90qwSbp8Csm7ZjsRFGofP6VouFoNT8xhIr7Y98YQYkAWJXGYkQjUqR0M4n4+JAhT8xRmZFWG1MpK
	TQGrmm/xUUMzFj/2g2WuiDewpfVc8LYE3kwNT2s9OKJjHEQ+mBFJ2w0oXEzTthDvi/+7ideoq4F5F
	tNppdJdU8PLWXJkHXQguKSPXtjLPNmrZPtPKNxrQMEsLtAfFT6CtNKaD1kGdBr+i3Am7LQHzddUUp
	K5V06DV4w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFYPv-0005hQ-K2; Fri, 26 Feb 2021 08:24:07 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFYPn-0005cO-8l
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 08:24:02 +0000
X-UUID: 821dacc786fd46f18897dc70cf4a5157-20210226
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=g2D2w9vHQf2/mpYO/QEG1chRQd9TnHcyQ0PWCzy6Xqo=; 
 b=k2enqPOhzyTbrVIqjL2CpIgF4sjql1ReZUv30sHMEBRFHgCtSJIAwIdHAxBu1VBbLIv/joqzWCbe4dmJ/8556ECI7KMtoEy3jLMU53GqdIg251loqyw63HnK3s3W0EAwijqFGJwqwQ8Aa7WbvTNQrD6XOeAfNhWywsaiwoKqYeo=;
X-UUID: 821dacc786fd46f18897dc70cf4a5157-20210226
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <sean.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2141857386; Fri, 26 Feb 2021 00:23:50 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Feb 2021 00:23:32 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 26 Feb 2021 16:23:30 +0800
Received: from mtkswgap22.mediatek.inc (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Fri, 26 Feb 2021 16:23:30 +0800
From: <sean.wang@mediatek.com>
To: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/2] mt76: mt7921: fix the base of the dynamic remap
Date: Fri, 26 Feb 2021 16:23:27 +0800
Message-ID: <93e133d30b727b1bf5fd7df397bc113d8ea1f108.1614327185.git.objelf@gmail.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <4ff45223ff7ecff8e20a722ffd2db77fe51fea00.1614327185.git.objelf@gmail.com>
References: <4ff45223ff7ecff8e20a722ffd2db77fe51fea00.1614327185.git.objelf@gmail.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9F1D6F8B1359B400F2310FEAD5BA557555E1D6D73C9965A5B0048A3673D6830B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_032359_637147_D658C7E1 
X-CRM114-Status: GOOD (  11.25  )
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
Cc: robin.chiu@mediatek.com, ch.yeh@mediatek.com, Eric.Liang@mediatek.com,
 sean.wang@mediatek.com, linux-wireless@vger.kernel.org, posh.sun@mediatek.com,
 YN.Chen@mediatek.com, linux-mediatek@lists.infradead.org,
 Soul.Huang@mediatek.com, Stella.Chang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Sean Wang <sean.wang@mediatek.com>

We should change the base for the dynamic remap into another one, because
the current base (0xe0000) have been the one used to operate the device
ownership.

Fixes: 163f4d22c118 ("mt76: mt7921: add MAC support")
Co-developed-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: YN Chen <YN.Chen@mediatek.com>
Signed-off-by: Sean Wang <sean.wang@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7921/regs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
index c4bd31cc81cb..f45f05c794cd 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
+++ b/drivers/net/wireless/mediatek/mt76/mt7921/regs.h
@@ -364,11 +364,11 @@
 #define MT_INFRA_CFG_BASE		0xfe000
 #define MT_INFRA(ofs)			(MT_INFRA_CFG_BASE + (ofs))
 
-#define MT_HIF_REMAP_L1			MT_INFRA(0x260)
+#define MT_HIF_REMAP_L1			MT_INFRA(0x24c)
 #define MT_HIF_REMAP_L1_MASK		GENMASK(15, 0)
 #define MT_HIF_REMAP_L1_OFFSET		GENMASK(15, 0)
 #define MT_HIF_REMAP_L1_BASE		GENMASK(31, 16)
-#define MT_HIF_REMAP_BASE_L1		0xe0000
+#define MT_HIF_REMAP_BASE_L1		0x40000
 
 #define MT_SWDEF_BASE			0x41f200
 #define MT_SWDEF(ofs)			(MT_SWDEF_BASE + (ofs))
-- 
2.25.1
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
