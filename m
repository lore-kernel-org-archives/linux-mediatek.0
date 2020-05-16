Return-Path: <SRS0=ODC1=66=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 874DBC433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 09:05:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5877B207D3
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 May 2020 09:05:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eEHKdj66";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="HChVdeEH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5877B207D3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jlKNE9Rh3jDLKSdq0Jhk+MbAZeWqpIAw8eTlvy0wI0c=; b=eEHKdj66OrBASS
	xDqc6OtUFNc/++wdOFN85y+JXyEj6KS2SJVWDV7fqe7vSpZwC6kTxOTXLe6ks2nNg/h3uB2cicN37
	INqwwFVOaRA8ShztMaYA/q6+FfxYzQSh9PGAc5jBtUNMu88Of5s5bADX9r4NK/DBfPNeFX/KSQWJ0
	d3WR6P6ZI+j76f6Uu40ALarLVddl23mAhIo46LpsKpHsKvMHqUX7YNEBvGm2VmDuoWEyBRCcHxqA8
	dnIAxNtbJVpDNHAQBE0bLI5enD1CQTFWjctYnlrmcdn+t+LFvgl+XpRLgPAbBpSkL/snmPKiUjc65
	2dRiZq2N/JGAao4zRV5w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jZslB-0005Gc-Ks; Sat, 16 May 2020 09:05:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jZsl9-0005GA-0z
 for linux-mediatek@lists.infradead.org; Sat, 16 May 2020 09:05:32 +0000
X-UUID: baadb7982c264ddc8753189897b05c59-20200516
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=WNNopO1zUNPM7KUT8zRztqjX7ggEw2/JQe+88S48eE4=; 
 b=HChVdeEHgaafMWOsiPXgKbHwh16R/gF9aKl7G1h4tO9vqYKwfXv2N/IwIQgk4SaU21X7kC2Ivv+mrJ9ee2UJiLYEzkj496TnGtVvSwjUwMBM3fkrFv/IfV089ZML/u60i83jrNxQEPS8aoBbI6BeehIOF4sS5OBrbZZoFnWPqiU=;
X-UUID: baadb7982c264ddc8753189897b05c59-20200516
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <ryder.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 195204878; Sat, 16 May 2020 01:05:27 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 May 2020 02:05:23 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sat, 16 May 2020 17:05:20 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Sat, 16 May 2020 17:05:20 +0800
From: Ryder Lee <ryder.lee@mediatek.com>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi
 <lorenzo.bianconi@redhat.com>
Subject: [PATCH 2/2] mt76: mt7915: fix sparse warnings: incorrect type
 initializer
Date: Sat, 16 May 2020 17:05:19 +0800
Message-ID: <c74093f29209201bdb5cf889d5f2aac30c9e6755.1589619627.git.ryder.lee@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <828924b331eb9524f851d0fb233904a45219b25d.1589619627.git.ryder.lee@mediatek.com>
References: <828924b331eb9524f851d0fb233904a45219b25d.1589619627.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-TM-SNTS-SMTP: CEC5AC64FA5F151626272EEF82E48F39022734BDA928C831C290103E25CDE96F2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200516_020531_075866_4A430B7F 
X-CRM114-Status: UNSURE (   7.51  )
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
Cc: linux-mediatek@lists.infradead.org, Sean Wang <sean.wang@mediatek.com>,
 linux-wireless@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

drivers/net/wireless/mediatek/mt76/mt7915/mcu.c:2317:31: sparse: sparse:
incorrect type in initializer (different base types)

Fixes: 5517f78b0063 ("mt76: mt7915: enable firmware module debug support")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Ryder Lee <ryder.lee@mediatek.com>
---
 drivers/net/wireless/mediatek/mt76/mt7915/mcu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
index 6d4808b13a40..abd07c2f4ff8 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/mcu.c
@@ -2671,7 +2671,7 @@ int mt7915_mcu_fw_dbg_ctrl(struct mt7915_dev *dev, u32 module, u8 level)
 		u16 len;
 		u8 level;
 		u8 rsv[3];
-		u32 module_idx;
+		__le32 module_idx;
 	} data = {
 		.module_idx = cpu_to_le32(module),
 		.level = level,
-- 
2.18.0
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
